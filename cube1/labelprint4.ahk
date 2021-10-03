#singleinstance ignore

settitlematchmode,2
sleep,100
run,C:\Program Files\Hidemaru\Hidemaru.exe

sleep,100

WinWait, - GŠÛ, 
IfWinNotActive, - GŠÛ, , WinActivate, - GŠÛ, 
WinWaitActive, - GŠÛ, 

sleep,100


{


clipboard_backup = %ClipboardAll%
clipboard=


formattime,weekd,,(ddd)

temp =-------4ƒ{ƒ^ƒ“‚ª‰Ÿ‚³‚ê‚Ü‚µ‚½B------`n`n
temp =%temp%                   %A_YYYY%`/%a_mon%`/%a_mday%%weekd%`n`n
temp =%temp%	  QQQQQQQQ‚ğH‚×‚Ü‚µ‚½B`n`n
temp =%temp%	     —v‚ ‚·‚¯‚ñ“o˜^`n`n
temp =%temp%	     ƒCƒ“ƒXƒŠƒ“’Ë`n`n


if(A_Hour>=12)
{
	ampm=pm
	jikan:=a_hour-12
	}
	else
	{
	ampm=am
	jikan:=a_hour
	}


temp =%temp%		%ampm%  * %jikan%`:%a_Min% * ‚É€”õ‚³‚ê‚Ü‚µ‚½B`n




sleep,100

clipboard := temp

send,^v

sleep,100

send,^p

WinWait, ˆóü, 
IfWinNotActive, ˆóü, , WinActivate, ˆóü, 
WinWaitActive, ˆóü, 
sleep,400

send,{enter}

sleep,500
send,!{f4}

sleep,700
send,n

return
}