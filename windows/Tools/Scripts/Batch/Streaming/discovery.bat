@echo off

python C:\Tools\Scripts\Python\Streaming\discovery.py > %TEMP%\Streams\discovery.txt
set /p url=<%TEMP%\Streams\discovery.txt
del %TEMP%\Streams\discovery.txt

if "%url%" == "" (
	echo We couldn't find any playable streams for Discovery.
	exit /b
)

echo Preparing to play Discovery.
streamlink "%url%" best
