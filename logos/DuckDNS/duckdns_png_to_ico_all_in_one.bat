@echo off
setlocal enabledelayedexpansion

:: Target sizes
set SIZES=256 128 96 64 48 32 16

:: List of icon variants
set FILES=duckdns_red.png duckdns_green.png duckdns_yellow.png duckdns_red_dead.png duckdns_white_dead.png

:: Temporary folder for resized icons
set TMPDIR=__ico_temp__
mkdir %TMPDIR%

:: Counter
set /a COUNT=0

:: Resize all files into multiple sizes
for %%F in (%FILES%) do (
    for %%S in (%SIZES%) do (
        set /a COUNT+=1
        set "OUTFILE=%TMPDIR%\icon_!COUNT!.png"
        magick "%%F" -resize %%Sx%%S "!OUTFILE!"
    )
)

:: Combine all resized PNGs into a single .ico file
echo Creating duckdns.ico ...
magick %TMPDIR%\*.png -compress Zip duckdns.ico

:: Cleanup
rd /s /q %TMPDIR%

echo All-in-one icon generated as duckdns.ico
pause
