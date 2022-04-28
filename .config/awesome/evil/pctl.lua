-- Provides:
-- evil::pctl
--      artist (string)
--      song (string)
--      paused (boolean)
local awful = require("awful")

function clean(string)
	s = string.gsub(string, '^%s+', '')
	s = string.gsub(s, '%s+$', '')
	s = string.gsub(s, '[\n\r]+', ' ')
	return s
end

local function emit_info()
  awful.spawn.easy_async({"playerctl", "metadata", "-f", "{{status}}|{{artist}}|{{title}}"},
    function(stdout)
      stdout = string.gsub(stdout, '&', '&amp;')
      if stdout == '' then
        status, artist, title = table.unpack({'Stopped', '', ''})
      else
        args = {}
        for i in string.gmatch(stdout, '([^|]+)') do table.insert(args, i) end
        status, artist, title = table.unpack(args)
        --title = string.gsub(title, '^%s*(.-)%s*$', '%1')
        if string.len(tostring(title)) > 30 then
          title = title:sub(0,30) .. '...'
        end
        if status == nil then
          status = Stopped
        end
      end
      awesome.emit_signal("evil::pctl", artist, title, status)
    end
  )
  end

-- Run once to initialize widgets
emit_info()

-- Sleeps until mpd changes state (pause/play/next/prev)
local mpd_script = [[
  sh -c '
    playerctl metadata --format "{{playerName}}|{{status}}|{{title}}" --follow
  ']]

-- Kill old mpc idleloop player process
awful.spawn.easy_async_with_shell("ps x | grep \"playerctl\" | grep -v grep | awk '{print $1}' | xargs kill", function ()
    -- Emit song info with each line printed
    awful.spawn.with_line_callback(mpd_script, {
      stdout = function(line)
        emit_info()
      end,
    })
end)
