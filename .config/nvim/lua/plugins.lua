return require 'packer'.startup(function(use)
  use 'wbthomason/packer.nvim'
  use { 'nvim-telescope/telescope.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons',
      'nvim-lua/plenary.nvim'
    }
  }

  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  use {
    'linrongbin16/lsp-progress.nvim',
    requires = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lsp-progress').setup()
    end
  }

  use 'andweeb/presence.nvim'
  use 'kyazdani42/nvim-tree.lua'
  use { 'nvim-treesitter/nvim-treesitter', run = ":TSUpdate" }
  use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' }
  use 'windwp/nvim-autopairs'
  use 'nvim-tree/nvim-web-devicons' -- OPTIONAL: for file icons
  use 'lewis6991/gitsigns.nvim'     -- OPTIONAL: for git status
  use 'romgrk/barbar.nvim'
  use { 'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  use 'rcarriga/nvim-notify'
  use { 'folke/trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
  }
  use { "akinsho/toggleterm.nvim", tag = '*', config = function()
    require("toggleterm").setup { size = 10, open_mapping = [[<C-\>]], start_in_insert = true, direction = "float", shell = "pwsh.exe", float_opts = { border = "curved", width = math.ceil(vim.o.columns * 0.8), height = math.ceil(vim.o.columns * 0.2) } }
  end
  }

  use({
    "seblyng/roslyn.nvim",
  })

  use {
    "williamboman/mason-lspconfig.nvim",
    tag = "*",
    requires = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" }
  }
	
	require("mason").setup({
    registries = {
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry",
    },
	})
  
	use({
    "L3MON4D3/LuaSnip",
    tag = "v2.4.0",
    run = "make install_jsregexp"
  })

  use 'nyoom-engineering/oxocarbon.nvim'

  use 'terrortylor/nvim-comment'
  use {
    'williamboman/mason.nvim',
    'neovim/nvim-lspconfig',
  }

  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/vim-vsnip'
end)
