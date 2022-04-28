local wibox = require("wibox")
local build_widget = require("widgets.build_widget")

local temp_perc = wibox.widget.textbox('00°C')

local temp_ok = false

awesome.connect_signal("evil::temperature", function(value)
  if value > 0 then
    temp_ok = true
  end
  temp_perc.markup = string.format('%0d°C', value)
end)

temp = build_widget:new(temp_perc, '', beautiful.xcolor9)

if temp_ok == false then
  temp.widget = wibox.widget.textbox('')
end

return temp.widget
