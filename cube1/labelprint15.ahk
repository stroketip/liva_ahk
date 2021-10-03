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



temp =-------青ボタンが押されました。------`n`n
temp =%temp%                 %A_YYYY%`/%a_mon%`/%a_mday%%weekd%`n`n
temp =%temp%      寝る前のチェックリスト`n`n`n
temp =%temp%　　　　□机を片付ける`n`n
temp =%temp%　　　　□領収書片付け→おくる`n`n
temp =%temp%　　　　□机の中の針などを片付ける`n`n
temp =%temp%　　　　□注射の確認`n`n
temp =%temp%　　　　□あすけんの入力確認`n`n
temp =%temp%　　　　□水筒の用意`n`n
temp =%temp%　　　　□明日の朝用に何か書き残すこと`n`n
temp =%temp%　　　　※＿＿＿＿＿＿＿＿＿＿＿＿＿＿`n`n`n
temp =%temp%　　　　□次の日に必要なことを書いておく`n`n
temp =%temp%　　　　□今週の予定`n`n



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