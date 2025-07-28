@echo off
setlocal enabledelayedexpansion
:loop
rem Güncel tarih ve saat al
for /f "tokens=1-3 delims=/- " %%a in ("%date%") do (
    set gun=%%a
    set ay=%%b
    set yil=%%c
)
for /f "tokens=1-3 delims=:." %%i in ("%time%") do (
    set saat=%%i
    set dakika=%%j
    set saniye=%%k
)
rem Ping at ve sonucu filtrele
for /f "tokens=*" %%r in ('ping bhs.ppbx.pro -n 1 ^| findstr /i "Reply from"') do (
    echo !gun!-!ay!-!yil! !saat!:!dakika!:!saniye! %%r >> C:\ping_log.txt
)
timeout /t 10 > nul
goto loop