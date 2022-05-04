local awful = require('awful')
local gtable = require('gears.table')

appkeys = gtable.join(
  -- Standard programs
  awful.key({ modkey }, "Return",
    function()
      awful.spawn(terminal)
    end,
    {description = "open a terminal", group = "apps"}),

  awful.key({ modkey }, "a",
    function()
      quake:toggle()
    end,
    {description = "Toggle quake terminal", group = "apps"}),

  awful.key({ modkey }, "w",
    function()
      awful.spawn(browser1)
    end,
    {description = "open ".. browser1, group = "apps"}),

  awful.key({ modkey, shiftkey }, "w",
    function()
      awful.spawn(browser2)
    end,
    {description = "open " .. browser2, group = "apps"}),

  awful.key({ modkey }, "r",
    function()
      awful.spawn(file1)
    end,
    {description = "open main file manager", group = "apps"}),

  awful.key({ modkey, shiftkey }, "r",
    function()
      awful.spawn(file2)
    end,
    {description = "open secondary file manager", group = "apps"}),

  awful.key({ modkey }, "n",
    function()
      awful.spawn(music)
    end,
    {description = "open music player", group = "apps"})
)
