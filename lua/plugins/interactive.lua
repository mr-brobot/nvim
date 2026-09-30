return {
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
				default_method = "slime",
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
	{
		"jpalardy/vim-slime",
		init = function()
			vim.g.slime_target = "neovim"
		end,
	},
}
