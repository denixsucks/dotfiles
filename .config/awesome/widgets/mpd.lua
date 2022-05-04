local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")

local function build_icon (icon)
  return string.format('<span color="%s" font="%s">%s</span> ',
    beautiful.fg_normal, beautiful.iconFont, icon)
end

local mpd_song = wibox.widget{
  markup = '',
  widget = wibox.widget.textbox
}

local mpd_play = wibox.widget{
  markup = build_icon(' '),
  widget = wibox.widget.textbox
}

local mpd_prev = wibox.widget{
  markup = '',
  widget = wibox.widget.textbox
}

local mpd_next = wibox.widget{
  markup = '',
  widget = wibox.widget.textbox
}

awesome.connect_signal("evil::mpd", function(artist, title, status)
  if status == "paused" then
    mpd_play.markup = build_icon('')
    mpd_prev.markup = build_icon('')
    mpd_next.markup = build_icon('')
    mpd_song.markup = string.format('<span font="%s">%s</span> - %s', beautiful.taglist_font, artist, title)
  elseif status == "playing" then
    mpd_play.markup = build_icon('')
    mpd_prev.markup = build_icon('')
    mpd_next.markup = build_icon('')
    mpd_song.markup = string.format('<span font="%s">%s</span> - %s', beautiful.taglist_font, artist, title)
  else
    mpd_prev.markup = ''
    mpd_next.markup = ''
    mpd_play.markup = build_icon(' ')
    mpd_song.markup = ''
  end
end)

mpd_play:buttons(awful.util.table.join(
  awful.button({}, 1, function()
    os.execute("mpc toggle")
  end),
  awful.button({}, 3, function()
    os.execute("mpc stop")
  end)
))

mpd_prev:buttons(awful.util.table.join(
  awful.button({}, 1, function()
    os.execute("mpc prev")
  end)
))

mpd_next:buttons(awful.util.table.join(
  awful.button({}, 1, function()
    os.execute("mpc next")
  end)
))

local mpd = wibox.widget{
  nil,
  {
    mpd_prev,
    mpd_play,
    mpd_next,
    mpd_song,
    layout = wibox.layout.fixed.horizontal
  },
  expand = "none",
  layout = wibox.layout.align.horizontal
}

return mpd
