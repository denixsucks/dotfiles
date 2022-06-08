return require 'packer'.startup(function(use)
	-- Packer is stupid so i have to have it here too
	use 'wbthomason/packer.nvim'

	use 'lewis6991/impatient.nvim'

	-- Buffer line
	-- Might replace with nvim-bufferline
	use {'romgrk/barbar.nvim', requires = 'kyazdani42/nvim-web-devicons'}

	use {'kyazdani42/nvim-tree.lua',
		config = function()
			require 'nvim-tree'.setup {
				open_on_setup = true,
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
					width = 24,
					auto_resize = true
				}
			}
		end
	}

	use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'},
		config = function()
			require 'gitsigns'.setup {
				signs = {
					topdelete = {
						hl = 'GitSignsDelete',
						text = '-'
					},
					changedelete = {
						hl = 'GitSignsChange',
						text = '|'
					},
				}
			}
		end
	}

	-- Completions
	use {
		'L3MON4D3/LuaSnip', requires = 'rafamadriz/friendly-snippets',
		config = function()
			require 'luasnip.loaders.from_vscode'.lazy_load {
				paths = { '~/.local/share/nvim/site/pack/packer/start/friendly-snippets' }
			}
		end
	}

	-- i have copilot pog
	use {'github/copilot.vim',
--		event = 'BufEnter',
		config = function ()
			vim.g.copilot_no_tab_map = true
			vim.g.copilot_assume_mapped = true
		end
	}

	use 'tami5/lspsaga.nvim'

	use {'hrsh7th/nvim-cmp',
		requires = {
			-- LSP things
			'neovim/nvim-lspconfig',
			'williamboman/nvim-lsp-installer',
			-- Sources
			'hrsh7th/cmp-nvim-lsp', -- lsp
			'hrsh7th/cmp-path', -- file paths
			'hrsh7th/cmp-buffer',
			'saadparwaiz1/cmp_luasnip'
		},
		config = function()
			local cmp = require 'cmp'
			local luasnip = require 'luasnip'
			local fn = vim.fn

			local function t(str)
				return vim.api.nvim_replace_termcodes(str, true, true, true)
			end

			local check_back_space = function()
				local col = vim.fn.col '.' - 1
				return col == 0 or vim.fn.getline('.'):sub(col, col):match '%s' ~= nil
			end

			local cmp_kinds = {
				Text = '  ',
				Method = '  ',
				Function = '  ',
				Constructor = '  ',
				Field = '  ',
				Variable = '  ',
				Class = '  ',
				Interface = '  ',
				Module = '  ',
				Property = '  ',
				Unit = '  ',
				Value = '  ',
				Enum = '  ',
				Keyword = '  ',
				Snippet = '  ',
				Color = '  ',
				File = '  ',
				Reference = '  ',
				Folder = '  ',
				EnumMember = '  ',
				Constant = '  ',
				Struct = '  ',
				Event = '  ',
				Operator = '  ',
				TypeParameter = '  ',
			}

			-- i hate lsp
			---@diagnostic disable-next-line: redundant-parameter
			cmp.setup {
				snippet = {
					expand = function(args)
						require 'luasnip'.lsp_expand(args.body)
					end
				},
				formatting = {
					fields = { 'abbr', 'kind' },
					format = function(_, item)
						item.kind = (cmp_kinds[item.kind] or '') .. item.kind
						return item
					end,
				},
				sources = {
					{ name = 'nvim_lsp' },
					{ name = 'luasnip' },
					{ name = 'buffer' },
					{ name = 'path' },
				},
				mapping = {
					['<Tab>'] = cmp.mapping(function (cb)
						if luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						elseif cmp.visible() then
							cmp.select_next_item()
						elseif check_back_space() then
							fn.feedkeys(t '<tab>', 'n')
						else
							cb()
						end
					end, { 'i', 's' }),
					['<S-Tab>'] = cmp.mapping(function (cb)
						if luasnip.jumpable(-1) then
							luasnip.jump(-1)
						elseif cmp.visible() then
							cmp.select_prev_item()
						else
							cb()
						end
					end, { 'i', 's' }),
					['<Esc>'] = function()
						if cmp.visible() then
							cmp.close()
						else
							vim.cmd 'stopinsert'
						end
					end,
					['<C-Esc>'] = function () vim.cmd 'stopinsert' end,
					['<CR>'] = cmp.mapping.confirm {select = true},
				}
			}
		end
	}

	use {'CosmicNvim/galaxyline.nvim', branch = 'main',
		config = function()
			require 'statusline'
		end
	}

	use {'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
--		event = 'BufRead',
		config = function()
			require 'nvim-treesitter.configs'.setup {
				ensure_installed = {'lua', 'go'},
				highlight = {
					enable = true
				}
			}
		end
	}

	use {'windwp/nvim-autopairs',
		config = function()
			require 'nvim-autopairs'.setup{}
		end
	}

	use {'andweeb/presence.nvim',
--		event = 'BufRead',
		config = function()
			require("presence"):setup({
				-- General options
				auto_update         = true,                       -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
				neovim_image_text   = "The One True Text Editor", -- Text displayed when hovered over the Neovim image
				main_image          = "neovim",                   -- Main image display (either "neovim" or "file")
				client_id           = "793271441293967371",       -- Use your own Discord application client id (not recommended)
				log_level           = nil,                        -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
				debounce_timeout    = 10,                         -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
				enable_line_number  = false,                      -- Displays the current line number instead of the current project
				blacklist           = {},                         -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
				buttons             = true,                       -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
				file_assets         = {},                         -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
			
				-- Rich Presence text options
				editing_text        = "Editing %s",               -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
				file_explorer_text  = "Browsing %s",              -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
				git_commit_text     = "Committing changes",       -- Format string rendered when committing changes in git (either string or function(filename: string): string)
				plugin_manager_text = "Managing plugins",         -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
				reading_text        = "Reading %s",               -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
				workspace_text      = "Working on %s",            -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
				line_number_text    = "Line %s out of %s",        -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
			})
		end
	}

	use {'folke/trouble.nvim', requires = 'kyazdani42/nvim-web-devicons'}

	use {'rcarriga/nvim-notify',
		config = function()
			vim.notify = require 'notify'
		end
	}

	use {'SmiteshP/nvim-gps',
		config = function()
			require 'nvim-gps'.setup {}
		end
	}

	use {'gbprod/cutlass.nvim',
		config = function()
			require 'cutlass'.setup {
				cut_key = 'd'
			}
		end
	}

	use {'nvim-telescope/telescope.nvim', requires = {'kyazdani42/nvim-web-devicons', 'nvim-lua/plenary.nvim'}}

	use {'kosayoda/nvim-lightbulb',
		config = function ()
			vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]
		end
	}
	use{"catppuccin/nvim",
		as = "catppuccin",
		config = function()
			require 'catppuccin'.setup {
				transparent_background = false,
				term_colors = false,
				styles = {
					comments = "italic",
					functions = "italic",
					keywords = "italic",
					strings = "NONE",
					variables = "italic",
				},
			integrations = {
			treesitter = true,
			native_lsp = {
				enabled = true,
				virtual_text = {
					errors = "italic",
					hints = "italic",
					warnings = "italic",
					information = "italic",
				},
				underlines = {
					errors = "underline",
					hints = "underline",
					warnings = "underline",
					information = "underline",
				},
			},
			lsp_trouble = false,
			cmp = true,
			lsp_saga = false,
			gitgutter = false,
			gitsigns = true,
			telescope = true,
			nvimtree = {
				enabled = true,
				show_root = false,
				transparent_panel = false,
			},
			neotree = {
				enabled = false,
				show_root = false,
				transparent_panel = false,
			},
			which_key = false,
			indent_blankline = {
				enabled = true,
				colored_indent_levels = false,
			},
			dashboard = true,
			neogit = false,
			vim_sneak = false,
			fern = false,
			barbar = false,
			bufferline = true,
			markdown = true,
			lightspeed = false,
			ts_rainbow = false,
			hop = false,
			notify = true,
			telekasten = true,
			symbols_outline = true,
		}

,	}
		
end
}

	
end)
