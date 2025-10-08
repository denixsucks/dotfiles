local colors

if vim.o.background == "light" then
  colors = {
    bg       = "#f0f0f0",
    fg       = "#4c566a",
    red      = "#bf616a",
    yellow   = "#ebcb8b",
    cyan     = "#88c0d0",
    darkblue = "#5e81ac",
    green    = "#a3be8c",
    purple   = "#b48ead",
    blue     = "#81a1c1",
  }
else
  colors = {
    bg       = "#161616",
    fg       = "#dde1e6",
    red      = "#ee5396",
    yellow   = "#3ddbd9",
    cyan     = "#08bdba",
    darkblue = "#78a9ff",
    green    = "#42be65",
    purple   = "#be95ff",
    blue     = "#33b1ff",
  }
end

return colors
