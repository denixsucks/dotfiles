local present, _ = pcall(require, "lspconfig")
if not present then return end

require('plugins.config.lsp.installer')
require('plugins.config.lsp.handlers').setup()
require('plugins.config.lsp.null')
require('plugins.config.lsp.trouble')
