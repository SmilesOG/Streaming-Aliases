from bs4 import BeautifulSoup
import json
from urllib.request import urlopen

url = "https://www.democracynow.org/"
response = urlopen(url)
html = response.read().decode("UTF-8")
soup = BeautifulSoup(html, features="html.parser")
media_player_elem = soup.find(id="show_video")
template_script = media_player_elem.find("script")
script_text = template_script.get_text()
json_response = json.loads(script_text)
high_res_video_url = json_response["high_res_video"]
print(high_res_video_url)
