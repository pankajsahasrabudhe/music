mp4File="$1"
pitch_shift="$2"

mkdir -pv Orig
ffmpeg -i $mp4File tmp1.wav
sox tmp1.wav tmp2.wav --norm 
sox tmp2.wav tmp-final.wav pitch "$pitch_shift"
ffmpeg -i $mp4File -i tmp-final.wav -c:v copy -map 0:v:0 -map 1:a:0 new.mp4
mv -v $mp4File Orig/"Org-${mp4File}"
mv -v new.mp4 $mp4File
rm -v tmp*

