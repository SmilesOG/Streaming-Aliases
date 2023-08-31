@echo off

python C:\Tools\Scripts\Python\Streaming\tnt.py > %TEMP%\Streams\tnt.txt
set /p url=<%TEMP%\Streams\tnt.txt
del %TEMP%\Streams\tnt.txt

if "%url%" == "" (
	echo We couldn't find any playable streams for TNT.
	exit /b
)

echo Preparing to play TNT.
streamlink "%url%" best
