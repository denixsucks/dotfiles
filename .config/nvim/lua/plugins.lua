return require 'packer'.startup(function(use)
  use 'wbthomason/packer.nvim'
  use { 'nvim-telescope/telescope.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons',
      'nvim-lua/plenary.nvim'
    }
  }
  use { 'romgrk/barbar.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
  }

  use {
    'linrongbin16/lsp-progress.nvim',
    requires = {'nvim-tree/nvim-web-devicons'},
    config = function()
      require('lsp-progress').setup()
    end
  }

  use 'lewis6991/impatient.nvim'
  use 'kyazdani42/nvim-tree.lua'
  use 'windwp/nvim-autopairs'

  use({
    'glepnir/galaxyline.nvim',
    branch = 'main',
    -- config = function()
      -- require('config.galaxyline')
    -- end,
    requires = { 'nvim-tree/nvim-web-devicons', opt = true },
  })

  use 'andweeb/presence.nvim'
  use 'rcarriga/nvim-notify'
  use { 'folke/trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
  }
  use 'folke/tokyonight.nvim'
  use 'terrortylor/nvim-comment'
  use {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
  }
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
end)
