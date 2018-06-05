@ECHO off 
SETLOCAL enableextensions disabledelayedexpansion

SET "search=%1"
SET "replace=%2"
SET "textFile=%3"

FOR /f "delims=" %%i in ('TYPE "%textFile%" ^& BREAK ^> "%textFile%"') do (
    SET "line=%%i"
    SETLOCAL enabledelayedexpansion
    SET "line=!line:%search%=%replace%!"
    >> "%textFile%" ECHO(!line!
    ENDLOCAL
)






