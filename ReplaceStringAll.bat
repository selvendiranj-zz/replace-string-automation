@ECHO off
SETLOCAL enabledelayedexpansion

SET curr_date=%DATE:~4,2%-%DATE:~7,2%-%DATE:~10,4%
SET parmfilefolder=%CD%
SET inpfilefolder=%CD%\Scripts
SET outfilefolder=%CD%\Output\%curr_date%
SET parmfile=%parmfilefolder%\Parameter.csv

IF NOT EXIST %outfilefolder% MKDIR %outfilefolder%
XCOPY /Y %inpfilefolder%\*.sql %outfilefolder%

FOR %%a in (%outfilefolder%\*.*) DO (
	SET OUTPUTFILE=%%a
	FOR /f "skip=1 tokens=1,* delims=," %%b in (%parmfile%) do (
       SET SEARCHTEXT=%%b
       SET REPLACETEXT=%%c
       CALL ReplaceString.bat !SEARCHTEXT! !REPLACETEXT! !OUTPUTFILE!
    )
)
