#singleinstance ignore

settitlematchmode,2
sleep,100
run,C:\Program Files\Hidemaru\Hidemaru.exe

sleep,100

WinWait, - �G��, 
IfWinNotActive, - �G��, , WinActivate, - �G��, 
WinWaitActive, - �G��, 

sleep,500


{

formattime,weekd,,(ddd)

clipboard_backup = %ClipboardAll%
clipboard=
temp =-------3�̃{�^����������܂����B------`n`n
temp =%temp%                 %A_YYYY%`/%a_mon%`/%a_mday%%weekd%`n`n

temp =%temp%	��A���˂̃`�F�b�N���X�g`n`n`n
temp =%temp%�Q�Q�Q�Q�Q�Q�̖�����ޕK�v������܂��B`n`n
temp =%temp%���Q�Q�Q�Q�Q�Q�Q`n`n
temp =%temp%		����������񂾁B`n`n`n
temp =%temp%���ɂ��邱�Ƃ́Q�Q�Q�Q�Q�Q�ł��B`n`n

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

WinWait, ���, 
IfWinNotActive, ���, , WinActivate, ���, 
WinWaitActive, ���, 
sleep,400

send,{enter}

sleep,700
send,!{f4}

sleep,500
send,n

return
}