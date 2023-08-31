@echo off

python C:\Tools\Scripts\Python\Streaming\amc.py > %TEMP%\Streams\amc.txt
set /p url=<%TEMP%\Streams\amc.txt
del %TEMP%\Streams\amc.txt

if "%url%" == "" (
	echo We couldn't find any playable streams for AMC.
	exit /b
)

echo Preparing to play AMC.
streamlink "%url%" best
