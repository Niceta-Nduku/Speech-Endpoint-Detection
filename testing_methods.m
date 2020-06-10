[data,fs] = audioread('sf1_cln.wav');

plot(data)
%normalize data 
data = data / abs(max(data));

%remove noise

%frame and window- function created
[windows,frames] = framing(data,fs,0.025); %between 20 to 30 ms;

%pre-emphasis filter -done

%VAD - voiced,unvoiced,silence detection
[numOfFrames,sizeOfFrame] =  size(frames);
%1. ZCR

%TODO: decide on a threshold statistically;
%2. STE

%3. Entropy - in built matlab function
%https://www.mathworks.com/help/signal/ref/pentropy.html#d120e105175
%https://www.mathworks.com/help/audio/ref/spectralentropy.html#namevaluepairarguments

%4. autocorrelation

%5. adaptive Filter

%6. energy normalization


