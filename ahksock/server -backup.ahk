#SingleInstance, FORCE
{

	#include C:\Users\neumanzig\Desktop\ahk\ahksock\ahksock.ahk
;	#include ./ahksock.ahk
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

	msgbox,0,,connect. %sEvent% ,5

	
	if(sEvent="ACCEPTED")
	{

		csSocket := iSocket

			if(svcSocket="")
			{
			msgbox,0,,�ڑ����܂�,5
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
		msgbox,0,,��M���܂���,1
	}


	msgbox,0,, - %sEvent% cs:%svcSocket% svc:%svcSocket% %sName% %bData% %iLength%,1
	

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


;	i := AHKsock_connect(sServer, 27015,"msgwait")

	i := AHKsock_Listen(27015,"msgwait")
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

sendar:
^+!s::

{
	msgbox,0,,send ���M�����܂��B,3
sText ="������ԐM���܂����B"
    VarSetCapacity(iFrame, 4, 0), NumPut((2 << 16) + iTextLength, iFrame, 0, "UInt")
    iTextLength := StrLen(sText) * 2    

   ;Send the actual string now, excluding the null terminator
;	msgbox,%svcSocket% %sText% %iTextLength%
    If (i := AHKsock_Send(svcSocket, &sText, iTextLength)) {
        OutputDebug, % "AHKsock_ForceSend failed with return value = " i " and error code = " ErrorLevel " at line " A_LineNumber
}
	msgbox,0,,connect. %sEvent% %svcSocket% %sName% %bData% %iLength%,3

return

}

fse:
^+!f::

{
msgbox,0,,force send�@���M�����܂��B,3

sText ="force send ������ԐM���܂����B"
    VarSetCapacity(iFrame, 4, 0), NumPut((2 << 16) + iTextLength, iFrame, 0, "UInt")
    iTextLength := StrLen(sText) * 2    

   ;Send the actual string now, excluding the null terminator
;	msgbox,%iPeerSocket% %sText% %iTextLength%
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
msgbox,0,,�I�������܂��B,3
	AHKsock_Close(csSocket)
	AHKsock_Close(svcSocket)

exitapp
}


^+z::
apprun:
{
msgbox,0,,�v���O�������N�����܂�,3
sText =runmp
    VarSetCapacity(iFrame, 4, 0), NumPut((2 << 16) + iTextLength, iFrame, 0, "UInt")
    iTextLength := StrLen(sText) * 2    

   ;Send the actual string now, excluding the null terminator
;	msgbox,%iPeerSocket% %sText% %iTextLength%
    If (i := AHKsock_Send(svcSocket, &sText, iTextLength)) {
        OutputDebug, % "AHKsock_ForceSend failed with return value = " i " and error code = " ErrorLevel " at line " A_LineNumber
	}
	msgbox,0,,connect. %sEvent% %svcSocket% %sName% %bData% %iLength%,3
return
}	

ahk1:
{
msgbox,0,,�v���O�������N�����܂�,3
sText =ahk1
    VarSetCapacity(iFrame, 4, 0), NumPut((2 << 16) + iTextLength, iFrame, 0, "UInt")
    iTextLength := StrLen(sText) * 2    

;	msgbox,%iPeerSocket% %sText% %iTextLength%
    If (i := AHKsock_Send(svcSocket, &sText, iTextLength)) {
        OutputDebug, % "AHKsock_ForceSend failed with return value = " i " and error code = " ErrorLevel " at line " A_LineNumber
	}
	msgbox,0,,connect. %sEvent% %svcSocket% %sName% %bData% %iLength%,3
return


}

;--; �N���b�v�{�[�h�ω���
onclipboardchange:
{
temp:=clipboard

stringleft,tempcheck,temp,6

if(tempcheck="ahkt10")
{
msgbox,0,,10���^�C�}�[���N�����܂�,1
sText =ahkt10
    VarSetCapacity(iFrame, 4, 0), NumPut((2 << 16) + iTextLength, iFrame, 0, "UInt")
    iTextLength := StrLen(sText) * 2    

   ;Send the actual string now, excluding the null terminator
;	msgbox,%iPeerSocket% %sText% %iTextLength%
    If (i := AHKsock_Send(svcSocket, &sText, iTextLength)) {
        OutputDebug, % "AHKsock_ForceSend failed with return value = " i " and error code = " ErrorLevel " at line " A_LineNumber
	}
	msgbox,0,,connect. %sEvent% %svcSocket% %sName% %bData% %iLength%,3
return
}

if(tempcheck="ahkt15")
{
msgbox,0,,15���^�C�}�[���N�����܂�,1
sText =ahkt15
    VarSetCapacity(iFrame, 4, 0), NumPut((2 << 16) + iTextLength, iFrame, 0, "UInt")
    iTextLength := StrLen(sText) * 2    

   ;Send the actual string now, excluding the null terminator
;	msgbox,%iPeerSocket% %sText% %iTextLength%
    If (i := AHKsock_Send(svcSocket, &sText, iTextLength)) {
        OutputDebug, % "AHKsock_ForceSend failed with return value = " i " and error code = " ErrorLevel " at line " A_LineNumber
	}
	msgbox,0,,connect. %sEvent% %svcSocket% %sName% %bData% %iLength%,3
return
}

if(tempcheck="ahkt30")
{
msgbox,0,,30���^�C�}�[���N�����܂�,1
sText =ahkt30
    VarSetCapacity(iFrame, 4, 0), NumPut((2 << 16) + iTextLength, iFrame, 0, "UInt")
    iTextLength := StrLen(sText) * 2    

   ;Send the actual string now, excluding the null terminator
;	msgbox,%iPeerSocket% %sText% %iTextLength%
    If (i := AHKsock_Send(svcSocket, &sText, iTextLength)) {
        OutputDebug, % "AHKsock_ForceSend failed with return value = " i " and error code = " ErrorLevel " at line " A_LineNumber
	}
	msgbox,0,,connect. %sEvent% %svcSocket% %sName% %bData% %iLength%,3
return
}

if(tempcheck="ahkt45")
{
msgbox,0,,45���^�C�}�[���N�����܂�,1
sText =ahkt45
    VarSetCapacity(iFrame, 4, 0), NumPut((2 << 16) + iTextLength, iFrame, 0, "UInt")
    iTextLength := StrLen(sText) * 2    

   ;Send the actual string now, excluding the null terminator
;	msgbox,%iPeerSocket% %sText% %iTextLength%
    If (i := AHKsock_Send(svcSocket, &sText, iTextLength)) {
        OutputDebug, % "AHKsock_ForceSend failed with return value = " i " and error code = " ErrorLevel " at line " A_LineNumber
	}
	msgbox,0,,connect. %sEvent% %svcSocket% %sName% %bData% %iLength%,3
return
}



;msgbox,%tempcheck%
return

}