@echo off

python C:\Tools\Scripts\Python\Streaming\ndtv.py > %TEMP%\Streams\ndtv.txt
set /p url=<%TEMP%\Streams\ndtv.txt
del %TEMP%\Streams\ndtv.txt

if "%url%" == "" (
	echo We couldn't find any playable streams for NDTV.
	exit /b
)

echo Preparing to play NDTV.
streamlink "%url%" best
