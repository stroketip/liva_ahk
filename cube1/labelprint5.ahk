#singleinstance ignore

settitlematchmode,2
sleep,100
run,C:\Program Files\Hidemaru\Hidemaru.exe

sleep,100

WinWait, - GŠÛ, 
IfWinNotActive, - GŠÛ, , WinActivate, - GŠÛ, 
WinWaitActive, - GŠÛ, 

sleep,500


{


clipboard_backup = %ClipboardAll%
clipboard=

formattime,weekd,,(ddd)

temp =-------5ƒ{ƒ^ƒ“‚ª‰Ÿ‚³‚ê‚Ü‚µ‚½B------`n`n
temp =%temp%                 %A_YYYY%`/%a_mon%`/%a_mday%%weekd%`n`n
temp =%temp%QQQQQQQ‚É‚Â‚¢‚Ä‚ÌƒCƒxƒ“ƒg‚ğ—\’è‚µ‚Ü‚·B`n`n`n
temp =%temp%	   —v@ƒJƒŒƒ“ƒ_[EƒCƒxƒ“ƒg“o˜^`n`n`n
temp =%temp%@@@@@¦ŠÖ˜A–€`n`n`n
temp =%temp%@@@@¦QQQQQQQQQQQQQQ`n`n`n
temp =%temp%@@@@¦QQQQQQQQQQQQQQ`n`n`n



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

sleep,400

send,^p

WinWait, ˆóü, 
IfWinNotActive, ˆóü, , WinActivate, ˆóü, 
WinWaitActive, ˆóü, 
sleep,400

send,{enter}

sleep,700
send,!{f4}

sleep,500
send,n

return
}