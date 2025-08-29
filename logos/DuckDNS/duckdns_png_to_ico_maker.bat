@echo off
setlocal enabledelayedexpansion

:: List of base filenames (without extension)
set ICONS=red green yellow red_dead white_dead

:: Resize to standard icon sizes for each file
for %%I in (%ICONS%) do (
    echo Creating duckdns_%%I.ico ...
    magick duckdns_%%I.png -define icon:auto-resize=256,128,96,64,48,32,16 -compress Zip duckdns_%%I.ico
)

echo Done!
pause
