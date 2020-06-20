function [stacf,stacf_wave] = STACF(frames)

[numOfFrames,sizeOfFrame] = size(frames);

 delay = sizeOfFrame+1;

 stacf = zeros(numOfFrames);
 
 for i = 1:numOfFrames
    f = frames(i,:);  
    [ac,~] = xcorr(f); %calculate the cross correlation function
    stacf(i) = ac(delay); %for a delay of 1
 end
 
 stacf = stacf./max(stacf);
 
 stacf_wave = 0;    
 for j = 1 : length(stacf)
    l = length(stacf_wave);
    stacf_wave(l : l + sizeOfFrame) = stacf(j);
 end