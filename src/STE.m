function [ste,ste_wave] = STE(frames)
   %data is assumed to be the frames
   
   [numOfFrames,sizeOfFrame] = size(frames);
   
   ste = zeros(numOfFrames);
   
   for i = 1 : numOfFrames
       ste(i) = sum(frames(i,:).^2);   %dependent on window 
   end

    ste = ste./max(ste);
    
    ste_wave = 0;    
    for j = 1 : length(ste)
        l = length(ste_wave);
        ste_wave(l : l + sizeOfFrame) = ste(j);
    end