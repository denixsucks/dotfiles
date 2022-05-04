vim.opt['termguicolors'] = true

local options = {
  shell = vim.env['SHELL'],
  fileencoding = "utf-8",

  syntax = 'on',
  hidden = true,
  showtabline = 2,

  number = true,
  cursorline = true,

  ignorecase = true,
  smartcase = true,
  mouse = 'a',

  undofile = true,
  backup = false,
  writebackup = false,

  clipboard = 'unnamedplus',
  inccommand = 'nosplit',
  splitright = true,
  splitbelow = true,

  conceallevel = 0,

  tabstop = 4,
  softtabstop = 4,
  shiftwidth = 4,
  expandtab = true,
  smarttab = true,

  completeopt = { "menuone", "noselect" },
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.g.dracula_italic_comment = true

vim.cmd "highlight CursorLineNR cterm=bold"
vim.cmd[[colorscheme catppuccin]]

vim.cmd [[
augroup langindentation
  autocmd FileType go setlocal noexpandtab tabstop=4 shiftwidth=4
	autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
	autocmd Filetype vim setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4

	autocmd Filetype css setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
	autocmd Filetype scss setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
	autocmd Filetype javascript setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
	autocmd Filetype html setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
	autocmd Filetype htmldjango setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
	autocmd Filetype handlebars setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
	autocmd Filetype ember setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
	autocmd Filetype json setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
	autocmd Filetype yaml setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
	autocmd Filetype xml setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
	autocmd Filetype lua setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
augroup END
]]

local disabled_built_ins = {
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  "matchit",
  "matchparen",
  "netrw",
  "netrwFileHandlers",
  "netrwPlugin",
  "netrwSettings",
  "remote_plugins",
  "rrhelper",
  "shada_plugin",
  "spellfile_plugin",
  "tar",
  "tarPlugin",
  "tutor_mode_plugin",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
}

for _, plugin in pairs(disabled_built_ins) do vim.g["loaded_" .. plugin] = 1 end
