function [manualFrame, soundEnvelope, manual_index] = manualFrame(data)

    %remove dc component
    data = data - mean(data);
    
    %normalize data 
    data = data / abs(max(data));
    
    %get upper envelope. Assuming that the sound is symmetrical about the x
    %axis
    
    [U,L] = envelope(data);
    soundEnvelope = U;
    
    % calculate Min peak height
    mph = mean(U)/2;
    
    % find the peaks
    [pks,ind] = findpeaks(U, 'MinPeakHeight', mph);
    
    %given index of sound 
    manual_index = ind;
    
    manualFrame = zeros(length(data),1);
    manualFrame(ind) = 1;
 
end
