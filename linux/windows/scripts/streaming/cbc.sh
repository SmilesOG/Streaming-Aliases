#!/home/linuxbrew/.linuxbrew/bin/python3

video_url=$(/home/linuxbrew/.linuxbrew/bin/python3 ~/scripts/streaming/cbc.py)
echo "The video URL is $video_url"
streamlink $video_url
