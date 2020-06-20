function [ZCR,zcr_wave]= zerocross(frames)
    [numOfFrames,sizeOfFrame] = size(frames);
       
    ZCR=zeros(1,numOfFrames);
    
    for i = 1:numOfFrames
        f = frames(i,:);
        f2 = zeros(size(f));
        f2(2:end) = f(1 : end - 1);
        ZCR(i) = (1/(2*length(f)))*sum(abs(sign(f)-sign(f2)));
    end
    
    % calculating rate
    ZCR = ZCR./max(ZCR);
    zcr_wave = 0;
    for j = 1 : length(ZCR)
        l = length(zcr_wave);
        zcr_wave(l : l + sizeOfFrame) = ZCR(j);
    end