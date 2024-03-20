------------------------------------------------
-- Vim Settings
vim.opt.hidden = true
vim.opt.cursorline = true
vim.preserveindent = true
vim.opt.wrap = false
vim.opt.termguicolors=true
vim.opt.ruler = true
vim.opt.cursorline = true
vim.opt.cursorcolumn = false
vim.opt.showmode = false
vim.opt.expandtab = false
vim.opt.mouse = 'a'
vim.opt.completeopt = 'menu,menuone,noinsert'
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.splitright = true
vim.opt.ci = true
vim.opt.undofile = true
vim.opt.guicursor:append('i:blinkwait700-blinkon400-blinkoff250')
vim.opt.laststatus = 3

vim.wo.number = true
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
vim.o.foldcolumn = '0'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

vim.opt.background = "dark"

if vim.loop.os_uname().sysname == 'Linux' then
	vim.cmd("colorscheme xresources")
else
	vim.cmd("colorscheme oxocarbon")
end

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
