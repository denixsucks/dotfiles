return require 'packer'.startup(function(use)
	use 'wbthomason/packer.nvim'

	use {'nvim-telescope/telescope.nvim',
		requires = {
			'kyazdani42/nvim-web-devicons',
			'nvim-lua/plenary.nvim'
		}
	}

	use {'romgrk/barbar.nvim',
		requires = 'kyazdani42/nvim-web-devicons',
	}

	use 'lewis6991/impatient.nvim'

 	use 'kyazdani42/nvim-tree.lua'

	
	use 'windwp/nvim-autopairs'
	use 'nekonako/xresources-nvim'

	use 'feline-nvim/feline.nvim'

	use 'andweeb/presence.nvim'

	use 'rcarriga/nvim-notify'

	use {'folke/trouble.nvim',
  	requires = 'kyazdani42/nvim-web-devicons',
	}

	  -- lsp config
  use {
    'neovim/nvim-lspconfig',
    'williamboman/nvim-lsp-installer',
  }


  -- for LSP autocompletion
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/vim-vsnip'
	use 'habamax/vim-godot'

	use 'terrortylor/nvim-comment'

	use 'xiyaowong/nvim-transparent'
end)
