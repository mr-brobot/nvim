return {
	{
		"benlubas/molten-nvim",
		version = "^1.0.0",
		build = ":UpdateRemotePlugins",
		dependencies = { "3rd/image.nvim" },
		ft = { "python", "quarto", "markdown" },
		init = function()
			vim.g.molten_image_provider = "image.nvim"
			vim.g.molten_output_win_max_height = 20
			vim.g.molten_virt_text_output = true
			vim.g.molten_virt_lines_off_by_1 = true
			vim.g.molten_wrap_output = true
			vim.g.molten_auto_open_output = false
		end,
		keys = {
			{ "<localleader>mi", ":MoltenInit<CR>", desc = "Molten: init kernel" },
			{ "<localleader>e", ":MoltenEvaluateOperator<CR>", desc = "Molten: evaluate operator" },
			{ "<localleader>rl", ":MoltenEvaluateLine<CR>", desc = "Molten: evaluate line" },
			{ "<localleader>rr", ":MoltenReevaluateCell<CR>", desc = "Molten: re-evaluate cell" },
			{ "<localleader>r", ":<C-u>MoltenEvaluateVisual<CR>gv", mode = "v", desc = "Molten: evaluate visual" },
			{ "<localleader>rd", ":MoltenDelete<CR>", desc = "Molten: delete cell" },
			{ "<localleader>oh", ":MoltenHideOutput<CR>", desc = "Molten: hide output" },
			{ "<localleader>os", ":noautocmd MoltenEnterOutput<CR>", desc = "Molten: enter output" },
			{ "<localleader>ie", ":MoltenExportOutput<CR>", desc = "Molten: export output to ipynb" },
			{ "<localleader>ii", ":MoltenImportOutput<CR>", desc = "Molten: import output from ipynb" },
			{ "]m", ":MoltenNext<CR>", desc = "Molten: next evaluated cell" },
			{ "[m", ":MoltenPrev<CR>", desc = "Molten: previous evaluated cell" },
		},
	},
	{
		"3rd/image.nvim",
		opts = function()
			-- Windows Terminal -> sixel;
			-- Ghostty/Kitty -> kitty
			return { backend = vim.env.WT_SESSION and "sixel" or "kitty" }
		end,
	},
	{
		"GCBallesteros/jupytext.nvim",
		lazy = false,
		opts = {
			custom_language_formatting = {
				python = {
					extension = "qmd",
					style = "quarto",
					force_ft = "quarto",
				},
			},
		},
	},
	{
		"quarto-dev/quarto-nvim",
		ft = { "quarto", "markdown" },
		dependencies = { "jmbuhr/otter.nvim", "nvim-treesitter/nvim-treesitter" },
		opts = {
			lspFeatures = {
				enabled = true,
				languages = { "python" },
				chunks = "all",
				diagnostics = { enabled = true, triggers = { "BufWritePost" } },
				completion = { enabled = true },
			},
			codeRunner = {
				enabled = true,
				default_method = "molten",
			},
		},
		keys = {
			{ "<localleader>qa", ":QuartoActivate<CR>", desc = "Quarto: activate" },
			{ "<localleader>qp", ":QuartoPreview<CR>", desc = "Quarto: preview" },
			{ "<localleader>qc", ":QuartoSend<CR>", desc = "Quarto: send cell under cursor" },
			{ "<localleader>qA", ":QuartoSendAll<CR>", desc = "Quarto: send all cells" },
			{ "<localleader>qb", ":QuartoSendAbove<CR>", desc = "Quarto: send cells above" },
			{ "<localleader>qB", ":QuartoSendBelow<CR>", desc = "Quarto: send cells below" },
		},
	},
}
