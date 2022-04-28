local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PackerBootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/plenary.nvim'

  -- UI
  use {'kyazdani42/nvim-tree.lua', requires='kyazdani42/nvim-web-devicons'}
  use {'nvim-lualine/lualine.nvim', requires='kyazdani42/nvim-web-devicons'}
  use {'kdheepak/tabline.nvim', requires='kyazdani42/nvim-web-devicons'}
  use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}
  use 'nvim-lua/popup.nvim'
  use 'akinsho/toggleterm.nvim'
  use 'petertriho/nvim-scrollbar'
  use {'folke/zen-mode.nvim', config=function() require("zen-mode").setup()end}

  -- Syntax
  use({
    "catppuccin/nvim",
    as = "catppuccin"
  })

  use 'windwp/nvim-autopairs'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'RRethy/vim-illuminate'
  use {'norcalli/nvim-colorizer.lua', config=function() require('colorizer').setup()end}
  use {'numToStr/Comment.nvim', config=function() require('Comment').setup()end}

  -- Treesitter
  use {'nvim-treesitter/nvim-treesitter', run=':TSUpdate'}
    -- Parenthesis highlighting
  use {'p00f/nvim-ts-rainbow', after = 'nvim-treesitter'}
    -- Autoclose tags
  use {'windwp/nvim-ts-autotag', after = 'nvim-treesitter',
  }
  use {
    'SmiteshP/nvim-gps',
    requires = 'nvim-treesitter/nvim-treesitter',
    config = function() require('nvim-gps').setup() end
  }

  -- Snippets
  use 'L3MON4D3/LuaSnip'
  use 'rafamadriz/friendly-snippets'
  use 'saadparwaiz1/cmp_luasnip'

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'simrat39/symbols-outline.nvim'
  use {'folke/trouble.nvim', requires='kyazdani42/nvim-web-devicons'}
  use {
      "tami5/lspsaga.nvim",
      event = "BufRead",
      config = function()
        require("lspsaga").setup()
      end
    }
  use {'andweeb/presence.nvim',
--		event = 'BufRead',
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
  -- Completion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-nvim-lsp'

  -- Languages tools
  use {'ray-x/go.nvim', config=function() require('go').setup() end}
  use 'ellisonleao/glow.nvim'
  use {
    'iamcco/markdown-preview.nvim',
    run = "cd app && npm install",
    setup = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" }
  }
  use {'Vimjas/vim-python-pep8-indent'}

  -- Debugger
  use 'mfussenegger/nvim-dap'

  -- Telescope
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-media-files.nvim'

  if PackerBootstrap then
    require('packer').sync()
  end
end)
