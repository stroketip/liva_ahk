settitlematchmode, 2


run,C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe "https://www.youtube.com/live_dashboard?nv=1"



WinWait, ���C�u�z�M - YouTube Studio , 
IfWinNotActive, ���C�u�z�M - YouTube Studio , , WinActivate, ���C�u�z�M - YouTube Studio , 
WinWaitActive, ���C�u�z�M - YouTube Studio ,

sleep,8000

send,{f11}

sleep,2000

mousemove,1589,35
sleep,100
mouseclick,l
sleep,1000
mousemove,1562,282
sleep,100
mouseclick,l
sleep,300



#include C:\Users\neumanzig\Desktop\ahk\qwatchcp\__YTcp__.ahk

return