# nvim

Plugins are managed by [lazy.nvim](https://github.com/folke/lazy.nvim), LSPs and formatters by [mason.nvim](https://github.com/mason-org/mason.nvim).

## Prerequisites

The following must be installed and on `PATH` before launching Neovim.

### System

- [`git`](https://git-scm.com/) and [`curl`](https://curl.se/) — lazy.nvim bootstrap
- `make` and a C compiler (`gcc` or `clang`) — builds [`telescope-fzf-native`](https://github.com/nvim-telescope/telescope-fzf-native.nvim), compiles Treesitter grammars, and builds Lua 5.1 via [`hererocks`](https://github.com/luarocks/hererocks) bootstrap
- [`ripgrep`](https://github.com/BurntSushi/ripgrep) — required by Telescope `live_grep`
- [`fd`](https://github.com/sharkdp/fd) — used by Telescope `find_files`
- [`imagemagick`](https://imagemagick.org/) — runtime FFI target for [`image.nvim`](https://github.com/3rd/image.nvim) (molten output rendering)
- A [Nerd Font](https://www.nerdfonts.com/) — for `blink.cmp` and `nvim-web-devicons` glyphs

### Language toolchains

- [Rust](https://rustup.rs/) — provides `rust_analyzer`, `rustfmt`, and powers `blink.cmp`'s fuzzy matcher
- [Python](https://www.python.org/) — runtime for `pyrefly` and `ruff`
- [`elan`](https://github.com/leanprover/elan) — manages Lean 4 toolchains for [`lean.nvim`](https://github.com/Julian/lean.nvim)

### Neovim Python host

[`molten-nvim`](https://github.com/benlubas/molten-nvim) is a remote plugin and needs its own Python interpreter. Host-side dependencies are declared in `pyproject.toml` and pinned in `uv.lock`. On a fresh machine, sync the venv with [`uv`](https://docs.astral.sh/uv/):

```bash
cd ~/.config/nvim && uv sync
```

