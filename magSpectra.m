function [f,magSpec] = magSpectra(tSeries,sampleRate)
%% magSpectra
% Author: S. DeWolf
% Modified by: R. Moak
% Date: 11/13/19

%% Calculate Magnitude Spectra

% Hamming Window
M=3;                             % padding multiplier (increase to make plot smoother)
N=length(tSeries);
%w=ones(N,1);                    % rectangular window (default)
w=hamming(N);                    % Hamming window
fs=1/(sampleRate);               % sample rate in Hz (simulation)
f=[0,(1:floor((M*N-1)/2))*fs/(M*N),-(ceil((M*N-1)/2):-1:1)*fs/(M*N)]';
magSpec=fft(w.*detrend(tSeries(:,1)),M*N);
I=find(f>0);                     % select only positive frequencies (i.e., 1-sided spectrum)
f=f(I);
w=sum(w)/N;                      % compute window function normalization
magSpec=abs(magSpec(I))*2/N*w;   % divide by N to convert to physical units
                                 % multiply by 2 to account for the use of only one-side
                                 % multiply by sum(w)/N to account for window
clear('N','fs','I','w');