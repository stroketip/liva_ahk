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


clipboard_backup = %ClipboardAll%
clipboard=

formattime,weekd,,(ddd)

temp =-------5ボタンが押されました。------`n`n
temp =%temp%                 %A_YYYY%`/%a_mon%`/%a_mday%%weekd%`n`n
temp =%temp%フォームボタン`n`n`n
temp =%temp%	□  画像`n`n`n
temp =%temp%　　　　　ラジオボタン`n`n`n
temp =%temp%　　　　□ラベル印刷`n`n`n
temp =%temp%　　　　sub`n`n`n
temp =%temp%　　　　※＿＿＿＿＿＿＿＿＿＿＿＿＿＿`n`n`n
temp =%temp%　　　　□裏にモックアップを書く`n`n`n


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