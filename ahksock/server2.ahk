{
	#include ./ahksock.ahk
	msgbox,0,,start connect,2
;	msgbox,start connect
	
	sServer := "stroketip-7.lan"
	
	AHKsock_Listen(27015,"msgwait")
	
return

}

msgwait(sEvent, iSocket = 0, sName = 0, sAddr = 0, sPort = 0, ByRef bData = 0, iLength = 0)
{
;	global iPeerSocket

;	iPeerSocket := iSocket

	msgbox,0,,connect. %sEvent% ,5
	if(sevent="ACCEPTED")
	{
		global csSocket
		csSocket := iSocket


			msgbox,0,,�ڑ����܂�,2
			sServer := "stroketip-7.lan"
			i := AHKsock_connect(sServer, 27015,"msgwait")
		
	}

	if(sevent="CONNECTED")
	{
		global svcSocket
		svcSocket := iSocket
	}



	msgbox,0,,connect. %sEvent% %iSocket% %sName% %bData% %iLength%,1


	AHKsock_Listen(27015,"msgwait")
	return
}
	
; tukuttemiru



^+!c::
{
	msgbox,�ڑ����܂�
	sServer := "stroketip-7.lan"
	i := AHKsock_connect(sServer, 27015,"msgwait")
;	msgbox,0,,connect. %sEvent% %iSocket% %sName% %bData% %iLength%,3
return
}

^+l::
{
msgbox,listen���J�n���܂��B
	AHKsock_Listen(27015,"msgwait")
;	msgbox,0,,connect. %sEvent% %iSocket% %sName% %bData% %iLength%,3
return
}

^+!s::
{
	msgbox,send ���M�����܂��B
sText ="������ԐM���܂����B"
    VarSetCapacity(iFrame, 4, 0), NumPut((2 << 16) + iTextLength, iFrame, 0, "UInt")
    iTextLength := StrLen(sText) * 2    

   ;Send the actual string now, excluding the null terminator
	msgbox,%svcSocket% %sText% %iTextLength%
    If (i := AHKsock_Send(svcSocket, &sText, iTextLength)) {
        OutputDebug, % "AHKsock_ForceSend failed with return value = " i " and error code = " ErrorLevel " at line " A_LineNumber
}
	msgbox,0,,connect. %sEvent% %iPeerSocket% %sName% %bData% %iLength%,3

return

}

^+!f::
{
msgbox,force send�@���M�����܂��B

sText ="force send ������ԐM���܂����B"
    VarSetCapacity(iFrame, 4, 0), NumPut((2 << 16) + iTextLength, iFrame, 0, "UInt")
    iTextLength := StrLen(sText) * 2    

   ;Send the actual string now, excluding the null terminator
	msgbox,%iPeerSocket% %sText% %iTextLength%
    If (i := AHKsock_Send(svcSocket, &sText, iTextLength)) {
        OutputDebug, % "AHKsock_ForceSend failed with return value = " i " and error code = " ErrorLevel " at line " A_LineNumber
	}
	msgbox,0,,connect. %sEvent% %svcSocket% %sName% %bData% %iLength%,3
return
}


^+!d::
{
msgbox,�ؒf�����܂��B
	AHKsock_Close(csSocket)
	AHKsock_Close(svcSocket)

	
	msgbox,0,,connect. %sEvent% %iPeerSocket% %sName% %bData% %iLength%,3
return
}






streamprocessor(bData, bDataLength)
{


return
}

^b::
{

		msgbox,���M�����܂��B��M�̗p�ӂ����Ă�������
			sText ="������ԐM���܂����B"
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
	msgbox,%iPeersocket%
	inputbox,newsocket
	if(newsocket="")
	{
	return
	}
	iPeersocket := newsocket

return
}

^+v::
{
	msgbox, %sEvent% %iPeerSocket% %sName% %bData% %iLength% , %svcSocket% , %csSocket% 
	return
}
