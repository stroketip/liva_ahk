{
	#include ./ahksock.ahk
	msgbox,0,,start connect,2
	
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

;	msgbox,0,,connect. %sEvent% ,5

	
	if(sEvent="ACCEPTED")
	{

		csSocket := iSocket

			if(svcSocket="")
			{
;			msgbox,0,,�ڑ����܂�,5
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
;		msgbox,0,,��M���܂���,1
	}


	msgbox,0,, - %sEvent% cs:%svcSocket% svc:%svcSocket% %sName% %bData% %iLength%,1


;	i := AHKsock_connect(sServer, 27015,"msgwait")

	i := AHKsock_Listen(27015,"msgwait")
	return
}
	
; tukuttemiru



^+!c::
{
;	msgbox,�ڑ����܂�
	sServer := "stroketip-7.lan"
	i := AHKsock_connect(sServer, 27015,"msgwait")
;	msgbox,0,,connect. %sEvent% %iSocket% %sName% %bData% %iLength%,3
return
}

^+l::
{
;msgbox,listen���J�n���܂��B
	AHKsock_Listen(27015,"msgwait")
;	msgbox,0,,connect. %sEvent% %iSocket% %sName% %bData% %iLength%,3
return
}

^+!s::
{
;	msgbox,send ���M�����܂��B
sText ="������ԐM���܂����B"
    VarSetCapacity(iFrame, 4, 0), NumPut((2 << 16) + iTextLength, iFrame, 0, "UInt")
    iTextLength := StrLen(sText) * 2    

   ;Send the actual string now, excluding the null terminator
;	msgbox,%svcSocket% %sText% %iTextLength%
    If (i := AHKsock_Send(svcSocket, &sText, iTextLength)) {
        OutputDebug, % "AHKsock_ForceSend failed with return value = " i " and error code = " ErrorLevel " at line " A_LineNumber
}
;	msgbox,0,,connect. %sEvent% %svcSocket% %sName% %bData% %iLength%,3

return

}

^+!f::
{
;msgbox,force send�@���M�����܂��B

sText ="force send ������ԐM���܂����B"
    VarSetCapacity(iFrame, 4, 0), NumPut((2 << 16) + iTextLength, iFrame, 0, "UInt")
    iTextLength := StrLen(sText) * 2    

   ;Send the actual string now, excluding the null terminator
;	msgbox,%iPeerSocket% %sText% %iTextLength%
    If (i := AHKsock_Send(svcSocket, &sText, iTextLength)) {
        OutputDebug, % "AHKsock_ForceSend failed with return value = " i " and error code = " ErrorLevel " at line " A_LineNumber
	}
;	msgbox,0,,connect. %sEvent% %svcSocket% %sName% %bData% %iLength%,3
return
}


^+!d::
{
;msgbox,�ؒf�����܂��B
	AHKsock_Close(csSocket)
	AHKsock_Close(svcSocket)

	
;	msgbox,0,,connect. %sEvent% %iPeerSocket% %sName% %bData% %iLength%,3
return
}






streamprocessor(bData, bDataLength)
{


return
}

^b::
{

;		msgbox,���M�����܂��B��M�̗p�ӂ����Ă�������
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
;	msgbox,csSocket:%csSocket% - svcSocket:%svcSocket%
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
;	msgbox, %sEvent% svc: %svcSocket% , cs: %csSocket%  %sName% %bData% %iLength% ,svc: %svcSocket% , cs: %csSocket% 
	return
}
