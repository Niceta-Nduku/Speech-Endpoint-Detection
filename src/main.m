% This is the main program that calls the feature functions,
% does the threshold
% smoothing with a median filter
% and 
%**********************************************************************
%read in audio
[data,fs] = audioread('../data/sf2_filtered.wav');

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

%plot the raw data
% figure;
% plot(t,data');

% %pre-emphasis filter 
emph_data = preEmphasis(data);
% figure;
% plot(t,emph_data');

figure;
% specgram(emph_data,1024,fs);

%frame and window- function created
frame_length = 0.025; %play with value;

[windows,frames,w_FFTS] = framing(emph_data,fs,frame_length); %between 20 to 30 ms;

[numOfFrames,sizeOfFrame] =  size(frames);

%**********************************************************************
% FEATURES
%**********************************************************************

%TIME DOMAIN
%**********************************************************************
% 1. ZCR
[ZCR,zcr_wave] = zerocross(frames);

% 2. STE
[ste,ste_wave] = STE(windows);

% 3. autocorrelation
[stacf,stacf_wave] = STACF(windows); 

% FREQUENCY DOMAIN
%**********************************************************************
% 4. Entropy
[entropy, entropy_wave] = getEntropy(w_FFTS);

%**********************************************************************
%DYNAMIC THRESHOLD
%**********************************************************************
bin = 40; %play with value
W = 5; %play with value

[ste_M1,ste_M2] = dynamicThres(ste,bin);

[entropy_M1,entropy_M2] = dynamicThres(entropy,bin);

[zcr_M1,zcr_M2] = dynamicThres(ZCR,bin);

%threshold
STE_Thres = ((W*ste_M1) + ste_M2)/(W+1);
entropy_Thres = ((W*entropy_M1) + entropy_M2)/(W+1);
ZCR_Thres = ((W*zcr_M1) + zcr_M2)/(W+1);
%**********************************************************************
%Finding index of voiced regions
%**********************************************************************

%find points in feature with points above thres
ste_index = find(ste > STE_Thres);
entropy_index = find(entropy > entropy_Thres);
zcr_index = find(ZCR < ZCR_Thres);%has a potential issue;

%TODO: come up with a way to use all the above to come up with an ideal


% just change the index

fr_ws = frames(entropy_index,:);
% reconstruct signal
data_r = reshape(fr_ws',1,[]);
data_r = data_r / abs(max(data_r));
figure;
plot(data);hold on;
plot(data_r,'g');

sound(data_r',fs);



