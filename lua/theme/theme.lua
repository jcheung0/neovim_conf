


require('lualine').setup {
 options = {
   -- ... 
   theme = 'vscode'
   -- ... 
 }
}



require('onedark').setup {
    style = 'dark',
    code_style = {
        comments = 'italic',
        keywords = 'none',
        functions = 'none',
        strings = 'none',
        variables = 'none'
    }
}
require('onedark').load()

require("bufferline").setup{
 	options = {
    separator_style = 'thin',
    indicator = {
        style = "icon",
        icon = "|"
    },
    buffer_close_icon = '',
    modified_icon = '●',
    close_icon = '',
 		close_command = "Bdelete %d",
 		right_mouse_command = "Bdelete! %d",
 		left_trunc_marker = '',
     	right_trunc_marker = '',
 		offsets = {{filetype = "NvimTree", text = "EXPLORER", text_align = "center"}},
 		show_tab_indicators = true,
 		show_close_icon = false
 	}
}


