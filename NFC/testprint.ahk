settitlematchmode,2


run,C:\Users\neumanzig\Desktop\print_qr\qrprint.lpz

WinWait, レイアウトして印刷２, 
IfWinNotActive, レイアウトして印刷２, , WinActivate, レイアウトして印刷２, 
WinWaitActive, レイアウトして印刷２, 

sleep,300

send,^p

winwait, 印刷
sleep,300

send,{enter}


sleep,1000

send,!{f4}
return
