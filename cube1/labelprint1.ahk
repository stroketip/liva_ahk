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

temp =-------1ボタンが押されました。------`n`n
temp =%temp%                 %A_YYYY%`/%a_mon%`/%a_mday%%weekd%`n`n
temp =%temp%	＿＿＿＿＿＿円のお金を使いました。`n`n
temp =%temp%	□　登録が必要です。`n`n

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



	



temp =%temp%		%ampm%  * %jikan%`:%a_Min% * に準備されました。`n


sleep,100

clipboard := temp

send,^v

sleep,400

send,^p

WinWait, 印刷, 
IfWinNotActive, 印刷, , WinActivate, 印刷, 
WinWaitActive, 印刷, 
sleep,400

send,{enter}

sleep,700
send,!{f4}

sleep,500
send,n

return
}