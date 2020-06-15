[data,fs] = audioread('../data/sf1_cln.wav');
t = [0 : 1/fs : length(data)/fs]; % time in sec
t = t(1:end - 1);
%listen to the sound
sound(data,fs);

%normalize data 
data = data / abs(max(data));

%plot the raw data
%plot(data)

%remove noise and dc component

% %pre-emphasis filter 


%frame and window- function created
[windows,frames,w_FFTS] = framing(data,fs,0.025); %between 20 to 30 ms;

[numOfFrames,sizeOfFrame] =  size(frames);


% %VAD - voiced,unvoiced,silence detection

% %1. ZCR
[ZCR,zcr_wave]= zerocross(frames);

% %2. STE
[ste,ste_wave] = STE(frames);

% %3. Entropy - in built matlab function
% https://www.mathworks.com/help/signal/ref/pentropy.html#d120e105175
% https://www.mathworks.com/help/audio/ref/spectralentropy.html#namevaluepairarguments
% entropy = spectralEntropy(data,fs,'Window',hamming(size(data,1)),'OverlapLength',0);

for i = 1 : numOfFrames
   w = w_FFTS(i,:);
   feature_spectral_entropy(w, 10);
end
% %4. autocorrelation
[stacf,stacf_wave] = STACF(frames); %see no reason for this as it is the same as STE

%5. adaptive Filter

%6. energy normalization


