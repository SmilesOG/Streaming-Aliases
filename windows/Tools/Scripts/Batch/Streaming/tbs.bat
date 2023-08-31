@echo off

python C:\Tools\Scripts\Python\Streaming\tbs.py > %TEMP%\Streams\tbs.txt
set /p url=<%TEMP%\Streams\tbs.txt
del %TEMP%\Streams\tbs.txt

if "%url%" == "" (
	echo We couldn't find any playable streams for TBS.
	exit /b
)

echo Preparing to play TBS.
streamlink "%url%" best
