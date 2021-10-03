
run,"https://studio.youtube.com/video/iwFQJuDBxvg/livestreaming?utm_campaign=upgrade&utm_medium=redirect&utm_source=`%2Flive_dashboard"
;run,%imbodd%
sleep,30000


sleep,10000
mousemove,1,1
sleep,10000
mousemove,10,10
sleep,10000
mousemove,1,1
sleep,10000
mousemove,10,10



winactivate,Program Manager
{
sleep,100
	a=C:\Users\neumanzig\Desktop\a_tojiru.bmp
	clickimage(a)
	mousemove,40,20,,r
	mouseclick,l

	sleep,30000
send,!{f4}
	

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
