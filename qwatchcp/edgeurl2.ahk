settitlematchmode, 2


run,C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe "https://www.youtube.com/live_dashboard?nv=1"



WinWait, ���C�u�z�M - YouTube Studio , 
IfWinNotActive, ���C�u�z�M - YouTube Studio , , WinActivate, ���C�u�z�M - YouTube Studio , 
WinWaitActive, ���C�u�z�M - YouTube Studio ,

sleep,8000

send,{f11}

sleep,5000

mousemove,1663,36
sleep,300
mouseclick,l
sleep,1200
mousemove,1157,683
sleep,300
mouseclick,l
sleep,300



#include C:\Users\neumanzig\Desktop\ahk\qwatchcp\time.ahk

return