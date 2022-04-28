function map(mode, lhs, rhs, opts)
	local options = {
		noremap = true,
		silent = true
	}

	if opts then options = vim.tbl_extend('force', options, opts) end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function nimap(lhs, rhs, opts)
	map('n', lhs, rhs, opts)
	map('i', lhs, rhs, opts)
end

-- Editor
nimap('<C-s>', '<Cmd>silent w<CR>') -- Save
nimap('<C-z>', '<Cmd>u<CR>') -- Undo
map('s', '<C-z>', '<Cmd>u<CR>') -- Undo
nimap('<C-r>', '<Cmd>redo<CR>') -- Redo
nimap('<C-S-Up>', '<Cmd>m .-2<CR>') -- Move line up
nimap('<C-S-Down>', '<Cmd>m .+1<CR>') -- Move line down


-- Copy Paste Right Mouse Click
map('v', '<RightMouse>', "y")
nimap('<RightMouse>', 'p')
map('v', '<S-RightMouse>', "p")

vim.cmd [[imap <silent><script><expr> <C-d> copilot#Accept("\<CR>")]]

-- Toggle a terminal buffer
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

-- Lspsaga
nimap('<C-e>', '<Cmd>Lspsaga hover_doc<CR>')
nimap('<C-g>', '<Cmd>Lspsaga rename<CR>')

-- Telescope
nimap('<C-t>', [[<Cmd>:lua require 'telescope.builtin'.lsp_code_actions(require 'telescope.themes'.get_cursor{})<CR>]])

local maps = {
  -- NvimTree
  {'n', '<C-n>', '<Cmd>NvimTreeToggle<CR>'},
  {'n', '<leader>r', '<Cmd>NvimTreeRefresh<CR>'},
  -- Telescope
  {'n', 'ff', ':Telescope find_files<CR>'},
  {'n', 'fl', ':Telescope live_grep<CR>'},
  {'n', 'fb', ':Telescope buffers<CR>'},
  {'n', 'ft', ':Telescope lsp_document_symbols<CR>'},
  {'n', 'fg', ':Telescope git_files<CR>'},
  {'n', 'fc', ':Telescope git_bcommits<CR>'},
  {'n', 'fC', ':Telescope git_commits<CR>'},
  {'n', 'fs', ':Telescope git_status<CR>'},
  {'n', 'fS', ':Telescope git_stash<CR>'},
  {'n', 'fm', ':Telescope media_files<CR>'},
  {'n', 'fq', ':Telescope neoclip<CR>'},
  -- Trouble
  {'n', '<C-X>', ':TroubleToggle workspace_diagnostics<CR>'},
  -- Lspsaga
  {'n', '[e', '<Cmd>Lspsaga diagnostic_jump_next<CR>'},
  {'n', ']e', '<Cmd>Lspsaga diagnostic_jump_prev<CR>'},
  -- Barbar
  {'n', '<A-z>', '<Cmd>BufferPrevious<CR>'},
  {'n', '<A-x>', '<Cmd>BufferNext<CR>'},
  {'n', '<A-c>', '<Cmd>BufferClose<CR>'},
  {'n', '<A-S-c>', '<Cmd>BufferClose!<CR>'},
  -- Side Terminal
  {'n', '<M-`>', '<Cmd>:call v:lua.OpenTerm("TerminalSide", v:true)<CR>'},-- Toggle a side terminal
  {'t', '<M-`>', '<C-\\><C-n>:call v:lua.OpenTerm("TerminalSide", v:true)<CR>'}, -- Map in terminal mode
  {'n', '<M-CR>', '<Cmd>:call v:lua.OpenTerm("Terminal", v:false)<CR>'},
  {'n', '<M-CR>', '<C-\\><C-n>:call v:lua.OpenTerm("Terminal", v:false)<CR>'},
  {'t', '<Esc><Esc>', '<C-\\><C-n>'}



}
for _, i in pairs(maps) do
  vim.api.nvim_set_keymap(i[1], i[2], i[3], {noremap = true, silent = true})
end

