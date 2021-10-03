fileread,ahktemp,*P932 C:\Users\neumanzig\Desktop\txt\getdata.txt

stringtrimright,tempk,ahktemp,1
stringsplit,array,tempk,`n
;msgbox,%tempk%
/*
msgbox,%array0% 
msgbox,%array1%
msgbox,%array2%
msgbox,%array3%
*/

; あとで、ファイル名に使えない文字があったらリプレースするのをいれる

updd=

;	msgbox,%array0%

loop,%array0%
{
	stab:=a_index+1
	stra := array%stab%
	updd=%updd%%stra%`n


}
;msgbox,%updd%
fileappend,%updd%,C:\Users\neumanzig\Desktop\ahk\liva_http_ahk\ahk_title\%array1%.txt



;msgbox,%outputvar%

;msgbox,%A_FileEncoding% %ahktemp%


return
