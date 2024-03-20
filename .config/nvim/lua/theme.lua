if vim.loop.os_uname().sysname == 'Linux' then
	return require('xresources')
else
	return {
		bg = "#161616",
		fg = "#dde1e6",
		red = "#ee5396",
		yellow = "#3ddbd9",
		cyan = "#08bdba",
		darkblue = "#78a9ff",
		green = "#42be65",
		purple = "#be95ff",
		blue = "#33b1ff"
	}
end
