#!/usr/bin/osascript

on run argv
    tell application "Google Chrome"
	tell window 1
	    repeat with i from 1 to (count tabs)
		if (title of tab i) is (item 1 of argv) then reload tab i
	    end repeat
	end tell
    end tell
end run
