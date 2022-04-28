local present, toggleterm = pcall(require, 'toggleterm')
if not present then return end

toggleterm.setup {
  open_mapping = [[<c-\>]],
  shade_terminals = true,
  start_in_insert = true,
  insert_mappings = true,
  terminal_mappings = true,
  direction = 'horizontal',
}
