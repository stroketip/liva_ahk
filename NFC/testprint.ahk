settitlematchmode,2


run,C:\Users\neumanzig\Desktop\print_qr\qrprint.lpz

WinWait, ���C�A�E�g���Ĉ���Q, 
IfWinNotActive, ���C�A�E�g���Ĉ���Q, , WinActivate, ���C�A�E�g���Ĉ���Q, 
WinWaitActive, ���C�A�E�g���Ĉ���Q, 

sleep,300

send,^p

winwait, ���
sleep,300

send,{enter}


sleep,1000

send,!{f4}
return
