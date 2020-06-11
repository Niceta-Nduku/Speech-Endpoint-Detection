function [ZCR]= zerocross(frames)
    %zcd = dsp.ZeroCrossingDetector;
    %ZCR = zcd(data);
    [numOfFrames,~,] = size(data);
    ZCR=zeros(1,numOfFrames);

    for i = 1:numOfFrames
        x = frames(i);
        ZCR(i) = 0.5*sum(abs(sign(x(2:end))-sign(x(1:end-1))));
    end
 