@echo off

python C:\Tools\Scripts\Python\Streaming\hboeast.py > %TEMP%\Streams\hboeast.txt
set /p url=<%TEMP%\Streams\hboeast.txt
del %TEMP%\Streams\hboeast.txt

if "%url%" == "" (
	echo We couldn't find any playable streams for HBO East.
	exit /b
)

echo Preparing to play HBO East.
streamlink "%url%" best
