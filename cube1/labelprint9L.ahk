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
temp =-------1�{�^����������܂����B------`n
temp =%temp%                 �@�@�@  %A_YYYY%`/%a_mon%`/%a_mday%%weekd%`n`n
temp =%temp%���\�[�X���L�����܂��B`n`n
temp =%temp%    �@���g�p���[�A�b�v�I�i�^�O�d�v�x���x��UP�j`n`n
temp =%temp%    �����}�C���_�[�@��Google�J�����_�[�iEvent�j`n
;temp =%temp%    
temp =%temp%    ��copied �J�X�^���L�[�{�[�h`n
temp =%temp%    ���R�s�[�Z���^�[�@�J�X�^���L�[�{�[�h`n
temp =%temp%    ��copied �����^�X�N�i�^�X�N�{�[�h�j`n
temp =%temp%    ���^�X�N�V���[�g�@��Evernote�d�v�Ȃ���`n
temp =%temp%    ���ӂ���`n
temp =%temp%    `n
temp =%temp%    ���V�K���\�[�X`n`n
temp =%temp%�@�@�@�@���@`n`n
temp =%temp%�@�@�@�@�@�i�@�@�@�@�@�@�@�@�@�@�@�@�@�j`n`n
temp =%temp%�@�@�@�@�@�֘A���\�[�X`n`n
temp =%temp%�@�@�@�@���Q�Q�Q�Q�Q�Q�Q�Q�Q�Q�Q�Q�Q�Q`n`n`n
temp =%temp%�@�@�@�@���Q�Q�Q�Q�Q�Q�Q�Q�Q�Q�Q�Q�Q�Q`n`n`n
temp =%temp%�@�@�@�@�@���֘A����`n`n`n
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