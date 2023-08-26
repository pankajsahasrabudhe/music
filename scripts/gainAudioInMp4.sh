mp4File="$1"

ffmpeg -i $mp4File tmp1.wav
sox tmp1.wav tmp-final.wav gain -l 6
ffmpeg -i $mp4File -i tmp-final.wav -c:v copy -map 0:v:0 -map 1:a:0 new.mp4
mv -v $mp4File Orig/"Org-${mp4File}"
mv -v new.mp4 $mp4File
rm -v tmp*

