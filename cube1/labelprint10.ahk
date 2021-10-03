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
temp =-------2のボタンが押されました。------`n`n
temp =%temp%                 %A_YYYY%`/%a_mon%`/%a_mday%%weekd%`n`n

temp =%temp%	タスクを追加する`n`n`n
temp =%temp%　　＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿`n`n
temp =%temp%→　どこへ`n`n
temp =%temp%□グーグルカレンダー　　□タスクシュート`n`n
temp =%temp%□リマインダー　　　　　□計測野帳`n`n
temp =%temp%□タスクボード（copiedカスタムキーボード）`n`n
temp =%temp%□手帳　　　　　　　　　□リソースカード`n`n
temp =%temp%□その他`n`n`n
temp =%temp%見積もり時間＿＿＿＿＿＿＿＿＿＿＿＿`n`n
temp =%temp%　　　　□　`n`n
temp =%temp%　　　　　（　　　　　　　　　　　　　）`n`n
temp =%temp%　　　　※＿＿＿＿＿＿＿＿＿＿＿＿＿＿`n`n`n
temp =%temp%予定日時　　　　　月　　　日　　　：`n`n`n

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


temp =%temp%				%ampm%  * %jikan%`:%a_Min% * 



sleep,100

clipboard := temp

send,^v

sleep,100

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