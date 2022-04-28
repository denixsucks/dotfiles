local awful = require("awful")
local wibox = require("wibox")
local build_widget = require("widgets.build_widget")

local disk_perc = wibox.widget.textbox('00%')

local disk_script = [[
  bash -c "
    df -k -h / | tail -1 | awk '{print $5}'
  "
]]

awful.widget.watch(disk_script, 1000, function(widget, stdout)
  disk_perc.markup = stdout
end)

disk = build_widget:new(disk_perc, '', beautiful.xcolor7)

return disk.widget
