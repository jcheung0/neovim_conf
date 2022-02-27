require("lsp.python-init")

require('rust-tools').setup({})


-- enable lspsaga
local saga = require 'lspsaga'
saga.init_lsp_saga()

