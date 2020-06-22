function [entropy, entropy_wave] = getEntropy(framesFFT)

[numOfFrames,sizeOfFrame] =  size(framesFFT);

entropy = zeros (numOfFrames);

for i = 1 : numOfFrames
    windowFFT= framesFFT(i,:);
   entropy(i) = feature_spectral_entropy(windowFFT, 10);
end
    entropy = entropy./max(entropy);
    
    entropy_wave = 0;    
    for j = 1 : length(entropy)
        l = length(entropy_wave);
        entropy_wave(l : l + sizeOfFrame) = entropy(j);
    end

function En = feature_spectral_entropy(windowFFT, numOfShortBlocks)

% function En = feature_spectral_entropy(windowFFT, numOfShortBlocks)
% Theodoros Giannakopoulos
% http://www.di.uoa.gr/~tyiannak
%
% (c)
% This function computes the spectral entropy of the given audio frame
%
% ARGUMENTS:
% - windowFFT:       the abs(FFT) of an audio frame
%                    (computed by getDFT() function)
% - numOfShortBins   the number of bins in which the spectrum
%                    is divided
%
% RETURNS:
% - En:              the value of the spectral entropy
%

% number of DFT coefs
fftLength = length(windowFFT);

% total frame (spectral) energy 
Eol = sum(windowFFT.^2);

% length of sub-frame:
subWinLength = floor(fftLength / numOfShortBlocks);
if length(windowFFT)~=subWinLength* numOfShortBlocks
    windowFFT = windowFFT(1:subWinLength* numOfShortBlocks);
end

% define sub-frames:
subWindows = reshape(windowFFT, subWinLength, numOfShortBlocks);

% compute spectral sub-energies: %probability of sub-band energy
s = sum(subWindows.^2) / (Eol+eps);

% compute spectral entropy:
En = -sum(s.*log2(s+eps));
