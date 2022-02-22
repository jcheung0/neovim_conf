

local set = vim.opt

set.tabstop = 2
set.shiftwidth = 2
set.softtabstop = 2
set.expandtab = true

set.number = true
set.cursorline = true

vim.g.dap_virtual_text = true

set.termguicolors = true
set.mouse = "a"


vim.g.vscode_style = "dark"
-- For light theme
-- vim.g.vscode_style = "light"
-- Enable transparent background.
vim.g.vscode_transparent = 1
-- Enable italic comment
vim.g.vscode_italic_comment = 1
-- Disable nvim-tree background color 
vim.g.vscode_disable_nvimtree_bg = true 
vim.cmd[[colorscheme vscode]]


