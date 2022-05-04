local awful = require("awful")
local naughty = require("naughty")
local gears = require("gears")
local hotkeys_popup = require("awful.hotkeys_popup").widget
require("awful.hotkeys_popup.keys")
local wibox = require("wibox")
local variables = require("variables")


modkey = "Mod4"
altkey = "Mod1"
ctrlkey = "Control"
shiftkey = "Shift"

local keys = {}

globalkeys = gears.table.join(
  -- Move between tags
  awful.key({ modkey, }, "j", awful.tag.viewprev,
    {description = "view previous", group = "tag"}),
  awful.key({ modkey, }, "k", awful.tag.viewnext,
    {description = "view next", group = "tag"}),
  awful.key({ modkey }, "Tab", awful.tag.history.restore,
    {description = "go back", group = "tag"}),

  -- Focus clients by direction
  awful.key({ modkey }, "Down",
    function()
      awful.client.focus.global_bydirection("down")
      if client.focus then client.focus:raise() end
    end,
    {description = "focus down", group = "client"}),
  awful.key({ modkey }, "Up",
    function()
      awful.client.focus.global_bydirection("up")
      if client.focus then client.focus:raise() end
    end,
    {description = "focus up", group = "client"}),
  awful.key({ modkey }, "Left",
    function()
      awful.client.focus.global_bydirection("left")
      if client.focus then client.focus:raise() end
    end,
    {description = "focus left", group = "client"}),
  awful.key({ modkey }, "Right",
    function()
      awful.client.focus.global_bydirection("right")
      if client.focus then client.focus:raise() end
    end,
    {description = "focus right", group = "client"}),

  -- Focus client by index (cycle through clients)
  awful.key({ modkey }, "l", function() awful.client.focus.byidx(1) end,
    {description = "focus next by index", group = "client"}),
  awful.key({ modkey }, "h", function() awful.client.focus.byidx(-1) end,
    {description = "focus previous by index", group = "client"}),

  -- Layout manipulation
  awful.key({ modkey, shiftkey }, "Left", function() awful.client.swap.global_bydirection("left") end,
    {description = "swap with direction left", group = "client"}),
  awful.key({ modkey, shiftkey }, "Right", function() awful.client.swap.global_bydirection("right") end,
    {description = "swap with direction right", group = "client"}),
  awful.key({ modkey, shiftkey }, "Up", function() awful.client.swap.global_bydirection("up") end,
    {description = "swap with direction up", group = "client"}),
  awful.key({ modkey, shiftkey }, "Down", function() awful.client.swap.global_bydirection("down") end,
    {description = "swap with direction down", group = "client"}),

  -- Move between screens
  awful.key({ altkey }, "Left", function() awful.screen.focus_relative( 1) end,
    {description = "focus the next screen", group = "screen"}),
  awful.key({ altkey }, "Right", function() awful.screen.focus_relative(-1) end,
    {description = "focus the previous screen", group = "screen"}),

  awful.key({ modkey }, "u", awful.client.urgent.jumpto,
    {description = "jump to urgent client", group = "client"}),


  -- Standard program
  awful.key({ modkey }, "Return", function() awful.spawn(terminal) end,
    {description = "open a terminal", group = "apps"}),

  awful.key({ modkey }, "w", function() awful.spawn(browser1) end,
    {description = "open ".. browser1, group = "apps"}),
  awful.key({ modkey, shiftkey }, "w", function() awful.spawn(browser2) end,
    {description = "open " .. browser2, group = "apps"}),

  awful.key({ modkey }, "r", function() awful.spawn(file1) end,
    {description = "open main file manager", group = "apps"}),
  awful.key({ modkey, shiftkey }, "r", function() awful.spawn(file2) end,
    {description = "open secondary file manager", group = "apps"}),
  awful.key({ modkey }, "n", function() awful.spawn(music) end,
    {description = "open ncmpcpp", group = "apps"}),

  -- Awesome actions
  awful.key({ modkey, shiftkey }, "F2", awesome.restart,
    {description = "reload awesome", group = "awesome"}),
  awful.key({ modkey, shiftkey }, "q", awesome.quit,
    {description = "quit awesome", group = "awesome"}),
  awful.key({ modkey }, "F1", hotkeys_popup.show_help,
    {description = "show help", group = "awesome"}),

  awful.key({ modkey, shiftkey }, "l", function() awful.tag.incmwfact( 0.05) end,
    {description = "increase master width factor", group = "layout"}),
  awful.key({ modkey, shiftkey }, "h", function() awful.tag.incmwfact(-0.05) end,
    {description = "decrease master width factor", group = "layout"}),

  awful.key({ modkey, altkey }, "k", function() awful.tag.incnmaster( 1, nil, true) end,
    {description = "increase the number of master clients", group = "layout"}),
  awful.key({ modkey, altkey }, "j", function() awful.tag.incnmaster(-1, nil, true) end,
    {description = "decrease the number of master clients", group = "layout"}),

  awful.key({ modkey, ctrlkey }, "l", function() awful.tag.incncol( 1, nil, true) end,
    {description = "increase the number of columns", group = "layout"}),
  awful.key({ modkey, ctrlkey }, "h", function() awful.tag.incncol(-1, nil, true) end,
    {description = "decrease the number of columns", group = "layout"}),

  awful.key({ modkey }, "space", function() awful.layout.inc( 1) end,
    {description = "select next", group = "layout"}),
  awful.key({ modkey, shiftkey }, "space", function() awful.layout.inc(-1) end,
    {description = "select previous", group = "layout"}),

  awful.key({ modkey }, "a", function () quake:toggle() end),

  awful.key({ modkey, "Control" }, "n",
    function ()
      local c = awful.client.restore()
      -- Focus restored client
      if c then
        client.focus = c
        c:raise()
      end
    end,
    {description = "restore minimized", group = "client"}),

  -- Menubar
  awful.key({ altkey }, "space", function() awful.spawn.with_shell("rofi -show combi -combi-modi \"drun,run\"") end,
    {description = "show the menubar", group = "launcher"}),

  -- Action Menus
  awful.key({ modkey }, "F3",
    function()
      awful.spawn.with_shell("displayselect " .. screen1 .. " " .. screen2 .. " \"rofi -dmenu\"")
    end,
    {description = "show display selection", group = "launcher"}),
  awful.key({ modkey, shiftkey }, "x",
    function()
      awful.spawn.with_shell("prompt " .. "\"Shutdown?\" " .. "\"shutdown -P 0\" " .. "\"rofi -dmenu\"")
    end,
    {description = "show shutdown prompt", group = "launcher"}),
  awful.key({ modkey, shiftkey }, "BackSpace",
    function()
      awful.spawn.with_shell("prompt " .. "\"Reboot?\" " .. "\"reboot\" " .. "\"rofi -dmenu\"")
    end,
    {description = "show shutdown prompt", group = "launcher"}),
  awful.key({ modkey }, "x",
    function()
      awful.spawn.with_shell(lockscreen)
    end,
    {description = "lock screen", group = "launcher"}),
  awful.key({ modkey }, "p",
    function()
      awful.spawn.with_shell("startproject")
    end,
    {description = "project selector", group = "launcher"}),

  -- Volume Control
  awful.key({}, "XF86AudioMute",
    function()
      awful.spawn.with_shell("pulsemixer --toggle-mute")
    end,
    {description = "mute/unmute volume", group = "controls"}),
  awful.key({}, "XF86AudioLowerVolume",
    function()
      awful.spawn.with_shell("pulsemixer --change-volume -5")
    end,
    {description = "lower volume", group = "controls"}),
  awful.key({}, "XF86AudioRaiseVolume",
    function()
      awful.spawn.with_shell("pulsemixer --change-volume +5")
    end,
    {description = "raise volume", group = "controls"}),

  -- Media Controls
  awful.key({}, "XF86AudioPlay",
    function()
      awful.spawn.with_shell("mpc toggle")
    end,
    {description = "toggle play/pause", group = "controls"}),
  awful.key({}, "XF86AudioStop",
    function()
      awful.spawn.with_shell("mpc stop")
    end,
    {description = "stops music", group = "controls"}),
  awful.key({}, "XF86AudioNext",
    function()
      awful.spawn.with_shell("mpc next")
    end,
    {description = "next song", group = "controls"}),
  awful.key({}, "XF86AudioPrev",
    function()
      awful.spawn.with_shell("mpc prev")
    end,
    {description = "previous song", group = "controls"}),

  -- Screen Brightness
  awful.key({}, "XF86MonBrightnessUp", function() awful.spawn.with_shell("light -A 5") end,
    {description = "Increase brightness", group = "controls"}),
  awful.key({}, "XF86MonBrightnessDown", function() awful.spawn.with_shell("light -U 5") end,
    {description = "Decrease brightness", group = "controls"}),

  -- Screenshot
  awful.key({}, "Print", function() awful.spawn.with_shell("xfce4-screenshooter -f -s ~/Pictures/Screenshots") end,
    {description = "took screenshot of entire screen", group = "screenshot"}),
  awful.key({ shiftkey }, "Print", function() awful.spawn.with_shell("xfce4-screenshooter -w -s ~/Pictures/Screenshots") end,
    {description = "took screenshot of focused window", group = "screenshot"}),
  awful.key({ ctrlkey }, "Print", function() awful.spawn.with_shell("xfce4-screenshooter -r -s ~/Pictures/Screenshots") end,
    {description = "took screenshot of selected area", group = "screenshot"})
)


clientkeys = gears.table.join(
  awful.key({ modkey }, "f",
    function(c)
      c.fullscreen = not c.fullscreen
      c:raise()
    end,
    {description = "toggle fullscreen", group = "client"}),

  awful.key({ modkey }, "q", function(c) c:kill() end,
    {description = "close", group = "client"}),

  awful.key({ modkey, ctrlkey }, "space", awful.client.floating.toggle,
    {description = "toggle floating", group = "client"}),

  awful.key({ modkey, ctrlkey }, "Return", function(c) c:swap(awful.client.getmaster()) end,
    {description = "move to master", group = "client"}),

  awful.key({ modkey }, "o", function(c) c:move_to_screen() end,
    {description = "move to screen", group = "client"}),

  awful.key({ modkey }, "t", function(c) c.ontop = not c.ontop end,
    {description = "toggle keep on top", group = "client"}),

  -- Slave client resize
  awful.key({ modkey, shiftkey }, "k" , function(c) awful.client.incwfact(0.05, c) end),
    {description = "increase client size", group = "client"},

  awful.key({ modkey, shiftkey }, "j" , function(c) awful.client.incwfact(-0.05, c) end),
    {description = "decrease client size", group = "client"},

  awful.key({ modkey }, "m",
    function (c)
      c.maximized = not c.maximized
      c:raise()
    end,
    {description = "(un)maximize", group = "client"})
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 10 do
  globalkeys = gears.table.join(globalkeys,
    -- View tag only.
    awful.key({ modkey }, "#" .. i + 9,
      function()
        local screen = awful.screen.focused()
        local tag = screen.tags[i]
        if tag then
          tag:view_only()
        end
      end,
      {description = "view tag #"..i, group = "tag"}),
    -- Toggle tag display.
    awful.key({ modkey, ctrlkey }, "#" .. i + 9,
      function()
        local screen = awful.screen.focused()
        local tag = screen.tags[i]
        if tag then
          awful.tag.viewtoggle(tag)
        end
      end,
      {description = "toggle tag #" .. i, group = "tag"}),
    -- Move client to tag.
    awful.key({ modkey, shiftkey }, "#" .. i + 9,
      function()
        if client.focus then
          local tag = client.focus.screen.tags[i]
          if tag then
            client.focus:move_to_tag(tag)
          end
        end
      end,
      {description = "move focused client to tag #"..i, group = "tag"}),
    -- Toggle tag on focused client.
    awful.key({ modkey, altkey }, "#" .. i + 9,
      function()
        if client.focus then
          local tag = client.focus.screen.tags[i]
          if tag then
            client.focus:toggle_tag(tag)
          end
        end
      end,
      {description = "toggle focused client on tag #" .. i, group = "tag"})
  )
end

-- Mouse Actions

clientbuttons = gears.table.join(
  awful.button({ }, 1, function(c) client.focus = c; c:raise() end),
  awful.button({ modkey }, 1, awful.mouse.client.move),
  awful.button({ modkey }, 3, awful.mouse.client.resize))

awful.util.taglist_buttons = gears.table.join(
  awful.button({ }, 1, function(t) t:view_only() end),
  awful.button({ }, 3, awful.tag.viewtoggle),
  awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
  awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
)

root.keys(globalkeys)
