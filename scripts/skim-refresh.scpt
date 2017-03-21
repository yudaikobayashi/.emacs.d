#!/usr/bin/osascript

on run argv
    tell application "Skim"
	repeat with n from 1 to (count of documents)
	    set doc to document n
	    if name of doc is item 1 of argv then
		revert doc
	    end if
	end repeat
    end tell
end run