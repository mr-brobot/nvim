return {
	"afonsofrancof/worktrees.nvim",
	event = "VeryLazy",
	cmd = { "WorktreeCreate", "WorktreeSwitch", "WorktreeDelete" },
	keys = { "<leader>wtc", "<leader>wts", "<leader>wtd" },
	opts = {
		base_path = "../.worktrees",
		mappings = {
			create = "<leader>wtc",
			switch = "<leader>wts",
			delete = "<leader>wtd",
		},
		-- terminal working dir to follow worktree
		on_create = function(path)
			vim.cmd.tcd(path)
		end,
		on_switch = function(_, to_path)
			vim.cmd.tcd(to_path)
		end,
	},
}
