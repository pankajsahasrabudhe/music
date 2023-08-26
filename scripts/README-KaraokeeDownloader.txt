====
Software needed
====
1. http://sox.sourceforge.net/  - audio pitch change (Audio processing utility)
2. https://cygwin.com/install.html - Cygwin (Linux emulator on windows)
3. https://yt-dl.org/downloads/2021.03.03/youtube-dl.exe - youtube-dl (utility to download youtube vidoes)
4. https://github.com/BtbN/FFmpeg-Builds/releases - ffmpeg (Video proccessing utility)

Once installed, all "bin" paths to PATH environment variable in Windows - this will enable you to execute the commands from any directory

Rename all wavs with spaces to underscores 
--
for file in *.wav;do mv -v -- "$file" "${file// /_}";done


Normalize wav files
 for file in *.wav; do sox "$file" "output/${file}" norm -2.0; done

Use mp3gain for mp3 normalize to 93dB


https://medium.com/@jud.dagnall/dynamic-range-compression-for-audio-with-ffmpeg-and-compand-621fe2b1a892

wav to mp3, set bitrate to 128kbps
---
for i in $(ls -1 *.wav);do fname="$(echo $i|cut -d. -f1)";ffmpeg -i "$i" -acodec mp3 -ab 128k "$fname.mp3"; done


Compression - changes dynamic range of low and high loudness to same
--
ffmpeg -i in.mp3 -filter_complex  "compand=attacks=0:points=-80/-900|-45/-15|-27/-9|0/-7|20/-7:gain=5" out.mp3

normalization - doesnt work as expected. volume low, mp3gain is better
--
ffmpeg -i input.wav -filter:a loudnorm output.wav

Create wave form chart
--
ffmpeg -i in.mp3 -filter_complex ""aformat=channel_layouts=mono,showwavespic=s=1000x200"" -frames:v 1 in.png


===
How to use 
===
SongList.txt
downloader-script.sh  <Songlist.txt> : Uses SongList.txt as input to download vidoes as mp4

extractAudioFromVideoFile.sh <input Video file> <Output audio file>
gainAudioInMp4.sh <mp4 file>
pitchChangeAudio.sh <audio file> <pitch shift, e.g. if reduce by 1 semitone then -100>
pitchChangemp4.sh <mp4 file> <pitch shift, e.g. if reduce by 1 semitone then -100>


====
Examples
====
==Speed up video by 
ffmpeg.exe -i Video.mp4 -filter_complex "[0:v]setpts=PTS/1.05[v];[0:a]atempo=1.05[a]" -map "[v]" -map "[a]" output.mp4

==Extract audio out of mp4 to mp3
ffmpeg -i sample.mp4 -q:a 0 -map a sample.mp3

open cygwin 
find youtube song link
youtube-dl -F URL

ffmpeg -i file.mp4    (shows all streams , video/audio details)

#Reduce pitch of file.mp4 by 1 semitone and Replace audio now with pitch changed
mp4File="file"; ffmpeg -i $mp4File tmp1.wav; sox tmp1.wav tmp2.wav --norm ; sox tmp2.wav tmp-final.wav pitch -100;ffmpeg -i $mp4File -i tmp-final.wav -c:v copy -map 0:v:0 -map 1:a:0 new.mp4;mv -v $mp4File Orig/"Org-${mp4File}";mv -v new.mp4 $mp4File;rm -v tmp*

==Put image as video 
ffmpeg -loop 1 -f image2 -r 2 -i input1.png -i input2.aiff -c:v libx264 -c:a copy -shortest output.mp4
==Extract part of video
ffmpeg -ss 00:00:10 -i input.mp4 -c copy output.mp4   (can add -to 00:00:30  to stop at 30 sec)


references:
https://danclowry.com/blog/youtube-dl-windows-install/
https://superuser.com/questions/1137612/ffmpeg-replace-audio-in-video
http://forum.doom9.org/showthread.php?t=165807  (sox compression,etc)
https://unix.stackexchange.com/questions/544365/normalize-the-volume-level-of-an-mp3-file-with-sox-using-maximum-bitrate-for-the

https://catswhocode.com/ffmpeg-commands/


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
