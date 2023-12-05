require("mason").setup()
require("mason-lspconfig").setup()

local omnisharp_server_location = 'C:\\DevTools\\omnisharp\\OmniSharp.exe'

local function join_paths(...)
	local path_sep = on_windows and "\\" or "/"
	local result = table.concat({ ... }, path_sep)
	return result
end

require'lspconfig'.clangd.setup{}
require'lspconfig'.lua_ls.setup{}
require'lspconfig'.pyright.setup{}

require('lspconfig').omnisharp.setup{
	cmd = { omnisharp_server_location, "--languageserver" , "--hostPID", tostring(pid) },
  on_attach = on_attach,
  capabilities = capabilities
}

-- diagnostic symbols
local signs = { Error = "", Warn = "", Hint = "", Info =  ""}
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

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
