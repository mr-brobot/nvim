return {
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	{
		"saghen/blink.cmp",
		version = "1.*",
		opts = {
			keymap = { preset = "super-tab" },
			fuzzy = { implementation = "prefer_rust" },
			signature = { enabled = true },
			sources = {
				default = { "lsp", "path", "snippets", "lazydev" },
				providers = {
					lazydev = {
						module = "lazydev.integrations.blink",
						score_offset = 100,
					},
				},
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"mason-org/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			{ "j-hui/fidget.nvim", opts = {} },
			"saghen/blink.cmp",
		},
		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
				callback = function(event)
					local map = function(keys, func, desc, mode)
						mode = mode or "n"
						vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					local picker = Snacks.picker
					map("gtd", picker.lsp_definitions, "Goto Definition")
					map("gtr", picker.lsp_references, "Goto References")
					map("gri", picker.lsp_implementations, "Goto Implementation")
					map("grt", picker.lsp_type_definitions, "Goto Type")
					map("grD", vim.lsp.buf.declaration, "Goto Declaration")
					map("gsd", picker.lsp_symbols, "Document Symbols")
					map("gsw", picker.lsp_workspace_symbols, "Workspace Symbols")
					map("gsr", vim.lsp.buf.rename, "Rename Symbol")
					map("gca", vim.lsp.buf.code_action, "Code Action", { "n", "x" })

					local client = vim.lsp.get_client_by_id(event.data.client_id)

					-- toggle diagnostics
					local toggle_diagnostics = function()
						local vl = vim.diagnostic.config().virtual_lines
						if not vl then
							vim.diagnostic.config({ virtual_lines = { current_line = true } })
						else
							vim.diagnostic.config({ virtual_lines = false })
						end
					end
					vim.keymap.set("n", "<leader>td", toggle_diagnostics, { desc = "Toggle diagnostics" })

					-- toggle hints
					if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
						map("<leader>th", function()
							vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
						end, "Toggle Inlay Hints")
					end

					if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
						local highlight_group = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
						vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
							buffer = event.buf,
							group = highlight_group,
							callback = vim.lsp.buf.document_highlight,
						})
						vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
							buffer = event.buf,
							group = highlight_group,
							callback = vim.lsp.buf.clear_references,
						})
						vim.api.nvim_create_autocmd("LspDetach", {
							group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
							callback = function(event2)
								vim.lsp.buf.clear_references()
								vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event2.buf })
							end,
						})
					end
				end,
			})

			local blink = require("blink.cmp")

			vim.lsp.config("*", { capabilities = blink.get_lsp_capabilities() })
			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						completion = { callSnippet = "Replace" },
					},
				},
			})
			vim.lsp.config("ruff", {
				on_attach = function(client)
					client.server_capabilities.hoverProvider = false
				end,
			})
			vim.lsp.config("vale_ls", {
				filetypes = { "markdown", "text", "quarto" },
				workspace_required = true,
			})

			require("mason-tool-installer").setup({
				ensure_installed = {
					"lua_ls",
					"rust_analyzer",
					"pyrefly",
					"ruff",
					"vale_ls",
					"stylua",
					"vale",
					"biome",
				},
			})

			require("mason-lspconfig").setup({})
		end,
	},
}
