matching_line=$(curl -s https://www.newslive.com/business/fox-business-network-fbn.html | head -n 1007 | tail -n 1)
video_url=$(echo $matching_line | sed -r 's/^file: "([^"]+?)".+?/\1/')
streamlink $video_url 720p
