#singleinstance ignore

settitlematchmode,2
sleep,100
run,C:\Program Files\Hidemaru\Hidemaru.exe

sleep,100

WinWait, - 秀丸, 
IfWinNotActive, - 秀丸, , WinActivate, - 秀丸, 
WinWaitActive, - 秀丸, 

sleep,500


{

formattime,weekd,,(ddd)

clipboard_backup = %ClipboardAll%
clipboard=
temp =-------3のボタンが押されました。------`n
temp =%temp%          　　    　        %A_YYYY%`/%a_mon%`/%a_mday%%weekd%`n`n
temp =%temp%　流れボタン`n`n`n
temp =%temp%　　　　＿＿＿＿＿＿＿＿＿＿を作る`n`n
temp =%temp%　　○材料・使うもの`n`n
temp =%temp%　　　　＿＿＿＿＿＿＿＿＿＿`n`n
temp =%temp%　　　　＿＿＿＿＿＿＿＿＿＿`n`n
temp =%temp%　　　　＿＿＿＿＿＿＿＿＿＿`n`n
temp =%temp%○作業内容`n`n
temp =%temp%　　・`n`n
temp =%temp%　　・`n`n
temp =%temp%　　・`n`n
temp =%temp%□写真に撮る`n`n
temp =%temp%　　（　　　　　　　　　）`n`n
temp =%temp%いつやるのか`n`n
temp =%temp%　　＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿`n`n
temp =%temp%		→完成`n
temp =%temp%　　　　                 　　　□流れ登録`n

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


temp =%temp%	　　  　　　	%ampm%  * %jikan%`:%a_Min% * 



sleep,100

clipboard := temp

send,^v

sleep,100

send,^p

WinWait, 印刷, 
IfWinNotActive, 印刷, , WinActivate, 印刷, 
WinWaitActive, 印刷, 
sleep,100


send,!e

WinWait,プリンターの設定, 
IfWinNotActive,プリンターの設定, , WinActivate,プリンターの設定, 
WinWaitActive,プリンターの設定, 


sleep,100

send,(
sleep,100

send,{enter}
WinWait, 印刷, 
IfWinNotActive, 印刷, , WinActivate, 印刷, 
WinWaitActive, 印刷, 
sleep,100
send,{enter}

sleep,500
send,!{f4}
sleep,300
send,n

return
}