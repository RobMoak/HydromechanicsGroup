function [f,magSpecWF]=magSpectraWF(tSeries,sampleRate,w,nfft)
%% magSpectraWF
% Author: S. DeWolf
% Modified by: R. Moak
% Date: 03/25/20

%% Documentation:
%
% inputs:
%            tSeries    = data vector (detrended)
%            sampleRate = sample rate in Hz
%            w          = window (taper) function
%                         hamming(length(tSeries)) if not specified
%            nfft       = number of FFT points
%                         2^(log2(N)+4) if not specified
% outputs:
%            f          = frequency vector corresponding to
%            magSpecWF  = vector of RMS amplitudes (or FFT magnitude, properly normalized)


%% Calculate Magnitude Spectra:

% compute window function if none is provided
if isempty(w)
  w = hamming(length(tSeries));
end

% compute number of FFT points if none is provided
if isempty(nfft)
  nfft = 2^(round(log2(length(tSeries)))+4);
end

% compute fft and frequency vector of detrended data
X = fft(w.*tSeries,nfft);
f = [0,(1:floor((nfft-1)/2))*sampleRate/nfft,-(ceil((nfft-1)/2):-1:1)*sampleRate/nfft]';

% compute magnitude for positive frequencies
I = find(f>0);
f = f(I);
magSpecWF= 2*abs(X(I))/sum(w);
clear('I');
