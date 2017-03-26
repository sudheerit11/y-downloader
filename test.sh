x=`curl -X POST -H "Content-Type: application/x-www-form-urlencoded" -H "Host: megavn.net" -H "Origin: http://megavn.com" -H "Cache-Control: no-cache"  -d 'Ajax_Download=1&curID=eiGdsH1g20k&url=https://www.youtube.com/watch?v%3DeiGdsH1g20k' "http://megavn.net/youtube/ajax.php"`

title=$(echo $x | awk -F'\"title\": ' '{print $2}'   | awk -F',' '{print $1}')
url=$(echo $x |awk -F'\"url\": ' '{print $2}' | awk -F',' '{print $1}')
echo $url
echo "FROM HERE DOWNLOADS"
#wget $url
