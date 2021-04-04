audioFile="$1"
pitch_shift="$2"

mkdir -pv Orig
sox $audioFile tmp1.wav --norm 
sox tmp1.wav tmp-final.wav pitch "$pitch_shift"
mv -v $audioFile Orig/"Org-${audioFile}"
mv -v tmp-final.wav $audioFile
rm -v tmp*

