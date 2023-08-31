@echo off

python C:\Tools\Scripts\Python\Streaming\history.py > %TEMP%\Streams\history.txt
set /p url=<%TEMP%\Streams\history.txt
del %TEMP%\Streams\history.txt

if "%url%" == "" (
	echo We couldn't find any playable streams for TBS.
	exit /b
)

echo Preparing to play TBS.
streamlink "%url%" best
