function [ste] = STE(frames)
   %data is assumed to be the frames
   
   [numOfFrames,sizeOfFrame] = size(frames);
   
   ste = zeros(r);
   
   for i = 1 : numOfFrames
       ste(i) =(1/sizeOfFrame)*sum(frames(i,:).^2);   %dependent on window 
   end

    ste = ste./max(ste); 
