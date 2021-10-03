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
temp =-------1ボタンが押されました。------`n
temp =%temp%                 　　　  %A_YYYY%`/%a_mon%`/%a_mday%%weekd%`n`n
temp =%temp%リソースを記入します。`n`n
temp =%temp%    　換喩パワーアップ！（タグ重要度レベルUP）`n`n
temp =%temp%    □リマインダー　□Googleカレンダー（Event）`n
;temp =%temp%    
temp =%temp%    □copied カスタムキーボード`n
temp =%temp%    □コピーセンター　カスタムキーボード`n
temp =%temp%    □copied 履歴タスク（タスクボード）`n
temp =%temp%    □タスクシュート　□Evernote重要なこと`n
temp =%temp%    □ふせん`n
temp =%temp%    `n
temp =%temp%    ☆新規リソース`n`n
temp =%temp%　　　　□　`n`n
temp =%temp%　　　　　（　　　　　　　　　　　　　）`n`n
temp =%temp%　　　　　関連リソース`n`n
temp =%temp%　　　　※＿＿＿＿＿＿＿＿＿＿＿＿＿＿`n`n`n
temp =%temp%　　　　※＿＿＿＿＿＿＿＿＿＿＿＿＿＿`n`n`n
temp =%temp%　　　　　※関連事項`n`n`n
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


temp =%temp%		%ampm%  * %jikan%`:%a_Min% * 




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