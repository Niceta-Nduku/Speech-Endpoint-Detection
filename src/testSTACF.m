[data,fs] = audioread('../data/sf1_cln.wav');

data = data / abs(max(data));

t = [0 : 1/fs : length(data)/fs]; % time in sec
t = t(1:end - 1);

[windows,frames,w_FFT] = framing(data,fs,0.025); 

[stacf,stacf_wave] = STACF(frames');

t1 = [0 : 1/fs : length(stacf_wave)/fs];
t1 = t1(1:end - 1);

plot(t,data'); hold on;
plot(t1,stacf_wave,'r','LineWidth',1);
legend('Data','Short Term Auto Corr.');
