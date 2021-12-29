echo off
title baking os image
echo osbake v 1.00
echo script created by: star
@setlocal enableextensions
@cd /d "%~dp0"
timeout 3 >nul
mkdir wim
dism /mount-wim /wimfile:boot.WIM /index:1 /mountdir:wim
dism /image:wim /set-targetpath:X:\
dism /unmount-wim /mountdir:wim /commit
powershell Remove-WindowsImage -ImagePath "boot.wim" -Index 2 -CheckIntegrity
dism /mount-wim /wimfile:boot.WIM /index:1 /mountdir:wim
dism /image:wim /set-targetpath:X:\
dism /unmount-wim /mountdir:wim /commit
rem echo creating iso
rem title creating iso
rem cd iso rem 
rem del setup.exe
rem cd sources
rem del *.wim
rem del *.esd
rem cd..
rem cd..
rem @cd /d "%~dp0"
rem copy boot.wim \windows_setup\iso\sources
rem bootable-component\x64\oscdimg.exe -n -d -m C:\windows_setup\iso C:\windows_setup\pe.iso
exit