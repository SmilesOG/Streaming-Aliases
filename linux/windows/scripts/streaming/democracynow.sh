#!/home/linuxbrew/.linuxbrew/bin/python3

video_url=$(/home/linuxbrew/.linuxbrew/bin/python3 ~/scripts/streaming/democracynow.py)
echo "The video URL is $video_url"
video_filename=`basename $video_url`
mkdir -p /tmp/democracynow
wget -O /tmp/democracynow/$video_filename $video_url

function cleanup {
	echo "Removing /tmp/democracynow/$video_filename"
	rm /tmp/democracynow/$video_filename
}

trap cleanup EXIT
mpv /tmp/democracynow/$video_filename
