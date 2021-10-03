#singleinstance ignore
settitlematchmode,2

fileread,outputvar,C:\Users\neumanzig\Desktop\txt\urldata.txt

stringpos := regexmatch(outputvar,"email")
stringpos += 7
stringtrimleft,outputvar2,outputvar,stringpos
stringtrimright,outputvar2,outputvar2,4

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

clipboard =
clipboard := outputvar2
clipwait,1


send,^v
sleep,100
mousemove,766,593
mouseclick,l
sleep,100

mousemove,711,516
mouseclick,l
sleep,500

;send,filename

filename=C:\Users\neumanzig\Desktop\print_qr\barcode\%a_year%%a_mm%%a_dd%%a_hour%%a_min%.png
clipboard:=filename
clipwait,1
send,^v
sleep,200
;同名ファイルに対応する
send,{enter}

send,!{f4}

sleep,100

; singleinstanceして
settitlematchmode, 2
{
run,C:\Users\neumanzig\Desktop\print_qr\qrprint.lpz

WinWait, - レイアウトして印刷２, 
IfWinNotActive, - レイアウトして印刷２, , WinActivate, - レイアウトして印刷２, 
WinWaitActive, - レイアウトして印刷２,

sleep,200
mousemove,749,388
mouseclick,left
sleep,100
mouseclick,left
mouseclick,left
clipboard=
clipboard:=outputvar
clipwait,1
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
clipboard=
clipboard:=filename
clipwait,1
sleep,100
send,^v
sleep,300
send,{enter}

send,^p
sleep,1000
send,{enter}
sleep,1000
send,{alt}
sleep,300
send,f
sleep,300
send,a
sleep,300


clipboard=
clipboard:=outputvar
clipwait,1

stringtrimleft,clipboard,clipboard,9
stringpos := regexmatch(outputvar,"email")
;stringpos -= 4
stringleft,clipboard,clipboard,stringpos
stringtrimright,clipboard,clipboard,13
clipboard=C:\Users\neumanzig\Desktop\print_qr\printout\%clipboard%

sleep,300
send,^v
send,{enter}
sleep,300
send,!{f4}


return
}

return
