x=`curl -X POST -H "Content-Type: application/x-www-form-urlencoded" -H "Host: megavn.net" -H "Origin: http://megavn.com" -H "Cache-Control: no-cache"  -d 'Ajax_Download=1&curID=Y9S5EV_Aidg&url=https://www.youtube.com/watch?v53DY9S5EV_Aidg' "http://megavn.net/youtube/ajax.php"`

title=$(echo $x | awk -F'\"title\": ' '{print $2}'   | awk -F',' '{print $1}')
url=$(echo $x |awk -F'\"url\": ' '{print $2}' | awk -F',' '{print $1}')
furl=$(echo $x | awk -F'\"url\": ' '{print $2}' | awk -F',' '{print $1}' | awk 'BEGIN{FS=OFS="/"}{gsub(/\\/,"",$0);print}'| awk 'BEGIN{FS=OFS="/"}{gsub(/\"/,"",$0);print}')
#echo $furl
second=`curl  $furl`
durl=$(echo $second | awk -F'HREF=' '{print $2}' | awk -F'>' '{print $1}' |  awk 'BEGIN{FS=OFS="/"}{gsub(/\&amp;/,"\\&",$0);print}' | awk -F"\"" '{print $2}')
echo $durl
dn=$(wget  -A.mp4 -O ./temp.mp4 $durl)
mv temp.mp4 "$title.mp4"
echo "Done"
