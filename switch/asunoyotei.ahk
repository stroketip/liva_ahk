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

temp =-------��ɂ�闂���̏���------`n`n
temp =%temp%            �@�@�@    %A_YYYY%`/%a_mon%`/%a_mday%%weekd%`n`n
temp =%temp%�@�@���@�����̗\��Q�Q�Q�Q�Q�Q�Q�ɂ��Ċm�F�B`n`n
temp =%temp%�@�@�@�@���@�v�@�����Ă������`�F�b�N���X�g`n
temp =%temp%�@�@�@�@���@�ꏊ�𒲂ׂ�`n
temp =%temp%�@�@�@�@���@���Ԃ𒲂ׂ�`n
temp =%temp%�@�@�@�@���@�]�͂𒲂ׂ�`n
temp =%temp%�@�@�@�@�@�i�@���Ɓ@�@�@�@�@���ԁ@�@�@�@���j`n`n
temp =%temp%�@�@�@�@�@���֘A����`n`n
temp =%temp%�@�@�@�@���Q�Q�Q�Q�Q�Q�Q�Q�Q�Q�Q�Q�Q�Q`n`n`n
temp =%temp%�@�@�@�@���Q�Q�Q�Q�Q�Q�Q�Q�Q�Q�Q�Q�Q�Q`n`n`n

temp =%temp%        ���@�g���������̓o�^`n
temp =%temp%�@�@�@�@���@�H�ׂ����̓o�^`n
temp =%temp%�@�@�@�@���@�����̕ЂÂ�`n
temp =%temp%�@�@�@�@���@���̗p��`n
temp =%temp%�@�@�@�@���@�����l����`n
temp =%temp%�@�@�@�@���@���͂�`n
temp =%temp%�@�@�@�@���@����`n
temp =%temp%�@�@�@�@���@����Еt����`n

temp =%temp%�@�@�@�@���@�������`n
temp =%temp%�@�@�@�@���@���󕨊���`n
temp =%temp%�@�@�@�@���@�􂢕�`n`n
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



sleep,100

clipboard := temp

send,^v

sleep,400

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