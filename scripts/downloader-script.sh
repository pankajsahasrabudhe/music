#Arg is file listing in this format "song name <space> youtubelink"
while read i;do 
	song_name=$(echo $i|awk '{print $1}')
	link=$(echo $i|awk '{print $2}')
	echo "Downloading Song: $song_name Link: $link"
	yt-dlp -o "$song_name.%(ext)s" --no-mtime --format "bestvideo+bestaudio[ext=m4a]/bestvideo+bestaudio/best" --merge-output-format mp4 $link
	#youtube-dl --format "bestvideo+bestaudio[ext=m4a]/bestvideo+bestaudio/best" --merge-output-format mp4 $link
done< <(grep http $1)
