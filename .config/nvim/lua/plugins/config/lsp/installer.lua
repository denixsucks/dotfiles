local present, installer = pcall(require, "nvim-lsp-installer")
if not present then	return end

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

installer.on_server_ready(function(server)
	local opts = {
		on_attach = require("plugins.config.lsp.handlers").on_attach,
		capabilities = require("plugins.config.lsp.handlers").capabilities,
    settings = {
      Lua = {
        diagnostics = {
          globals = {'vim', 'use'}
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
        },
        telemetry = {
          enable = false,
        },
      },
      python = {
        analysis = {
          autoSearchPaths = true,
          diagnosticMode = "workspace",
          useLibraryCodeForTypes = true
        }
      },
      pylsp = {
        plugins = {
          flake8 = {
            maxLineLength = 120,
          }
        }
      }
    }
	}

	server:setup(opts)
end)
