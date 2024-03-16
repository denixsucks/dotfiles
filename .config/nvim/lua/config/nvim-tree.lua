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
		custom = {'.git', 'node_modules'}
	},
	view = {
		width = 20,
	}
})
