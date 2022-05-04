local awful = require("awful")
local wibox = require("wibox")
local build_widget = require("widgets.build_widget")

local mem_perc = wibox.widget{
  markup = "00%",
  align  = 'center',
  valign = 'center',
  widget = wibox.widget.textbox
}

awesome.connect_signal("evil::ram", function(used, total)
  local value = math.floor((used / total) * 100)
  mem_perc.markup = string.format('%0d%%', value)
end)

mem = build_widget:new(mem_perc, '', '#a753fc')

return mem.widget
