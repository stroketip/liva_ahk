#singleinstance ignore

settitlematchmode,2
sleep,100
run,C:\Program Files\Hidemaru\Hidemaru.exe

sleep,100

WinWait, - �G��, 
IfWinNotActive, - �G��, , WinActivate, - �G��, 
WinWaitActive, - �G��, 

sleep,100


{


clipboard_backup = %ClipboardAll%
clipboard=


formattime,weekd,,(ddd)

temp =-------4�{�^����������܂����B------`n`n
temp =%temp%                   %A_YYYY%`/%a_mon%`/%a_mday%%weekd%`n`n
temp =%temp%	  �Q�Q�Q�Q�Q�Q�Q�Q��H�ׂ܂����B`n`n
temp =%temp%	  ��  �v��������o�^`n`n
temp =%temp%	  ��  �C���X��������`n`n


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


temp =%temp%		%ampm%  * %jikan%`:%a_Min% * �ɏ�������܂����B`n




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

sleep,500
send,!{f4}

sleep,700
send,n

return
}