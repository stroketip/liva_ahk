{
	#include ./ahksock.ahk
	msgbox,start connect
	
	sServer := "192.168.86.27"
	
	AHKsock_Listen(27015,"msgwait")
	
return

}

msgwait(sEvent, iSocket = 0, sName = 0, sAddr = 0, sPort = 0, ByRef bData = 0, iLength = 0)
{
	global iPeerSocket

	iPeerSocket := iSocket

	loop,10
	{
	msgbox,0,,connect. %sEvent% ,5
	if(sevent="ACCEPTED")
	{
		
	}
	}



	msgbox,0,,connect. %sEvent% %iSocket% %sName% %bData% %iLength%,1


	AHKsock_Listen(27015,"msgwait")
	return
}
	
; tukuttemiru



^+!c::
{
	msgbox,接続します
	sServer := "192.168.86.27"
	i := AHKsock_connect(sServer, 27015,"msgwait")
;	msgbox,0,,connect. %sEvent% %iSocket% %sName% %bData% %iLength%,3
return
}

^+!l::
{
msgbox,listenを開始します。
	AHKsock_Listen(27015,"msgwait")
;	msgbox,0,,connect. %sEvent% %iSocket% %sName% %bData% %iLength%,3
return
}

^+!s::
{
	msgbox,send 送信をします。
sText ="文字を返信しました。"
    VarSetCapacity(iFrame, 4, 0), NumPut((2 << 16) + iTextLength, iFrame, 0, "UInt")
    iTextLength := StrLen(sText) * 2    

   ;Send the actual string now, excluding the null terminator
	msgbox,%iPeerSocket% %sText% %iTextLength%
    If (i := AHKsock_Send(iPeerSocket, &sText, iTextLength)) {
        OutputDebug, % "AHKsock_ForceSend failed with return value = " i " and error code = " ErrorLevel " at line " A_LineNumber
}
	msgbox,0,,connect. %sEvent% %iPeerSocket% %sName% %bData% %iLength%,3

return

}

^+!f::
{
msgbox,force send　送信をします。

sText ="force send 文字を返信しました。"
    VarSetCapacity(iFrame, 4, 0), NumPut((2 << 16) + iTextLength, iFrame, 0, "UInt")
    iTextLength := StrLen(sText) * 2    

   ;Send the actual string now, excluding the null terminator
	msgbox,%iPeerSocket% %sText% %iTextLength%
    If (i := AHKsock_Send(iPeerSocket, &sText, iTextLength)) {
        OutputDebug, % "AHKsock_ForceSend failed with return value = " i " and error code = " ErrorLevel " at line " A_LineNumber
	}
	msgbox,0,,connect. %sEvent% %iPeerSocket% %sName% %bData% %iLength%,3
return
}


^+!d::
{
msgbox,切断をします。
	AHKsock_Close(iPeerSocket)
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