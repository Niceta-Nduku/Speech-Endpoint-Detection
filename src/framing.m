function [f_windows,frames,w_FFT] = framing(data,fs,frame_duration,frame_overlap)
    
    sizeOfFrame = round(fs * frame_duration);
    overlap = round(frame_overlap*sizeOfFrame);
    
    frames = buffer(data,sizeOfFrame,overlap);
    f_windows = diag(sparse(hamming(sizeOfFrame)))*frames;
    w_FFT = abs(fft(f_windows))/sizeOfFrame;

    
    