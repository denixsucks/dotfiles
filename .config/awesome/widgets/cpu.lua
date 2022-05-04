local awful = require("awful")
local wibox = require("wibox")
local build_widget = require("widgets.build_widget")

local cpu_perc = wibox.widget{
  markup = "00%",
  align  = 'center',
  valign = 'center',
  widget = wibox.widget.textbox
}

awesome.connect_signal("evil::cpu", function(value)
  cpu_perc.markup = string.format('%02d%%', value)
end)

cpu = build_widget:new(cpu_perc, '', '#1eff8e')

return cpu.widget
