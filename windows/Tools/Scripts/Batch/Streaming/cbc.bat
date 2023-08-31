@echo off

python C:\Tools\Scripts\Python\Streaming\cbc.py > %TEMP%\Streams\cbc.txt
set /p url=<%TEMP%\Streams\cbc.txt
del %TEMP%\Streams\cbc.txt

if "%url%" == "" (
	echo We couldn't find any playable streams for CBC.
	exit /b
)

echo Preparing to play CBC.
streamlink "%url%" %1
