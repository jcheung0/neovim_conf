-- [[ local fn = vim.fn
-- local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use {
    'wbthomason/packer.nvim',
    "nvim-lua/popup.nvim",
    "nvim-lua/plenary.nvim",
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'p00f/clangd_extensions.nvim',
    'simrat39/rust-tools.nvim',
    'Hoffs/omnisharp-extended-lsp.nvim',
    'RubixDev/mason-update-all',
     --mason and lsp
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",

    'neovim/nvim-lspconfig',
    "github/copilot.vim",

    'tpope/vim-fugitive',
    'kosayoda/nvim-lightbulb',
    'navarasu/onedark.nvim',
    'saadparwaiz1/cmp_luasnip',
    'L3MON4D3/LuaSnip',

    'windwp/nvim-autopairs',
    'sheerun/vim-polyglot',
    'liuchengxu/vista.vim',
    'karb94/neoscroll.nvim',

    'nvim-lua/lsp-status.nvim',
    'Mofiqul/dracula.nvim',
    'Mofiqul/vscode.nvim',

    'lewis6991/impatient.nvim',
    "terrortylor/nvim-comment",
    'pantharshit00/vim-prisma',
    --tpope/vim-vinegar",
    'editorconfig/editorconfig-vim',
    'dense-analysis/ale',
    'machakann/vim-sandwich',
    --'fatih/vim-go',
    'sebdah/vim-delve',
    'airblade/vim-gitgutter',
    "nvim-telescope/telescope-file-browser.nvim",
    "folke/neodev.nvim"

  }

  use {
    'mfussenegger/nvim-dap',
    "rcarriga/nvim-dap-ui",
    'mfussenegger/nvim-dap-python',
    'scalameta/nvim-metals',
    'theHamsta/nvim-dap-virtual-text',
    'leoluz/nvim-dap-go',
    'nvim-telescope/telescope-dap.nvim',
    requires = {
      "mfussenegger/nvim-dap",
      "nvim-lua/plenary.nvim"
    },
    config = function() 
      require('dap-go').setup()
    end
  }

  use {'akinsho/bufferline.nvim', tag = "*", requires = 'kyazdani42/nvim-web-devicons'}

  use {
    'lewis6991/gitsigns.nvim',
    'sindrets/diffview.nvim',
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      require('gitsigns').setup()
    end
  }


  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
        require("lspsaga").setup({})
    end,
  })
  use {
    'kdheepak/tabline.nvim',
    config = function()
      require'tabline'.setup {
        -- Defaults configuration options
        enable = true,
        options = {
        -- If lualine is installed tabline will use separators configured in lualine by default.
        -- These options can be used to override those settings.
          section_separators = {'', ''},
          component_separators = {'', ''},
          max_bufferline_percent = 66, -- set to nil by default, and it uses vim.o.columns * 2/3
          show_tabs_always = false, -- this shows tabs only when there are more than one tab or if the first tab is named
          show_devicons = true, -- this shows devicons in buffer section
          show_bufnr = false, -- this appends [bufnr] to buffer section,
          show_filename_only = false, -- shows base filename only instead of relative path in filename
          modified_icon = "+ ", -- change the default modified icon
          modified_italic = false, -- set to true by default; this determines whether the filename turns italic if modified
        }
      }
      vim.cmd[[
        set guioptions-=e " Use showtabline in gui vim
        set sessionoptions+=tabpages,globals " store tabpages and globals in session
      ]]
    end,
    requires = { { 'hoob3rt/lualine.nvim', opt=true }, {'kyazdani42/nvim-web-devicons', opt = true} }
  }

  use {
	 "kyazdani42/nvim-tree.lua",
   'nvim-lualine/lualine.nvim',
	 requires = {
	   "kyazdani42/nvim-web-devicons",
	 },
	 config = function()
	    require("nvim-web-devicons").setup()
	    require("nvim-tree").setup()
	 end,
   opt = true
 }

 use {
    "folke/which-key.nvim",
  }

   use {
     'pwntester/octo.nvim',
     requires = {
       'nvim-lua/plenary.nvim',
       'nvim-telescope/telescope.nvim',
       'kyazdani42/nvim-web-devicons',
     },
     config = function ()
       require"octo".setup()
     end
   }
  
   use {
    'goolord/alpha-nvim',
    config = function ()
        require'alpha'.setup(require'alpha.themes.startify'.config)
    end
  }

  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  use { "nvim-neotest/nvim-nio" }

  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end


end) -- ]]
