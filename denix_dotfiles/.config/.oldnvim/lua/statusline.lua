-- Examples:
-- https://github.com/haorenW1025/dotfiles/blob/130dbf80e73e71cc8f6b89066f536417f455b088/nvim/lua/status-line.lua
-- https://www.reddit.com/r/neovim/comments/kco3l3/help_lua_statusline_the_stubborn_way/

local execute = vim.api.nvim_command
local api     = vim.api
local cmd     = vim.cmd
local fn      = vim.fn
local wo      = vim.wo

-- =============================================================================
-- COLORS
-- =============================================================================

function statusline_color(name, ctermfg, ctermbg, guifg, guibg)
	-- `highlight` doesn't work until after VimEnter:
	--https://www.reddit.com/r/neovim/comments/me35u9/comment/h2x5n7u/?utm_source=share&utm_medium=web2x&context=3
	local highlight_cmd = 'autocmd VimEnter * '
		.. 'highlight StatusLine'..name
		.. (ctermfg == nil and '' or ' ctermfg='..ctermfg)
		.. (ctermbg == nil and '' or ' ctermbg='..ctermbg)
		.. (guifg == nil and '' or ' guifg='..guifg)
		.. (guibg == nil and '' or ' guibg='..guibg)
	--vim.cmd('echom "'..highlight_cmd..'"')
	execute(highlight_cmd)
end

--local default = '%#StatusLine#'
local red     = '%#StatusLineRed#'
local green   = '%#StatusLineGreen#'
local yellow  = '%#StatusLineYellow#'
local blue    = '%#StatusLineBlue#'
local magenta = '%#StatusLineMagenta#'
local cyan    = '%#StatusLineCyan#'
local white   = '%#StatusLineWhite#'

local colors = require('colors')
local cterm = colors.cterm
local gui = colors.gui

statusline_color('Red'    , cterm.red    , 236, gui.red    , gui.bg)
statusline_color('Green'  , cterm.green  , 236, gui.green  , gui.bg)
statusline_color('Yellow' , cterm.yellow , 236, gui.yellow , gui.bg)
statusline_color('Blue'   , cterm.blue   , 236, gui.blue   , gui.bg)
statusline_color('Magenta', cterm.magenta, 236, gui.magenta, gui.bg)
statusline_color('Cyan'   , cterm.cyan   , 236, gui.cyan   , gui.bg)
statusline_color('White'  , cterm.white  , 236, gui.white  , gui.bg)

-- =============================================================================
-- MODE
-- =============================================================================
function statusline_mode()
	local modelist = {
		--n = white..'[NORMAL]',
		n = '',
		i = red..'[INSERT]',
		v = blue..'[VISUAL]',
		V = blue..'[VISUAL]',
		-- TODO: Figure out why visual block mode doesn't work
		['CTRL-V'] = blue..'[VISUAL]',
		R = red..'[REPLACE]',
		s = blue..'[SELECT]',
		S = blue..'[SELECT]',
		c = magenta..'[COMMAND]',
		t = blue..'[TERM]',
	}
	return modelist[fn.mode()] or red..'[UNKNOWN-'..fn.mode()..']'
end


-- =============================================================================
-- SCROLLBAR
-- =============================================================================
function statusline_scrollbar()
	local width = 20
	local total_lines = api.nvim_buf_line_count(0)
	local top_line = api.nvim_call_function('line', {'w0'})
	local bottom_line = api.nvim_call_function('line', {'w$'})
	local top = math.ceil(width * (top_line - 1) / total_lines) + 1
	local bottom = math.floor(width * bottom_line / total_lines)

	-- Use a percentage if file is too big
	if top > bottom then
		return yellow..'[%3p%%]'
	end

	local symbol_empty = '░'
	local symbol_bar   = '█'
	--local symbol_empty = ' '
	--local symbol_bar   = '░'

	local bar = {}
	for i=1,width do
		if (i <= bottom) and (i >= top) then
			bar[i] = symbol_bar
		else
			bar[i] = symbol_empty
		end
	end
	--return yellow..'['..top..'..'..bottom..']'
	return yellow..'['..table.concat(bar, '')..']'
end

-- =============================================================================
-- STATUS LINE LEFT
-- =============================================================================
function statusline_left()
	local statusline = ''

	-- Modified
	statusline = statusline..red..'%m'
	-- Buffer number
	statusline = statusline..yellow..'[%n]'
	-- Mode
	statusline = statusline..statusline_mode()
	-- relative/path/to/file
	statusline = statusline..white..'%f'

	return statusline
end


-- =============================================================================
-- STATUS LINE RIGHT
-- =============================================================================
function statusline_right()
	local statusline = ''

	-- CurrentLine
	statusline = statusline..yellow..'%6l'
	-- TotalLines
	statusline = statusline..white..'/%L,'
	-- ColumnNumber
	statusline = statusline..yellow..'%-3c'

	-- Filetype and syntax
	-- TODO: Move filetype and syntax into StatuslineFileInfo
	statusline = statusline..green..'[%{&filetype==&syntax?&filetype:&filetype.".".&syntax}]'
	--let l:statusline .= StatuslineFileInfo(a:width)

	-- TODO: Add file size

	-- Indent status
	statusline = statusline..blue..'[%{&expandtab?"s":"t"}%{&tabstop.&softtabstop.&shiftwidth}]'

	-- Scroll statusbar
	-- TODO: Implement this
	statusline = statusline..statusline_scrollbar()

	return statusline
end


-- =============================================================================
-- STATUS LINE
-- =============================================================================
function statusline()
	local statusline = ''
	statusline = statusline..statusline_left()
	statusline = statusline..'%='
	statusline = statusline..statusline_right()

	return statusline
end

--wo.statusline = '%!luaeval("statusline()")'
vim.opt.statusline = '%!luaeval("statusline()")'
