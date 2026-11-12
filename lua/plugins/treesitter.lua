return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local ts = require("nvim-treesitter")

		ts.install({
			"bash",
			"c",
			"diff",
			"html",
			"lua",
			"luadoc",
			"json",
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
				"json",
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

				-- enable ts-based folding
				vim.wo.foldmethod = "expr"
				vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
			end,
		})
	end,
}
