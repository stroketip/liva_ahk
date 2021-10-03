settitlematchmode,2

run,C:\Program Files (x86)\Barcode Generator\BarcodeGenerator.exe

WinWait,- QR Code, 
IfWinNotActive,- QR Code, , WinActivate,- QR Code, 
WinWaitActive,- QR Code,

sleep,100

mousemove,50,347
mouseclick,l

sleep,100

mousemove,165,347
mouseclick,l
sleep,100

mousemove,45,420
mouseclick,l
sleep,100

mousemove,456,339
mouseclick,l
sleep,100

mousemove,321,375
mouseclick,l
sleep,100

send,{tab}

send,http://aa.aa

mousemove,766,593
mouseclick,l
sleep,100

mousemove,711,516
mouseclick,l
sleep,500

send,filename
send,{enter}
sleep,100
;“¯–¼ƒtƒ@ƒCƒ‹‚É‘Î‰ž‚·‚é


send,!{f4}

return
