function [f_windows,frames] = framing(data,fs,frame_duration)
     
    frame_size = round(fs * frame_duration);
    
    num_Frames = floor(length(data)/frame_size); 
    %it is smaller than may need to increase, maybe zero padding the data 
    
    %create frames from data
    
    frames=zeros(num_Frames,frame_size+1);
    
    f_windows=zeros(num_Frames,frame_size+1);
    
    start = 1;
    for i= 1:num_Frames
        %TODO: allow for overlap of 30%-50%
        frames(i,:) = data(start:start+frame_size);    
        f_windows(i,:) = data(start:start+frame_size) .* hamming(frame_size+1);
        start = start + frame_size;
    end
    %to change and see what window will be best
    
    %may need to change window type to rectangular 
    
    
    