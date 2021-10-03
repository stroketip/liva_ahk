#singleinstance ignore
{

timestring:=a_hour



;‚±‚±‚Åif

if( timestring >=14)
{
timebb := a_hour*3600+a_min*60+a_sec
timekijun := 14*3600+7*60+37+5

timesa := timebb - timekijun	
sleep,700	
	clipboard =%clipboard%?t=%timesa%

send,!{f4}
sleep,2000
send,!^s

sleep,700
send,^w
sleep,300
send,{home}
sleep,300
send,msedge.exe
send,{space}
sleep,100
send,^w
sleep,500
send,{ctrl 2}

sleep,100

send,1



return
sleep,2000
send,!^s

sleep,700

sleep,500
send,{ctrl 2}

sleep,100

send,1
return
}
else if( timestring <=2){
timebb := (a_hour+24)*3600+a_min*60+a_sec
timekijun := 14*3600+7*60+37+5
timesa := timebb - timekijun	
sleep,700
	clipboard =%clipboard%?t=%timesa%

send,!{f4}
sleep,2000
send,!^s

sleep,700
send,^w
sleep,300
send,{home}
sleep,300
send,msedge.exe
send,{space}
sleep,100
send,^w
sleep,500
send,{ctrl 2}

sleep,100

send,1



return
}
else if( timestring >=5)and(timestring <= 13)
{
timebb := a_hour*3600+a_min*60+a_sec
timekijun := 5*3600+1*60+37+5+35+316 ;2021/1/31’²‚×

timesa := timebb - timekijun	
sleep,7000	
	clipboard =%clipboard%?t=%timesa%


send,!{f4}
sleep,2000
send,!^s

sleep,700
send,^w
sleep,300
send,{home}
sleep,300
send,msedge.exe
send,{space}
sleep,100
send,^w
sleep,500
send,{ctrl 2}

sleep,100

send,1


	return
}

else
{
	clipboard = no match
send,!^s

sleep,700

sleep,500
send,{ctrl 2}

sleep,100

send,1
return
	return
}
	
return
}