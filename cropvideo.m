vid = VideoReader('C:\Users\KHAN\Desktop\Anamorphosis - Google Chrome 18-06-2017 16_38_08.mp4');


% Not down the Y's and X's of the cropped version of your video
Y = 172:642;
X = 7:930;

v = VideoWriter('cropped.avi');
open(v)

while hasFrame(vid)
    video = readFrame(vid);
    videoCropped = video(Y, X, :);
    writeVideo(v,videoCropped)
end

close(v)
