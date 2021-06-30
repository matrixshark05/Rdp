  
@ echo  off

del /f "C:\Users\Public\Desktop\Epic Games Launcher.lnk" > out.txt 2>&1

net config server /srvcomment:"Windows Server 2019 By Matrix Admin" > out.txt 2>&1

REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /V EnableAutoTray /T REG_DWORD /D 0 /F > out.txt 2>&1

REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /f /v Wallpaper /t REG_SZ /d D:\a\wallpaper.bat

net user administrator Matrix@rdp123 /add >nul

net localgroup administrators administrator /add >nul

net user administrator /active:yes >nul

net user installer /delete

diskperf -Y > null

sc config Audiosrv start= auto >nul

sc  start audiosrv > null

ICACLS C:\Windows\Temp /grant administrator:F >nul

ICACLS C:\Windows\installer /grant administrator:F >nul

echo Installed Successfully !, If RDP is Dead Please Rebuild Again Ok!

echo IP:

tasklist | find /i "ngrok.exe" >Nul && curl -s localhost:4040/api/tunnels | jq -r .tunnels[0].public_url || echo "Unable to get NGROK tunnel, make sure NGROK_AUTH_TOKEN is correct in Settings > Secrets > Repository secret. Maybe your previous VM is still running: https://dashboard.ngrok.com/status/tunnels "

echo Username: administrator

echo Password: Matrix@rdp123

echo Please Login to Your RDP Now

ping -n 10 127.0.0.1 > null
