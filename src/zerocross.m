function [ZCR,zcr_wave]= zerocross(frames)
    %zcd = dsp.ZeroCrossingDetector;
    %ZCR = zcd(data);
    [numOfFrames,sizeOfFrame] = size(frames);
       
    ZCRf=zeros(1,numOfFrames);

    for i = 1:numOfFrames
        f = frames(i,:);
        ZCRf(i) = sum(f(1 : end - 1) .* f(2:end) <= 0);
    end
    
    % calculating rate
    ZCR = ZCRf/length(f);
    ZCR = ZCR./max(ZCR);
    zcr_wave = 0;
    for j = 1 : length(ZCR)
        l = length(zcr_wave);
        zcr_wave(l : l + sizeOfFrame) = ZCR(j);
    end