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



temp =-------�{�^����������܂����B------`n`n
temp =%temp%                 %A_YYYY%`/%a_mon%`/%a_mday%%weekd%`n`n
temp =%temp%      �Q��O�̃`�F�b�N���X�g`n`n`n
temp =%temp%�@�@�@�@������Еt����`n`n
temp =%temp%�@�@�@�@���̎����Еt����������`n`n
temp =%temp%�@�@�@�@�����̒��̐j�Ȃǂ�Еt����`n`n
temp =%temp%�@�@�@�@�����˂̊m�F`n`n
temp =%temp%�@�@�@�@����������̓��͊m�F`n`n
temp =%temp%�@�@�@�@�������̗p��`n`n
temp =%temp%�@�@�@�@�������̒��p�ɉ��������c������`n`n
temp =%temp%�@�@�@�@���Q�Q�Q�Q�Q�Q�Q�Q�Q�Q�Q�Q�Q�Q`n`n`n
temp =%temp%�@�@�@�@�����̓��ɕK�v�Ȃ��Ƃ������Ă���`n`n
temp =%temp%�@�@�@�@�����T�̗\��`n`n



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