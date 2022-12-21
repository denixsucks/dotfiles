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

	use {'windwp/nvim-autopairs',
		config = function()
			require 'nvim-autopairs'.setup{}
		end
	}

	use 'feline-nvim/feline.nvim'

	use {'andweeb/presence.nvim',
		config = function()
			require 'presence':setup {
				auto_update	= true,
				neovim_image_text = 'The One True Text Editor',
				main_image = 'file',
				log_level = 'error',
				debounce_timeout = 10,
				enable_line_number	= false,
				editing_text = 'Working on %s',
				file_explorer_text	= 'Browsing %s',
				git_commit_text = 'Committing Changes',
				plugin_manager_text = 'Managing Plugins',
				reading_text = 'Looking at %s',
				workspace_text = 'Workspace: %s',
				line_number_text = 'Line %s/%s',
			}
		end
	}

	use {'rcarriga/nvim-notify',
		config = function()
			vim.notify = require 'notify'
		end
	}

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

end)
