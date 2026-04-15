return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{ "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Toggle file tree" },
	},
	config = function()
		require("nvim-tree").setup({
			view = {
				float = {
					enable = true,
					open_win_config = function()
						local width = math.floor(vim.o.columns * 0.6)
						local height = math.floor(vim.o.lines * 0.8)
						return {
							relative = "editor",
							border = "rounded",
							width = width,
							height = height,
							row = math.floor((vim.o.lines - height) / 2),
							col = math.floor((vim.o.columns - width) / 2),
						}
					end,
				},
				width = function()
					return math.floor(vim.o.columns * 0.6)
				end,
			},
		})
	end,
}
