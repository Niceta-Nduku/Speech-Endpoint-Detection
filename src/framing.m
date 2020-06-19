function [f_windows,frames,w_FFT] = framing(data,fs,frame_duration)
     
    sizeOfFrame = round(fs * frame_duration);
    
    frames = buffer(data,sizeOfFrame);
    f_windows = diag(sparse(hamming(sizeOfFrame)))*frames;
    w_FFT = abs(fft(f_windows))/sizeOfFrame;

    
    