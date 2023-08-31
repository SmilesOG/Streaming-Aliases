@echo off

python C:\Tools\Scripts\Python\Streaming\tcm.py > %TEMP%\Streams\tcm.txt
set /p url=<%TEMP%\Streams\tcm.txt
del %TEMP%\Streams\tcm.txt

if "%url%" == "" (
	echo We couldn't find any playable streams for TCM.
	exit /b
)

echo Preparing to play TCM.
streamlink "%url%" best
