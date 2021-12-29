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
copy boot.wim \windows_setup\iso\sources
bootable-component\x64\oscdimg -m -o -u2 -udfver102 -bootdata:2#p0,e,bC:\windows_setup\iso\boot\etfsboot.com#pEF,e,bC:\windows_setup\iso\efi\microsoft\boot\efisys.bin C:\windows_setup\iso C:\windows_setup\pe.iso
exit