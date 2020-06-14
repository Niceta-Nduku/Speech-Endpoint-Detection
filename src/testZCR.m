[data,fs] = audioread('../data/sf1_cln.wav');

data = data / abs(max(data));

t = [0 : 1/fs : length(data)/fs]; % time in sec
t = t(1:end - 1);

[windows,frames] = framing(data,fs,0.025); %between 20 to 30 ms;

[numOfFrames,sizeOfFrame] =  size(frames);

[ZCR,zcr_wave]= zerocross(frames);

% plot the ZCR with Signal
t1 = [0 : 1/fs : length(zcr_wave)/fs];
t1 = t1(1:end - 1);

plot(t,data'); hold on;
plot(t1,zcr_wave,'r','LineWidth',2);