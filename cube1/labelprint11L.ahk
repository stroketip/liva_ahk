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
temp =-------3�̃{�^����������܂����B------`n
temp =%temp%          �@�@    �@        %A_YYYY%`/%a_mon%`/%a_mday%%weekd%`n`n
temp =%temp%�@����{�^��`n`n`n
temp =%temp%�@�@�@�@�Q�Q�Q�Q�Q�Q�Q�Q�Q�Q�����`n`n
temp =%temp%�@�@���ޗ��E�g������`n`n
temp =%temp%�@�@�@�@�Q�Q�Q�Q�Q�Q�Q�Q�Q�Q`n`n
temp =%temp%�@�@�@�@�Q�Q�Q�Q�Q�Q�Q�Q�Q�Q`n`n
temp =%temp%�@�@�@�@�Q�Q�Q�Q�Q�Q�Q�Q�Q�Q`n`n
temp =%temp%����Ɠ��e`n`n
temp =%temp%�@�@�E`n`n
temp =%temp%�@�@�E`n`n
temp =%temp%�@�@�E`n`n
temp =%temp%���ʐ^�ɎB��`n`n
temp =%temp%�@�@�i�@�@�@�@�@�@�@�@�@�j`n`n
temp =%temp%�����̂�`n`n
temp =%temp%�@�@�Q�Q�Q�Q�Q�Q�Q�Q�Q�Q�Q�Q�Q�Q�Q`n`n
temp =%temp%		������`n
temp =%temp%�@�@�@�@                 �@�@�@������o�^`n

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


temp =%temp%	�@�@  �@�@�@	%ampm%  * %jikan%`:%a_Min% * 



sleep,100

clipboard := temp

send,^v

sleep,100

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