#!/usr/bin/osascript

tell application "Google Chrome"
    tell active tab of window 1
	execute javascript "window.scrollBy(0,-50)"
    end tell
end tell