-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- dedicated python host for remote plugins (venv managed by uv)
vim.g.python3_host_prog = vim.fn.stdpath("config") .. "/.venv/bin/python3"

-- expose venv bin on PATH so plugins that shell out (e.g. jupytext.nvim) find the tools
vim.env.PATH = vim.fn.stdpath("config") .. "/.venv/bin:" .. vim.env.PATH

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- set <space> as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = "  "

-- enable relative line numbers
vim.opt.relativenumber = true
vim.opt.number = true

-- case-insensitive search (unless \C or one or more capital letters in the search term)
vim.o.ignorecase = true
vim.o.smartcase = true

-- sync clipboard between os and nvim
vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)

-- indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

-- clear search highlights when pressing esc
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- center cursor after vertical motions
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")
vim.keymap.set("n", "{", "{zz")
vim.keymap.set("n", "}", "}zz")

require("lazy").setup({
	spec = {
		{ import = "plugins" },
	},
	checker = { enabled = true },
})
