
local present, npairs = pcall(require, 'nvim-autopairs')
if not present then return end

npairs.setup{
  check_ts = true,
  ts_config = {
    lua = {'string'},
  }
}
