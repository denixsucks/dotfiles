-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/denix/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/denix/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/denix/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/denix/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/denix/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    config = { "\27LJ\2\n£\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\npaths\1\0\0\1\2\0\0A~/.local/share/nvim/site/pack/packer/start/friendly-snippets\14lazy_load luasnip.loaders.from_vscode\frequire\0" },
    loaded = true,
    path = "/home/denix/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["barbar.nvim"] = {
    loaded = true,
    path = "/home/denix/.local/share/nvim/site/pack/packer/start/barbar.nvim",
    url = "https://github.com/romgrk/barbar.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/denix/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/denix/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/denix/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/denix/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["cutlass.nvim"] = {
    config = { "\27LJ\2\nF\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\fcut_key\6d\nsetup\fcutlass\frequire\0" },
    loaded = true,
    path = "/home/denix/.local/share/nvim/site/pack/packer/start/cutlass.nvim",
    url = "https://github.com/gbprod/cutlass.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/denix/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["galaxyline.nvim"] = {
    config = { "\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15statusline\frequire\0" },
    loaded = true,
    path = "/home/denix/.local/share/nvim/site/pack/packer/start/galaxyline.nvim",
    url = "https://github.com/CosmicNvim/galaxyline.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n≠\1\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\3=\3\t\2B\0\2\1K\0\1\0\nsigns\1\0\0\17changedelete\1\0\2\ttext\6|\ahl\19GitSignsChange\14topdelete\1\0\0\1\0\2\ttext\6-\ahl\19GitSignsDelete\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/denix/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/home/denix/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/home/denix/.local/share/nvim/site/pack/packer/start/lspsaga.nvim",
    url = "https://github.com/tami5/lspsaga.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/home/denix/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\nF\0\1\a\0\3\0\b6\1\0\0009\1\1\0019\1\2\1\18\3\0\0+\4\2\0+\5\2\0+\6\2\0D\1\5\0\27nvim_replace_termcodes\bapi\bvimõ\1\0\0\6\0\b\2\0286\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\2\23\0\0\0\b\0\1\0X\1\18Ä6\1\0\0009\1\1\0019\1\4\1'\3\3\0B\1\2\2\18\3\1\0009\1\5\1\18\4\0\0\18\5\0\0B\1\4\2\18\3\1\0009\1\6\1'\4\a\0B\1\3\2\v\1\0\0X\1\2Ä+\1\1\0X\2\1Ä+\1\2\0L\1\2\0\a%s\nmatch\bsub\fgetline\6.\bcol\afn\bvim\2\0C\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequire7\0\2\4\1\2\0\n-\2\0\0009\3\0\0018\2\3\2\14\0\2\0X\3\1Ä'\2\1\0009\3\0\1&\2\3\2=\2\0\1L\1\2\0\5¿\5\tkind·\1\0\1\6\5\a\0!-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\23Ä-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\4Ä-\1\1\0009\1\3\1B\1\1\1X\1\14Ä-\1\2\0B\1\1\2\15\0\1\0X\2\bÄ-\1\3\0009\1\4\1-\3\4\0'\5\5\0B\3\2\2'\4\6\0B\1\3\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\1¿\0¿\4¿\2¿\3¿\6n\n<tab>\rfeedkeys\21select_next_item\fvisible\19expand_or_jump\23expand_or_jumpableé\1\0\1\4\2\4\0\23-\1\0\0009\1\0\1)\3ˇˇB\1\2\2\15\0\1\0X\2\5Ä-\1\0\0009\1\1\1)\3ˇˇB\1\2\1X\1\vÄ-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\4Ä-\1\1\0009\1\3\1B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\1¿\0¿\21select_prev_item\fvisible\tjump\rjumpableb\0\0\3\1\5\0\14-\0\0\0009\0\0\0B\0\1\2\15\0\0\0X\1\4Ä-\0\0\0009\0\1\0B\0\1\1X\0\4Ä6\0\2\0009\0\3\0'\2\4\0B\0\2\1K\0\1\0\0¿\15stopinsert\bcmd\bvim\nclose\fvisible.\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\15stopinsert\bcmd\bvimƒ\6\1\0\14\0(\00096\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\3\0009\2\4\0023\3\5\0003\4\6\0005\5\a\0009\6\b\0005\b\f\0005\t\n\0003\n\t\0=\n\v\t=\t\r\b5\t\15\0005\n\14\0=\n\16\t3\n\17\0=\n\18\t=\t\19\b4\t\5\0005\n\20\0>\n\1\t5\n\21\0>\n\2\t5\n\22\0>\n\3\t5\n\23\0>\n\4\t=\t\24\b5\t\28\0009\n\25\0003\f\26\0005\r\27\0B\n\3\2=\n\29\t9\n\25\0003\f\30\0005\r\31\0B\n\3\2=\n \t3\n!\0=\n\"\t3\n#\0=\n$\t9\n\25\0009\n%\n5\f&\0B\n\2\2=\n'\t=\t\25\bB\6\2\0012\0\0ÄK\0\1\0\t<CR>\1\0\1\vselect\2\fconfirm\f<C-Esc>\0\n<Esc>\0\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\0\0\1\3\0\0\6i\6s\0\fmapping\fsources\1\0\1\tname\tpath\1\0\1\tname\vbuffer\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\15formatting\vformat\0\vfields\1\0\0\1\3\0\0\tabbr\tkind\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\1\0\25\vFolder\nÓ™É  \tText\nÓ™ì  \14Reference\nÓ™î  \rConstant\nÓ≠ù  \tFile\nÓ©ª  \vStruct\nÓ™ë  \nColor\nÓ≠ú  \nEvent\nÓ™Ü  \fSnippet\nÓ≠¶  \rOperator\nÓ≠§  \fKeyword\nÓ≠¢  \tEnum\nÓ™ï  \18TypeParameter\nÓ™í  \nValue\nÓ™ï  \tUnit\nÓ™ñ  \rProperty\nÓ≠•  \vModule\nÓ™ã  \14Interface\nÓ≠°  \nClass\nÓ≠õ  \rVariable\nÓ™à  \nField\nÓ≠ü  \16Constructor\nÓ™å  \rFunction\nÓ™å  \15EnumMember\nÓ™ï  \vMethod\nÓ™å  \0\0\afn\bvim\fluasnip\bcmp\frequire\0" },
    loaded = true,
    path = "/home/denix/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-gps"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rnvim-gps\frequire\0" },
    loaded = true,
    path = "/home/denix/.local/share/nvim/site/pack/packer/start/nvim-gps",
    url = "https://github.com/SmiteshP/nvim-gps"
  },
  ["nvim-lightbulb"] = {
    config = { "\27LJ\2\ns\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0Tautocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()\bcmd\bvim\0" },
    loaded = true,
    path = "/home/denix/.local/share/nvim/site/pack/packer/start/nvim-lightbulb",
    url = "https://github.com/kosayoda/nvim-lightbulb"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "/home/denix/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/denix/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-notify"] = {
    config = { "\27LJ\2\n2\0\0\4\0\3\0\0066\0\0\0006\1\2\0'\3\1\0B\1\2\2=\1\1\0K\0\1\0\frequire\vnotify\bvim\0" },
    loaded = true,
    path = "/home/denix/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\nÔ\1\0\0\5\0\14\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\t\0005\4\b\0=\4\n\3=\3\v\0025\3\f\0=\3\r\2B\0\2\1K\0\1\0\tview\1\0\1\nwidth\3\24\ffilters\vcustom\1\0\0\1\3\0\0\t.git\17node_modules\24update_focused_file\1\0\1\venable\2\16diagnostics\1\0\1\venable\2\1\0\2\15update_cwd\2\18open_on_setup\2\nsetup\14nvim-tree\frequire\0" },
    loaded = true,
    path = "/home/denix/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nç\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\14highlight\1\0\1\venable\2\21ensure_installed\1\0\0\1\3\0\0\blua\ago\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/denix/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/denix/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/denix/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/denix/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["presence.nvim"] = {
    config = { "\27LJ\2\n’\3\0\0\5\0\6\0\f6\0\0\0'\2\1\0B\0\2\2\18\2\0\0009\0\2\0005\3\3\0004\4\0\0=\4\4\0034\4\0\0=\4\5\3B\0\3\1K\0\1\0\16file_assets\14blacklist\1\0\14\23file_explorer_text\16Browsing %s\20git_commit_text\23Committing changes\17editing_text\15Editing %s\fbuttons\2\23enable_line_number\1\21debounce_timeout\3\n\19workspace_text\18Working on %s\17reading_text\15Reading %s\14client_id\023793271441293967371\24plugin_manager_text\21Managing plugins\15main_image\vneovim\21line_number_text\22Line %s out of %s\22neovim_image_text\29The One True Text Editor\16auto_update\2\nsetup\rpresence\frequire\0" },
    loaded = true,
    path = "/home/denix/.local/share/nvim/site/pack/packer/start/presence.nvim",
    url = "https://github.com/andweeb/presence.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/denix/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["trouble.nvim"] = {
    loaded = true,
    path = "/home/denix/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
try_loadstring("\27LJ\2\n£\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\npaths\1\0\0\1\2\0\0A~/.local/share/nvim/site/pack/packer/start/friendly-snippets\14lazy_load luasnip.loaders.from_vscode\frequire\0", "config", "LuaSnip")
time([[Config for LuaSnip]], false)
-- Config for: galaxyline.nvim
time([[Config for galaxyline.nvim]], true)
try_loadstring("\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15statusline\frequire\0", "config", "galaxyline.nvim")
time([[Config for galaxyline.nvim]], false)
-- Config for: nvim-lightbulb
time([[Config for nvim-lightbulb]], true)
try_loadstring("\27LJ\2\ns\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0Tautocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()\bcmd\bvim\0", "config", "nvim-lightbulb")
time([[Config for nvim-lightbulb]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n≠\1\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\3=\3\t\2B\0\2\1K\0\1\0\nsigns\1\0\0\17changedelete\1\0\2\ttext\6|\ahl\19GitSignsChange\14topdelete\1\0\0\1\0\2\ttext\6-\ahl\19GitSignsDelete\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: presence.nvim
time([[Config for presence.nvim]], true)
try_loadstring("\27LJ\2\n’\3\0\0\5\0\6\0\f6\0\0\0'\2\1\0B\0\2\2\18\2\0\0009\0\2\0005\3\3\0004\4\0\0=\4\4\0034\4\0\0=\4\5\3B\0\3\1K\0\1\0\16file_assets\14blacklist\1\0\14\23file_explorer_text\16Browsing %s\20git_commit_text\23Committing changes\17editing_text\15Editing %s\fbuttons\2\23enable_line_number\1\21debounce_timeout\3\n\19workspace_text\18Working on %s\17reading_text\15Reading %s\14client_id\023793271441293967371\24plugin_manager_text\21Managing plugins\15main_image\vneovim\21line_number_text\22Line %s out of %s\22neovim_image_text\29The One True Text Editor\16auto_update\2\nsetup\rpresence\frequire\0", "config", "presence.nvim")
time([[Config for presence.nvim]], false)
-- Config for: nvim-notify
time([[Config for nvim-notify]], true)
try_loadstring("\27LJ\2\n2\0\0\4\0\3\0\0066\0\0\0006\1\2\0'\3\1\0B\1\2\2=\1\1\0K\0\1\0\frequire\vnotify\bvim\0", "config", "nvim-notify")
time([[Config for nvim-notify]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\nç\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\14highlight\1\0\1\venable\2\21ensure_installed\1\0\0\1\3\0\0\blua\ago\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\nÔ\1\0\0\5\0\14\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\t\0005\4\b\0=\4\n\3=\3\v\0025\3\f\0=\3\r\2B\0\2\1K\0\1\0\tview\1\0\1\nwidth\3\24\ffilters\vcustom\1\0\0\1\3\0\0\t.git\17node_modules\24update_focused_file\1\0\1\venable\2\16diagnostics\1\0\1\venable\2\1\0\2\15update_cwd\2\18open_on_setup\2\nsetup\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: cutlass.nvim
time([[Config for cutlass.nvim]], true)
try_loadstring("\27LJ\2\nF\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\fcut_key\6d\nsetup\fcutlass\frequire\0", "config", "cutlass.nvim")
time([[Config for cutlass.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\nF\0\1\a\0\3\0\b6\1\0\0009\1\1\0019\1\2\1\18\3\0\0+\4\2\0+\5\2\0+\6\2\0D\1\5\0\27nvim_replace_termcodes\bapi\bvimõ\1\0\0\6\0\b\2\0286\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\2\23\0\0\0\b\0\1\0X\1\18Ä6\1\0\0009\1\1\0019\1\4\1'\3\3\0B\1\2\2\18\3\1\0009\1\5\1\18\4\0\0\18\5\0\0B\1\4\2\18\3\1\0009\1\6\1'\4\a\0B\1\3\2\v\1\0\0X\1\2Ä+\1\1\0X\2\1Ä+\1\2\0L\1\2\0\a%s\nmatch\bsub\fgetline\6.\bcol\afn\bvim\2\0C\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequire7\0\2\4\1\2\0\n-\2\0\0009\3\0\0018\2\3\2\14\0\2\0X\3\1Ä'\2\1\0009\3\0\1&\2\3\2=\2\0\1L\1\2\0\5¿\5\tkind·\1\0\1\6\5\a\0!-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\23Ä-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\4Ä-\1\1\0009\1\3\1B\1\1\1X\1\14Ä-\1\2\0B\1\1\2\15\0\1\0X\2\bÄ-\1\3\0009\1\4\1-\3\4\0'\5\5\0B\3\2\2'\4\6\0B\1\3\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\1¿\0¿\4¿\2¿\3¿\6n\n<tab>\rfeedkeys\21select_next_item\fvisible\19expand_or_jump\23expand_or_jumpableé\1\0\1\4\2\4\0\23-\1\0\0009\1\0\1)\3ˇˇB\1\2\2\15\0\1\0X\2\5Ä-\1\0\0009\1\1\1)\3ˇˇB\1\2\1X\1\vÄ-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\4Ä-\1\1\0009\1\3\1B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\1¿\0¿\21select_prev_item\fvisible\tjump\rjumpableb\0\0\3\1\5\0\14-\0\0\0009\0\0\0B\0\1\2\15\0\0\0X\1\4Ä-\0\0\0009\0\1\0B\0\1\1X\0\4Ä6\0\2\0009\0\3\0'\2\4\0B\0\2\1K\0\1\0\0¿\15stopinsert\bcmd\bvim\nclose\fvisible.\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\15stopinsert\bcmd\bvimƒ\6\1\0\14\0(\00096\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\3\0009\2\4\0023\3\5\0003\4\6\0005\5\a\0009\6\b\0005\b\f\0005\t\n\0003\n\t\0=\n\v\t=\t\r\b5\t\15\0005\n\14\0=\n\16\t3\n\17\0=\n\18\t=\t\19\b4\t\5\0005\n\20\0>\n\1\t5\n\21\0>\n\2\t5\n\22\0>\n\3\t5\n\23\0>\n\4\t=\t\24\b5\t\28\0009\n\25\0003\f\26\0005\r\27\0B\n\3\2=\n\29\t9\n\25\0003\f\30\0005\r\31\0B\n\3\2=\n \t3\n!\0=\n\"\t3\n#\0=\n$\t9\n\25\0009\n%\n5\f&\0B\n\2\2=\n'\t=\t\25\bB\6\2\0012\0\0ÄK\0\1\0\t<CR>\1\0\1\vselect\2\fconfirm\f<C-Esc>\0\n<Esc>\0\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\0\0\1\3\0\0\6i\6s\0\fmapping\fsources\1\0\1\tname\tpath\1\0\1\tname\vbuffer\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\15formatting\vformat\0\vfields\1\0\0\1\3\0\0\tabbr\tkind\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\1\0\25\vFolder\nÓ™É  \tText\nÓ™ì  \14Reference\nÓ™î  \rConstant\nÓ≠ù  \tFile\nÓ©ª  \vStruct\nÓ™ë  \nColor\nÓ≠ú  \nEvent\nÓ™Ü  \fSnippet\nÓ≠¶  \rOperator\nÓ≠§  \fKeyword\nÓ≠¢  \tEnum\nÓ™ï  \18TypeParameter\nÓ™í  \nValue\nÓ™ï  \tUnit\nÓ™ñ  \rProperty\nÓ≠•  \vModule\nÓ™ã  \14Interface\nÓ≠°  \nClass\nÓ≠õ  \rVariable\nÓ™à  \nField\nÓ≠ü  \16Constructor\nÓ™å  \rFunction\nÓ™å  \15EnumMember\nÓ™ï  \vMethod\nÓ™å  \0\0\afn\bvim\fluasnip\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: nvim-gps
time([[Config for nvim-gps]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rnvim-gps\frequire\0", "config", "nvim-gps")
time([[Config for nvim-gps]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
