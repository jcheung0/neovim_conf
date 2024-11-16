

return {
    "github/copilot.vim",
    "nvim-lua/popup.nvim",
    "nvim-lua/plenary.nvim",
    'nvim-treesitter/nvim-treesitter',
    "nvim-lualine/lualine.nvim",
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
    -- {'leoluz/nvim-dap-go', opt = {require('dap-go').setup()}, enabled = true}
}
