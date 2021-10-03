
{
{
sleep,3000
settitlematchmode,2

temp:=clipboard

FoundPos := RegExMatch(temp, "視聴中")

stringmid,temp2,temp,Foundpos+6,10

FoundPos := RegExMatch(temp2, ":")

stringmid,temp3h,temp2,Foundpos-2,2
stringreplace,temp3h,temp3h,`n,
stringmid,temp3m,temp2,Foundpos+1,2
stringmid,temp3s,temp2,Foundpos+4,2

second := (temp3h*60*60)+(temp3m*60)+temp3s-5

/*
msgbox,%temp2%
msgbox,%temp3h%
msgbox,%temp3m%
msgbox,%temp3s%
msgbox,%second%
*/


FoundPos2 := RegExMatch(temp, "動画再生ページを表示")

stringmid,temp4,temp,Foundpos2+11,70

;FoundPos := RegExMatch(temp2, ":")

;msgbox,%temp4%
StringReplace, temp4, temp4, https://www.youtube.com/watch?v= , https://youtu.be/
stringreplace,temp4,temp4,`n,
stringtrimright,temp4,temp4,2

temp4=msedge.exe %temp4%?t=%second%

clipboard := temp4

send,!{f4}


send,!^s

sleep,700

send,{ctrl 2}

sleep,100

send,1

return
}}