settitlematchmode,2
^b:
winactivate,Youtube
{
	sleep,500
	a=C:\Users\neumanzig\Desktop\qwatch\liveshuuryou.bmp
	clickimage(a)
	mousemove,40,20,,r
	mouseclick,l

sleep,10000

	sleep,500
	a=C:\Users\neumanzig\Desktop\qwatch\shuuryou.bmp
	clickimage(a)
	mousemove,40,20,,r
	mouseclick,l

;run,C:\Users\neumanzig\Desktop\q_off.bat
;sleep,10000
;run,C:\Users\neumanzig\Desktop\q_on.bat

sleep,20000
winactivate,- YouTube Studio
sleep,300
send,^w
winclose,a
return
}




clickimage(a)
{
SysGet, VirtualWidth, 78
SysGet, VirtualHeight, 79
;msgbox,vw=%VirtualWidth% & vh= %VirtualHeight%
image_name:=a
if 1	; screen coordinates
coord=screen
else
coord=relative

scorex=
CoordMode, ToolTip, %coord%
CoordMode, Pixel, %coord%
CoordMode, Mouse, %coord%
CoordMode, Caret, %coord%
CoordMode, Menu, %coord%
SetTimer, WatchCursor, 100

ImageSearch, FoundX, FoundY, 0, -340, VirtualWidth, VirtualHeight, %image_name%

if ErrorLevel = 2
{
tooltip Could not conduct the search.
settimer notip, -500
scorex=2
tooltip
}
else if ErrorLevel = 1
{
tooltip Image could not be found on the screen.
settimer notip, -500
scorex=2
return 
}
else
{
foundx += 5
foundy += 5
mousemove, %FoundX%, %FoundY%, 2
scorex=1
}
return

}

WatchCursor:
MouseGetPos,xpos , ypos , id, control
return

notip:
	tooltip
return
