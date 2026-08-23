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
		statuscolumn = { enabled = true },
		words = { enabled = true },
		input = { enabled = true },
		notifier = { enabled = true },
		picker = {
			sources = {
				explorer = {
					layout = { preset = "vertical", preview = false, layout = { width = 0.6, height = 0.8 } },
					jump = { close = true }, -- close the float when opening a file
					on_close = function(picker)
						explorer_cwd = picker:cwd()
					end,
				},
			},
		},
		explorer = { enabled = true },
		terminal = {
			enabled = true,
			win = { style = "float", border = "rounded", width = 0.8, height = 0.8 },
		},
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
			"<leader>gds",
			function()
				Snacks.picker.git_diff({ staged = true })
			end,
			desc = "Git diff (staged)",
		},
		{
			"<leader>gdh",
			function()
				Snacks.picker.git_diff()
			end,
			desc = "Git diff (hunks)",
		},
		{
			"<leader>ff",
			function()
				Snacks.picker.files()
			end,
			desc = "Find files",
		},
		{
			"<leader>tt",
			function()
				Snacks.terminal.toggle()
			end,
			desc = "Toggle terminal",
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
