local function move(position)
	return function()
		local terminal = require("claudecode.terminal")
		local win_opts = { position = position }
		if position == "left" or position == "right" then
			win_opts.width = 0.3
		else
			win_opts.height = 0.3
		end
		terminal.close()
		terminal.open({ snacks_win_opts = win_opts })
	end
end

return {
	"coder/claudecode.nvim",
	dependencies = { "folke/snacks.nvim" },
	opts = {
		terminal = {
			snacks_win_opts = { position = "bottom", height = 0.3 },
		},
	},
	keys = {
		{ "<leader>cc", "<cmd>ClaudeCodeFocus<cr>", desc = "Toggle Claude", mode = { "n", "t" } },
		{ "<leader>cs", "<cmd>ClaudeCodeSend<cr>", desc = "Send selection", mode = "v" },
		{ "<leader>ca", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
		{ "<leader>cd", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
		{ "<leader>ch", move("left"), desc = "Claude @ Left", mode = { "n", "t" } },
		{ "<leader>cj", move("bottom"), desc = "Claude @ Bottom", mode = { "n", "t" } },
		{ "<leader>ck", move("top"), desc = "Claude @ Top", mode = { "n", "t" } },
		{ "<leader>cl", move("right"), desc = "Claude @ Right", mode = { "n", "t" } },
	},
}
