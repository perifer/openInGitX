-- Opens the currently selected Finder files, or else the current Finder window, in GitX. Also handles dropped files and folders.

-- By Anders Fajerson <http://perifer.se>
-- Based heavily on Open in TextMate by Henrik Nyh <http://henrik.nyh.se>

-- script was clicked
on run
	tell application "Finder"
		if selection is {} then
			set finderSelection to folder of the front window as string
		else
			set finderSelection to selection as alias list
		end if
	end tell
	
	tm(finderSelection)
end run

-- script was drag-and-dropped onto
on open (theList)
	tm(theList)
end open

-- open in GitX
on tm(listOfAliases)
	tell application "GitX"
		open listOfAliases
		activate
	end tell
end tm
