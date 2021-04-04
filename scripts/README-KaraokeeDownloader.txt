Install
http://sox.sourceforge.net/  - audio pitch change
Cygwin
youtube-dl : https://yt-dl.org/downloads/2021.03.03/youtube-dl.exe
ffmpeg:  https://github.com/BtbN/FFmpeg-Builds/releases

add all above bin paths to PATH in windows

==Extract audio out of mp4 to mp3
ffmpeg -i sample.mp4 -q:a 0 -map a sample.mp3

open cygwin 
find youtube song link
youtube-dl -F URL

youtube-dl --format "bestvideo+bestaudio[ext=m4a]/bestvideo+bestaudio/best" --merge-output-format mp4 https://www.youtube.com/watch?v=haiX9myJsRU 
youtube-dl --format "bestvideo+bestaudio[ext=m4a]/bestvideo+bestaudio/best" --merge-output-format mp4 https://www.youtube.com/watch?v=p9bo3XXk3xk

O Sanam:
youtube-dl --format "bestvideo+bestaudio[ext=m4a]/bestvideo+bestaudio/best" --merge-output-format mp4  https://www.youtube.com/watch?v=4m6oE9Xgefg

ffmpeg -i file.mp4    (shows all streams , video/audio details)

#Reduce pitch of file.mp4 by 1 semitone and Replace audio now with pitch changed
mp4File="file"; ffmpeg -i $mp4File tmp1.wav; sox tmp1.wav tmp2.wav --norm ; sox tmp2.wav tmp-final.wav pitch -100;ffmpeg -i $mp4File -i tmp-final.wav -c:v copy -map 0:v:0 -map 1:a:0 new.mp4;mv -v $mp4File Orig/"Org-${mp4File}";mv -v new.mp4 $mp4File;rm -v tmp*



Put image as video 
ffmpeg -loop 1 -f image2 -r 2 -i input1.png -i input2.aiff -c:v libx264 -c:a copy -shortest output.mp4


ffmpeg -ss 00:00:10 -i input.mp4 -c copy output.mp4   (can add -to 00:00:30  to stop at 30 sec)

%%(title)s.^%%(ext)s


references:
https://danclowry.com/blog/youtube-dl-windows-install/
https://superuser.com/questions/1137612/ffmpeg-replace-audio-in-video
http://forum.doom9.org/showthread.php?t=165807  (sox compression,etc)
https://unix.stackexchange.com/questions/544365/normalize-the-volume-level-of-an-mp3-file-with-sox-using-maximum-bitrate-for-the

https://catswhocode.com/ffmpeg-commands/