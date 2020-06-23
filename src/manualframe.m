function manualFrame = manualFrame(data)

    %remove dc component
    data = data - mean(data);
    
    %normalize data 
    data = data / abs(max(data));
    
    %get upper envelope
    
    [U,L] = envelope(data);
    
    %m = mean(U)
    mph = mean(U)/3;
    
    % find the peaks
    [pks,ind] = findpeaks(U, 'MinPeakHeight', mph);
    
    manualFrame = zeros(length(data),1);
    manualFrame(ind) = 1;
    
end