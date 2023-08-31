@echo off

python C:\Tools\Scripts\Python\Streaming\natgeo.py > %TEMP%\Streams\natgeo.txt
set /p url=<%TEMP%\Streams\natgeo.txt
del %TEMP%\Streams\natgeo.txt

if "%url%" == "" (
	echo We couldn't find any playable streams for National Geographic.
	exit /b
)

echo Preparing to play National Geographic.
streamlink "%url%" best
