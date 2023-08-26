audioFile="$1"
pitch_shift="$2"

mkdir -pv Orig
#sox $audioFile tmp1.wav --norm 
sox $audioFile tmp1.mp3 --norm 
#sox tmp1.wav tmp-final.wav pitch "$pitch_shift"
sox tmp1.mp3 tmp-final.mp3 pitch "$pitch_shift"
mv -v $audioFile Orig/"Org-${audioFile}"
#mv -v tmp-final.wav $audioFile
mv -v tmp-final.mp3 $audioFile
rm -v tmp*

