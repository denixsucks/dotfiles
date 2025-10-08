local nvimtree = require 'nvim-tree'

nvimtree.setup({
  update_cwd = true,
  diagnostics = {
    enable = true,
  },
  update_focused_file = {
    enable = true,
  },
  filters = {
    dotfiles = false,
    git_clean = false,
    no_buffer = false,
    custom = { '.git', 'node_modules', '*.meta' },
  },
  git = {
    enable = false,
  },
  view = {
    width = 30,
  }
})
