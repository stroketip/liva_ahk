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



temp =-------���{�^����������܂����B------`n`n
temp =%temp%                 %A_YYYY%`/%a_mon%`/%a_mday%%weekd%`n`n
temp =%temp%      �A����Ƃ��̃`�F�b�N���X�g`n`n`n
temp =%temp%	���Ԃ̃S�~���̂Ă�i�T��1�x�j`n`n
temp =%temp%�@�@�@�@���̎����Еt����������`n`n
temp =%temp%�@�@�@�@�����z�����Â�`n`n
temp =%temp%�@�@�@�@�������v�����o��`n`n
temp =%temp%�@�@�@�@��������p��`n`n
temp =%temp%�@�@�@�@�������̕Еt��`n`n
temp =%temp%�@�@�@�@���Q�Q�Q�Q�Q�Q�Q�Q�Q�Q�Q�Q�Q�Q`n`n`n
temp =%temp%�@�@�@�@���Ԃ̏d�v�ȏ��ނ����낵�Ă���`n`n


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