#!/usr/bin/osascript
on run argv
    tell application "TeXShop"
	repeat with n from 1 to count documents
	    if path of document n is (item 1 of argv as string)
		refreshpdfbackground document n
	    end if
	end repeat
    end tell
end run