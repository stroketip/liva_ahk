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
temp =-------2�{�^����������܂����B------`n
temp =%temp%                 %A_YYYY%`/%a_mon%`/%a_mday%%weekd%`n`n
temp =%temp%	�������Ă������`�F�b�N���X�g`n`n
temp =%temp%    ���P�[�^�C�@�@�@�@�@�@�@�����z`n
temp =%temp%    ���X�[�c�@�@�@�@�@�@�@�@������`n
temp =%temp%    ���C���@�@�@�@�@�@�@�@�@�����イ����`n
temp =%temp%    �������Ƃ��悤���@�@�@�@�����D`n
temp =%temp%    ���V���c�@�@�@�@�@�@�@�@��ADHD�̖�`n
temp =%temp%    ���l�N�^�C�@�@�@�@�@�@�@���ٓ�`n
temp =%temp%    ����� USB �@�@�@�@�@ ���C���X�����o�b�O`n
temp =%temp%    ���{�[���y���@�@�@�@�@�@���X���b�p`n
temp =%temp%    ���u���y���@�@�@�@�@�@�@���Ԃ̐���`n`n
temp =%temp%    ���n���J�`�@�@�@�@�@�@�@������o�b�O`n
temp =%temp%    �����v�@�@�@�@�@�@�@�@�@���R���^�N�g�����Y`n
temp =%temp%    ����@�@�@�@�@�@�@�@�@�@���}�X�N`n
temp =%temp%    ���Ђ����@�@�@�@�@�@�@���g�ѓd�b`n
temp =%temp%    ��Informant�`�F�b�N�@���[�d��`n
temp =%temp%    ���\�K �h��`n
temp =%temp%    �������@�@�@�@�@�@�@�@�@������`n
temp =%temp%    ���M���@�@�@�@�@�@�@�@�@���}��`n


temp =%temp%�@�@�@�@�@�@�@�@�@�@�@  �@�@�@���@�S�`�F�b�N`n
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
sleep,400

send,{enter}

sleep,700
send,!{f4}

sleep,500
send,n

return
}