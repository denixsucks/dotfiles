local awful = require("awful")
local wibox = require("wibox")
local build_widget = require("widgets.build_widget")

local vol_perc = wibox.widget{
  markup = "00%",
  align  = 'center',
  valign = 'center',
  widget = wibox.widget.textbox
}
local vol_icon = ""
local vol_icon_color = "#ff8e1e"


awesome.connect_signal("evil::volume", function(volume, muted)
  local cur_vol = tonumber(volume)
  --if vol_icon ~= "" and cur_vol >= 70 then
  --  vol_icon = ""
  --  vol:UpdateIcon(vol_icon, vol_icon_color)
  --elseif vol_icon ~= "" and cur_vol >= 30 and cur_vol < 70 then
  --  vol_icon = ""
  --  vol:UpdateIcon(vol_icon, vol_icon_color)
    --vol.widget_icon.markup = "p"
  --elseif vol_icon ~= "" and cur_vol <= 29 then
  --  vol_icon = ""
  --  vol:UpdateIcon(vol_icon, vol_icon_color)
  --end
  if not muted then
  --  vol_icon_color = "#ff8e1e"
    vol_perc.markup = string.format("VOL:%s", cur_vol) .. '%'
  --  vol:UpdateIcon(vol_icon, vol_icon_color)
  else
  --  vol_icon_color = "red"
    vol_perc.markup = '<span color="red">mute</span>'
  --  vol:UpdateIcon(vol_icon, vol_icon_color)
  end
end
)

hide_separator = not is_laptop

vol = build_widget:new(vol_perc)

vol.widget:buttons(awful.util.table.join(
  awful.button({}, 2, function() -- left click
    awful.spawn("pavucontrol")
  end),
  awful.button({}, 3, function() -- right click
    os.execute("pulsemixer --toggle-mute")
  end),
  awful.button({}, 4, function() -- scroll up
    os.execute("pulsemixer --change-volume +2")
  end),
  awful.button({}, 5, function() -- scroll down
    os.execute("pulsemixer --change-volume -2")
  end)
))

return vol.widget
