require("lsp.python-init")
require("lsp.rust")
require("lsp.omnisharp")

require'lspconfig'.svelte.setup{}
require'lspconfig'.tailwindcss.setup{}
require'lspconfig'.gopls.setup{}
require'lspconfig'.gradle_ls.setup{}
require'lspconfig'.kotlin_language_server.setup{}
require'lspconfig'.pyright.setup{}
require'lspconfig'.tsserver.setup{}
require'lspconfig'.ansiblels.setup{}
require'lspconfig'.bashls.setup{}

require'lspconfig'.ccls.setup{}
require'lspconfig'.clangd.setup{}
require'lspconfig'.cmake.setup{}
require'lspconfig'.intelephense.setup{}
require'lspconfig'.jdtls.setup{}
require'lspconfig'.metals.setup{}
require'lspconfig'.clojure_lsp.setup{}
require'lspconfig'.omnisharp.setup{}

require('nvim-autopairs').setup{}


-- If you want insert `(` after select function or method item
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))


-- add a lisp filetype (wrap my-function), FYI: Hardcoded = { "clojure", "clojurescript", "fennel", "janet" }
cmp_autopairs.lisp[#cmp_autopairs.lisp+1] = "racket"

-- enable lspsaga
local saga = require 'lspsaga'
saga.init_lsp_saga()

