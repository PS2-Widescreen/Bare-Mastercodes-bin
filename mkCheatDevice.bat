@echo off
md CHEATDEVICE
for %%a in (MASTERCODES/*.cht) do (
echo %%a
copy MASTERCODES\%%a CHEATDEVICE\%%~na.TXT
)