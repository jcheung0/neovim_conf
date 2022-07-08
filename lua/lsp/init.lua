require("lsp.python-init")
require("lsp.rust")
require("lsp.omnisharp")
require ("lsp.lua-init")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local lspconfig = require('lspconfig')

require('nvim-autopairs').setup{}

local servers = { 'clangd', 
  'rust_analyzer', 
  'pyright', 
  'tsserver',
  'svelte',
  'tailwindcss',
  'gopls',
  'gradle_ls',
  'kotlin_language_server',
  'ansiblels',
  'bashls',
  'ccls',
  'cmake',
  'intelephense',
  'metals',
  'clojure_lsp',
  'omnisharp',
  'jdtls',
  'hls'
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    -- on_attach = my_custom_on_attach,
    capabilities = capabilities,
  }
end





-- If you want insert `(` after select function or method item
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))


-- add a lisp filetype (wrap my-function), FYI: Hardcoded = { "clojure", "clojurescript", "fennel", "janet" }
-- cmp_autopairs.lisp[#cmp_autopairs.lisp+1] = "racket"

-- enable lspsaga
local saga = require 'lspsaga'
saga.init_lsp_saga()

