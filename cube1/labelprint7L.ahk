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
temp =-------2�{�^����������܂����B------`n`n
temp =%temp%�@                 %A_YYYY%`/%a_mon%`/%a_mday%%weekd%`n`n
temp =%temp%	�a�@�Ɏ����Ă������`�F�b�N���X�g`n`n
temp =%temp%�@�@���}�X�N�@�@�@�@�@�@�@  �����z`n
temp =%temp%�@�@�����̓��̖�ɽ��ޭ�� �@�����˃����^�X`n
temp =%temp%�@�@���ی��؁@�@�@�@�@�@�@�@�����˃m�{���s�b�h`n
temp =%temp%�@�@�������Ƃ��悤���@�@���K�v�����v�Z����`n
temp =%temp%�@�@���f�@�J�[�h�@�@�@�@������`n
temp =%temp%�@�@���\��\�L���@�@�@�@���g��`n
temp =%temp%�@�@�������l�]�L �@ �@�@������ɍs���莝�v�Z`n
temp =%temp%�@�@���{�[���y���@�@�@�@������蒠��`n
temp =%temp%�@�@�����A�a�蒠�@�@�@�@���{�[���y��`n`n
temp =%temp%�@�@���g�p�ςݐj�y�b�g�{�g�����e�B�b�V����ǉ�`n
temp =%temp%�@�@�����𐔂���
temp =%temp%�@�@���j�@�@�@�@�@�@�@�@�@�@`n
temp =%temp%�@�@�����u���@�@�@�@�@�@�@�@`n
temp =%temp%�@�@���A���R�[���ȁ@�@�@�@�@`n
temp =%temp%�@�@���\�K �h��`n
temp =%temp%�@�@�@�@�@�@�@�@�@�@�@�@�@�@���@�S�`�F�b�N`n
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