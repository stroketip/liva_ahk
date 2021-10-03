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

temp =-------夜にやる翌日の準備------`n`n
temp =%temp%            　　　    %A_YYYY%`/%a_mon%`/%a_mday%%weekd%`n`n
temp =%temp%　　□　あすの予定＿＿＿＿＿＿＿について確認。`n`n
temp =%temp%　　　　□　要　持っていく物チェックリスト`n
temp =%temp%　　　　□　場所を調べる`n
temp =%temp%　　　　□　時間を調べる`n
temp =%temp%　　　　□　余力を調べる`n
temp =%temp%　　　　　（　あと　　　　　時間　　　　分）`n`n
temp =%temp%　　　　　※関連事項`n`n
temp =%temp%　　　　※＿＿＿＿＿＿＿＿＿＿＿＿＿＿`n`n`n
temp =%temp%　　　　※＿＿＿＿＿＿＿＿＿＿＿＿＿＿`n`n`n

temp =%temp%        □　使ったお金の登録`n
temp =%temp%　　　　□　食べたもの登録`n
temp =%temp%　　　　□　メモの片づけ`n
temp =%temp%　　　　□　水の用意`n
temp =%temp%　　　　□　血糖値測定`n
temp =%temp%　　　　□　ごはん`n
temp =%temp%　　　　□　注射`n
temp =%temp%　　　　□　机を片付ける`n

temp =%temp%　　　　□　洗濯もの`n
temp =%temp%　　　　□　洗濯物干す`n
temp =%temp%　　　　□　洗い物`n`n
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