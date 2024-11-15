

-- require('plugins')
require("configs.lazy")
require("lazy").setup("plugins", { concurrency = 1})

require('editorconf')
require('lsp')
require('autocomplete')
require('keybindings')
require('dbg')
require('theme')


