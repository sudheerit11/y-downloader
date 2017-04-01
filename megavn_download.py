#!/usr/bin/python
import json
import urllib2
import urllib
import os

url = 'http://megavn.net/youtube/ajax.php'

video_url = raw_input('input url of video to download\n') # 'https://www.youtube.com/watch?v=S66SSfc7SUQ'

curl_id = video_url.split('=')[1]

# data for post request
data = urllib.urlencode({
	'Ajax_Download' : 1,
	'curID': curl_id,
	'url': video_url
})

# response from server as json string
response = urllib2.urlopen(url=url, data=data).read()

video_response = json.loads(response)

# 720p video url
video_url = video_response['download'][0]['url']

# name of video
name = video_response['info']['title']
print name
command = 'wget -O "' + name + '" "' + video_url + '"'

os.system(command)
