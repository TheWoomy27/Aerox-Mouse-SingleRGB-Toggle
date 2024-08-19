@echo off

taskkill /IM SteelSeriesGG.exe /F
taskkill /IM SteelSeriesGGClient.exe /F
taskkill /IM SteelSeriesEngine.exe /F

REM Path to the source and destination folders
set "sourceFolder=C:\Program Files\SteelSeries\GG\apps\engine\deviceSpecifications"
set "destinationFolder=C:\Users\Austin\Documents\Aerox 5 Files"

REM List of specific files or extensions to toggle
set "fileList=aerox_5.edevice aerox_5_wireless_bluetooth.edevice aerox_5_wireless_destiny_2_bluetooth.edevice aerox_5_wireless_destiny_2_dongle.edevice aerox_5_wireless_destiny_2_mouse.edevice aerox_5_wireless_destiny_2_shared.edevice aerox_5_wireless_diablo_4_bluetooth.edevice aerox_5_wireless_diablo_4_dongle.edevice aerox_5_wireless_diablo_4_mouse.edevice aerox_5_wireless_diablo_4_shared.edevice aerox_5_wireless_dongle.edevice aerox_5_wireless_mouse.edevice"

REM Check if the first file exists in the source folder
set "movedFiles=0"
for %%f in (%fileList%) do (
    if exist "%sourceFolder%\%%f" (
        echo Moving files from "%sourceFolder%" to "%destinationFolder%"
        move "%sourceFolder%\%%f" "%destinationFolder%"
        set /a movedFiles+=1
    )
)

REM If no files were moved from the source folder, try moving them back from the destination folder
if "%movedFiles%"=="0" (
    for %%f in (%fileList%) do (
        if exist "%destinationFolder%\%%f" (
            echo Moving files from "%destinationFolder%" to "%sourceFolder%"
            move "%destinationFolder%\%%f" "%sourceFolder%"
        )
    )
)

echo Opening SteelSeries GG...
start "" "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\SteelSeries\SteelSeries GG\SteelSeries GG.lnk"

echo Opening devices page...
start "" "signalrgb://view/showdevice?uid=1038:1852:5-27EC4662-0-1"

echo Toggle complete.
pause
