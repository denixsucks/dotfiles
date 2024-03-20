require 'config.nvim-tree'
require 'config.nvim-treesitter'
require 'config.cmp'
require 'config.lualine'
require 'config.cmp'
require 'config.presence'

-- init some setups without config
require('nvim_comment').setup()
require("nvim-autopairs").setup()

require("mason").setup({
	ui = {
		icons = {
      package_installed = "",
			package_pending = "",
			package_uninstalled = "",
		},
	}
})

require("mason-lspconfig").setup()


local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true
}

local language_servers = require("lspconfig").util.available_servers() -- or list servers manually like {'gopls', 'clangd'}
for _, ls in ipairs(language_servers) do
	require('lspconfig')[ls].setup({
	  capabilities = capabilities
	})
end

require('ufo').setup()
