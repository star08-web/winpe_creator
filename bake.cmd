echo off
title baking os image
color 3
echo osbake v 3.00
echo script created by: star
@setlocal enableextensions
@cd /d "%~dp0"
timeout 3 >nul
cd iso
cd sources
copy boot.wim %~dp0\
cd..
cd..
imagex\imagex.exe /info %~dp0\boot.wim "1" /boot
mkdir wim
dism /mount-wim /wimfile:boot.WIM /index:1 /mountdir:wim
dism /image:wim /set-targetpath:X:\
dism /unmount-wim /mountdir:wim /commit
powershell Remove-WindowsImage -ImagePath "boot.wim" -Index 2 -CheckIntegrity
dism /mount-wim /wimfile:boot.WIM /index:1 /mountdir:wim
dism /image:wim /set-targetpath:X:\
dism /unmount-wim /mountdir:wim /commit
echo adding apps
dism /mount-wim /wimfile:boot.WIM /index:1 /mountdir:wim
cd wim 
mkdir appfolder
cd appfolder
mkdir shell
mkdir browser
mkdir gimagex
cd..
cd..
cd appcomponent 
xcopy browser \windows_setup\wim\appfolder\browser /S /q
xcopy gimagex \windows_setup\wim\appfolder\gimagex /S /q
xcopy shell \windows_setup\wim\appfolder\shell /S /q
cd /d "%~dp0"
cd wim\windows\system32
takeown /f startnet.cmd && icacls startnet.cmd /grant administrators:F
ren startnet.cmd startnet.backup
cd /d "%~dp0"
copy appcomponent\startnet.cmd wim\windows\system32 
dism /unmount-wim /mountdir:wim /commit
echo creating iso
title creating iso
cd iso 
del setup.exe
cd sources
del *.wim
del *.esd
cd..
cd..
@cd /d "%~dp0"
copy boot.wim %~dp0\iso\sources
bootable-component\x64\oscdimg -m -o -u2 -udfver102 -bootdata:2#p0,e,b%~dp0\iso\boot\etfsboot.com#pEF,e,b%~dp0\iso\efi\microsoft\boot\efisys.bin %~dp0\iso %~dp0\pe.iso
title cleaning up
echo starting clean process
del boot.wim /f /q
rd wim /q
rd iso /s /q
mkdir iso
exit