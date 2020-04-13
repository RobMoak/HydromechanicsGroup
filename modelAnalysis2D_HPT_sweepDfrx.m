%% modelAnalysis2D_sweepDfrx
% Author: R. Moak
% Date: 04/10/20

%% Evaluate effect of Parameter on Pressure & Strain Signals
% % This code evaluates:
% 1) magnitude spectra w/ window function (magSpectraWF)
% 2) maximum value of magnitude spectra
% 3) phase (ellipseFit)
% 4) phase (xcorr)
% 5) maximum strain rate
% 6) average strain rate
% 7) perfoms correlations and polynomial fits to data for interpretation

%% Define Key Values ============================================================================ %
%
% =============================================================================================== %

% lower detection thresholds for strain magnitude and rate
minCriteria;

%% Calculate Characteristic Parameters

% =============================================================================================== %
% Characteristic Time (t_c)
% =============================================================================================== %

tc_frxD01 = (ModelParams_sweepDfrx(1).x_c^2)/(4*ModelParams_sweepDfrx(1).D01_frx);
tc_frxD02 = (ModelParams_sweepDfrx(1).x_c^2)/(4*ModelParams_sweepDfrx(1).D02_frx);
tc_frxD03 = (ModelParams_sweepDfrx(1).x_c^2)/(4*ModelParams_sweepDfrx(1).D03_frx);
tc_frxD04 = (ModelParams_sweepDfrx(1).x_c^2)/(4*ModelParams_sweepDfrx(1).D04_frx);
tc_frxD05 = (ModelParams_sweepDfrx(1).x_c^2)/(4*ModelParams_sweepDfrx(1).D05_frx);
tc_frxD06 = (ModelParams_sweepDfrx(1).x_c^2)/(4*ModelParams_sweepDfrx(1).D06_frx);
tc_frxD07 = (ModelParams_sweepDfrx(1).x_c^2)/(4*ModelParams_sweepDfrx(1).D07_frx);
tc_frxD08 = (ModelParams_sweepDfrx(1).x_c^2)/(4*ModelParams_sweepDfrx(1).D08_frx);
tc_frxD09 = (ModelParams_sweepDfrx(1).x_c^2)/(4*ModelParams_sweepDfrx(1).D09_frx);
tc_frxD10 = (ModelParams_sweepDfrx(1).x_c^2)/(4*ModelParams_sweepDfrx(1).D10_frx);

tc_swpDfrx = [tc_frxD01 tc_frxD02 tc_frxD03 tc_frxD04 tc_frxD05 tc_frxD06 tc_frxD07 tc_frxD08 tc_frxD09 tc_frxD10];
clear tc_frxD01 tc_frxD02 tc_frxD03 tc_frxD04 tc_frxD05 tc_frxD06 tc_frxD07 tc_frxD08 tc_frxD09 tc_frxD10

%% Obtain absolute values of strain rates

% =============================================================================================== %
% PARAMETER 01
% =============================================================================================== %
eXXrate_frxD01_01d = abs(eXXrate_frxD01_01d);
eZZrate_frxD01_01d = abs(eZZrate_frxD01_01d);
eTXrate_frxD01_01d = abs(eTXrate_frxD01_01d);
eXXrate_frxD01_03d = abs(eXXrate_frxD01_03d);
eZZrate_frxD01_03d = abs(eZZrate_frxD01_03d);
eTXrate_frxD01_03d = abs(eTXrate_frxD01_03d);
eXXrate_frxD01_05d = abs(eXXrate_frxD01_05d);
eZZrate_frxD01_05d = abs(eZZrate_frxD01_05d);
eTXrate_frxD01_05d = abs(eTXrate_frxD01_05d);
eXXrate_frxD01_10d = abs(eXXrate_frxD01_10d);
eZZrate_frxD01_10d = abs(eZZrate_frxD01_10d);
eTXrate_frxD01_10d = abs(eTXrate_frxD01_10d);
eXXrate_frxD01_50d = abs(eXXrate_frxD01_50d);
eZZrate_frxD01_50d = abs(eZZrate_frxD01_50d);
eTXrate_frxD01_50d = abs(eTXrate_frxD01_50d);

% =============================================================================================== %
% PARAMETER 02
% =============================================================================================== %
eXXrate_frxD02_01d = abs(eXXrate_frxD02_01d);
eZZrate_frxD02_01d = abs(eZZrate_frxD02_01d);
eTXrate_frxD02_01d = abs(eTXrate_frxD02_01d);
eXXrate_frxD02_03d = abs(eXXrate_frxD02_03d);
eZZrate_frxD02_03d = abs(eZZrate_frxD02_03d);
eTXrate_frxD02_03d = abs(eTXrate_frxD02_03d);
eXXrate_frxD02_05d = abs(eXXrate_frxD02_05d);
eZZrate_frxD02_05d = abs(eZZrate_frxD02_05d);
eTXrate_frxD02_05d = abs(eTXrate_frxD02_05d);
eXXrate_frxD02_10d = abs(eXXrate_frxD02_10d);
eZZrate_frxD02_10d = abs(eZZrate_frxD02_10d);
eTXrate_frxD02_10d = abs(eTXrate_frxD02_10d);
eXXrate_frxD02_50d = abs(eXXrate_frxD02_50d);
eZZrate_frxD02_50d = abs(eZZrate_frxD02_50d);
eTXrate_frxD02_50d = abs(eTXrate_frxD02_50d);

% =============================================================================================== %
% PARAMETER 03
% =============================================================================================== %
eXXrate_frxD03_01d = abs(eXXrate_frxD03_01d);
eZZrate_frxD03_01d = abs(eZZrate_frxD03_01d);
eTXrate_frxD03_01d = abs(eTXrate_frxD03_01d);
eXXrate_frxD03_03d = abs(eXXrate_frxD03_03d);
eZZrate_frxD03_03d = abs(eZZrate_frxD03_03d);
eTXrate_frxD03_03d = abs(eTXrate_frxD03_03d);
eXXrate_frxD03_05d = abs(eXXrate_frxD03_05d);
eZZrate_frxD03_05d = abs(eZZrate_frxD03_05d);
eTXrate_frxD03_05d = abs(eTXrate_frxD03_05d);
eXXrate_frxD03_10d = abs(eXXrate_frxD03_10d);
eZZrate_frxD03_10d = abs(eZZrate_frxD03_10d);
eTXrate_frxD03_10d = abs(eTXrate_frxD03_10d);
eXXrate_frxD03_50d = abs(eXXrate_frxD03_50d);
eZZrate_frxD03_50d = abs(eZZrate_frxD03_50d);
eTXrate_frxD03_50d = abs(eTXrate_frxD03_50d);

% =============================================================================================== %
% PARAMETER 04
% =============================================================================================== %
eXXrate_frxD04_01d = abs(eXXrate_frxD04_01d);
eZZrate_frxD04_01d = abs(eZZrate_frxD04_01d);
eTXrate_frxD04_01d = abs(eTXrate_frxD04_01d);
eXXrate_frxD04_03d = abs(eXXrate_frxD04_03d);
eZZrate_frxD04_03d = abs(eZZrate_frxD04_03d);
eTXrate_frxD04_03d = abs(eTXrate_frxD04_03d);
eXXrate_frxD04_05d = abs(eXXrate_frxD04_05d);
eZZrate_frxD04_05d = abs(eZZrate_frxD04_05d);
eTXrate_frxD04_05d = abs(eTXrate_frxD04_05d);
eXXrate_frxD04_10d = abs(eXXrate_frxD04_10d);
eZZrate_frxD04_10d = abs(eZZrate_frxD04_10d);
eTXrate_frxD04_10d = abs(eTXrate_frxD04_10d);
eXXrate_frxD04_50d = abs(eXXrate_frxD04_50d);
eZZrate_frxD04_50d = abs(eZZrate_frxD04_50d);
eTXrate_frxD04_50d = abs(eTXrate_frxD04_50d);

% =============================================================================================== %
% PARAMETER 05
% =============================================================================================== %
eXXrate_frxD05_01d = abs(eXXrate_frxD05_01d);
eZZrate_frxD05_01d = abs(eZZrate_frxD05_01d);
eTXrate_frxD05_01d = abs(eTXrate_frxD05_01d);
eXXrate_frxD05_03d = abs(eXXrate_frxD05_03d);
eZZrate_frxD05_03d = abs(eZZrate_frxD05_03d);
eTXrate_frxD05_03d = abs(eTXrate_frxD05_03d);
eXXrate_frxD05_05d = abs(eXXrate_frxD05_05d);
eZZrate_frxD05_05d = abs(eZZrate_frxD05_05d);
eTXrate_frxD05_05d = abs(eTXrate_frxD05_05d);
eXXrate_frxD05_10d = abs(eXXrate_frxD05_10d);
eZZrate_frxD05_10d = abs(eZZrate_frxD05_10d);
eTXrate_frxD05_10d = abs(eTXrate_frxD05_10d);
eXXrate_frxD05_50d = abs(eXXrate_frxD05_50d);
eZZrate_frxD05_50d = abs(eZZrate_frxD05_50d);
eTXrate_frxD05_50d = abs(eTXrate_frxD05_50d);

% =============================================================================================== %
% PARAMETER 06
% =============================================================================================== %
eXXrate_frxD06_01d = abs(eXXrate_frxD06_01d);
eZZrate_frxD06_01d = abs(eZZrate_frxD06_01d);
eTXrate_frxD06_01d = abs(eTXrate_frxD06_01d);
eXXrate_frxD06_03d = abs(eXXrate_frxD06_03d);
eZZrate_frxD06_03d = abs(eZZrate_frxD06_03d);
eTXrate_frxD06_03d = abs(eTXrate_frxD06_03d);
eXXrate_frxD06_05d = abs(eXXrate_frxD06_05d);
eZZrate_frxD06_05d = abs(eZZrate_frxD06_05d);
eTXrate_frxD06_05d = abs(eTXrate_frxD06_05d);
eXXrate_frxD06_10d = abs(eXXrate_frxD06_10d);
eZZrate_frxD06_10d = abs(eZZrate_frxD06_10d);
eTXrate_frxD06_10d = abs(eTXrate_frxD06_10d);
eXXrate_frxD06_50d = abs(eXXrate_frxD06_50d);
eZZrate_frxD06_50d = abs(eZZrate_frxD06_50d);
eTXrate_frxD06_50d = abs(eTXrate_frxD06_50d);

% =============================================================================================== %
% PARAMETER 07
% =============================================================================================== %
eXXrate_frxD07_01d = abs(eXXrate_frxD07_01d);
eZZrate_frxD07_01d = abs(eZZrate_frxD07_01d);
eTXrate_frxD07_01d = abs(eTXrate_frxD07_01d);
eXXrate_frxD07_03d = abs(eXXrate_frxD07_03d);
eZZrate_frxD07_03d = abs(eZZrate_frxD07_03d);
eTXrate_frxD07_03d = abs(eTXrate_frxD07_03d);
eXXrate_frxD07_05d = abs(eXXrate_frxD07_05d);
eZZrate_frxD07_05d = abs(eZZrate_frxD07_05d);
eTXrate_frxD07_05d = abs(eTXrate_frxD07_05d);
eXXrate_frxD07_10d = abs(eXXrate_frxD07_10d);
eZZrate_frxD07_10d = abs(eZZrate_frxD07_10d);
eTXrate_frxD07_10d = abs(eTXrate_frxD07_10d);
eXXrate_frxD07_50d = abs(eXXrate_frxD07_50d);
eZZrate_frxD07_50d = abs(eZZrate_frxD07_50d);
eTXrate_frxD07_50d = abs(eTXrate_frxD07_50d);

% =============================================================================================== %
% PARAMETER 08
% =============================================================================================== %
eXXrate_frxD08_01d = abs(eXXrate_frxD08_01d);
eZZrate_frxD08_01d = abs(eZZrate_frxD08_01d);
eTXrate_frxD08_01d = abs(eTXrate_frxD08_01d);
eXXrate_frxD08_03d = abs(eXXrate_frxD08_03d);
eZZrate_frxD08_03d = abs(eZZrate_frxD08_03d);
eTXrate_frxD08_03d = abs(eTXrate_frxD08_03d);
eXXrate_frxD08_05d = abs(eXXrate_frxD08_05d);
eZZrate_frxD08_05d = abs(eZZrate_frxD08_05d);
eTXrate_frxD08_05d = abs(eTXrate_frxD08_05d);
eXXrate_frxD08_10d = abs(eXXrate_frxD08_10d);
eZZrate_frxD08_10d = abs(eZZrate_frxD08_10d);
eTXrate_frxD08_10d = abs(eTXrate_frxD08_10d);
eXXrate_frxD08_50d = abs(eXXrate_frxD08_50d);
eZZrate_frxD08_50d = abs(eZZrate_frxD08_50d);
eTXrate_frxD08_50d = abs(eTXrate_frxD08_50d);

% =============================================================================================== %
% PARAMETER 09
% =============================================================================================== %
eXXrate_frxD09_01d = abs(eXXrate_frxD09_01d);
eZZrate_frxD09_01d = abs(eZZrate_frxD09_01d);
eTXrate_frxD09_01d = abs(eTXrate_frxD09_01d);
eXXrate_frxD09_03d = abs(eXXrate_frxD09_03d);
eZZrate_frxD09_03d = abs(eZZrate_frxD09_03d);
eTXrate_frxD09_03d = abs(eTXrate_frxD09_03d);
eXXrate_frxD09_05d = abs(eXXrate_frxD09_05d);
eZZrate_frxD09_05d = abs(eZZrate_frxD09_05d);
eTXrate_frxD09_05d = abs(eTXrate_frxD09_05d);
eXXrate_frxD09_10d = abs(eXXrate_frxD09_10d);
eZZrate_frxD09_10d = abs(eZZrate_frxD09_10d);
eTXrate_frxD09_10d = abs(eTXrate_frxD09_10d);
eXXrate_frxD09_50d = abs(eXXrate_frxD09_50d);
eZZrate_frxD09_50d = abs(eZZrate_frxD09_50d);
eTXrate_frxD09_50d = abs(eTXrate_frxD09_50d);

% =============================================================================================== %
% PARAMETER 10
% =============================================================================================== %
eXXrate_frxD10_01d = abs(eXXrate_frxD10_01d);
eZZrate_frxD10_01d = abs(eZZrate_frxD10_01d);
eTXrate_frxD10_01d = abs(eTXrate_frxD10_01d);
eXXrate_frxD10_03d = abs(eXXrate_frxD10_03d);
eZZrate_frxD10_03d = abs(eZZrate_frxD10_03d);
eTXrate_frxD10_03d = abs(eTXrate_frxD10_03d);
eXXrate_frxD10_05d = abs(eXXrate_frxD10_05d);
eZZrate_frxD10_05d = abs(eZZrate_frxD10_05d);
eTXrate_frxD10_05d = abs(eTXrate_frxD10_05d);
eXXrate_frxD10_10d = abs(eXXrate_frxD10_10d);
eZZrate_frxD10_10d = abs(eZZrate_frxD10_10d);
eTXrate_frxD10_10d = abs(eTXrate_frxD10_10d);
eXXrate_frxD10_50d = abs(eXXrate_frxD10_50d);
eZZrate_frxD10_50d = abs(eZZrate_frxD10_50d);
eTXrate_frxD10_50d = abs(eTXrate_frxD10_50d);

%% Compute Magnitude Spectra

[f_swpDfrx, eXXmagSpec_frxD01_01d] = magSpectra(eXX_frxD01_01d(:,i),sampleRate);
n_samples = length(eXXmagSpec_frxD01_01d);
clear eXXmagSpec_frxD01_01d f_swpDfrx

% =============================================================================================== %
% PARAMETER 01
% =============================================================================================== %
eXXmagSpec_frxD01_01d = zeros(n_samples,n_probes);
eXXmagSpec_frxD01_03d = zeros(n_samples,n_probes);
eXXmagSpec_frxD01_05d = zeros(n_samples,n_probes);
eXXmagSpec_frxD01_10d = zeros(n_samples,n_probes);
eXXmagSpec_frxD01_50d = zeros(n_samples,n_probes);
f_swpDfrx             = zeros(n_samples);
for i = 1:n_probes
    [f_swpDfrx, eXXmagSpec_frxD01_01d(:,i)] = magSpectra(eXX_frxD01_01d(:,i),sampleRate);
    [~,         eXXmagSpec_frxD01_03d(:,i)] = magSpectra(eXX_frxD01_03d(:,i),sampleRate);
    [~,         eXXmagSpec_frxD01_05d(:,i)] = magSpectra(eXX_frxD01_05d(:,i),sampleRate);
    [~,         eXXmagSpec_frxD01_10d(:,i)] = magSpectra(eXX_frxD01_10d(:,i),sampleRate);
    [~,         eXXmagSpec_frxD01_50d(:,i)] = magSpectra(eXX_frxD01_50d(:,i),sampleRate);
end

% =============================================================================================== %
% PARAMETER 02
% =============================================================================================== %
eXXmagSpec_frxD02_01d = zeros(n_samples,n_probes);
eXXmagSpec_frxD02_03d = zeros(n_samples,n_probes);
eXXmagSpec_frxD02_05d = zeros(n_samples,n_probes);
eXXmagSpec_frxD02_10d = zeros(n_samples,n_probes);
eXXmagSpec_frxD02_50d = zeros(n_samples,n_probes);
for i = 1:n_probes
    [~,        eXXmagSpec_frxD02_01d(:,i)] = magSpectra(eXX_frxD02_01d(:,i),sampleRate);
    [~,        eXXmagSpec_frxD02_03d(:,i)] = magSpectra(eXX_frxD02_03d(:,i),sampleRate);
    [~,        eXXmagSpec_frxD02_05d(:,i)] = magSpectra(eXX_frxD02_05d(:,i),sampleRate);
    [~,        eXXmagSpec_frxD02_10d(:,i)] = magSpectra(eXX_frxD02_10d(:,i),sampleRate);
    [~,        eXXmagSpec_frxD02_50d(:,i)] = magSpectra(eXX_frxD02_50d(:,i),sampleRate);
end

% =============================================================================================== %
% PARAMETER 03
% =============================================================================================== %
eXXmagSpec_frxD03_01d = zeros(n_samples,n_probes);
eXXmagSpec_frxD03_03d = zeros(n_samples,n_probes);
eXXmagSpec_frxD03_05d = zeros(n_samples,n_probes);
eXXmagSpec_frxD03_10d = zeros(n_samples,n_probes);
eXXmagSpec_frxD03_50d = zeros(n_samples,n_probes);
for i = 1:n_probes
    [~,        eXXmagSpec_frxD03_01d(:,i)] = magSpectra(eXX_frxD03_01d(:,i),sampleRate);
    [~,        eXXmagSpec_frxD03_03d(:,i)] = magSpectra(eXX_frxD03_03d(:,i),sampleRate);
    [~,        eXXmagSpec_frxD03_05d(:,i)] = magSpectra(eXX_frxD03_05d(:,i),sampleRate);
    [~,        eXXmagSpec_frxD03_10d(:,i)] = magSpectra(eXX_frxD03_10d(:,i),sampleRate);
    [~,        eXXmagSpec_frxD03_50d(:,i)] = magSpectra(eXX_frxD03_50d(:,i),sampleRate);
end

% =============================================================================================== %
% PARAMETER 04
% =============================================================================================== %
eXXmagSpec_frxD04_01d = zeros(n_samples,n_probes);
eXXmagSpec_frxD04_03d = zeros(n_samples,n_probes);
eXXmagSpec_frxD04_05d = zeros(n_samples,n_probes);
eXXmagSpec_frxD04_10d = zeros(n_samples,n_probes);
eXXmagSpec_frxD04_50d = zeros(n_samples,n_probes);
for i = 1:n_probes
    [~,        eXXmagSpec_frxD04_01d(:,i)] = magSpectra(eXX_frxD04_01d(:,i),sampleRate);
    [~,        eXXmagSpec_frxD04_03d(:,i)] = magSpectra(eXX_frxD04_03d(:,i),sampleRate);
    [~,        eXXmagSpec_frxD04_05d(:,i)] = magSpectra(eXX_frxD04_05d(:,i),sampleRate);
    [~,        eXXmagSpec_frxD04_10d(:,i)] = magSpectra(eXX_frxD04_10d(:,i),sampleRate);
    [~,        eXXmagSpec_frxD04_50d(:,i)] = magSpectra(eXX_frxD04_50d(:,i),sampleRate);
end

% =============================================================================================== %
% PARAMETER 05
% =============================================================================================== %
eXXmagSpec_frxD05_01d = zeros(n_samples,n_probes);
eXXmagSpec_frxD05_03d = zeros(n_samples,n_probes);
eXXmagSpec_frxD05_05d = zeros(n_samples,n_probes);
eXXmagSpec_frxD05_10d = zeros(n_samples,n_probes);
eXXmagSpec_frxD05_50d = zeros(n_samples,n_probes);
for i = 1:n_probes
    [~,        eXXmagSpec_frxD05_01d(:,i)] = magSpectra(eXX_frxD05_01d(:,i),sampleRate);
    [~,        eXXmagSpec_frxD05_03d(:,i)] = magSpectra(eXX_frxD05_03d(:,i),sampleRate);
    [~,        eXXmagSpec_frxD05_05d(:,i)] = magSpectra(eXX_frxD05_05d(:,i),sampleRate);
    [~,        eXXmagSpec_frxD05_10d(:,i)] = magSpectra(eXX_frxD05_10d(:,i),sampleRate);
    [~,        eXXmagSpec_frxD05_50d(:,i)] = magSpectra(eXX_frxD05_50d(:,i),sampleRate);
end

% =============================================================================================== %
% PARAMETER 06
% =============================================================================================== %
eXXmagSpec_frxD06_01d = zeros(n_samples,n_probes);
eXXmagSpec_frxD06_03d = zeros(n_samples,n_probes);
eXXmagSpec_frxD06_05d = zeros(n_samples,n_probes);
eXXmagSpec_frxD06_10d = zeros(n_samples,n_probes);
eXXmagSpec_frxD06_50d = zeros(n_samples,n_probes);
for i = 1:n_probes
    [~,        eXXmagSpec_frxD06_01d(:,i)] = magSpectra(eXX_frxD06_01d(:,i),sampleRate);
    [~,        eXXmagSpec_frxD06_03d(:,i)] = magSpectra(eXX_frxD06_03d(:,i),sampleRate);
    [~,        eXXmagSpec_frxD06_05d(:,i)] = magSpectra(eXX_frxD06_05d(:,i),sampleRate);
    [~,        eXXmagSpec_frxD06_10d(:,i)] = magSpectra(eXX_frxD06_10d(:,i),sampleRate);
    [~,        eXXmagSpec_frxD06_50d(:,i)] = magSpectra(eXX_frxD06_50d(:,i),sampleRate);
end

% =============================================================================================== %
% PARAMETER 07
% =============================================================================================== %
eXXmagSpec_frxD07_01d = zeros(n_samples,n_probes);
eXXmagSpec_frxD07_03d = zeros(n_samples,n_probes);
eXXmagSpec_frxD07_05d = zeros(n_samples,n_probes);
eXXmagSpec_frxD07_10d = zeros(n_samples,n_probes);
eXXmagSpec_frxD07_50d = zeros(n_samples,n_probes);
for i = 1:n_probes
    [~,        eXXmagSpec_frxD07_01d(:,i)] = magSpectra(eXX_frxD07_01d(:,i),sampleRate);
    [~,        eXXmagSpec_frxD07_03d(:,i)] = magSpectra(eXX_frxD07_03d(:,i),sampleRate);
    [~,        eXXmagSpec_frxD07_05d(:,i)] = magSpectra(eXX_frxD07_05d(:,i),sampleRate);
    [~,        eXXmagSpec_frxD07_10d(:,i)] = magSpectra(eXX_frxD07_10d(:,i),sampleRate);
    [~,        eXXmagSpec_frxD07_50d(:,i)] = magSpectra(eXX_frxD07_50d(:,i),sampleRate);
end

% =============================================================================================== %
% PARAMETER 08
% =============================================================================================== %
eXXmagSpec_frxD08_01d = zeros(n_samples,n_probes);
eXXmagSpec_frxD08_03d = zeros(n_samples,n_probes);
eXXmagSpec_frxD08_05d = zeros(n_samples,n_probes);
eXXmagSpec_frxD08_10d = zeros(n_samples,n_probes);
eXXmagSpec_frxD08_50d = zeros(n_samples,n_probes);
for i = 1:n_probes
    [~,        eXXmagSpec_frxD08_01d(:,i)] = magSpectra(eXX_frxD08_01d(:,i),sampleRate);
    [~,        eXXmagSpec_frxD08_03d(:,i)] = magSpectra(eXX_frxD08_03d(:,i),sampleRate);
    [~,        eXXmagSpec_frxD08_05d(:,i)] = magSpectra(eXX_frxD08_05d(:,i),sampleRate);
    [~,        eXXmagSpec_frxD08_10d(:,i)] = magSpectra(eXX_frxD08_10d(:,i),sampleRate);
    [~,        eXXmagSpec_frxD08_50d(:,i)] = magSpectra(eXX_frxD08_50d(:,i),sampleRate);
end

% =============================================================================================== %
% PARAMETER 09
% =============================================================================================== %
eXXmagSpec_frxD09_01d = zeros(n_samples,n_probes);
eXXmagSpec_frxD09_03d = zeros(n_samples,n_probes);
eXXmagSpec_frxD09_05d = zeros(n_samples,n_probes);
eXXmagSpec_frxD09_10d = zeros(n_samples,n_probes);
eXXmagSpec_frxD09_50d = zeros(n_samples,n_probes);
for i = 1:n_probes
    [~,        eXXmagSpec_frxD09_01d(:,i)] = magSpectra(eXX_frxD09_01d(:,i),sampleRate);
    [~,        eXXmagSpec_frxD09_03d(:,i)] = magSpectra(eXX_frxD09_03d(:,i),sampleRate);
    [~,        eXXmagSpec_frxD09_05d(:,i)] = magSpectra(eXX_frxD09_05d(:,i),sampleRate);
    [~,        eXXmagSpec_frxD09_10d(:,i)] = magSpectra(eXX_frxD09_10d(:,i),sampleRate);
    [~,        eXXmagSpec_frxD09_50d(:,i)] = magSpectra(eXX_frxD09_50d(:,i),sampleRate);
end

% =============================================================================================== %
% PARAMETER 10
% =============================================================================================== %
eXXmagSpec_frxD10_01d = zeros(n_samples,n_probes);
eXXmagSpec_frxD10_03d = zeros(n_samples,n_probes);
eXXmagSpec_frxD10_05d = zeros(n_samples,n_probes);
eXXmagSpec_frxD10_10d = zeros(n_samples,n_probes);
eXXmagSpec_frxD10_50d = zeros(n_samples,n_probes);
for i = 1:n_probes
    [~,        eXXmagSpec_frxD10_01d(:,i)] = magSpectra(eXX_frxD10_01d(:,i),sampleRate);
    [~,        eXXmagSpec_frxD10_03d(:,i)] = magSpectra(eXX_frxD10_03d(:,i),sampleRate);
    [~,        eXXmagSpec_frxD10_05d(:,i)] = magSpectra(eXX_frxD10_05d(:,i),sampleRate);
    [~,        eXXmagSpec_frxD10_10d(:,i)] = magSpectra(eXX_frxD10_10d(:,i),sampleRate);
    [~,        eXXmagSpec_frxD10_50d(:,i)] = magSpectra(eXX_frxD10_50d(:,i),sampleRate);
end


%% Find Maximum Value of each Magnitude Spectra Series

% =============================================================================================== %
% PARAMETER 01
% =============================================================================================== %

eXXmagSpecMax_frxD01_01d = zeros(n_probes,1);
eXXmagSpecMax_frxD01_03d = zeros(n_probes,1);
eXXmagSpecMax_frxD01_05d = zeros(n_probes,1);
eXXmagSpecMax_frxD01_10d = zeros(n_probes,1);
eXXmagSpecMax_frxD01_50d = zeros(n_probes,1);
for i = 1:n_probes
    eXXmagSpecMax_frxD01_01d(i) = max(eXXmagSpec_frxD01_01d(:,i));
    eXXmagSpecMax_frxD01_03d(i) = max(eXXmagSpec_frxD01_03d(:,i));
    eXXmagSpecMax_frxD01_05d(i) = max(eXXmagSpec_frxD01_05d(:,i));
    eXXmagSpecMax_frxD01_10d(i) = max(eXXmagSpec_frxD01_10d(:,i));
    eXXmagSpecMax_frxD01_50d(i) = max(eXXmagSpec_frxD01_50d(:,i));
end

% =============================================================================================== %
% PARAMETER 02
% =============================================================================================== %

eXXmagSpecMax_frxD02_01d = zeros(n_probes,1);
eXXmagSpecMax_frxD02_03d = zeros(n_probes,1);
eXXmagSpecMax_frxD02_05d = zeros(n_probes,1);
eXXmagSpecMax_frxD02_10d = zeros(n_probes,1);
eXXmagSpecMax_frxD02_50d = zeros(n_probes,1);
for i = 1:n_probes
    eXXmagSpecMax_frxD02_01d(i) = max(eXXmagSpec_frxD02_01d(:,i));
    eXXmagSpecMax_frxD02_03d(i) = max(eXXmagSpec_frxD02_03d(:,i));
    eXXmagSpecMax_frxD02_05d(i) = max(eXXmagSpec_frxD02_05d(:,i));
    eXXmagSpecMax_frxD02_10d(i) = max(eXXmagSpec_frxD02_10d(:,i));
    eXXmagSpecMax_frxD02_50d(i) = max(eXXmagSpec_frxD02_50d(:,i));
end

% =============================================================================================== %
% PARAMETER 03
% =============================================================================================== %

eXXmagSpecMax_frxD03_01d = zeros(n_probes,1);
eXXmagSpecMax_frxD03_03d = zeros(n_probes,1);
eXXmagSpecMax_frxD03_05d = zeros(n_probes,1);
eXXmagSpecMax_frxD03_10d = zeros(n_probes,1);
eXXmagSpecMax_frxD03_50d = zeros(n_probes,1);
for i = 1:n_probes
    eXXmagSpecMax_frxD03_01d(i) = max(eXXmagSpec_frxD03_01d(:,i));
    eXXmagSpecMax_frxD03_03d(i) = max(eXXmagSpec_frxD03_03d(:,i));
    eXXmagSpecMax_frxD03_05d(i) = max(eXXmagSpec_frxD03_05d(:,i));
    eXXmagSpecMax_frxD03_10d(i) = max(eXXmagSpec_frxD03_10d(:,i));
    eXXmagSpecMax_frxD03_50d(i) = max(eXXmagSpec_frxD03_50d(:,i));
end

% =============================================================================================== %
% PARAMETER 04
% =============================================================================================== %

eXXmagSpecMax_frxD04_01d = zeros(n_probes,1);
eXXmagSpecMax_frxD04_03d = zeros(n_probes,1);
eXXmagSpecMax_frxD04_05d = zeros(n_probes,1);
eXXmagSpecMax_frxD04_10d = zeros(n_probes,1);
eXXmagSpecMax_frxD04_50d = zeros(n_probes,1);
for i = 1:n_probes
    eXXmagSpecMax_frxD04_01d(i) = max(eXXmagSpec_frxD04_01d(:,i));
    eXXmagSpecMax_frxD04_03d(i) = max(eXXmagSpec_frxD04_03d(:,i));
    eXXmagSpecMax_frxD04_05d(i) = max(eXXmagSpec_frxD04_05d(:,i));
    eXXmagSpecMax_frxD04_10d(i) = max(eXXmagSpec_frxD04_10d(:,i));
    eXXmagSpecMax_frxD04_50d(i) = max(eXXmagSpec_frxD04_50d(:,i));
end

% =============================================================================================== %
% PARAMETER 05
% =============================================================================================== %

eXXmagSpecMax_frxD05_01d = zeros(n_probes,1);
eXXmagSpecMax_frxD05_03d = zeros(n_probes,1);
eXXmagSpecMax_frxD05_05d = zeros(n_probes,1);
eXXmagSpecMax_frxD05_10d = zeros(n_probes,1);
eXXmagSpecMax_frxD05_50d = zeros(n_probes,1);
for i = 1:n_probes
    eXXmagSpecMax_frxD05_01d(i) = max(eXXmagSpec_frxD05_01d(:,i));
    eXXmagSpecMax_frxD05_03d(i) = max(eXXmagSpec_frxD05_03d(:,i));
    eXXmagSpecMax_frxD05_05d(i) = max(eXXmagSpec_frxD05_05d(:,i));
    eXXmagSpecMax_frxD05_10d(i) = max(eXXmagSpec_frxD05_10d(:,i));
    eXXmagSpecMax_frxD05_50d(i) = max(eXXmagSpec_frxD05_50d(:,i));
end

% =============================================================================================== %
% PARAMETER 06
% =============================================================================================== %

eXXmagSpecMax_frxD06_01d = zeros(n_probes,1);
eXXmagSpecMax_frxD06_03d = zeros(n_probes,1);
eXXmagSpecMax_frxD06_05d = zeros(n_probes,1);
eXXmagSpecMax_frxD06_10d = zeros(n_probes,1);
eXXmagSpecMax_frxD06_50d = zeros(n_probes,1);
for i = 1:n_probes
    eXXmagSpecMax_frxD06_01d(i) = max(eXXmagSpec_frxD06_01d(:,i));
    eXXmagSpecMax_frxD06_03d(i) = max(eXXmagSpec_frxD06_03d(:,i));
    eXXmagSpecMax_frxD06_05d(i) = max(eXXmagSpec_frxD06_05d(:,i));
    eXXmagSpecMax_frxD06_10d(i) = max(eXXmagSpec_frxD06_10d(:,i));
    eXXmagSpecMax_frxD06_50d(i) = max(eXXmagSpec_frxD06_50d(:,i));
end

% =============================================================================================== %
% PARAMETER 07
% =============================================================================================== %

eXXmagSpecMax_frxD07_01d = zeros(n_probes,1);
eXXmagSpecMax_frxD07_03d = zeros(n_probes,1);
eXXmagSpecMax_frxD07_05d = zeros(n_probes,1);
eXXmagSpecMax_frxD07_10d = zeros(n_probes,1);
eXXmagSpecMax_frxD07_50d = zeros(n_probes,1);
for i = 1:n_probes
    eXXmagSpecMax_frxD07_01d(i) = max(eXXmagSpec_frxD07_01d(:,i));
    eXXmagSpecMax_frxD07_03d(i) = max(eXXmagSpec_frxD07_03d(:,i));
    eXXmagSpecMax_frxD07_05d(i) = max(eXXmagSpec_frxD07_05d(:,i));
    eXXmagSpecMax_frxD07_10d(i) = max(eXXmagSpec_frxD07_10d(:,i));
    eXXmagSpecMax_frxD07_50d(i) = max(eXXmagSpec_frxD07_50d(:,i));
end

% =============================================================================================== %
% PARAMETER 08
% =============================================================================================== %

eXXmagSpecMax_frxD08_01d = zeros(n_probes,1);
eXXmagSpecMax_frxD08_03d = zeros(n_probes,1);
eXXmagSpecMax_frxD08_05d = zeros(n_probes,1);
eXXmagSpecMax_frxD08_10d = zeros(n_probes,1);
eXXmagSpecMax_frxD08_50d = zeros(n_probes,1);
for i = 1:n_probes
    eXXmagSpecMax_frxD08_01d(i) = max(eXXmagSpec_frxD08_01d(:,i));
    eXXmagSpecMax_frxD08_03d(i) = max(eXXmagSpec_frxD08_03d(:,i));
    eXXmagSpecMax_frxD08_05d(i) = max(eXXmagSpec_frxD08_05d(:,i));
    eXXmagSpecMax_frxD08_10d(i) = max(eXXmagSpec_frxD08_10d(:,i));
    eXXmagSpecMax_frxD08_50d(i) = max(eXXmagSpec_frxD08_50d(:,i));
end

% =============================================================================================== %
% PARAMETER 09
% =============================================================================================== %

eXXmagSpecMax_frxD09_01d = zeros(n_probes,1);
eXXmagSpecMax_frxD09_03d = zeros(n_probes,1);
eXXmagSpecMax_frxD09_05d = zeros(n_probes,1);
eXXmagSpecMax_frxD09_10d = zeros(n_probes,1);
eXXmagSpecMax_frxD09_50d = zeros(n_probes,1);
for i = 1:n_probes
    eXXmagSpecMax_frxD09_01d(i) = max(eXXmagSpec_frxD09_01d(:,i));
    eXXmagSpecMax_frxD09_03d(i) = max(eXXmagSpec_frxD09_03d(:,i));
    eXXmagSpecMax_frxD09_05d(i) = max(eXXmagSpec_frxD09_05d(:,i));
    eXXmagSpecMax_frxD09_10d(i) = max(eXXmagSpec_frxD09_10d(:,i));
    eXXmagSpecMax_frxD09_50d(i) = max(eXXmagSpec_frxD09_50d(:,i));
end

% =============================================================================================== %
% PARAMETER 10
% =============================================================================================== %

eXXmagSpecMax_frxD10_01d = zeros(n_probes,1);
eXXmagSpecMax_frxD10_03d = zeros(n_probes,1);
eXXmagSpecMax_frxD10_05d = zeros(n_probes,1);
eXXmagSpecMax_frxD10_10d = zeros(n_probes,1);
eXXmagSpecMax_frxD10_50d = zeros(n_probes,1);
for i = 1:n_probes
    eXXmagSpecMax_frxD10_01d(i) = max(eXXmagSpec_frxD10_01d(:,i));
    eXXmagSpecMax_frxD10_03d(i) = max(eXXmagSpec_frxD10_03d(:,i));
    eXXmagSpecMax_frxD10_05d(i) = max(eXXmagSpec_frxD10_05d(:,i));
    eXXmagSpecMax_frxD10_10d(i) = max(eXXmagSpec_frxD10_10d(:,i));
    eXXmagSpecMax_frxD10_50d(i) = max(eXXmagSpec_frxD10_50d(:,i));
end

%% Time Domain Analysis ======================================================================================== %
%
% ============================================================================================================== %



%% Corelation Coef and polyfit to eXXrate_minRateDuration
% eXXrate_minRateDuration_03d_coef = (eXXrate_minRateDuration_03d(end)-eXXrate_minRateDuration_03d(1))/(r(end)-r(1)); %s/m
% eXXrate_minRateDuration_03d_polyFit = polyfit_frxD0(r,eXXrate_minRateDuration_03d,2);
% eXXrate_minRateDuration_03d_polyVal = polyval(eXXrate_minRateDuration_03d_polyFit,r);eZZrate_minRateDuration_03d_coef = (eZZrate_minRateDuration_03d(end)-eZZrate_minRateDuration_03d(1))/(r(end)-r(1)); %s/m
% eZZrate_minRateDuration_03d_polyFit = polyfit(r,eZZrate_minRateDuration_03d,2);
% eZZrate_minRateDuration_03d_polyVal = polyval(eZZrate_minRateDuration_03d_polyFit,r);