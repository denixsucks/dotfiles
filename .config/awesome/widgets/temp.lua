local awful = require("awful")
local wibox = require("wibox")
local build_widget = require("widgets.build_widget")

local temp_perc = wibox.widget{
  markup = "00°C",
  align  = 'center',
  valign = 'center',
  widget = wibox.widget.textbox
}

awesome.connect_signal("evil::temperature", function(value)
  temp_perc.markup = string.format('%0d°C', value)
end)

temp = build_widget:new(temp_perc, '', '#fc4f8e')

return temp.widget
