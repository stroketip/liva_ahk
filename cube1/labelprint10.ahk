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
temp =-------2�̃{�^����������܂����B------`n`n
temp =%temp%                 %A_YYYY%`/%a_mon%`/%a_mday%%weekd%`n`n

temp =%temp%	�^�X�N��ǉ�����`n`n`n
temp =%temp%�@�@�Q�Q�Q�Q�Q�Q�Q�Q�Q�Q�Q�Q�Q�Q�Q�Q�Q�Q`n`n
temp =%temp%���@�ǂ���`n`n
temp =%temp%���O�[�O���J�����_�[�@�@���^�X�N�V���[�g`n`n
temp =%temp%�����}�C���_�[�@�@�@�@�@���v���쒠`n`n
temp =%temp%���^�X�N�{�[�h�icopied�J�X�^���L�[�{�[�h�j`n`n
temp =%temp%���蒠�@�@�@�@�@�@�@�@�@�����\�[�X�J�[�h`n`n
temp =%temp%�����̑�`n`n`n
temp =%temp%���ς��莞�ԁQ�Q�Q�Q�Q�Q�Q�Q�Q�Q�Q�Q`n`n
temp =%temp%�@�@�@�@���@`n`n
temp =%temp%�@�@�@�@�@�i�@�@�@�@�@�@�@�@�@�@�@�@�@�j`n`n
temp =%temp%�@�@�@�@���Q�Q�Q�Q�Q�Q�Q�Q�Q�Q�Q�Q�Q�Q`n`n`n
temp =%temp%�\������@�@�@�@�@���@�@�@���@�@�@�F`n`n`n

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


temp =%temp%				%ampm%  * %jikan%`:%a_Min% * 



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

sleep,700
send,!{f4}

sleep,500
send,n

return
}