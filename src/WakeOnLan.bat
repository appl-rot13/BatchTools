@echo off

set IP_ADDRESS=192.168.64.15
set MAC_ADDRESS=c8:60:00:dd:ea:b9

if "%IP_ADDRESS%"=="" (
	set PARSE_CODE=Broadcast
) else (
	set PARSE_CODE=Parse^("""%IP_ADDRESS%"""^)
)

powershell "$mac=[byte[]]("""%MAC_ADDRESS%""".split(""":""") | ForEach-Object{[Convert]::ToInt32($_, 16)}); $message=[byte[]](@(0xff) * 6) + $mac * 16; $udpClient=new-object System.Net.Sockets.UdpClient; $udpClient.Connect([System.Net.IPAddress]::%PARSE_CODE%, 3708); $udpClient.Send($message, $message.Length) | out-null; $udpClient.Close();"
