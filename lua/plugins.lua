local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd [[packadd packer.nvim]]


return require('packer').startup(function()

  use 'wbthomason/packer.nvim'
  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"
  use 'neovim/nvim-lspconfig' 
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'p00f/clangd_extensions.nvim'
  use 'simrat39/rust-tools.nvim'
  use 'Hoffs/omnisharp-extended-lsp.nvim'
 	use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}
  use { 'RubixDev/mason-update-all' }

  use { "williamboman/mason.nvim" }
  use { "github/copilot.vim"}
  use 'fatih/vim-go'
  use 'sebdah/vim-delve'
  use 'omnisharp/omnisharp-vim'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip' 
  use 'mfussenegger/nvim-dap'

  use 'bazelbuild/vim-bazel'
  use 'google/vim-maktaba'
  use 'tpope/vim-fugitive'
  use 'ellisonleao/gruvbox.nvim'
  use 'kosayoda/nvim-lightbulb'
  use 'navarasu/onedark.nvim'
  use {'akinsho/bufferline.nvim', tag = "*", requires = 'kyazdani42/nvim-web-devicons'}
  use 'windwp/nvim-autopairs'
  use 'sheerun/vim-polyglot'
  use 'liuchengxu/vista.vim'
  use 'karb94/neoscroll.nvim'
  use({'scalameta/nvim-metals', requires = { "nvim-lua/plenary.nvim" }})
  use 'mhinz/vim-startify'
  use 'nvim-lua/lsp-status.nvim'
  use 'Mofiqul/dracula.nvim'
  use 'lewis6991/impatient.nvim'
  use "terrortylor/nvim-comment"
  use 'pantharshit00/vim-prisma'
  use {"tpope/vim-vinegar"}
  use 'editorconfig/editorconfig-vim'
  use 'Mofiqul/vscode.nvim'

  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

  use 'dense-analysis/ale'
  use 'machakann/vim-sandwich'
  use 'mfussenegger/nvim-jdtls'


  use {
    'glacambre/firenvim',
    run = function() vim.fn['firenvim#install'](0) end 
  }


  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    
    config = function()
      require('gitsigns').setup()
    end
    -- tag = 'release' -- To use the latest release
  }

  use 'airblade/vim-gitgutter'

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
  use 'simrat39/rust-tools.nvim'

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function ()
        require'alpha'.setup(require'alpha.themes.dashboard'.config)
    end
  }

  use {'theHamsta/nvim-dap-virtual-text'}

  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
  use {'nvim-telescope/telescope-dap.nvim'}
  use {'mfussenegger/nvim-dap-python'}
  use {
	 "kyazdani42/nvim-tree.lua",
	 requires = {
	   "kyazdani42/nvim-web-devicons",
	 },
	 config = function()
	       require("nvim-web-devicons").setup()

	    require("nvim-tree").setup()
	 end
 }
 use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
 }

 use {
  "folke/which-key.nvim",
  config = function()
    require("which-key").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
}
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use 'leoluz/nvim-dap-go'
  use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end


end)
