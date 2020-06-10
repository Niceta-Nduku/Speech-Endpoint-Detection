% Read in the sound data
[data,r] = audioread('sf1_cln.wav');
% r is the sampling rate
% d is the data
size(d);
% i.e. 110250 samples = 5 seconds * 22050 samples/sec
% Listen to it
soundsc(d,r);
% Look at the spectrogram (spectrum as a function of time)
specgram(d,1024,r);
% Design a quick high-pass filter at 1000 Hz (relative to nyquist rate r/2)
[b,a] = ellip(8,1,50,1000/(r/2),'high');
% Pass it through the filter
df = filter(b,a,d);
% See how the spectrogram is changed
specgram(df,1024,r);
%stft(df);
% Most of the energy below 1000 Hz has been removed
% Take a listen
soundsc(df,r);