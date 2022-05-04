local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")
beautiful.init(string.format("%s/.config/awesome/theme/theme.lua", os.getenv("HOME")))

awful.rules.rules = {
  -- All clients will match this rule.
  { rule = { },
    properties = { border_width = beautiful.border_width,
      border_color = beautiful.border_normal,
      focus = awful.client.focus.filter,
      keys = clientkeys,
      raise = false,
      buttons = clientbuttons,
      screen = awful.screen.preferred,
      size_hints_honor = false,
    }
  },

  -- Floating clients.
  {
    rule_any = {
      instance = {
      "copyq", -- Includes session name in class.
      },
      class = {
        "Arandr",
        "Gpick",
        "MessageWin", -- kalarm.
        "Sxiv",
        "Wpa_gui",
        "pinentry",
        "veromix",
        "xtightvncviewer"
      },
      name = {
        "Event Tester", -- xev.
      },
      role = {
        "AlarmWindow", -- Thunderbird's calendar.
        "pop-up", -- e.g. Google Chrome's (detached) Developer Tools.
      }
    },
    properties = { 
      floating = true,
      ontop = true,
    }
  },

  -- Steam Rules
  { rule = { class = "Steam" }, properties = { screen = 1, tag = "10", }},

  {
    rule = { class = "Steam" },
    except = { name = "Steam" },
    properties = { ontop = true, }
  },
  
  -- Keep dialogs on top
  {
    rule_any = {
      class = {"file_progress", },
      type = { "dialog" },
    },
    properties = { ontop = true, },
  }

}
