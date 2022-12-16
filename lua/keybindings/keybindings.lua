local util = require('utils')


function map(mode,lhs,rhs,opts)
	local options = { noremap = true}
	if opts then
	   options = vim.tbl_extend("force",options,opts)
	end
	vim.api.nvim_set_keymap(mode,lhs,rhs,options)
end


vim.g.mapleader = ";"

util.map("n","<C-p>",":Telescope find_files <CR>")
util.map("n","<leader-l>",":Telescope lsp_references <CR>")

util.map("n","<C-d>",":NvimTreeOpen <CR>")
util.map("n","<C-g>",":Telescope live_grep <CR>")
util.map("n","<C-b>",":lua require'dap'.toggle_breakpoint() <CR>")
util.map("n", "<leader>e", ":echo you just pressed the leader")
util.map("n","<C-l>",":CommentToggle <CR>")

util.map("v","<C-l>",":CommentToggle  <CR>")


