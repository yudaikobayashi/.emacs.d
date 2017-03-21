#!/usr/bin/osascript

on run argv
    tell application "Google Chrome"
	repeat with i from 1 to (count windows)
	    repeat with j from 1 to (count tab of window i)
		if (URL of tab j of window i) is (item 1 of argv) then
		    tell tab j of window i
			x = execute javascript "window.scrollX"
			y = execute javascript "window.scrollY"
			reload tab j of window i
		    end tell
		end repeat
	end repeat
    end tell
end run
