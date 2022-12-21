------------------------------------------------
-- Vim Keymap Mappings
local keymaps = {
	-- Vim Remaps
	['<C-s>'] = '<cmd>silent w<CR>',					-- save
	['<C-z>'] = '<cmd>u<CR>',   							-- undo
	['<C-r>'] = '<cmd>redo<CR>', 							-- redo
	['<C-Up>'] = '<cmd>m .-2<CR>',						-- move line up
	['<C-Down>'] = '<cmd>m .1<CR>',						-- move line down
	-- NvimTree Settings
	['<C-n>'] = '<cmd>NvimTreeToggle<CR>',		-- nvimtree toggle
	-- Telescope Settings
	['tf'] = '<cmd>Telescope find_files<CR>', -- find files
	['tr'] = '<cmd>Telescope oldfiles<CR>',		-- recent files
}

------------------------------------------------
-- some of the funtionality for mapping the keymaps
function map(mode, lhs, rhs, opts)
	local options = {
		noremap = true,
		silent = true
	}

	if opts then options = vim.tbl_extend('force', options, opts) end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function normalModeMap(lhs, rhs, opts)
	map('n', lhs, rhs, opts)
end

function insertModeMap(lhs, rhs, opts)
	map('i', lhs, rhs, opts)
end

function visualModeMap(lhs, rhs, opts)
	map('v', lhs, rhs, opts)
end
------------------------------------------------

for i, k in pairs(keymaps) do -- init all keymaps
	normalModeMap(i, k)
end
