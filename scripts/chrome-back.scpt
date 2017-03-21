#!/usr/bin/osascript

tell application "Google Chrome"
    tell active tab of window 1
	execute javascript "window.history.back()"
    end tell
end tell
