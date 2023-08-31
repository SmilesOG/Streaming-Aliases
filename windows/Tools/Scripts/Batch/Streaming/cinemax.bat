@echo off

python C:\Tools\Scripts\Python\Streaming\cinemax.py > %TEMP%\Streams\cinemax.txt
set /p url=<%TEMP%\Streams\cinemax.txt
del %TEMP%\Streams\cinemax.txt

if "%url%" == "" (
	echo We couldn't find any playable streams for Cinemax.
	exit /b
)

echo Preparing to play Cinemax.
streamlink "%url%" best
