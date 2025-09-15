local set = vim.opt
local utils = require("utils")
local os = utils.detect_os()

set.tabstop = 2
set.shiftwidth = 2
set.softtabstop = 2
set.expandtab = true

set.number = true
set.cursorline = true
set.relativenumber = true

vim.g.dap_virtual_text = true
--vim.g.clipboard = 'unnamedplus'
--set.clipboard = 'unnamedplus'

if os == "windows" then
  print("Setting clipboard for Windows")
  vim.g.clipboard = {
    name = "clip.exe",
    copy = {
      ["+"] = "clip.exe",
      ["*"] = "clip.exe",
    },
    paste = {
      ["+"] = "Get-Clipboard",
      ["*"] = "Get-Clipboard",
    },
    cache_enabled = true
  }
elseif os == "mac" then
  print("Setting clipboard for Mac")

  vim.g.clipboard = {
    name = "pbcopy",
    copy = {
      ["+"] = "pbcopy",
      ["*"] = "pbcopy"
    },
    paste = {
      ["+"] = "pbpaste",
      ["*"] = "pbpaste"
    },
    cache_enabled = true
  }
else 
  print("No clipboard settings applied linux or unkown os" .. os) 
  vim.g.clipboard = 'unnamedplus'
  set.clipboard = 'unnamedplus'
end


vim.diagnostic.config({
  virtual_text = true,  -- Show virtual text
  signs = true,         -- Show signs in the sign column
  underline = true,     -- Underline the text with an error
  update_in_insert = false,
  severity_sort = true,
})


set.termguicolors = true
set.mouse = "a"

vim.g.mapleader = ";"

vim.g.vscode_style = "dark"
-- For light theme
-- vim.g.vscode_style = "light"
-- Enable transparent background.
vim.g.vscode_transparent = 1
-- Enable italic comment
vim.g.vscode_italic_comment = 1
-- Disable nvim-tree background color 
vim.g.vscode_disable_nvimtree_bg = true 
-- vim.cmd[[colorscheme onedark]]


