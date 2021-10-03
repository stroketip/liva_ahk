; singleinstanceして
settitlematchmode, 2
{
run,C:\Users\neumanzig\Desktop\print_qr\原紙フォント10.5.lpz

WinWait, - レイアウトして印刷２, 
IfWinNotActive, - レイアウトして印刷２, , WinActivate, - レイアウトして印刷２, 
WinWaitActive, - レイアウトして印刷２,

sleep,200
mousemove,749,388
mouseclick,left
sleep,100
mouseclick,left
mouseclick,left
sleep,300
send,^a
send,^v
sleep,100

mousemove,33,76
mouseclick,left
sleep,100

mousemove,39,259
mouseclick,left
sleep,100

mousemove,778,339
mouseclick,left
sleep,300

mouseclick,right
sleep,300

send,{down}
sleep,100
send,{enter}

sleep,300
clipboard=C:\Users\neumanzig\Desktop\print_qr\barcode\tudas.png
clipwait,1
sleep,100
send,^v
sleep,300
send,{enter}

return
}
