# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Setup

Run `./setup.sh` to symlink the config into `~/.config/nvim/`. It creates symlinks for `init.lua`, `lua/`, and `after/`.

On Windows, use `setup.ps1` instead.

## Architecture

This is a Neovim configuration managed with [lazy.nvim](https://github.com/folke/lazy.nvim).

**Load order** (`init.lua`):
1. `editorconf` — editor settings (tabs, line numbers, clipboard, diagnostics, colorscheme vars)
2. `configs.lazy` — bootstraps lazy.nvim, sets leader key to `;`, imports all plugins from `lua/plugins/`
3. `lsp` — LSP setup (currently only `lsp.rust`)
4. `dbg` — DAP (debugger) configuration and keybindings
5. `keybindings` — key mappings (general + normal-mode)
6. `theme` — lualine and bufferline setup

**Plugin directory** (`lua/plugins/`): Each file returns a lazy.nvim plugin spec table. lazy.nvim auto-imports all files from this directory.

**Key modules:**
- `lua/utils/init.lua` — shared helpers: `utils.map()` for keymaps, `utils.detect_os()` for cross-platform clipboard
- `lua/dbg/init.lua` — DAP setup with Mason, language configs (Go/Python/TypeScript/C), and dap-ui lifecycle hooks
- `lua/lsp/rust.lua` — rust-analyzer options (currently commented out, using built-in `vim.lsp.config`)

## Plugins Overview

| Plugin | Purpose |
|--------|---------|
| `nvim-lspconfig` + `mason` | LSP, installs: lua_ls, biome, tailwindcss, gopls, pyright, rust_analyzer, bashls |
| `nvim-cmp` | Completion with LSP + LuaSnip sources; Tab accepts Copilot suggestions |
| `conform.nvim` | Format on save: stylua (Lua), black+isort (Python), rustfmt (Rust), prettier (JS) |
| `nvim-dap` + `nvim-dap-ui` | Debugger with Mason-managed adapters: cppdbg, delve, js-debug-adapter, python |
| `telescope.nvim` | Fuzzy finder, also used for DAP integration |
| `neo-tree.nvim` | File explorer, shows dotfiles, hijacks netrw |
| `noice.nvim` | UI for messages/cmdline (LSP progress disabled) |
| `github/copilot.vim` | Copilot inline suggestions |
| `bufferline.nvim` + `lualine.nvim` | Tab bar and status line |
| `which-key.nvim` | Keybinding hints |

## Key Bindings

Leader key is `;`.

| Key | Action |
|-----|--------|
| `<C-p>` | Telescope find files |
| `<C-g>` | Telescope live grep |
| `<C-d>` | Open Neo-tree |
| `<C-b>` | Toggle DAP breakpoint |
| `<C-l>` | Toggle comment (normal + visual) |
| `<C-t>` | New tab |
| `<leader>l` | LSP references (Telescope) |
| `<F1>` | DAP continue |
| `<F2>` | DAP step over |
| `<F3>` | DAP step into |
| `<F4>` | DAP step out |
| `<Esc>` | Dismiss all notifications |

DAP telescope shortcuts use `<leader>d*` prefix (e.g., `<leader>dcc` = DAP commands, `<leader>dlb` = list breakpoints).

## Disabled/Commented Plugins

- `codecompanion.lua` — CodeCompanion AI plugin (commented out)
- `mcp.lua` — mcphub.nvim MCP server integration (commented out)
- `lua/lsp/init.lua` — Python and Java LSP setups are commented out

## Dotfiles

- `dotfiles/tmux.conf` — tmux config (prefix: `C-l`, TPM plugins)
- `dotfiles/wezterm/wezterm.lua` — WezTerm terminal config
- `zed/settings.json` — Zed editor settings (Ayu Dark theme, vim mode, Copilot/Ollama AI)
