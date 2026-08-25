# Neovim Config

Plugins are managed by [lazy.nvim](https://github.com/folke/lazy.nvim),
LSPs and formatters by [mason.nvim](https://github.com/mason-org/mason.nvim).

## Prerequisites

### System

- [Neovim](https://neovim.io/) 0.12+
- [`uv`](https://docs.astral.sh/uv/)
- [`ripgrep`](https://github.com/BurntSushi/ripgrep)
- [`fd`](https://github.com/sharkdp/fd)
- [`tree-sitter` CLI](https://tree-sitter.github.io/tree-sitter/cli/index.html)
- [`imagemagick`](https://imagemagick.org/)
- [`quarto`](https://quarto.org/) (optional)
- A [Nerd Font](https://www.nerdfonts.com/) (optional)
- [Docker](https://docs.docker.com/get-docker/) and [Docker Compose](https://docs.docker.com/compose/) (optional)
- [NVIDIA Container Toolkit](https://github.com/NVIDIA/nvidia-container-toolkit) (optional
### Language toolchains

- [Rust](https://rustup.rs/)
- [Python](https://www.python.org/)
- [`elan`](https://github.com/leanprover/elan)

### Python Host

[`molten-nvim`](https://github.com/benlubas/molten-nvim) is a remote plugin and needs its own Python interpreter.
Host-side dependencies are declared in `pyproject.toml`.

