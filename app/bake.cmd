@echo off
echo osbake v 4.00
echo script created by: star
@setlocal enableextensions
@cd /d "%~dp0"
timeout 3 >nul
cd iso
cd sources
copy boot.wim %~dp0\
cd..
cd..
echo creating base system
echo running task: winpe_create
echo task 1/4
timeout 1 >nul 
imagex\imagex.exe /info %~dp0\boot.wim "1" /boot >nul
mkdir wim
echo mounting and customizing images, can take some time.
timeout 1 >nul
dism /mount-wim /wimfile:boot.WIM /index:1 /mountdir:wim >nul
dism /image:wim /set-targetpath:X:\ >nul
dism /unmount-wim /mountdir:wim /commit >nul
powershell Remove-WindowsImage -ImagePath "boot.wim" -Index 2 -CheckIntegrity
dism /mount-wim /wimfile:boot.WIM /index:1 /mountdir:wim >nul
dism /image:wim /set-targetpath:X:\ >nul
dism /unmount-wim /mountdir:wim /commit >nul
echo adding apps
echo running task: winpe_add_extras
echo task 2/4
timeout 1 >nul
dism /mount-wim /wimfile:boot.WIM /index:1 /mountdir:wim >nul
cd wim 
mkdir appfolder
cd appfolder
mkdir browser
mkdir gimagex
mkdir shell
cd..
cd..
cd appcomponent 
xcopy browser \windows_setup\app\wim\appfolder\browser /S /q
xcopy gimagex \windows_setup\app\wim\appfolder\gimagex /S /q
xcopy shell \windows_setup\app\wim\appfolder\shell /S /q
xcopy explorer++.exe \windows_setup\app\wim\windows /S /q
xcopy choice.exe \windows_setup\app\wim\windows\system32 /S /q
xcopy timeout.exe \windows_setup\app\wim\windows\system32 /S /q
cd /d "%~dp0"
cd wim\windows\system32
takeown /f startnet.cmd && icacls startnet.cmd /grant administrators:F
ren startnet.cmd startnet.backup
cd /d "%~dp0"
copy appcomponent\startnet.cmd wim\windows\system32 >nul
dism /unmount-wim /mountdir:wim /commit >nul
echo creating iso
echo running task: winpe_build
echo task 3/4
title creating iso
timeout 1 >nul
cd iso 
del setup.exe
cd sources
del *.wim >nul
del *.esd >nul
cd..
cd..
@cd /d "%~dp0"
copy boot.wim %~dp0\iso\sources
bootable-component\x64\oscdimg -m -o -u2 -udfver102 -bootdata:2#p0,e,b%~dp0\iso\boot\etfsboot.com#pEF,e,b%~dp0\iso\efi\microsoft\boot\efisys.bin %~dp0\iso %~dp0\pe.iso >nul
title cleaning up
echo starting clean process
echo running task: osbake_clean
echo task 4/4
timeout 1 >nul
del boot.wim /f /q
rd wim /q
rd iso /s /q
mkdir iso
echo Done! your image is here %~dp0\pe.iso
exit