local awful = require("awful")
local gtable = require("gears.table")
local hotkeys_popup = require("awful.hotkeys_popup").widget
require('keys.movekeys')
require('keys.appkeys')
require('keys.menukeys')
require('keys.mediakeys')
require('keys.layoutkeys')


globalkeys = gtable.join(
  gtable.join(movekeys),
  gtable.join(appkeys),
  gtable.join(menukeys),
  gtable.join(mediakeys),
  gtable.join(layoutkeys),

  -- Awesome actions
  awful.key({ modkey, shiftkey }, "F2",
    awesome.restart,
    {description = "reload awesome", group = "awesome"}),

  awful.key({ modkey, shiftkey }, "q",
    awesome.quit,
    {description = "quit awesome", group = "awesome"}),

  awful.key({ modkey }, "F1",
    hotkeys_popup.show_help,
    {description = "show help", group = "awesome"}),

  awful.key({ modkey, "Control" }, "n",
    function()
      local c = awful.client.restore()
      -- Focus restored client
      if c then
        client.focus = c
        c:raise()
      end
    end,
    {description = "restore minimized", group = "client"})
)


clientkeys = gtable.join(
  awful.key({ modkey }, "f",
    function(c)
      c.fullscreen = not c.fullscreen
      c:raise()
    end,
    {description = "toggle fullscreen", group = "client"}),

  awful.key({ modkey }, "q",
    function(c)
      c:kill()
    end,
    {description = "close", group = "client"}),

  awful.key({ modkey, ctrlkey }, "space",
    awful.client.floating.toggle,
    {description = "toggle floating", group = "client"}),

  awful.key({ modkey, ctrlkey }, "Return",
    function(c)
      c:swap(awful.client.getmaster())
    end,
    {description = "move to master", group = "client movement"}),

  awful.key({ modkey }, "o",
    function(c)
      c:move_to_screen()
    end,
    {description = "move to screen", group = "client movement"}),

  awful.key({ modkey }, "t",
    function(c)
      c.ontop = not c.ontop
    end,
    {description = "toggle keep on top", group = "client manipulation"}),

  -- Slave client resize
  awful.key({ modkey, ctrlkey }, "k",
    function(c)
      awful.client.incwfact(0.05, c)
    end,
    {description = "increase client size", group = "client manipulation"}),

  awful.key({ modkey, ctrlkey }, "j",
    function(c)
      awful.client.incwfact(-0.05, c)
    end,
    {description = "decrease client size", group = "client manipulation"}),

  awful.key({ modkey }, "m",
    function (c)
      c.maximized = not c.maximized
      c:raise()
    end,
    {description = "(un)maximize", group = "client manipulation"})
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 10 do
  globalkeys = gtable.join(globalkeys,
    -- View tag only.
    awful.key({ modkey }, "#" .. i + 9,
      function()
        local screen = awful.screen.focused()
        local tag = screen.tags[i]
        if tag then
          tag:view_only()
        end
      end,
      {description = "view tag #"..i, group = "tag navigation"}),

    -- Toggle tag display.
    awful.key({ modkey, ctrlkey }, "#" .. i + 9,
      function()
        local screen = awful.screen.focused()
        local tag = screen.tags[i]
        if tag then
          awful.tag.viewtoggle(tag)
        end
      end,
      {description = "toggle tag #" .. i, group = "tag navigation"}),

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
      {description = "move focused client to tag #"..i, group = "tag movement"}),

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
      {description = "toggle focused client on tag #" .. i, group = "tag movement"})
  )
end

-- Mouse Actions

clientbuttons = gtable.join(
  awful.button({ }, 1, function(c) client.focus = c; c:raise() end),
  awful.button({ modkey }, 1, awful.mouse.client.move),
  awful.button({ modkey }, 3, awful.mouse.client.resize))

awful.util.taglist_buttons = gtable.join(
  awful.button({ }, 1, function(t) t:view_only() end),
  awful.button({ }, 3, awful.tag.viewtoggle),
  awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
  awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
)

root.keys(globalkeys)
