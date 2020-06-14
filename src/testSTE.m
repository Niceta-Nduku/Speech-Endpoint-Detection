%This is the test for the Short Time Energy function
%This file creates frames and windows are required 
%The STE function is called and the output is evaluated

[data,fs] = audioread('../data/sf1_cln.wav');

data = data / abs(max(data));

t = [0 : 1/fs : length(data)/fs]; % time in sec
t = t(1:end - 1);

[windows,frames] = framing(data,fs,0.025); %between 20 to 30 ms;

[numOfFrames,sizeOfFrame] =  size(frames);

[ste,ste_wave] = STE(frames);

t1 = [0 : 1/fs : length(ste_wave)/fs];
t1 = t1(1:end - 1);

plot(t,data'); hold on;
plot(t1,ste_wave,'r','LineWidth',2);
legend('Speech Signal','Short Term Energy (Frame Energy)');