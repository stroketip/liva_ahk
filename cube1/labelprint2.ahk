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
temp =-------2ボタンが押されました。------`n
temp =%temp%                 %A_YYYY%`/%a_mon%`/%a_mday%%weekd%`n`n
temp =%temp%	朝持っていく物チェックリスト`n`n
temp =%temp%    □ケータイ　　　　　　　□財布`n
temp =%temp%    □スーツ　　　　　　　　□ご飯`n
temp =%temp%    □靴下　　　　　　　　　□ちゅうしゃ`n
temp =%temp%    □髪をとくようい　　　　□名札`n
temp =%temp%    □シャツ　　　　　　　　□ADHDの薬`n
temp =%temp%    □ネクタイ　　　　　　　□弁当`n
temp =%temp%    □印鑑 USB 　　　　　 □インスリンバッグ`n
temp =%temp%    □ボールペン　　　　　　□スリッパ`n
temp =%temp%    □蛍光ペン　　　　　　　□車の整理`n`n
temp =%temp%    □ハンカチ　　　　　　　□日報バッグ`n
temp =%temp%    □時計　　　　　　　　　□コンタクトレンズ`n
temp =%temp%    □薬　　　　　　　　　　□マスク`n
temp =%temp%    □ひげ剃る　　　　　　　□携帯電話`n
temp =%temp%    □Informantチェック　□充電器`n
temp =%temp%    □予習 宿題`n
temp =%temp%    □水筒　　　　　　　　　□日報`n
temp =%temp%    □筆箱　　　　　　　　　□図面`n


temp =%temp%　　　　　　　　　　　  　　　□　全チェック`n
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