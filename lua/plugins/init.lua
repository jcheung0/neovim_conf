

return {
    "github/copilot.vim",
    "nvim-lua/popup.nvim",
    "nvim-lua/plenary.nvim",
    'nvim-treesitter/nvim-treesitter',
    {
      "nvim-lualine/lualine.nvim",
      dependencies = { "kyazdani42/nvim-web-devicons", opt = true },
      config = function()
        require("lualine").setup({
          options = {
            icons_enabled = true,
            component_separators = { left = "", right = "" },
            section_separators = { left = "", right = "" },
          },
          sections = {
            lualine_x = {
              "mcphub",
            }
          }
        }
        )
      end,
    },
    'Mofiqul/vscode.nvim',
    'tpope/vim-fugitive',
    { 'folke/which-key.nvim',  enabled = true },
    {"folke/neodev.nvim", config = function()
      --require("neodev").setup({
       -- library = { plugins = { "nvim-dap-ui" }, types = true },
      --})
    end
    },
    "L3MON4D3/LuaSnip",
    {'akinsho/bufferline.nvim',dependencies = 'kyazdani42/nvim-web-devicons'},
    'simrat39/rust-tools.nvim',
    "terrortylor/nvim-comment",
    'windwp/nvim-autopairs',
    'saadparwaiz1/cmp_luasnip',
    {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
    }
    -- {'leoluz/nvim-dap-go', opt = {require('dap-go').setup()}, enabled = true}
}
