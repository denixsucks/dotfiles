local present, treesitter = pcall(require, 'nvim-treesitter.configs')
if not present then return end

treesitter.setup {
  ensure_installed = "maintained",
  sync_install = false,
  -- autopairs = { enable = true },
  highlight = {
    enable = true,
    disable = { "" },
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = false, disable = { "yaml" } },
  rainbow = {
    enable = true,
    extended_mode = true,
    disable = { "html" },
    max_file_lines = nil,
  },
  autotag = {
    enable = false,
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
}
