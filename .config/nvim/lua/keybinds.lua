-- Vim Keymap Mappings

local normalModeKeymaps = {
	['tf'] = '<cmd>Telescope find_files<CR>', -- find files
	['to'] = '<cmd>Telescope oldfiles<CR>',		-- recent files
	['<C-k>'] = '<Cmd>Telescope keymaps<CR>',
	['<C-x>'] = '<Cmd>TroubleToggle<CR>',
	['<C-b>'] = '<Cmd>:call v:lua.OpenTerm("TerminalSide", v:true)<CR>',
	['tt'] = '<Cmd>BufferNext<CR>',
	['tr'] = '<Cmd>BufferPrevious<CR>',
}

vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

local insertModeKeymaps = {
}

local visualModeKeymaps = {
	['<RightMouse>'] = 'y',
}

local allModeKeymaps = {
	['<C-.>'] = '<cmd>CommentToggle<CR>',
	['<C-z>'] = '<cmd>u<CR>',   							-- undo
	['<C-s>'] = '<cmd>silent w<CR>',					-- save
	['<C-r>'] = '<cmd>redo<CR>', 							-- redo
	['<A-Up>'] = '<cmd>m .-2<CR>',						-- move line up
	['<A-Down>'] = '<cmd>m .1<CR>',						-- move line down
	['<C-n>'] = '<cmd>NvimTreeToggle<CR>',		-- nvimtree toggle

}
------------------------------------------------
-- Terminal buffer
_G.OpenTerm = function(name, side)
	local term = vim.api.nvim_eval(string.format('bufwinnr("%s")', name))
	local buf = vim.api.nvim_eval(string.format('bufexists("%s")', name))

	-- If the term is visible, close it
	if term > 0 then
		-- If it's a side terminal
		if side then
			vim.cmd(tostring(term) .. 'wincmd c')
		else
			vim.cmd 'e #'
		end
	elseif buf > 0 then -- if current buffer isnt term
		if side then vim.cmd 'vsplit' end
		vim.cmd('b ' .. name)
	else -- if term doesnt exist
		if side then vim.cmd 'vsplit' end
		vim.cmd 'term'
		vim.bo.buflisted = false
		vim.wo.foldcolumn = '1' -- set left padding basically
		vim.cmd('f ' .. name)
	end
end

------------------------------------------------
-- some of the funtionality for mapping the keymaps
local function map(mode, lhs, rhs, opts)
	local options = {
		noremap = true,
		silent = true
	}

	if opts then options = vim.tbl_extend('force', options, opts) end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local function normalModeMap(lhs, rhs, opts)
	map('n', lhs, rhs, opts)
end

local function insertModeMap(lhs, rhs, opts)
	map('i', lhs, rhs, opts)
end

local function visualModeMap(lhs, rhs, opts)
	map('v', lhs, rhs, opts)
end

------------------------------------------------
for i, k in pairs(normalModeKeymaps) do -- init normal mode keymaps
	normalModeMap(i, k)
end

for i, k in pairs(insertModeKeymaps) do -- init insert mode keymaps
	insertModeMap(i, k)
end

for i, k in pairs(visualModeKeymaps) do -- init visual mode keymaps
	visualModeMap(i, k)
end

for i, k in pairs (allModeKeymaps) do		-- init keymaps for all modes
	normalModeMap(i, k)
	insertModeMap(i, k)
end
