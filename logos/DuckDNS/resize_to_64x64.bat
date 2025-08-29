@echo off
setlocal enabledelayedexpansion

:: List of original icon PNG files
set FILES=duckdns_red.png duckdns_green.png duckdns_yellow.png duckdns_red_dead.png duckdns_white_dead.png

:: Resize each to 64x64 and save as *_64.png
for %%F in (%FILES%) do (
    set "NAME=%%~nF"
    magick "%%F" -resize 64x64 "!NAME!_64.png"
    echo Created !NAME!_x64.png
)

echo Done resizing to 64x64!
pause
