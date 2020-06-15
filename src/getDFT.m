function [FFT, Freq] = getDFT(signal, Fs, PLOT)

%
% function [FFT, Freq] = getDFT(signal, Fs, PLOT)
%
% This function returns the DFT of a discrete signal and the 
% respective frequency range.
% 
% ARGUMENTS:
% - signal: vector containing the samples of the signal
% - Fs:     the sampling frequency
% - PLOT:   use this argument if the FFT (and the respective 
%           frequency values) need to be returned in the 
%           [-fs/2..fs/2] range. Otherwise, only half of 
%           the spectrum is returned.
%
% RETURNS:
% - FFT:    the magnitude of the DFT coefficients
% - Freq:   the corresponding frequencies (in Hz)
%

N = length(signal);  % length of signal
% compute the magnitude of the spectrum
% (and normalize by the number of samples):
FFT = abs(fft(signal)) / N;
FFT = fftshift(FFT);        
if mod(N,2)==0                      % define the frequency axis:
    Freq = -N/2:N/2-1;              % if N is even
else
    Freq = -(N-1)/2:(N-1)/2;        % if N is odd
end
Freq = (Fs/2) * Freq ./ ceil(N/2);
end

