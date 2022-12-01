@echo off

if exist CRCLIST.TXT del CRCLIST.TXT

cd MASTERCODES
for %%a in (*.cht) do (

	for /f "delims=" %%b in ('type %%a ^| findstr "CRC" ^| busybox grep -Eo "[a-fA-F0-9]{8}"') do echo %%~na;%%b >> ..\CRCLIST.TXT
)
echo completed CRC list. looking for matching CRC on PNACH...
timeout 5
for /f "delims=; tokens=1,2*" %%a in (CRCLIST.TXT) do if exist ..\pnach-DB\PNACH\%%b.pnach echo %%b.pnach;%a
pause
pause
