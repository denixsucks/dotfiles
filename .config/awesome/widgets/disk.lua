local awful = require("awful")
local wibox = require("wibox")
local build_widget = require("widgets.build_widget")

local disk_perc = wibox.widget{
  markup = '00%',
  align  = 'center',
  valign = 'center',
  widget = wibox.widget.textbox
}

local disk_script = [[
  bash -c "
    df -k -h / | tail -1 | awk '{print $5}'
  "
]]

awful.widget.watch(disk_script, 1000, function(widget, stdout)
  disk_perc.markup = stdout
end)

disk = build_widget:new(disk_perc, '', '#b6b6b6')

return disk.widget
