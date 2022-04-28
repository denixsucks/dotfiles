-- Provides:
-- evil::battery
--      percentage (integer)
-- evil::charger
--      plugged (boolean)
--
local awful = require("awful")
local naughty = require("naughty")

local update_interval = 30

local battery_script = [[
  sh -c "
    ls -lL /sys/class/power_supply | grep BAT | awk '{print $9}'\
  "]]


-- Subscribe to power supply status changes with acpi_listen
local charger_script = [[
    sh -c '
    acpi_listen | grep --line-buffered ac_adapter
']]

-- Periodically get battery info
awful.widget.watch(battery_script, update_interval, function(widget, stdout)
  local battery_perc = 0
  local battery_number = 0
  for line in stdout:gmatch("[^\r\n]+") do
    awful.spawn.easy_async_with_shell(string.format("bash -c 'cat /sys/class/power_supply/%s/capacity'", line),
      function(out)
        battery_number = battery_number + 1
        battery_perc = (battery_perc + out) / battery_number
        awesome.emit_signal("evil::battery", math.floor(battery_perc))
      end
    )
  end
end)

local emit_charger_info = function()
    awful.spawn.easy_async_with_shell("bash -c 'cat /sys/class/power_supply/*/online'", function (out)
        status = tonumber(out)
        if status == 1 then
            awesome.emit_signal("evil::charger", true)
        else
            awesome.emit_signal("evil::charger", false)
        end
    end)
end

-- Run once to initialize widgets
emit_charger_info()

-- Kill old acpi_listen process
awful.spawn.easy_async_with_shell("ps x | grep \"acpi_listen\" | grep -v grep | awk '{print $1}' | xargs kill", function ()
    -- Update charger status with each line printed
    awful.spawn.with_line_callback(charger_script, {
        stdout = function(_)
            emit_charger_info()
        end
    })

end)
