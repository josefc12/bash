for i in *.mp4;
    do name=`echo $i | cut -d'.' -f1`;
    echo $name;
    ffmpeg -c:v h264_cuvid -i $i -c:v dnxhd -profile:v dnxhr_hq -pix_fmt yuv422p -c:a pcm_s16le $name.mov;
done
