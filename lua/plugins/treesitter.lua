return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").install({
			"bash",
			"c",
			"diff",
			"html",
			"lua",
			"luadoc",
			"markdown",
			"markdown_inline",
			"python",
			"query",
			"rust",
			"vim",
			"vimdoc",
			"yaml",
		})

		vim.api.nvim_create_autocmd("FileType", {
			pattern = {
				"bash",
				"sh",
				"c",
				"diff",
				"html",
				"lua",
				"markdown",
				"python",
				"query",
				"rust",
				"vim",
				"help",
				"yaml",
			},
			callback = function()
				vim.treesitter.start()
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})
	end,
}
