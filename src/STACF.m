function [stacf,stacf_wave] = STACF(frames)

[numOfFrames,sizeOfFrame] = size(frames);

 stacf = zeros(numOfFrames);
 
 for i = 1:numOfFrames
     f = frames(i,:);
     
%      ac = autocorr(f,sizeOfFrame-1);
     ac = 0;
     for n = 0:sizeOfFrame-1 %lag
         sum = 0;
         for j = 1:sizeOfFrame-n
             s = f(j)*f(j+n);
             sum = sum + s;
         end
         ac(n+1) = sum; %autocorrelation sequence
     end
%      %temp(i) = ac(1);
       stacf(i) = ac(2); % taking second coeff. built in function gives normalized
%      % autocorrelation (it is autocorr at lag 1)
 end
 stacf = stacf./max(stacf);

    stacf_wave = 0;    
    for j = 1 : length(stacf)
        l = length(stacf_wave);
        stacf_wave(l : l + sizeOfFrame) = stacf(j);
    end