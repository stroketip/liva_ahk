#singleinstance ignore
settitlematchmode, 2


run,C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe "https://www.youtube.com/live_dashboard?nv=1"



WinWait, ライブ ダッシュボード - YouTube, 
IfWinNotActive, ライブ ダッシュボード - YouTube, , WinActivate, ライブ ダッシュボード - YouTube, 
WinWaitActive, ライブ ダッシュボード - YouTube,

sleep,8000

send,^a
sleep,350
send,^c
sleep,1100

#include C:\Users\neumanzig\Desktop\ahk\qwatchcp\YTcp.ahk

return