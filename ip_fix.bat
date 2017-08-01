@echo off 
echo Choose: 
echo Manual IP Config by @ssm123ssm
echo [A] Pillard area 
echo [B] Set DHCP 
echo. 
:choice 
SET /P C=[A,B]? 
for %%? in (A) do if /I "%C%"=="%%?" goto A 
for %%? in (B) do if /I "%C%"=="%%?" goto B 
goto choice 
:A 
@echo off  
set IP_Addr=10.40.155.136
set D_Gate=10.40.155.254
set Sub_Mask=255.255.255.0

echo "Setting Static IP Information" 
netsh interface ip set address "Wi-Fi" static %IP_Addr% %Sub_Mask% %D_Gate% 1 
netsh interface ipv4 set dns "Wi-Fi" static 10.40.2.1
netsh interface ipv4 add dns "Wi-Fi" 10.40.2.2 index=2

echo "Done! Please enable proxy..."
ipconfig /all
pause 
goto end

:B 
@ECHO OFF 
ECHO Resetting IP Address and Subnet Mask For DHCP 
netsh int ip set address name = "Wi-Fi" source = dhcp
netsh interface ip set dns "Wi-Fi" dhcp
echo "Done! Disable proxy manually..."

ECHO Here are the new settings for %computername%: 
ipconfig /all

pause 
goto end 
:end
