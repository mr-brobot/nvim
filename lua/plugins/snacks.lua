-- preserve explorer working dir
local explorer_cwd

return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	dependencies = { "nvim-tree/nvim-web-devicons" }, -- filetype glyphs for picker + explorer
	opts = {
		bigfile = { enabled = true }, -- disable heavy features in huge files
		scope = { enabled = true }, -- scope text objects / motions
		statuscolumn = { enabled = true }, -- fold/sign/number column
		words = { enabled = true }, -- highlight LSP references under cursor
		input = { enabled = true }, -- replaces vim.ui.input
		notifier = { enabled = true }, -- replaces vim.notify
		picker = {
			-- fuzzy finder; also takes over vim.ui.select (ui_select default)
			sources = {
				-- centered floating explorer (replaces nvim-tree); the vertical preset
				-- with preview off collapses to a centered input+list box.
				explorer = {
					layout = { preset = "vertical", preview = false, layout = { width = 0.6, height = 0.8 } },
					jump = { close = true }, -- close the float when opening a file (dirs still just toggle)
					on_close = function(picker)
						explorer_cwd = picker:cwd()
					end,
				},
			},
		},
		explorer = { enabled = true }, -- file explorer (replaces nvim-tree)
	},
	keys = {
		{
			"<leader>n",
			function()
				Snacks.notifier.show_history()
			end,
			desc = "Notification history",
		},
		{
			"<leader>un",
			function()
				Snacks.notifier.hide()
			end,
			desc = "Dismiss notifications",
		},
		{
			"<leader>e",
			function()
				Snacks.explorer({ cwd = explorer_cwd or vim.fn.expand("%:p:h") })
			end,
			desc = "File explorer",
		},
		{
			"<leader>gd",
			function()
				Snacks.picker.git_diff()
			end,
			desc = "Git diff",
		},
		-- Finders (replaces telescope; LSP navigation is wired in lsp.lua).
		{
			"<leader>ff",
			function()
				Snacks.picker.files()
			end,
			desc = "Find files",
		},
		{
			"<leader>fg",
			function()
				Snacks.picker.grep()
			end,
			desc = "Live grep",
		},
		{
			"<leader>fb",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Buffers",
		},
		{
			"<leader>fh",
			function()
				Snacks.picker.help()
			end,
			desc = "Help tags",
		},
	},
}
