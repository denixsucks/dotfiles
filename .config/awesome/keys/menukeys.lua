local awful = require('awful')
local gtable = require('gears.table')

menukeys = gtable.join(
  -- Menubar
  awful.key({ altkey }, "space",
    function()
      awful.spawn.with_shell("rofi -show combi -combi-modi \"drun,run\"")
    end,
    {description = "show the menubar", group = "launcher"}),

  -- Action Menus
  awful.key({ modkey }, "F3",
    function()
      awful.spawn.with_shell("displayselect \"rofi -dmenu\"")
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

  awful.key({ modkey }, "b",
    function()
      awful.spawn.with_shell("rofi-bluetooth")
    end,
    {description = "Bluetooth Manager", group = "launcher"})
)
