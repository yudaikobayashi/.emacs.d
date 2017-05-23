#!/usr/bin/osascript

tell application "Safari"
    tell window 1
	tell current tab
	    do javascript "window.scrollBy(0,-50)"
	end tell
    end tell
end tell
