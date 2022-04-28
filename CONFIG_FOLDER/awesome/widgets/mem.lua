local wibox = require("wibox")
local build_widget = require("widgets.build_widget")

local mem_perc = wibox.widget.textbox('00%')

awesome.connect_signal("evil::ram", function(used, total)
  local value = math.floor((used / total) * 100)
  mem_perc.markup = string.format('%0d%%', value)
end)

mem = build_widget:new(mem_perc, '', beautiful.xcolor5)

return mem.widget
