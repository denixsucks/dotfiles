-- lsp.lua (nvim-lspconfig ≥0.11)
local util = require("lspconfig/util")

-- =========================
-- Common LSP on_attach
-- =========================
local on_attach_common = function(client, bufnr)
  local opts = { buffer = bufnr }
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
end

-- =========================
-- Capabilities
-- =========================
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}
capabilities = vim.tbl_deep_extend(
  "force",
  capabilities,
  require("cmp_nvim_lsp").default_capabilities()
)

-- =========================
-- LSP Servers
-- =========================
local servers = {
  lua_ls = {
    settings = { Lua = { diagnostics = { globals = { "vim" } } } },
  },
  pyright = {},
  gopls = {},
  rust_analyzer = {},
  clangd = {
    root_dir = function(fname)
      return util.root_pattern(
            "Makefile",
            "configure.ac",
            "configure.in",
            "config.h.in",
            "meson.build",
            "meson_options.txt",
            "build.ninja"
          )(fname) or util.root_pattern("compile_commands.json", "compile_flags.txt")(fname)
          or util.find_git_ancestor(fname)
    end,
    capabilities = { offsetEncoding = { "utf-16" } },
    cmd = {
      "clangd",
      "--background-index",
      "--clang-tidy",
      "--header-insertion=iwyu",
      "--completion-style=detailed",
      "--function-arg-placeholders",
      "--fallback-style=llvm",
    },
    init_options = {
      usePlaceholders = true,
      completeUnimported = true,
      clangdFileStatus = true,
    },
  },
}

-- =========================
-- Setup servers using vim.lsp.config
-- =========================
for server, cfg in pairs(servers) do
  vim.lsp.config[server] = vim.tbl_deep_extend("force", {
    on_attach = on_attach_common,
    capabilities = capabilities,
  }, cfg)
end

-- =========================
-- Roslyn (C# / Unity)
-- =========================
require("roslyn").setup({
  on_attach = function(_, bufnr)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr })
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr })
    -- Only show WARN/ERROR
    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, {
        severity_sort = true,
        severity_limit = vim.diagnostic.severity.WARN,
      }
    )
  end,
})

-- =========================
-- Autostart LSPs by filetype
-- =========================
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "lua", "python", "go", "rust", "c", "cpp", "cs" },
  callback = function(args)
    local ft_map = {
      lua = "lua_ls",
      python = "pyright",
      go = "gopls",
      rust = "rust_analyzer",
      c = "clangd",
      cpp = "clangd",
      cs = "roslyn",
    }
    local server = ft_map[args.match]
    if server and vim.lsp.config[server] then
      vim.lsp.start(vim.lsp.config[server])
    end
  end,
})

-- =========================
-- UFO Folding
-- =========================
require("ufo").setup()
