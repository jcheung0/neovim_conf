



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
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip' 
  use 'mfussenegger/nvim-dap'

  use {"tpope/vim-vinegar"}
  
 
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

	      require("nvim-tree").setup {
		hijack_cursor = true,
		view = {
		  width = 40
		}
	      }	
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
