@echo off

python C:\Tools\Scripts\Python\Streaming\sciencechannel.py > %TEMP%\Streams\sciencechannel.txt
set /p url=<%TEMP%\Streams\sciencechannel.txt
del %TEMP%\Streams\sciencechannel.txt

if "%url%" == "" (
	echo We couldn't find any playable streams for Science Channel.
	exit /b
)

echo Preparing to play Science Channel.
streamlink "%url%" best
