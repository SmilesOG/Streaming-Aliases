@echo off

python C:\Tools\Scripts\Python\Streaming\usanetwork.py > %TEMP%\Streams\usanetwork.txt
set /p url=<%TEMP%\Streams\usanetwork.txt
del %TEMP%\Streams\usanetwork.txt

if "%url%" == "" (
	echo We couldn't find any playable streams for USA Network.
	exit /b
)

echo Preparing to play USA Network.
streamlink "%url%" best
