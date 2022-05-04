-- Provides:
-- evil::temperature
--      temperature (integer - in Celcius)
local awful = require("awful")

local update_interval = 15
local temp_script = string.format([[
  sh -c "
  cat /sys/class/thermal/thermal_zone%s/temp
  "]], thermal_zone)

-- Periodically get temperature info
awful.widget.watch(temp_script, update_interval, function(widget, stdout)
  local temp = math.floor(stdout / 1000)
    awesome.emit_signal("evil::temperature", tonumber(temp))
end)
