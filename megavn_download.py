import json
import urllib2
import urllib
import os

url = 'http://megavn.net/youtube/ajax.php'

# data for post request
data = urllib.urlencode({
	'Ajax_Download' : 1,
	'curID': 'S66SSfc7SUQ',
	'url': 'https://www.youtube.com/watch?v=S66SSfc7SUQ'
})

# response from server as json string
response = urllib2.urlopen(url=url, data=data).read()

video_response = json.loads(response)

# 720p video url
video_url = video_response['download'][0]['url']

# name of video
name = video_response['info']['title']
print name
command = 'wget -o "' + name + '" "' + video_url + '"'

os.system(command)
