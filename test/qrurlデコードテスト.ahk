fileread,outputvar,C:\Users\neumanzig\Desktop\txt\qrurl.txt

sleep,100


;stringtrimright,tempk,outputvar,5
;stringsplit,array,tempk,\n

;msgbox,%outputvar%

;%array0% %array1% %array2% %array3%
;msgbox,%outputvar%



clipboard := outputvar
;gosub Store_Clipboard_Copy_Selected_Text


outputvar:=URiDecode(outputvar) ;Decode URL
;Gosub Paste_and_Restore_Stored_Clipboard ;restore clipboard
msgbox,%outputvar%

return




uriDecode(str) {
    Loop
 If RegExMatch(str, "i)(?<=%)[\da-f]{1,2}", hex)
    StringReplace, str, str, `%%hex%, % Chr("0x" . hex), All
    Else Break
 Return, str
}

Paste_and_Restore_Stored_Clipboard:  ;put back original content
SendEvent , ^v
Clipboard:=Store
return

/*
Store_Clipboard_Copy_Selected_Text:
Store:=ClipboardAll  ;Store full version of Clipboard
  clipboard = ; Empty the clipboard
  SendInput, ^c ;changd from Send  11/23
  ClipWait, 1
    If ErrorLevel ;Added errorLevel checking
      {
        MsgBox, No text was sent to clipboard
        Return
      }
return
*/