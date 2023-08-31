#curl -v -c /tmp/cookies.txt -b /tmp/cookies.txt https://thetvapp.to/tv/cinemax-live-stream/
#csrf_token=$(cat /tmp/cookies.txt | tail -n 1 | sed 's/^.*XSRF-TOKEN\t//')
#curl -X POST -H 'X-CSRF-TOKEN:$csrf_token' https://thetvapp.to/token/cinemax-east/


