local ignore_filetypes_list = {
  "venv", "pycache_", "%.xlsx", "%.jpg", "%.png", "%.webp",
  "%.pdf", "%.odt", "%.ico", "%.meta", "%.csproj", ".git",
  "AssetBundles", "%.asset", "%.mp3", "%.wav", "%.prefab",
  "%.DS_Store", "Library"
}

local telescope = require("telescope")
local actions = require("telescope.actions")
local sorters = require("telescope.sorters")

telescope.setup({
  defaults = {
    file_ignore_patterns = ignore_filetypes_list,
    sorting_strategy = "descending",
    file_sorter = sorters.get_fzf_sorter, -- fast fuzzy sorting
    mappings = {
      i = {
        ["<esc>"] = actions.close,
      },
    },
  },
  pickers = {
    live_grep = {
      additional_args = function(_)
        local args = { "--hidden" }
        for _, pattern in ipairs(ignore_filetypes_list) do
          table.insert(args, "--glob")
          table.insert(args, "!" .. pattern)
        end
        return args
      end,
    },
  },
})

-- Load fzf-native extension
telescope.load_extension('fzf')
