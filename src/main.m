% This is the main program that calls the feature functions,
% does the threshold
% smoothing with a median filter
% and 
%**********************************************************************
%read in audio
[data,fs] = audioread('../data/sf1_cln.wav');

t = [0 : 1/fs : length(data)/fs]; % time in sec
t = t(1:end - 1);

%listen to the sound
% sound(data,fs);

%observe spectogram
% specgram(data,1024,fs);

%remove dc component
data = data - mean(data);

%normalize data 
data = data / abs(max(data));

% %pre-emphasis filter 
emph_data = preEmphasis(data);
% specgram(emph_data,1024,fs);

%frame and window- function created
frame_length = 0.025; %play with value;
frame_overlap = 0; % 30%  overlap
[windows,frames,w_FFTS] = framing(data,fs,frame_length,frame_overlap); %between 20 to 30 ms;

[sizeOfFrame,numOfFrames] =  size(frames);

%**********************************************************************
%% FEATURES
%**********************************************************************

%TIME DOMAIN
%**********************************************************************
% 1. ZCR
[ZCR,zcr_wave] = zerocross(frames');

% 2. STE
[ste,ste_wave] = STE(windows');

% 3. autocorrelation
[stacf,stacf_wave] = STACF(windows'); 

%FREQUENCY DOMAIN
%**********************************************************************
% 4. Entropy
[entropy, entropy_wave] = getEntropy(w_FFTS');

t1 = [0 : 1/fs : length(ste_wave)/fs];
t1 = t1(1:end - 1);
%**********************************************************************
%% DYNAMIC THRESHOLD
%**********************************************************************
bin = 20; %play with value
W = 5; %play with value

[ste_M1,ste_M2] = dynamicThres(ste,bin);

[entropy_M1,entropy_M2] = dynamicThres(entropy,bin);

[zcr_M1,zcr_M2] = dynamicThres(ZCR,bin);

%threshold
STE_Thres = ((W*ste_M1) + ste_M2)/(W+1);
entropy_Thres = ((W*entropy_M1) + entropy_M2)/(W+1);
ZCR_Thres = ((W*zcr_M1) + zcr_M2)/(W+1);

figure;
plot(t,data'); hold on;
plot(t1,ste_wave,'g','LineWidth',1);
legend('Short Term Energy (Frame Energy)');
yline(STE_Thres,'g','STE','LineWidth',1)
hold off;

hold on;
plot(t1,entropy_wave,'k','LineWidth',1);
legend('Short Term Spectral Entropy');
yline(entropy_Thres,'k','entropy','LineWidth',1)

hold on;
plot(t1,zcr_wave,'m','LineWidth',1);
legend('Zero Crossing Rate');
yline(ZCR_Thres,'m','ZCR','LineWidth',1)

hold off;
%**********************************************************************
%% Finding index of voiced regions
%**********************************************************************

%find points in feature with points above thres
ste_index = find(ste_wave > STE_Thres);
entropy_index = find(entropy < entropy_Thres);
zcr_index = find(ZCR < ZCR_Thres);%has a potential issue;

%TODO: come up with a way to use all the above to come up with an ideal

% data_manual = using the 
data_p = zeros(length(data),1);

data_p(ste_index) = 1;

% just change the index





