import datetime
import json
import logging
import os
from selenium import webdriver
from selenium.webdriver.chrome.options import Options
import tempfile
from time import mktime, sleep

ms = datetime.datetime.now()
current_timestamp = int(str(mktime(ms.timetuple()) * 1000).rsplit(".", 1)[0])
sleep(10)

logger = logging.getLogger("cbc_" + str(current_timestamp))
logger.setLevel(logging.DEBUG)
# create file handler which logs even debug messages
temp_dir = tempfile.gettempdir()
log_filename = temp_dir + "/Streams/cbc.log"

try:
    os.mkdir(os.path.dirname(log_filename))
except FileExistsError:
    pass

open(log_filename, "a").close()
fh = logging.FileHandler(log_filename, mode="w")
fh.setLevel(logging.DEBUG)
logger.addHandler(fh)

options = Options()
#options.add_argument("--headless")
options.add_argument("--no-sandbox")
options.set_capability("goog:loggingPrefs", {"performance": "ALL"})

driver = webdriver.Chrome(options=options)
driver.get("https://player.teleon.tv/en/channel/cbc-news-ca")
driver.implicitly_wait(10)
logs = driver.get_log("performance")
response = ""
m3u8_url = ""

for idx, log in enumerate(logs):
    message = log["message"]
    logger.debug(message)

    if "m3u8" in message and '''log["timestamp"] >= current_timestamp:''':
        logger.debug("The usable response: {}".format(message))
        response = message
        break

if len(response) > 0:
    json_response = json.loads(response) 
    m3u8_url = json_response["message"]["params"]["request"]["url"]

print(m3u8_url)
driver.quit()
