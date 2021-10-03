fileread,outputvar,C:\Users\neumanzig\Desktop\txt\urldata.txt

stringpos := regexmatch(outputvar,"email")
stringpos += 7
stringtrimleft,outputvar,outputvar,stringpos
stringtrimright,outputvar,outputvar,4
msgbox,%outputvar%


return
