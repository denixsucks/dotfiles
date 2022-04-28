local awful = require('awful')
local gtable = require('gears.table')
local touchpad_state = ""

layoutkeys = gtable.join(
  awful.key({ modkey, ctrlkey }, "l",
    function()
      awful.tag.incmwfact( 0.05)
    end,
    {description = "increase master width factor", group = "layout manipulation"}),

  awful.key({ modkey, ctrlkey }, "h",
    function()
      awful.tag.incmwfact(-0.05)
    end,
    {description = "decrease master width factor", group = "layout manipulation"}),


  awful.key({ modkey, altkey }, "k",
    function()
      awful.tag.incnmaster( 1, nil, true)
    end,
    {description = "increase the number of master clients", group = "layout manipulation"}),

  awful.key({ modkey, altkey }, "j",
    function()
      awful.tag.incnmaster(-1, nil, true)
    end,
    {description = "decrease the number of master clients", group = "layout manipulation"}),


  awful.key({ modkey, altkey }, "l",
    function()
      awful.tag.incncol( 1, nil, true)
    end,
    {description = "increase the number of columns", group = "layout manipulation"}),

  awful.key({ modkey, altkey }, "h",
    function()
      awful.tag.incncol(-1, nil, true)
    end,
    {description = "decrease the number of columns", group = "layout manipulation"}),


  awful.key({ modkey }, "space",
    function()
      awful.layout.inc( 1)
    end,
    {description = "select next", group = "layout"}),

  awful.key({ modkey, shiftkey }, "space",
    function()
      awful.layout.inc(-1)
    end,
    {description = "select previous", group = "layout"}),

  awful.key({modkey, shiftkey},"m",
    function()
      awful.spawn.easy_async('xinput list-props 19 | grep "361" | egrep -o "[0-9]$"',function(stdout)
      	if stdout:match(0) then awful.spawn.with_shell('xinput set-prop 19 361 1') else awful.spawn.with_shell('xinput set-prop 19 361 0') end
      end)
    end,
    {description = "brooo touchpaddd", group = "touchpad"}
  )
)
