#SingleInstance, FORCE
{

	#include C:\Users\neumanzig\Desktop\ahk\ahksock\ahksock.ahk
;	#include ./ahksock.ahk
	msgbox,0,,start connect,0.1
	
;	sServer := "stroketip-7.lan"
	
	global csSocket
	global svcSocket

	AHKsock_Listen(27015,"msgwait")
	
return

}

msgwait(sEvent, iSocket = 0, sName = 0, sAddr = 0, sPort = 0, ByRef bData = 0, iLength = 0)
{
;	global iPeerSocket

;	iPeerSocket := iSocket

	msgbox,0,,connect. %sEvent% ,0.1

	
	if(sEvent="ACCEPTED")
	{

		csSocket := iSocket

			if(svcSocket="")
			{
			msgbox,0,,接続します,0.1
			sServer := "stroketip-7.lan"
			i := AHKsock_connect(sServer, 27015,"msgwait")
			return
			}
	}

	if(sEvent="CONNECTED")
	{
		svcSocket := iSocket
	}

	if(sEvent="RECEIVED")
	{
		msgbox,0,,受信しました,0.1
	}

	if(sEvet="DISCONNECTED")
	{
		AHKsock_Close(csSocket)
		AHKsock_Close(svcSocket)
		csSocket := -1
		svcSocket := -1
		msgbox,0,,切断しました,0.1
	}

	msgbox,0,, - %sEvent% cs:%svcSocket% svc:%svcSocket% %sName% %bData% %iLength%,0.1
	





	clipboard := bData

	if(bData="""^b""")
	{
	gosub,sendar
	return
;msgbox, %bData%
	}

	if(bData="""^f""")
	{
	gosub,fse
	return
	}

	if(bData="""^q""")
	{
	gosub,extapp
	return
	}

	if(bData="""^z""")
	{
	gosub,apprun
	return
	}

	if(bData="ahk1")
	{
	gosub,ahk1
	return
	}

	if(bData="addtask")
	{
	gosub,addtask
	return
	}

	if(bData="tuikatest")
	{
	gosub,tuikatest
	return
	}



;	i := AHKsock_connect(sServer, 27015,"msgwait")

	i := AHKsock_Listen(27015,"msgwait")
	return
}
	
; tukuttemiru



^+!c::
{
	msgbox,0,,接続します,0.1
	sServer := "stroketip-7.lan"
	i := AHKsock_connect(sServer, 27015,"msgwait")
;	msgbox,0,,connect. %sEvent% %iSocket% %sName% %bData% %iLength%,3
return
}

^+l::
{
msgbox,listenを開始します。
	AHKsock_Listen(27015,"msgwait")
;	msgbox,0,,connect. %sEvent% %iSocket% %sName% %bData% %iLength%,3
return
}

sendar:
^+!s::

{
	msgbox,0,,send 送信をします。,0.1
sText ="文字を返信しました。"
    VarSetCapacity(iFrame, 4, 0), NumPut((2 << 16) + iTextLength, iFrame, 0, "UInt")
    iTextLength := StrLen(sText) * 2    

   ;Send the actual string now, excluding the null terminator
;	msgbox,%svcSocket% %sText% %iTextLength%
    If (i := AHKsock_Send(svcSocket, &sText, iTextLength)) {
        OutputDebug, % "AHKsock_ForceSend failed with return value = " i " and error code = " ErrorLevel " at line " A_LineNumber
}
	msgbox,0,,connect. %sEvent% %svcSocket% %sName% %bData% %iLength%,0.1

return

}

fse:
^+!f::

{
msgbox,0,,force send　送信をします。,0.1

sText ="force send 文字を返信しました。"
    VarSetCapacity(iFrame, 4, 0), NumPut((2 << 16) + iTextLength, iFrame, 0, "UInt")
    iTextLength := StrLen(sText) * 2    

   ;Send the actual string now, excluding the null terminator
;	msgbox,%iPeerSocket% %sText% %iTextLength%
    If (i := AHKsock_Send(svcSocket, &sText, iTextLength)) {
        OutputDebug, % "AHKsock_ForceSend failed with return value = " i " and error code = " ErrorLevel " at line " A_LineNumber
	}
	msgbox,0,,connect. %sEvent% %svcSocket% %sName% %bData% %iLength%,0.1
return
}


^+!d::
{
msgbox,切断をします。
	AHKsock_Close(csSocket)
	AHKsock_Close(svcSocket)
	csSocket := -1
	svcSocket := -1

	
	msgbox,0,,connect. %sEvent% %iPeerSocket% %sName% %bData% %iLength%,3
return
}






streamprocessor(bData, bDataLength)
{


return
}

^b::
{

		msgbox,送信をします。受信の用意をしてください
			sText ="文字を返信しました。"
    VarSetCapacity(iFrame, 4, 0), NumPut((2 << 16) + iTextLength, iFrame, 0, "UInt")
    iTextLength := StrLen(sText) * 2    

   ;Send the actual string now, excluding the null terminator
	msgbox,%iPeerSocket% %sText% %iTextLength%
    If (i := AHKsock_Send(iPeerSocket, &sText, iTextLength)) {
        OutputDebug, % "AHKsock_ForceSend failed with return value = " i " and error code = " ErrorLevel " at line " A_LineNumber
        return

}
}

^+/::
{
	msgbox,csSocket:%csSocket% - svcSocket:%svcSocket%
	inputbox,newcsSocket
	if(newcsSocket="")
	{
		return
	}
	csSocket := newcsSocket
	
	inputbox,newsvcSocket
	if(newsvcSocket="")
	{
		return
	}
	svcSocket := newsvcSocket	
	
	return

return
}

^+v::
{
	msgbox, %sEvent% svc: %svcSocket% , cs: %csSocket%  %sName% %bData% %iLength% ,svc: %svcSocket% , cs: %csSocket% 
	return
}

^+q::
extapp:
{
msgbox,0,,終了をします。,3
	AHKsock_Close(csSocket)
	AHKsock_Close(svcSocket)

exitapp
}


^+t::
{
;つながっているかのチェック
if(svcSocket="")or(svcSocket=-1){
msgbox,cssocket null
;つながっていない
return
}
msgbox,%svcSocket%
;つながっている
;つながっている場合の処理（タスクを送る）
return

}



^+z::
apprun:
{
msgbox,0,,プログラムを起動します,0.1
sText =runmp
    VarSetCapacity(iFrame, 4, 0), NumPut((2 << 16) + iTextLength, iFrame, 0, "UInt")
    iTextLength := StrLen(sText) * 2    

   ;Send the actual string now, excluding the null terminator
;	msgbox,%iPeerSocket% %sText% %iTextLength%
    If (i := AHKsock_Send(svcSocket, &sText, iTextLength)) {
        OutputDebug, % "AHKsock_ForceSend failed with return value = " i " and error code = " ErrorLevel " at line " A_LineNumber
	}
	msgbox,0,,connect. %sEvent% %svcSocket% %sName% %bData% %iLength%,0.1
return
}	

ahk1:
{
msgbox,0,,プログラムを起動します,0.1
sText =ahk1
    VarSetCapacity(iFrame, 4, 0), NumPut((2 << 16) + iTextLength, iFrame, 0, "UInt")
    iTextLength := StrLen(sText) * 2    

;	msgbox,%iPeerSocket% %sText% %iTextLength%
    If (i := AHKsock_Send(svcSocket, &sText, iTextLength)) {
        OutputDebug, % "AHKsock_ForceSend failed with return value = " i " and error code = " ErrorLevel " at line " A_LineNumber
	}
	msgbox,0,,connect. %sEvent% %svcSocket% %sName% %bData% %iLength%,0.1
return


}

addtask:
{
msgbox,0,,プログラムを起動します,0.1
sText =addtask
    VarSetCapacity(iFrame, 4, 0), NumPut((2 << 16) + iTextLength, iFrame, 0, "UInt")
    iTextLength := StrLen(sText) * 2    

;	msgbox,%iPeerSocket% %sText% %iTextLength%
    If (i := AHKsock_Send(svcSocket, &sText, iTextLength)) {
        OutputDebug, % "AHKsock_ForceSend failed with return value = " i " and error code = " ErrorLevel " at line " A_LineNumber
	}
	msgbox,0,,connect. %sEvent% %svcSocket% %sName% %bData% %iLength%,0.1
return
}
tuikatest:
{
msgbox,0,,プログラムを起動します,0.1
sText =tuikatest
    VarSetCapacity(iFrame, 4, 0), NumPut((2 << 16) + iTextLength, iFrame, 0, "UInt")
    iTextLength := StrLen(sText) * 2    

;	msgbox,%iPeerSocket% %sText% %iTextLength%
    If (i := AHKsock_Send(svcSocket, &sText, iTextLength)) {
        OutputDebug, % "AHKsock_ForceSend failed with return value = " i " and error code = " ErrorLevel " at line " A_LineNumber
	}
	msgbox,0,,connect. %sEvent% %svcSocket% %sName% %bData% %iLength%,0.1
return
}




;--; クリップボード変化時
onclipboardchange:
{
temp:=clipboard

stringleft,tempcheck,temp,6

if(tempcheck="ahkt10")
{
msgbox,0,,10分タイマーを起動します,0.1
sText =ahkt10
    VarSetCapacity(iFrame, 4, 0), NumPut((2 << 16) + iTextLength, iFrame, 0, "UInt")
    iTextLength := StrLen(sText) * 2    

   ;Send the actual string now, excluding the null terminator
;	msgbox,%iPeerSocket% %sText% %iTextLength%
    If (i := AHKsock_Send(svcSocket, &sText, iTextLength)) {
        OutputDebug, % "AHKsock_ForceSend failed with return value = " i " and error code = " ErrorLevel " at line " A_LineNumber
	}
	msgbox,0,,connect. %sEvent% %svcSocket% %sName% %bData% %iLength%,0.1
return
}

if(tempcheck="ahkt15")
{
msgbox,0,,15分タイマーを起動します,0.1
sText =ahkt15
    VarSetCapacity(iFrame, 4, 0), NumPut((2 << 16) + iTextLength, iFrame, 0, "UInt")
    iTextLength := StrLen(sText) * 2    

   ;Send the actual string now, excluding the null terminator
;	msgbox,%iPeerSocket% %sText% %iTextLength%
    If (i := AHKsock_Send(svcSocket, &sText, iTextLength)) {
        OutputDebug, % "AHKsock_ForceSend failed with return value = " i " and error code = " ErrorLevel " at line " A_LineNumber
	}
	msgbox,0,,connect. %sEvent% %svcSocket% %sName% %bData% %iLength%,0.1
return
}

if(tempcheck="ahkt30")
{
msgbox,0,,30分タイマーを起動します,0.1
sText =ahkt30
    VarSetCapacity(iFrame, 4, 0), NumPut((2 << 16) + iTextLength, iFrame, 0, "UInt")
    iTextLength := StrLen(sText) * 2    

   ;Send the actual string now, excluding the null terminator
;	msgbox,%iPeerSocket% %sText% %iTextLength%
    If (i := AHKsock_Send(svcSocket, &sText, iTextLength)) {
        OutputDebug, % "AHKsock_ForceSend failed with return value = " i " and error code = " ErrorLevel " at line " A_LineNumber
	}
	msgbox,0,,connect. %sEvent% %svcSocket% %sName% %bData% %iLength%,0.1
return
}

if(tempcheck="ahkt45")
{
msgbox,0,,45分タイマーを起動します,0.1
sText =ahkt45
    VarSetCapacity(iFrame, 4, 0), NumPut((2 << 16) + iTextLength, iFrame, 0, "UInt")
    iTextLength := StrLen(sText) * 2    

   ;Send the actual string now, excluding the null terminator
;	msgbox,%iPeerSocket% %sText% %iTextLength%
    If (i := AHKsock_Send(svcSocket, &sText, iTextLength)) {
        OutputDebug, % "AHKsock_ForceSend failed with return value = " i " and error code = " ErrorLevel " at line " A_LineNumber
	}
	msgbox,0,,connect. %sEvent% %svcSocket% %sName% %bData% %iLength%,0.1
return
}
if(tempcheck="addtas")

	gosub,addtask
	return

;msgbox,%tempcheck%
return



if(tempcheck="tuikat")
{
gosub,tuikatest
return
}

}
