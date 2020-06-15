[data,fs] = audioread('../data/sf1_cln.wav');

data = data / abs(max(data));

t = [0 : 1/fs : length(data)/fs]; % time in sec
t = t(1:end - 1);

[windows,frames,w_FFTS] = framing(data,fs,0.01); %between 20 to 30 ms;

[numOfFrames,sizeOfFrame] =  size(frames);

entropy = zeros (numOfFrames);

for i = 1 : numOfFrames
   entropy(i) = feature_spectral_entropy(w_FFTS(i,:), 10);
end
    entropy = entropy./max(entropy);
    
    entropy_wave = 0;    
    for j = 1 : length(entropy)
        l = length(entropy_wave);
        entropy_wave(l : l + sizeOfFrame) = entropy(j);
    end

t1 = [0 : 1/fs : length(entropy_wave)/fs];
t1 = t1(1:end - 1);

plot(t,data'); hold on;
plot(t1,entropy_wave,'r');
legend('Speech Signal','Short Term Auto Corr.');