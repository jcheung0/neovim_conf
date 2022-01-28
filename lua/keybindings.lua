
function map(mode,lhs,rhs,opts)
	local options = { noremap = true}
	if opts then
	   options = vim.tbl_extend("force",options,opts)
	end
	vim.api.nvim_set_keymap(mode,lhs,rhs,options)
end


map("n","<C-p>",":Telescope find_files <CR>")
map("n","<C-d>",":NvimTreeOpen <CR>")
map("n","<C-g>",":Telescope live_grep <CR>")

