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

temp =-------6�{�^����������܂����B------`n`n
temp =%temp%                 %A_YYYY%`/%a_mon%`/%a_mday%%weekd%`n`n
temp =%temp%�Q�Q�Q�Q�Q�Q�Q�ɂ��Ă̏�����\�肵�܂��B`n`n`n
temp =%temp%�@�@�@�@���@�v�@�����Ă������`�F�b�N���X�g`n`n
temp =%temp%�@�@�@�@���@�ꏊ�𒲂ׂ�`n`n
temp =%temp%�@�@�@�@���@�c�Ǝ��Ԃ𒲂ׂ�B`n`n
temp =%temp%�@�@�@�@���@���ԂƗ]�͂𒲂ׂ�`n`n
temp =%temp%�@�@�@�@�@�i�@���Ɓ@�@�@�@�@���ԁ@�@�@�@���j`n`n
temp =%temp%�@�@�@�@�@���֘A����`n`n`n
temp =%temp%�@�@�@�@���Q�Q�Q�Q�Q�Q�Q�Q�Q�Q�Q�Q�Q�Q`n`n`n
temp =%temp%�@�@�@�@���Q�Q�Q�Q�Q�Q�Q�Q�Q�Q�Q�Q�Q�Q`n`n`n



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




clipboard := temp
sleep,100

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