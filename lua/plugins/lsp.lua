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
            "gopls",
            "svelte",
            "pyright",
            "rust_analyzer",
            "clangd",
            "bashls",
            "omnisharp",
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
      
       require('lspconfig').omnisharp.setup {
         capabilities = capabilities,
         root_dir = require("lspconfig.util").root_pattern("*.sln", "*.csproj", ".git"),
         settings = {
           FormattingOptions = {
            EnableEditorConfigSupport = true,
            OrganizaImports = true,

           },
           RoslynExtensionsOptions = {
             EnableAnalyzersSupport = true,
             EnableImportCompletion = true,
           },
           CompletionOptions = {
             UnimportedTypes = true
           }
         },
         on_attach = function(client, bufnr)
           if client.server_capabilities.document_formatting then
             vim.api.nvim.nvim_buf_set_option(bufnr, 'formatexpr', 'v:lua.vim.lsp.formatexpr()')
             vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', { noremap = true, silent = true })
           end
          end
       }

      -- If you want insert `(` after select function or method item
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      local cmp = require('cmp')
      cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))
  end
} ,
    {
      'nvim-java/nvim-java',
      dependencies = {
        'nvim-java/lua-async-await',
        'nvim-java/nvim-java-core',
        'nvim-java/nvim-java-test',
        'nvim-java/nvim-java-dap',
        'MunifTanjim/nui.nvim',
        'neovim/nvim-lspconfig',
        'mfussenegger/nvim-dap',
        {
          'williamboman/mason.nvim',
          opts = {
            registries = {
              'github:nvim-java/mason-registry',
              'github:mason-org/mason-registry',
            },
          },
        }
  },

    },
    {
      "seblyng/roslyn.nvim", 
      ft = "cs",
        {
          'williamboman/mason.nvim',
          opts = {
            registries = {
              'github:CrashDummyy/mason-registry',
              'github:mason-org/mason-registry',
            },
          },
        }

    },
-- lazy.nvim
  {
    "GustavEikaas/easy-dotnet.nvim",
    dependencies = { "nvim-lua/plenary.nvim", 'nvim-telescope/telescope.nvim', },
    config = function()
      require("easy-dotnet").setup()
    end
  }



}



