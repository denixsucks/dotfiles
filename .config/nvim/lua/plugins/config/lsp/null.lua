local present, null = pcall(require, "null-ls")
if not present then	return end

local formatting = null.builtins.formatting
local diagnostics = null.builtins.diagnostics

null.setup({
	debug = false,
	sources = {
		null.builtins.diagnostics.flake8.with({
			args = {"--max-line-length", "120", "--stdin-display-name", "$FILENAME", "-" }
		}),
		formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
		formatting.black.with({ extra_args = { "--fast" } }),
		formatting.stylua,
	},
})
