local awful = require("awful")
local utils = require("utils")

terminal = "alacritty"
browser1 = "prime-run chromium"
browser2 = "min"
editor = os.getenv("EDITOR") or "nvim"
editor_cmd = terminal .. " -e " .. editor
file1 = "thunar"
file2 = "dolphin"
music = "spotify"

thermal_zone = 1

lockscreen = "betterlockscreen -l dimblur"

awful.layout.layouts = {
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.corner.nw,
    utils.centerwork,
    awful.layout.suit.floating,
}

awful.util.tagnames = {
	{
		{name = "", sel = true},
		{name = "", sgap = true},
		{name = "", lay = awful.layout.layouts[3], mw = 0.87},
		{name = ""},
		{name = ""},
		{name = ""},
		{name = ""},
		{name = ""},
		{name = ""},
		{name = "•"},
	},
	{
		{name = "", sel = true},
		{name = ""},
		{name = ""},
		{name = ""},
		{name = ""},
		{name = ""},
		{name = ""},
		{name = ""},
		{name = ""},
		{name = "•"},
	}
}
