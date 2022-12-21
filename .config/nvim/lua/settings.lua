------------------------------------------------
-- Vim Settings
vim.o.hidden = true
vim.o.cursorline = true
vim.preserveindent = true
vim.o.termguicolors = true
vim.o.wrap = false
vim.o.ruler = false
vim.o.showmode = false
vim.o.expandtab = false
vim.o.mouse = 'a'
vim.o.completeopt = 'menu,menuone,noinsert'
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 0
vim.o.splitright = true
vim.o.foldenable = true
vim.o.foldmethod = 'indent'
vim.wo.number = true
vim.opt.ci = true
vim.opt.undofile = true
vim.opt.guicursor:append('i:blinkwait700-blinkon400-blinkoff250')
vim.cmd 'autocmd TermOpen * setlocal nonumber norelativenumber foldcolumn=3'
vim.opt.laststatus=3
------------------------------------------------
-- Disable unwanted built-in plugins
local disabledBuiltInPlugins = {
  'netrw',
  'netrwPlugin',
  'netrwSettings',
  'netewFileHandlers',
  'gzip',
  'zip',
  'zipPlugin',
  'tar',
  'tarPlugin',
  'getscript',
  'getscriptPlugin',
  'vimball',
  'vimballPlugin',
  '2html_plugin',
  'logipat',
  'rrhelper',
  'spellfile_plugin',
}

for _, p in pairs(disabledBuiltInPlugins) do
  vim.g['loaded_' .. p] = 1
end
