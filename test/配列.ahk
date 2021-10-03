fileread,outputvar,C:\Users\neumanzig\Desktop\txt\text.txt

sleep,100


stringtrimright,tempk,outputvar,5
stringsplit,array,tempk,\n

msgbox,%array0% %array1% %array2% %array3%
;msgbox,%outputvar%

return
