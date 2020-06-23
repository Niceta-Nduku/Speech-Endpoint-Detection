function [manualFrame, soundEnvelope, manual_index] = manualFrame(data)
    %Outputs:
    % the upper envelope of a signal
    % frame around voice 
    % also outputs the indices where of the voice segments
    
    %remove dc component
    data = data - mean(data);
    
    %normalize data 
    data = data / abs(max(data));
    
    %get upper envelope. Assuming that the sound is symmetrical about the x
    %axis
    
    [U,L] = envelope(data);
    soundEnvelope = U;
    
    % calculate Min peak height
    
    %TODO find an optimum mph that will work for noisy signals
    mph = mean(U)/2;
    
    % find all the peaks
    [pks2,ind2] = findpeaks(U);
    testmph = mean(pks2);
    
    % find the peaks
    [pks,ind] = findpeaks(U, 'MinPeakHeight', testmph);
    
    %  index of sound 
    manual_index = ind;
    
    manualFrame = zeros(length(data),1);
    manualFrame(ind) = 1;
    
end
