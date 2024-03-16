return require 'packer'.startup(function(use)
  use 'wbthomason/packer.nvim'
  use { 'nvim-telescope/telescope.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons',
      'nvim-lua/plenary.nvim'
    }
  }

  use {
    'linrongbin16/lsp-progress.nvim',
    requires = {'nvim-tree/nvim-web-devicons'},
    config = function()
      require('lsp-progress').setup()
    end
  }

  use 'kyazdani42/nvim-tree.lua'
  use {'nvim-treesitter/nvim-treesitter', run = ":TSUpdate"}
  use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}


  use 'windwp/nvim-autopairs'

  use 'rcarriga/nvim-notify'
  use { 'folke/trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
  }

	if vim.loop.os_uname().sysname == 'Linux' then
		use 'nekonako/xresources-nvim'
	else
		use 'nyoom-engineering/oxocarbon.nvim'
	end

	use 'terrortylor/nvim-comment'
  use {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
  }

  use 'simrat39/rust-tools.nvim'
	use 'hrsh7th/nvim-cmp'
 	use 'hrsh7th/cmp-nvim-lsp'

  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/vim-vsnip'


end)
