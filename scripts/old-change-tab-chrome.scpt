#!/usr/bin/osascript

tell application "Google Chrome"
    --make new tab of window 1 -- worked!
    --move tab 1 of window 1 to tab 2 of window 1 -- doesn't work
    --exit presentation mode window 1
    --get properties of window 1
    set numberOfTabs to 0
    repeat with t in (tabs of window 1)
	set numberOfTabs to numberOfTabs + 1
    end repeat
    if active tab index of window 1 = numberOfTabs then
	set active tab index of window 1 to 1
    else
	set active tab index of window 1 to active tab index of window 1 + 1
    end if
end tell

