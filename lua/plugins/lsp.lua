return {
  {
    'neovim/nvim-lspconfig', 
    enabled = true,
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-nvim-lsp',
    },
    opts = {
      diagnostics = {
          signs = false,
          virtual_text = false
      },

    },
    config = function()
      require('nvim_comment').setup()
      require("mason").setup()
      require("mason-lspconfig").setup(
        {
          ensure_installed = {
            "lua_ls",
            "ts_ls", 
            "biome",
            "tailwindcss",
            -- "gopls",
            "svelte",
            "pyright",
            "rust_analyzer",
            "clangd",
            "bashls"
          }  
        }
      )
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

       
      local lspconfig = require('lspconfig')
      
      require('nvim-autopairs').setup{}

      local servers = { 
         'clangd', 
         'rust_analyzer', 
         'pyright', 
         'ts_ls',
         'svelte',
         'tailwindcss',
         -- 'gopls',
         'biome',
          'gradle_ls',
         'ansiblels',
         'bashls',
         'clangd',
         'cmake',
      }

       for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup {
           on_attach = my_custom_on_attach,
          capabilities = capabilities,
         }
       end


      -- If you want insert `(` after select function or method item
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      local cmp = require('cmp')
      cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))
  end
} 
}



