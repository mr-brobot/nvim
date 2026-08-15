return {
	-- llama.cpp server is managed separately: (see docker-compose.yaml).
	"ggml-org/llama.vim",
	event = "InsertEnter",
	keys = {
		{ "<leader>llt", "<cmd>LlamaToggleAutoFim<CR>", desc = "Toggle llama.vim auto FIM" },
	},
	init = function()
		vim.g.llama_config = {
			show_info = 1, -- 0 = off, 1 = statusline, 2 = inline
			keymap_fim_trigger = "<C-f><C-f>",
			keymap_fim_accept_full = "<C-f><C-j>",
			keymap_fim_accept_line = "<C-f><C-l>",
			keymap_fim_accept_word = "<C-f><C-w>",
			keymap_fim_next = "<C-f><C-]>",
			keymap_fim_prev = "<C-f><C-[>",
		}
	end,
}
