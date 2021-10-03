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

formattime,weekd,,(ddd)

clipboard_backup = %ClipboardAll%
clipboard=
temp =-------3‚Ìƒ{ƒ^ƒ“‚ª‰Ÿ‚³‚ê‚Ü‚µ‚½B------`n
temp =%temp%          @@    @        %A_YYYY%`/%a_mon%`/%a_mday%%weekd%`n`n
temp =%temp%@—¬‚êƒ{ƒ^ƒ“`n`n`n
temp =%temp%@@@@QQQQQQQQQQ‚ğì‚é`n`n
temp =%temp%@@›Ş—¿Eg‚¤‚à‚Ì`n`n
temp =%temp%@@@@QQQQQQQQQQ`n`n
temp =%temp%@@@@QQQQQQQQQQ`n`n
temp =%temp%@@@@QQQQQQQQQQ`n`n
temp =%temp%›ì‹Æ“à—e`n`n
temp =%temp%@@E`n`n
temp =%temp%@@E`n`n
temp =%temp%@@E`n`n
temp =%temp% Ê^‚ÉB‚é`n`n
temp =%temp%@@i@@@@@@@@@j`n`n
temp =%temp%‚¢‚Â‚â‚é‚Ì‚©`n`n
temp =%temp%@@QQQQQQQQQQQQQQQ`n`n
temp =%temp%		¨Š®¬`n
temp =%temp%@@@@                 @@@ —¬‚ê“o˜^`n

if(A_Hour>=12)
{
	ampm=PM
	jikan:=a_hour-12
	}
	else
	{
	ampm=AM
	jikan:=a_hour
	}


temp =%temp%	@@  @@@	%ampm%  * %jikan%`:%a_Min% * 



sleep,100

clipboard := temp

send,^v

sleep,100

send,^p

WinWait, ˆóü, 
IfWinNotActive, ˆóü, , WinActivate, ˆóü, 
WinWaitActive, ˆóü, 
sleep,100


send,!e

WinWait,ƒvƒŠƒ“ƒ^[‚Ìİ’è, 
IfWinNotActive,ƒvƒŠƒ“ƒ^[‚Ìİ’è, , WinActivate,ƒvƒŠƒ“ƒ^[‚Ìİ’è, 
WinWaitActive,ƒvƒŠƒ“ƒ^[‚Ìİ’è, 


sleep,100

send,(
sleep,100

send,{enter}
WinWait, ˆóü, 
IfWinNotActive, ˆóü, , WinActivate, ˆóü, 
WinWaitActive, ˆóü, 
sleep,100
send,{enter}

sleep,500
send,!{f4}
sleep,300
send,n

return
}