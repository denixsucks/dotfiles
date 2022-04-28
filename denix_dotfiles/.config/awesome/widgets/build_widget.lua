local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local build_widget = {}

local build_icon = function (icon, icon_color)
  return string.format('<span color="%s" font="%s">%s</span>',
    icon_color, beautiful.iconFont, icon)
end

function build_widget:new (value_widget, icon, icon_color, last)
  obj = {}
  value_widget.font = beautiful.font
  if last then
    obj.is_space = wibox.widget.textbox('')
  end

  obj.pipe = obj.is_space or wibox.widget.textbox(string.format(' <span color="%s">|</span>', beautiful.xcolor8))
  
  obj.widget_icon = wibox.widget.textbox(build_icon(icon, icon_color))

  obj.widget = wibox.widget{
    obj.pipe,
    obj.widget_icon,
    value_widget,
    spacing = dpi(3),
    layout = wibox.layout.fixed.horizontal
  }

  self.__index = self  
  return setmetatable(obj, self)
end

function build_widget:UpdateIcon(icon, icon_color)
  self.widget_icon.markup = build_icon(icon, icon_color)
end

return build_widget
