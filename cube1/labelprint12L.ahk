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


clipboard_backup = %ClipboardAll%
clipboard=

formattime,weekd,,(ddd)

temp =-------5�{�^����������܂����B------`n`n
temp =%temp%                 %A_YYYY%`/%a_mon%`/%a_mday%%weekd%`n`n
temp =%temp%�t�H�[���{�^��`n`n`n
temp =%temp%	��  �摜`n`n`n
temp =%temp%�@�@�@�@�@���W�I�{�^��`n`n`n
temp =%temp%�@�@�@�@�����x�����`n`n`n
temp =%temp%�@�@�@�@sub`n`n`n
temp =%temp%�@�@�@�@���Q�Q�Q�Q�Q�Q�Q�Q�Q�Q�Q�Q�Q�Q`n`n`n
temp =%temp%�@�@�@�@�����Ƀ��b�N�A�b�v������`n`n`n


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

sleep,400

send,^p

WinWait, ���, 
IfWinNotActive, ���, , WinActivate, ���, 
WinWaitActive, ���, 
sleep,100


send,!e

WinWait,�v�����^�[�̐ݒ�, 
IfWinNotActive,�v�����^�[�̐ݒ�, , WinActivate,�v�����^�[�̐ݒ�, 
WinWaitActive,�v�����^�[�̐ݒ�, 


sleep,100

send,(
sleep,100

send,{enter}
WinWait, ���, 
IfWinNotActive, ���, , WinActivate, ���, 
WinWaitActive, ���, 
sleep,100
send,{enter}

sleep,500
send,!{f4}
sleep,300
send,n

return
}