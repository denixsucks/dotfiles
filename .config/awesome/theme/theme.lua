local os = os

local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local xrdb = xresources.get_current_theme()

local theme = {}
theme.dir = os.getenv("HOME") .. "/.config/awesome/theme"

-- Colors
theme.xbackground = xrdb.background 
theme.xforeground = xrdb.foreground 
theme.xcolor0     = xrdb.color0     
theme.xcolor1     = xrdb.color1     
theme.xcolor2     = xrdb.color2     
theme.xcolor3     = xrdb.color3     
theme.xcolor4     = xrdb.color4     
theme.xcolor5     = xrdb.color5     
theme.xcolor6     = xrdb.color6     
theme.xcolor7     = xrdb.color7     
theme.xcolor8     = xrdb.color8     
theme.xcolor9     = xrdb.color9     
theme.xcolor10    = xrdb.color10    
theme.xcolor11    = xrdb.color11    
theme.xcolor12    = xrdb.color12    
theme.xcolor13    = xrdb.color13    
theme.xcolor14    = xrdb.color14    
theme.xcolor15    = xrdb.color15
theme.transparent = "#0000000"

-- Fonts
theme.font = "BigBlueTermPlus Nerd Font Regular 9"
theme.taglist_font = "BigBlueTermPlus Nerd Font Bold 9"
theme.iconFont = "BigBlueTermPlus Nerd Font Regular 9"

-- Standard Background and Foreground
theme.bg_normal = theme.xbackground
theme.wibar_bg = theme.xbackground .. "e6" -- opacity
theme.tasklist_bg_normal = theme.transparent
theme.fg_normal = theme.xforeground
theme.bg_focus = theme.xcolor
theme.fg_focus = theme.xforeground
theme.bg_urgent = theme.xcolor1
theme.fg_urgent = theme.xcolor15

-- Borders
theme.border_width = dpi(1)
theme.border_normal = theme.xbackground
theme.border_focus = theme.xcolor7

-- Taglist
theme.taglist_bg_focus = theme.transparent
theme.taglist_fg_focus = theme.bg_normal
theme.taglist_bg_empty = theme.transparent
theme.taglist_fg_empty = theme.fg_normal
theme.taglist_fg_occupied = theme.xcolor14
theme.taglist_bg_occupied = theme.transparent
theme.taglist_bg_urgent = theme.xcolor1
theme.taglist_fg_urgent = theme.xcolor15
theme.taglist_spacing = dpi(0)

theme.taglist_squares = "true"
theme.titlebar_close_button = "true"
theme.menu_height = dpi(10)
theme.menu_width  = dpi(100)
theme.wibar_stretch = false
theme.wibar_width = 0
theme.wibar_height = 20
theme.wibar_border_width = 0
theme.wibar_opacity = 1
theme.background_opacity = 0.1


theme.awesome_icon = theme.dir .."/icons/awesome.png"
theme.layout_tile = theme.dir .. "/icons/tile.png"
theme.layout_tileleft = theme.dir .. "/icons/tileleft.png"
theme.layout_tilebottom = theme.dir .. "/icons/tilebottom.png"
theme.layout_tiletop = theme.dir .. "/icons/tiletop.png"
theme.layout_fairv = theme.dir .. "/icons/fairv.png"
theme.layout_fairh = theme.dir .. "/icons/fairh.png"
theme.layout_spiral = theme.dir .. "/icons/spiral.png"
theme.layout_dwindle = theme.dir .. "/icons/dwindle.png"
theme.layout_fullscreen = theme.dir .. "/icons/fullscreen.png"
theme.layout_magnifier = theme.dir .. "/icons/magnifier.png"
theme.layout_floating = theme.dir .. "/icons/floating.png"
theme.layout_cornernw = theme.dir .. "/icons/cornernw.png"
theme.layout_centerwork = theme.dir .. "/icons/centerwork.png"

theme.useless_gap = dpi(2)
theme.screen_margin = dpi(0)
theme.maximized_hide_border = true
return theme
