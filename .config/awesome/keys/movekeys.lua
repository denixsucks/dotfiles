local awful = require('awful')
local gtable = require('gears.table')

movekeys = gtable.join(
  awful.key({ modkey }, "Tab",
    awful.tag.viewnext,
    {description = "view next", group = "tag navigation"}),

  awful.key({ modkey, shiftkey }, "Tab",
    awful.tag.viewprev,
    {description = "view previous", group = "tag navigation"}),

  -- Focus clients by direction
  awful.key({ modkey }, "Down",
    function()
      awful.client.focus.global_bydirection("down")
      if client.focus then client.focus:raise() end
    end,
    {description = "focus down", group = "client navigation"}),
  awful.key({ modkey }, "Up",
    function()
      awful.client.focus.global_bydirection("up")
      if client.focus then client.focus:raise() end
    end,
    {description = "focus up", group = "client navigation"}),

  awful.key({ modkey }, "Left",
    function()
      awful.client.focus.global_bydirection("left")
      if client.focus then client.focus:raise() end
    end,
    {description = "focus left", group = "client navigation"}),

  awful.key({ modkey }, "Right",
    function()
      awful.client.focus.global_bydirection("right")
      if client.focus then client.focus:raise() end
    end,
    {description = "focus right", group = "client navigation"}),

  awful.key({ modkey }, "h",
    function()
      awful.client.focus.global_bydirection("left")
      if client.focus then client.focus:raise() end
    end,
    {description = "focus left", group = "client navigation"}),

  awful.key({ modkey, }, "j",
    function()
      awful.client.focus.global_bydirection("down")
      if client.focus then client.focus:raise() end
    end,
    {description = "focus up", group = "client navigation"}),

  awful.key({ modkey, }, "k",
    function()
      awful.client.focus.global_bydirection("up")
      if client.focus then client.focus:raise() end
    end,
    {description = "focus up", group = "client navigation"}),

  awful.key({ modkey }, "l",
    function()
      awful.client.focus.global_bydirection("right")
      if client.focus then client.focus:raise() end
    end,
    {description = "focus right", group = "client navigation"}),

  -- Layout manipulation
  awful.key({ modkey, shiftkey }, "Left",
    function()
      awful.client.swap.global_bydirection("left")
    end,
    {description = "swap with direction left", group = "client movement"}),

  awful.key({ modkey, shiftkey }, "Right",
    function()
      awful.client.swap.global_bydirection("right")
    end,
    {description = "swap with direction right", group = "client movement"}),

  awful.key({ modkey, shiftkey }, "Up",
    function()
      awful.client.swap.global_bydirection("up")
    end,
    {description = "swap with direction up", group = "client movement"}),

  awful.key({ modkey, shiftkey }, "Down",
    function()
      awful.client.swap.global_bydirection("down")
    end,
    {description = "swap with direction down", group = "client movement"}),

   awful.key({ modkey, shiftkey }, "h",
    function()
      awful.client.swap.global_bydirection("left")
    end,
    {description = "swap with direction left", group = "client movement"}),

  awful.key({ modkey, shiftkey }, "l",
    function()
      awful.client.swap.global_bydirection("right")
    end,
    {description = "swap with direction right", group = "client movement"}),

  awful.key({ modkey, shiftkey }, "k",
    function()
      awful.client.swap.global_bydirection("up")
    end,
    {description = "swap with direction up", group = "client movement"}),

  awful.key({ modkey, shiftkey }, "j",
    function()
      awful.client.swap.global_bydirection("down")
    end,
    {description = "swap with direction down", group = "client movement"}),

 -- Move between screens
  awful.key({ altkey }, "Left",
    function()
      awful.screen.focus_relative(1)
    end,
    {description = "focus the next screen", group = "screen"}),

  awful.key({ altkey }, "l",
    function()
      awful.screen.focus_relative(1)
    end,
    {description = "focus the next screen", group = "screen"}),

  awful.key({ altkey }, "Right",
    function()
      awful.screen.focus_relative(-1)
    end,
    {description = "focus the previous screen", group = "screen"}),

  awful.key({ altkey }, "h",
    function()
      awful.screen.focus_relative(-1)
    end,
    {description = "focus the previous screen", group = "screen"}),

  awful.key({ modkey }, "u",
    awful.client.urgent.jumpto,
    {description = "jump to urgent client", group = "client"})
)
