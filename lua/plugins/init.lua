

return {
    "github/copilot.vim",
    "nvim-lua/popup.nvim",
    "nvim-lua/plenary.nvim",
    'nvim-treesitter/nvim-treesitter',
    "nvim-lualine/lualine.nvim",
    'Mofiqul/vscode.nvim',
    'tpope/vim-fugitive',
    {'folke/which-key.nvim', config = function()
    
      require("which-key").setup {}
      
    end,
    enabled = true
    },
    'mfussenegger/nvim-dap',
    "rcarriga/nvim-dap-ui",
    {"folke/neodev.nvim", config = function()
      require("neodev").setup({
        library = { plugins = { "nvim-dap-ui" }, types = true },
      })
        
    end
    },
    'simrat39/rust-tools.nvim',
    "terrortylor/nvim-comment",
    'windwp/nvim-autopairs',
    'saadparwaiz1/cmp_luasnip',
    -- {'leoluz/nvim-dap-go', opt = {require('dap-go').setup()}, enabled = true}
}
