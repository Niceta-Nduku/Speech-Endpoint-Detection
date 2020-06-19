[data,fs] = audioread('../data/sf1_cln.wav');

data = data / abs(max(data));

t = [0 : 1/fs : length(data)/fs]; % time in sec
t = t(1:end - 1);

[windows,frames,w_FFTS] = framing(data,fs,0.025); %between 20 to 30 ms;

[numOfFrames,sizeOfFrame] =  size(frames);

[entropy, entropy_wave] = getEntropy(w_FFTS');

plot(t,data'); hold on;
plot(t1,entropy_wave,'k','LineWidth',1);
legend('Short Term Spectral Entropy');

yline(0.4,'LineWidth',2)