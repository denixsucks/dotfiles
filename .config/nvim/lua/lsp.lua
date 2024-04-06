require("mason").setup()
require("mason-lspconfig").setup()

local util = require "lspconfig/util"

-- LSP Languages
require'lspconfig'.gopls.setup{}
require'lspconfig'.clangd.setup{}
require'lspconfig'.lua_ls.setup{}
require'lspconfig'.pyright.setup{}
require'lspconfig'.rust_analyzer.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = {"rust"},
	root_dir = util.root_pattern("Cargo.toml"),
	settings = {
		['rust_analyzer'] = {
			cargo = {
				allFeatures = true,
			}
		}
	}
})

-- diagnostic symbols
local signs = { Error = "", Warn = "", Hint = "", Info =  ""}
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.api.nvim_create_user_command("DiagnosticToggle", function()
		local config = vim.diagnostic.config
		local vt = config().virtual_text
		config {
			virtual_text = not vt,
			underline = not vt,
			signs = not vt,
		}
end, {desc = "toggle diagnostic"})

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    update_in_insert = true,
    underline = true,
    severity_sort = false,
    float = {
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
    },
})

vim.opt.shortmess = vim.opt.shortmess + {c = true}
vim.api.nvim_set_option('updatetime', 300)

vim.cmd([[set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])

vim.lsp.protocol.CompletionItemKind = {
    "   (Text) ",
    "   (Method)",
    "   (Function)",
    "   (Constructor)",
    " ﴲ  (Field)",
    "[] (Variable)",
    "   (Class)",
    " ﰮ  (Interface)",
    "   (Module)",
    " 襁 (Property)",
    "   (Unit)",
    "   (Value)",
    " 練 (Enum)",
    "   (Keyword)",
    "   (Snippet)",
    "   (Color)",
    "   (File)",
    "   (Reference)",
    "   (Folder)",
    "   (EnumMember)",
    " ﲀ  (Constant)",
    " ﳤ  (Struct)",
    "   (Event)",
    "   (Operator)",
    "   (TypeParameter)"
}
