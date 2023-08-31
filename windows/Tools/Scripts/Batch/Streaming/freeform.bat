@echo off

python C:\Tools\Scripts\Python\Streaming\freeform.py > %TEMP%\Streams\freeform.txt
set /p url=<%TEMP%\Streams\freeform.txt
del %TEMP%\Streams\freeform.txt

if "%url%" == "" (
	echo We couldn't find any playable streams for Freeform.
	exit /b
)

echo Preparing to play Freeform.
streamlink "%url%" best
