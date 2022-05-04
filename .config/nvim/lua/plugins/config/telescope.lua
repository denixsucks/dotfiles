local present, telescope = pcall(require, 'telescope')
if not present then return end

telescope.setup{
  defaults = {
    layout_config = {
        horizontal = {
           prompt_position = "bottom",
           preview_width = 0.60,
           results_width = 0.8,
        },
        width = 0.70,
        height = 0.70,
        preview_cutoff = 120,
     },
     path_display = { 'smart' },
     pickers = {
        find_files = { preview = true },
    },
    extensions = {
      media_files = {
        filetypes = {"png", "webp", "jpg", "jpeg"},
        find_cmd = "find"
      }
    }
  }
}

telescope.load_extension("media_files")
