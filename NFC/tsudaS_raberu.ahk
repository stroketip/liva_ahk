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
temp =-------2ボタンが押されました。------`n`n
temp =%temp%　                 %A_YYYY%`/%a_mon%`/%a_mday%%weekd%`n`n
temp =%temp%	病院に持っていく物チェックリスト`n`n
temp =%temp%　　□マスク　　　　　　　  □財布`n
temp =%temp%　　□その日の夜にｽｹｼﾞｭｰﾙ 　□注射ランタス`n
temp =%temp%　　□保険証　　　　　　　　□注射ノボラピッド`n
temp =%temp%　　□髪をとくようい　　　　□必要数を計算する`n
temp =%temp%　　□診察カード　　　　　　□お金`n
temp =%temp%　　□予約表記入　　　　　　□携帯`n
temp =%temp%　　□血糖値転記 　　　　□薬取りに行く手持計算`n
temp =%temp%    `n
temp =%temp%　　□ボールペン　　　　　　□お薬手帳●`n
temp =%temp%　　□糖尿病手帳　　　　　　□ボールペン`n`n
temp =%temp%　　□使用済み針ペットボトル□ティッシュを追加`n
temp =%temp%　　□数を数える　　　　　　
temp =%temp%　　□針`n
temp =%temp%　　□リブレ　　　　　　　　`n
temp =%temp%　　□アルコール綿　　　　　`n
temp =%temp%　　□予習 宿題`n
temp =%temp%　　　　　　　　　　　　　　□　全チェック`n
temp =%temp%`n
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

sleep,100

send,^p

sleep,100

send,!e
sleep,100
send,n
sleep,100
send,n
sleep,100
send,{enter}
sleep,300

send,{enter}

sleep,500

send,!{f4}

WinWait, 秀丸エディタ, 
IfWinNotActive, 秀丸エディタ, , WinActivate, 秀丸エディタ, 
WinWaitActive, 秀丸エディタ, 


sleep,100
send,n

return
}