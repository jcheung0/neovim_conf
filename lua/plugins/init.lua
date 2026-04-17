

return {
    --"github/copilot.vim",
    --"nvim-lua/popup.nvim",
    --"nvim-lua/plenary.nvim",
    --'nvim-treesitter/nvim-treesitter',
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
    'tpope/vim-fugitive',
    { 'folke/which-key.nvim',  enabled = true },
    "L3MON4D3/LuaSnip",
    {'akinsho/bufferline.nvim',dependencies = 'kyazdani42/nvim-web-devicons'},
    "terrortylor/nvim-comment",
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
