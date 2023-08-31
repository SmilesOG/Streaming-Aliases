@echo off

python C:\Tools\Scripts\Python\Streaming\moviemax.py > %TEMP%\Streams\moviemax.txt
set /p url=<%TEMP%\Streams\moviemax.txt
del %TEMP%\Streams\moviemax.txt

if "%url%" == "" (
	echo We couldn't find any playable streams for Movie Max.
	exit /b
)

echo Preparing to play Movie Max.
streamlink "%url%" best
