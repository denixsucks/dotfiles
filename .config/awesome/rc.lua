require("variables")
require("evil")
require("awful.autofocus")
local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")
local utils = require("utils")

modkey = "Mod4"
altkey = "Mod1"
ctrlkey = "Control"
shiftkey = "Shift"

local keys = require("keys")
local rules = require("rules")

beautiful.init(string.format("%s/.config/awesome/theme/theme.lua", os.getenv("HOME")))

local widgets = require("widgets")
awful.util.terminal = terminal

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
  naughty.notify({ preset = naughty.config.presets.critical,
    title = "Oops, there were errors during startup!",
  text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
  local in_error = false
  awesome.connect_signal("debug::error", function (err)
    if in_error then return end
    in_error = true

    naughty.notify({ preset = naughty.config.presets.critical,
      title = "Oops, an error happened!",
    text = tostring(err) })
    in_error = false
  end)
end
-- }}}

-- {{{ Screen
-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", function(s)
    awful.spawn.with_shell('nitrogen --restore')
end)

-- Create a wibox for each screen and add it
awful.screen.connect_for_each_screen(function(s)
  -- Tags
  --awful.tag(awful.util.tagnames, s, awful.layout.layouts[1])
  for _, i in pairs(awful.util.tagnames[s.index]) do
    awful.tag.add(i.name, {
      layout = i.lay or awful.layout.layouts[1],
      gap = i.gap or beautiful.useless_gap,
      gap_single_client = not i.sgap,
      screen = s,
      selected = i.sel or false,
      master_width_factor = i.mw or 0.5,
    })
  end

  -- Create a promptbox for each screen
  -- Create an imagebox widget which will contains an icon indicating which layout we're using.
  -- We need one layoutbox per screen.
  s.mylayoutbox = awful.widget.layoutbox(s)
  s.mylayoutbox:buttons(gears.table.join(
    awful.button({}, 2, function() awful.layout.set( awful.layout.layouts[1] ) end),
    awful.button({}, 4, function() awful.layout.inc( 1) end),
    awful.button({}, 5, function() awful.layout.inc(-1) end)))
  -- Create a taglist widget
  s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, awful.util.taglist_buttons)

  -- Create a tasklist widget
  s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.focused)

  -- Create the wibox
  s.mywibox = awful.wibar({ position = "top", screen = s, height = 19 })

  -- Add widgets to the wibox
  s.mywibox:setup {
    layout = wibox.layout.align.horizontal,
    expand = 'none',
    { -- Left widgets
      layout = wibox.layout.fixed.horizontal,
      s.mylayoutbox,
      s.mytaglist,
      s.mypromptbox,
      widgets.seperator,
      widgets.media,
    },
      wibox.container.place(widgets.textclock, "center"),
    { -- Right widgets
      layout = wibox.layout.fixed.horizontal,
      id = "rightwidgets",
      wibox.widget.systray(),
      seperator,
      widgets.kblayout,
      widgets.temp,
      widgets.disk,
      seperator,
      widgets.cpu,
      widgets.mem,
      widgets.vol,
      widgets.bat,
      widgets.space,
    },
  }
end)
-- }}}


-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c)
  -- Start the new client as slave.
  if not awesome.startup then awful.client.setslave(c) end

  if awesome.startup and
  not c.size_hints.user_position
  and not c.size_hints.program_position then
    -- Prevent clients from being unreachable after screen count changes.
    awful.placement.no_offscreen(c, {honor_padding = true})
  end
end)


-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
  c:emit_signal("request::activate", "mouse_enter", {raise = true})
end)


-- Force minimized clients to unminimize.
client.connect_signal("property::minimized", function(c)
  c.minimized = false
end)

awful.mouse.snap.client_enabled = false

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)

-- Quake terminal
quake = utils.quake {
  app = terminal, 
  horiz = "center",
  height = 0.4,
  width = 0.9,
  followtag = true,
  border = 0,
  argname = "--class %s",
}

