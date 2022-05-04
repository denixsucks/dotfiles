local awful = require("awful")
local wibox = require("wibox")
local build_widget = require("widgets.build_widget")

local cpu_perc = wibox.widget.textbox('00%')

awesome.connect_signal("evil::cpu", function(value)
  cpu_perc.markup = string.format('%02d%%', value)
end)

cpu = build_widget:new(cpu_perc, '', beautiful.xcolor10)

return cpu.widget
