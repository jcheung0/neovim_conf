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
            "biome",
            "tailwindcss",
            "gopls",
            "pyright",
            "rust_analyzer",
            "bashls",
          }  
        }
      )


      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

      local servers = { 
         'rust_analyzer', 
         'pyright', 
         'svelte',
         'tailwindcss',
         'biome',
         'bashls',
      }

       for _, lsp in ipairs(servers) do

         vim.lsp.config(lsp,{
            on_attach = my_custom_on_attach,
            capabilities = capabilities,    
         });
       end
  end
}



}



