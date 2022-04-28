local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local build_widget = require("widgets.build_widget")


if os.getenv('IS_LAPTOP') then
  local bat_perc = wibox.widget.textbox('00%')

  local bat_icon = ""
  local bat_icon_color = beautiful.xcolor12
  local bat_text_color = beautiful.fg_normal

  local bat_value_update = function (value, color)
    bat_perc.markup = '<span color="' .. color ..'">' .. value ..'%</span>'
  end

  awesome.connect_signal("evil::charger", function(plugged)
    if plugged then
      bat_text_color = bat_icon_color
    else
      bat_text_color = beautiful.fg_normal
    end
  end)
    

  awesome.connect_signal("evil::battery", function(value)
    local bat_now = value

    if bat_icon ~= "" and bat_now >= 90 then
      bat_icon = ""
      bat_warning = false
    elseif bat_icon ~= "" and bat_now < 90 and bat_now >= 60 then
      bat_icon = ""
      bat_warning = false
    elseif bat_icon ~= "" and bat_now < 60 and bat_now >= 20 then
      bat_icon = ""
      bat_warning = false
    elseif bat_icon ~= "" and bat_now < 20 then
      bat_icon = ""
      bat_warning = true
    end
    
    if bat_warning and bat_icon_color ~= "red" then
      bat_icon_color = beautiful.xcolor1
    elseif not bat_warning and bat_icon_color ~= "#0883ff" then
      bat_icon_color = beautiful.xcolor12
    end

    bat_value_update(value, bat_text_color)
    bat:UpdateIcon(bat_icon, bat_icon_color)
  end)

  bat = build_widget:new(bat_perc, bat_icon, bat_icon_color)

  bat.widget:buttons(awful.util.table.join(
    awful.button({}, 4, function() -- scroll up
      os.execute("light -A 5")
    end),
    awful.button({}, 5, function() -- scroll down
      os.execute("light -U 5")
    end)
  ))

  return bat.widget
else
  return wibox.widget.textbox("")
end
