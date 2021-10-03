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

temp =-------6ボタンが押されました。------`n`n
temp =%temp%                 %A_YYYY%`/%a_mon%`/%a_mday%%weekd%`n`n
temp =%temp%＿＿＿＿＿＿＿についての準備を予定します。`n`n`n
temp =%temp%　　　　□　要　持っていく物チェックリスト`n`n
temp =%temp%　　　　□　場所を調べる`n`n
temp =%temp%　　　　□　営業時間を調べる。`n`n
temp =%temp%　　　　□　時間と余力を調べる`n`n
temp =%temp%　　　　　（　あと　　　　　時間　　　　分）`n`n
temp =%temp%　　　　　※関連事項`n`n`n
temp =%temp%　　　　※＿＿＿＿＿＿＿＿＿＿＿＿＿＿`n`n`n
temp =%temp%　　　　※＿＿＿＿＿＿＿＿＿＿＿＿＿＿`n`n`n



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




clipboard := temp
sleep,100

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