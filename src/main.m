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

%frame and window- function created
[windows,frames] = framing(data,fs,0.025); %between 20 to 30 ms;

[numOfFrames,sizeOfFrame] =  size(frames);
% %pre-emphasis filter 

% %VAD - voiced,unvoiced,silence detection

% %1. ZCR
[ZCR,zcr_wave]= zerocross(frames);

% %TODO: decide on a threshold statistically;
% %2. STE
[ste,ste_wave] = STE(frames);

% %3. Entropy - in built matlab function
% https://www.mathworks.com/help/signal/ref/pentropy.html#d120e105175
% https://www.mathworks.com/help/audio/ref/spectralentropy.html#namevaluepairarguments
% 
% %4. autocorrelation

%5. adaptive Filter

%6. energy normalization


