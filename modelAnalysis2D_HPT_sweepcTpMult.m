%% modelAnalysis2D_sweepcTpMult
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

% Sample Rate
sampleRate_cTp = 1/tStep_cTp;

% lower detection thresholds for strain magnitude and rate
minCriteria;

%% Calculate Characteristic Parameters

% =============================================================================================== %
% Characteristic Time (t_c)
% =============================================================================================== %

tc_sweepcTpMult = (x_c^2)/(4*ModelParams_sweepcTpMult(1).D_frx);

%% Obtain absolute values of strain rates

% =============================================================================================== %
% PARAMETER 01
% =============================================================================================== %
eXXrate_cTp01_01d = abs(eXXrate_cTp01_01d);
eZZrate_cTp01_01d = abs(eZZrate_cTp01_01d);
eTXrate_cTp01_01d = abs(eTXrate_cTp01_01d);
eXXrate_cTp01_03d = abs(eXXrate_cTp01_03d);
eZZrate_cTp01_03d = abs(eZZrate_cTp01_03d);
eTXrate_cTp01_03d = abs(eTXrate_cTp01_03d);
eXXrate_cTp01_05d = abs(eXXrate_cTp01_05d);
eZZrate_cTp01_05d = abs(eZZrate_cTp01_05d);
eTXrate_cTp01_05d = abs(eTXrate_cTp01_05d);
eXXrate_cTp01_10d = abs(eXXrate_cTp01_10d);
eZZrate_cTp01_10d = abs(eZZrate_cTp01_10d);
eTXrate_cTp01_10d = abs(eTXrate_cTp01_10d);
eXXrate_cTp01_50d = abs(eXXrate_cTp01_50d);
eZZrate_cTp01_50d = abs(eZZrate_cTp01_50d);
eTXrate_cTp01_50d = abs(eTXrate_cTp01_50d);

% =============================================================================================== %
% PARAMETER 02
% =============================================================================================== %
eXXrate_cTp02_01d = abs(eXXrate_cTp02_01d);
eZZrate_cTp02_01d = abs(eZZrate_cTp02_01d);
eTXrate_cTp02_01d = abs(eTXrate_cTp02_01d);
eXXrate_cTp02_03d = abs(eXXrate_cTp02_03d);
eZZrate_cTp02_03d = abs(eZZrate_cTp02_03d);
eTXrate_cTp02_03d = abs(eTXrate_cTp02_03d);
eXXrate_cTp02_05d = abs(eXXrate_cTp02_05d);
eZZrate_cTp02_05d = abs(eZZrate_cTp02_05d);
eTXrate_cTp02_05d = abs(eTXrate_cTp02_05d);
eXXrate_cTp02_10d = abs(eXXrate_cTp02_10d);
eZZrate_cTp02_10d = abs(eZZrate_cTp02_10d);
eTXrate_cTp02_10d = abs(eTXrate_cTp02_10d);
eXXrate_cTp02_50d = abs(eXXrate_cTp02_50d);
eZZrate_cTp02_50d = abs(eZZrate_cTp02_50d);
eTXrate_cTp02_50d = abs(eTXrate_cTp02_50d);

% =============================================================================================== %
% PARAMETER 03
% =============================================================================================== %
eXXrate_cTp03_01d = abs(eXXrate_cTp03_01d);
eZZrate_cTp03_01d = abs(eZZrate_cTp03_01d);
eTXrate_cTp03_01d = abs(eTXrate_cTp03_01d);
eXXrate_cTp03_03d = abs(eXXrate_cTp03_03d);
eZZrate_cTp03_03d = abs(eZZrate_cTp03_03d);
eTXrate_cTp03_03d = abs(eTXrate_cTp03_03d);
eXXrate_cTp03_05d = abs(eXXrate_cTp03_05d);
eZZrate_cTp03_05d = abs(eZZrate_cTp03_05d);
eTXrate_cTp03_05d = abs(eTXrate_cTp03_05d);
eXXrate_cTp03_10d = abs(eXXrate_cTp03_10d);
eZZrate_cTp03_10d = abs(eZZrate_cTp03_10d);
eTXrate_cTp03_10d = abs(eTXrate_cTp03_10d);
eXXrate_cTp03_50d = abs(eXXrate_cTp03_50d);
eZZrate_cTp03_50d = abs(eZZrate_cTp03_50d);
eTXrate_cTp03_50d = abs(eTXrate_cTp03_50d);

% =============================================================================================== %
% PARAMETER 04
% =============================================================================================== %
eXXrate_cTp04_01d = abs(eXXrate_cTp04_01d);
eZZrate_cTp04_01d = abs(eZZrate_cTp04_01d);
eTXrate_cTp04_01d = abs(eTXrate_cTp04_01d);
eXXrate_cTp04_03d = abs(eXXrate_cTp04_03d);
eZZrate_cTp04_03d = abs(eZZrate_cTp04_03d);
eTXrate_cTp04_03d = abs(eTXrate_cTp04_03d);
eXXrate_cTp04_05d = abs(eXXrate_cTp04_05d);
eZZrate_cTp04_05d = abs(eZZrate_cTp04_05d);
eTXrate_cTp04_05d = abs(eTXrate_cTp04_05d);
eXXrate_cTp04_10d = abs(eXXrate_cTp04_10d);
eZZrate_cTp04_10d = abs(eZZrate_cTp04_10d);
eTXrate_cTp04_10d = abs(eTXrate_cTp04_10d);
eXXrate_cTp04_50d = abs(eXXrate_cTp04_50d);
eZZrate_cTp04_50d = abs(eZZrate_cTp04_50d);
eTXrate_cTp04_50d = abs(eTXrate_cTp04_50d);

% =============================================================================================== %
% PARAMETER 05
% =============================================================================================== %
eXXrate_cTp05_01d = abs(eXXrate_cTp05_01d);
eZZrate_cTp05_01d = abs(eZZrate_cTp05_01d);
eTXrate_cTp05_01d = abs(eTXrate_cTp05_01d);
eXXrate_cTp05_03d = abs(eXXrate_cTp05_03d);
eZZrate_cTp05_03d = abs(eZZrate_cTp05_03d);
eTXrate_cTp05_03d = abs(eTXrate_cTp05_03d);
eXXrate_cTp05_05d = abs(eXXrate_cTp05_05d);
eZZrate_cTp05_05d = abs(eZZrate_cTp05_05d);
eTXrate_cTp05_05d = abs(eTXrate_cTp05_05d);
eXXrate_cTp05_10d = abs(eXXrate_cTp05_10d);
eZZrate_cTp05_10d = abs(eZZrate_cTp05_10d);
eTXrate_cTp05_10d = abs(eTXrate_cTp05_10d);
eXXrate_cTp05_50d = abs(eXXrate_cTp05_50d);
eZZrate_cTp05_50d = abs(eZZrate_cTp05_50d);
eTXrate_cTp05_50d = abs(eTXrate_cTp05_50d);

% =============================================================================================== %
% PARAMETER 06
% =============================================================================================== %
eXXrate_cTp06_01d = abs(eXXrate_cTp06_01d);
eZZrate_cTp06_01d = abs(eZZrate_cTp06_01d);
eTXrate_cTp06_01d = abs(eTXrate_cTp06_01d);
eXXrate_cTp06_03d = abs(eXXrate_cTp06_03d);
eZZrate_cTp06_03d = abs(eZZrate_cTp06_03d);
eTXrate_cTp06_03d = abs(eTXrate_cTp06_03d);
eXXrate_cTp06_05d = abs(eXXrate_cTp06_05d);
eZZrate_cTp06_05d = abs(eZZrate_cTp06_05d);
eTXrate_cTp06_05d = abs(eTXrate_cTp06_05d);
eXXrate_cTp06_10d = abs(eXXrate_cTp06_10d);
eZZrate_cTp06_10d = abs(eZZrate_cTp06_10d);
eTXrate_cTp06_10d = abs(eTXrate_cTp06_10d);
eXXrate_cTp06_50d = abs(eXXrate_cTp06_50d);
eZZrate_cTp06_50d = abs(eZZrate_cTp06_50d);
eTXrate_cTp06_50d = abs(eTXrate_cTp06_50d);

% =============================================================================================== %
% PARAMETER 07
% =============================================================================================== %
eXXrate_cTp07_01d = abs(eXXrate_cTp07_01d);
eZZrate_cTp07_01d = abs(eZZrate_cTp07_01d);
eTXrate_cTp07_01d = abs(eTXrate_cTp07_01d);
eXXrate_cTp07_03d = abs(eXXrate_cTp07_03d);
eZZrate_cTp07_03d = abs(eZZrate_cTp07_03d);
eTXrate_cTp07_03d = abs(eTXrate_cTp07_03d);
eXXrate_cTp07_05d = abs(eXXrate_cTp07_05d);
eZZrate_cTp07_05d = abs(eZZrate_cTp07_05d);
eTXrate_cTp07_05d = abs(eTXrate_cTp07_05d);
eXXrate_cTp07_10d = abs(eXXrate_cTp07_10d);
eZZrate_cTp07_10d = abs(eZZrate_cTp07_10d);
eTXrate_cTp07_10d = abs(eTXrate_cTp07_10d);
eXXrate_cTp07_50d = abs(eXXrate_cTp07_50d);
eZZrate_cTp07_50d = abs(eZZrate_cTp07_50d);
eTXrate_cTp07_50d = abs(eTXrate_cTp07_50d);

% =============================================================================================== %
% PARAMETER 08
% =============================================================================================== %
eXXrate_cTp08_01d = abs(eXXrate_cTp08_01d);
eZZrate_cTp08_01d = abs(eZZrate_cTp08_01d);
eTXrate_cTp08_01d = abs(eTXrate_cTp08_01d);
eXXrate_cTp08_03d = abs(eXXrate_cTp08_03d);
eZZrate_cTp08_03d = abs(eZZrate_cTp08_03d);
eTXrate_cTp08_03d = abs(eTXrate_cTp08_03d);
eXXrate_cTp08_05d = abs(eXXrate_cTp08_05d);
eZZrate_cTp08_05d = abs(eZZrate_cTp08_05d);
eTXrate_cTp08_05d = abs(eTXrate_cTp08_05d);
eXXrate_cTp08_10d = abs(eXXrate_cTp08_10d);
eZZrate_cTp08_10d = abs(eZZrate_cTp08_10d);
eTXrate_cTp08_10d = abs(eTXrate_cTp08_10d);
eXXrate_cTp08_50d = abs(eXXrate_cTp08_50d);
eZZrate_cTp08_50d = abs(eZZrate_cTp08_50d);
eTXrate_cTp08_50d = abs(eTXrate_cTp08_50d);

%% Compute Magnitude Spectra

[n_samples, eXXmagSpec_cTp01_01d] = magSpectra(eXX_cTp01_01d(:,1),sampleRate_cTp);
n_samples = length(n_samples);
clear eXXmagSpec_cTp01_01d

% =============================================================================================== %
% PARAMETER 01
% =============================================================================================== %

eXXmagSpec_cTp01_01d = zeros(n_samples,n_probes);
eXXmagSpec_cTp01_03d = zeros(n_samples,n_probes);
eXXmagSpec_cTp01_05d = zeros(n_samples,n_probes);
eXXmagSpec_cTp01_10d = zeros(n_samples,n_probes);
eXXmagSpec_cTp01_50d = zeros(n_samples,n_probes);
for i = 1:n_probes
    [f_swpcTpMult, eXXmagSpec_cTp01_01d(:,i)] = magSpectra(eXX_cTp01_01d(:,i),sampleRate_cTp);
    [~,            eXXmagSpec_cTp01_03d(:,i)] = magSpectra(eXX_cTp01_03d(:,i),sampleRate_cTp);
    [~,            eXXmagSpec_cTp01_05d(:,i)] = magSpectra(eXX_cTp01_05d(:,i),sampleRate_cTp);
    [~,            eXXmagSpec_cTp01_10d(:,i)] = magSpectra(eXX_cTp01_10d(:,i),sampleRate_cTp);
    [~,            eXXmagSpec_cTp01_50d(:,i)] = magSpectra(eXX_cTp01_50d(:,i),sampleRate_cTp);
end

% =============================================================================================== %
% PARAMETER 02
% =============================================================================================== %
eXXmagSpec_cTp02_01d = zeros(n_samples,n_probes);
eXXmagSpec_cTp02_03d = zeros(n_samples,n_probes);
eXXmagSpec_cTp02_05d = zeros(n_samples,n_probes);
eXXmagSpec_cTp02_10d = zeros(n_samples,n_probes);
eXXmagSpec_cTp02_50d = zeros(n_samples,n_probes);
for i = 1:n_probes
    [~,        eXXmagSpec_cTp02_01d(:,i)] = magSpectra(eXX_cTp02_01d(:,i),sampleRate_cTp);
    [~,        eXXmagSpec_cTp02_03d(:,i)] = magSpectra(eXX_cTp02_03d(:,i),sampleRate_cTp);
    [~,        eXXmagSpec_cTp02_05d(:,i)] = magSpectra(eXX_cTp02_05d(:,i),sampleRate_cTp);
    [~,        eXXmagSpec_cTp02_10d(:,i)] = magSpectra(eXX_cTp02_10d(:,i),sampleRate_cTp);
    [~,        eXXmagSpec_cTp02_50d(:,i)] = magSpectra(eXX_cTp02_50d(:,i),sampleRate_cTp);
end

% =============================================================================================== %
% PARAMETER 03
% =============================================================================================== %
eXXmagSpec_cTp03_01d = zeros(n_samples,n_probes);
eXXmagSpec_cTp03_03d = zeros(n_samples,n_probes);
eXXmagSpec_cTp03_05d = zeros(n_samples,n_probes);
eXXmagSpec_cTp03_10d = zeros(n_samples,n_probes);
eXXmagSpec_cTp03_50d = zeros(n_samples,n_probes);
for i = 1:n_probes
    [~,        eXXmagSpec_cTp03_01d(:,i)] = magSpectra(eXX_cTp03_01d(:,i),sampleRate_cTp);
    [~,        eXXmagSpec_cTp03_03d(:,i)] = magSpectra(eXX_cTp03_03d(:,i),sampleRate_cTp);
    [~,        eXXmagSpec_cTp03_05d(:,i)] = magSpectra(eXX_cTp03_05d(:,i),sampleRate_cTp);
    [~,        eXXmagSpec_cTp03_10d(:,i)] = magSpectra(eXX_cTp03_10d(:,i),sampleRate_cTp);
    [~,        eXXmagSpec_cTp03_50d(:,i)] = magSpectra(eXX_cTp03_50d(:,i),sampleRate_cTp);
end

% =============================================================================================== %
% PARAMETER 04
% =============================================================================================== %
eXXmagSpec_cTp04_01d = zeros(n_samples,n_probes);
eXXmagSpec_cTp04_03d = zeros(n_samples,n_probes);
eXXmagSpec_cTp04_05d = zeros(n_samples,n_probes);
eXXmagSpec_cTp04_10d = zeros(n_samples,n_probes);
eXXmagSpec_cTp04_50d = zeros(n_samples,n_probes);
for i = 1:n_probes
    [~,        eXXmagSpec_cTp04_01d(:,i)] = magSpectra(eXX_cTp04_01d(:,i),sampleRate_cTp);
    [~,        eXXmagSpec_cTp04_03d(:,i)] = magSpectra(eXX_cTp04_03d(:,i),sampleRate_cTp);
    [~,        eXXmagSpec_cTp04_05d(:,i)] = magSpectra(eXX_cTp04_05d(:,i),sampleRate_cTp);
    [~,        eXXmagSpec_cTp04_10d(:,i)] = magSpectra(eXX_cTp04_10d(:,i),sampleRate_cTp);
    [~,        eXXmagSpec_cTp04_50d(:,i)] = magSpectra(eXX_cTp04_50d(:,i),sampleRate_cTp);
end

% =============================================================================================== %
% PARAMETER 05
% =============================================================================================== %
eXXmagSpec_cTp05_01d = zeros(n_samples,n_probes);
eXXmagSpec_cTp05_03d = zeros(n_samples,n_probes);
eXXmagSpec_cTp05_05d = zeros(n_samples,n_probes);
eXXmagSpec_cTp05_10d = zeros(n_samples,n_probes);
eXXmagSpec_cTp05_50d = zeros(n_samples,n_probes);
for i = 1:n_probes
    [~,        eXXmagSpec_cTp05_01d(:,i)] = magSpectra(eXX_cTp05_01d(:,i),sampleRate_cTp);
    [~,        eXXmagSpec_cTp05_03d(:,i)] = magSpectra(eXX_cTp05_03d(:,i),sampleRate_cTp);
    [~,        eXXmagSpec_cTp05_05d(:,i)] = magSpectra(eXX_cTp05_05d(:,i),sampleRate_cTp);
    [~,        eXXmagSpec_cTp05_10d(:,i)] = magSpectra(eXX_cTp05_10d(:,i),sampleRate_cTp);
    [~,        eXXmagSpec_cTp05_50d(:,i)] = magSpectra(eXX_cTp05_50d(:,i),sampleRate_cTp);
end

% =============================================================================================== %
% PARAMETER 06
% =============================================================================================== %
eXXmagSpec_cTp06_01d = zeros(n_samples,n_probes);
eXXmagSpec_cTp06_03d = zeros(n_samples,n_probes);
eXXmagSpec_cTp06_05d = zeros(n_samples,n_probes);
eXXmagSpec_cTp06_10d = zeros(n_samples,n_probes);
eXXmagSpec_cTp06_50d = zeros(n_samples,n_probes);
for i = 1:n_probes
    [~,        eXXmagSpec_cTp06_01d(:,i)] = magSpectra(eXX_cTp06_01d(:,i),sampleRate_cTp);
    [~,        eXXmagSpec_cTp06_03d(:,i)] = magSpectra(eXX_cTp06_03d(:,i),sampleRate_cTp);
    [~,        eXXmagSpec_cTp06_05d(:,i)] = magSpectra(eXX_cTp06_05d(:,i),sampleRate_cTp);
    [~,        eXXmagSpec_cTp06_10d(:,i)] = magSpectra(eXX_cTp06_10d(:,i),sampleRate_cTp);
    [~,        eXXmagSpec_cTp06_50d(:,i)] = magSpectra(eXX_cTp06_50d(:,i),sampleRate_cTp);
end

% =============================================================================================== %
% PARAMETER 07
% =============================================================================================== %
eXXmagSpec_cTp07_01d = zeros(n_samples,n_probes);
eXXmagSpec_cTp07_03d = zeros(n_samples,n_probes);
eXXmagSpec_cTp07_05d = zeros(n_samples,n_probes);
eXXmagSpec_cTp07_10d = zeros(n_samples,n_probes);
eXXmagSpec_cTp07_50d = zeros(n_samples,n_probes);
for i = 1:n_probes
    [~,        eXXmagSpec_cTp07_01d(:,i)] = magSpectra(eXX_cTp07_01d(:,i),sampleRate_cTp);
    [~,        eXXmagSpec_cTp07_03d(:,i)] = magSpectra(eXX_cTp07_03d(:,i),sampleRate_cTp);
    [~,        eXXmagSpec_cTp07_05d(:,i)] = magSpectra(eXX_cTp07_05d(:,i),sampleRate_cTp);
    [~,        eXXmagSpec_cTp07_10d(:,i)] = magSpectra(eXX_cTp07_10d(:,i),sampleRate_cTp);
    [~,        eXXmagSpec_cTp07_50d(:,i)] = magSpectra(eXX_cTp07_50d(:,i),sampleRate_cTp);
end

% =============================================================================================== %
% PARAMETER 08
% =============================================================================================== %
eXXmagSpec_cTp08_01d = zeros(n_samples,n_probes);
eXXmagSpec_cTp08_03d = zeros(n_samples,n_probes);
eXXmagSpec_cTp08_05d = zeros(n_samples,n_probes);
eXXmagSpec_cTp08_10d = zeros(n_samples,n_probes);
eXXmagSpec_cTp08_50d = zeros(n_samples,n_probes);
for i = 1:n_probes
    [~,        eXXmagSpec_cTp08_01d(:,i)] = magSpectra(eXX_cTp08_01d(:,i),sampleRate_cTp);
    [~,        eXXmagSpec_cTp08_03d(:,i)] = magSpectra(eXX_cTp08_03d(:,i),sampleRate_cTp);
    [~,        eXXmagSpec_cTp08_05d(:,i)] = magSpectra(eXX_cTp08_05d(:,i),sampleRate_cTp);
    [~,        eXXmagSpec_cTp08_10d(:,i)] = magSpectra(eXX_cTp08_10d(:,i),sampleRate_cTp);
    [~,        eXXmagSpec_cTp08_50d(:,i)] = magSpectra(eXX_cTp08_50d(:,i),sampleRate_cTp);
end

%% Find Maximum Value of each Magnitude Spectra Series

% =============================================================================================== %
% PARAMETER 01
% =============================================================================================== %

eXXmagSpecMax_cTp01_01d = zeros(n_probes,1);
eXXmagSpecMax_cTp01_03d = zeros(n_probes,1);
eXXmagSpecMax_cTp01_05d = zeros(n_probes,1);
eXXmagSpecMax_cTp01_10d = zeros(n_probes,1);
eXXmagSpecMax_cTp01_50d = zeros(n_probes,1);
for i = 1:n_probes
    eXXmagSpecMax_cTp01_01d(i) = max(eXXmagSpec_cTp01_01d(:,i));
    eXXmagSpecMax_cTp01_03d(i) = max(eXXmagSpec_cTp01_03d(:,i));
    eXXmagSpecMax_cTp01_05d(i) = max(eXXmagSpec_cTp01_05d(:,i));
    eXXmagSpecMax_cTp01_10d(i) = max(eXXmagSpec_cTp01_10d(:,i));
    eXXmagSpecMax_cTp01_50d(i) = max(eXXmagSpec_cTp01_50d(:,i));
end

% =============================================================================================== %
% PARAMETER 02
% =============================================================================================== %

eXXmagSpecMax_cTp02_01d = zeros(n_probes,1);
eXXmagSpecMax_cTp02_03d = zeros(n_probes,1);
eXXmagSpecMax_cTp02_05d = zeros(n_probes,1);
eXXmagSpecMax_cTp02_10d = zeros(n_probes,1);
eXXmagSpecMax_cTp02_50d = zeros(n_probes,1);
for i = 1:n_probes
    eXXmagSpecMax_cTp02_01d(i) = max(eXXmagSpec_cTp02_01d(:,i));
    eXXmagSpecMax_cTp02_03d(i) = max(eXXmagSpec_cTp02_03d(:,i));
    eXXmagSpecMax_cTp02_05d(i) = max(eXXmagSpec_cTp02_05d(:,i));
    eXXmagSpecMax_cTp02_10d(i) = max(eXXmagSpec_cTp02_10d(:,i));
    eXXmagSpecMax_cTp02_50d(i) = max(eXXmagSpec_cTp02_50d(:,i));
end

% =============================================================================================== %
% PARAMETER 03
% =============================================================================================== %

eXXmagSpecMax_cTp03_01d = zeros(n_probes,1);
eXXmagSpecMax_cTp03_03d = zeros(n_probes,1);
eXXmagSpecMax_cTp03_05d = zeros(n_probes,1);
eXXmagSpecMax_cTp03_10d = zeros(n_probes,1);
eXXmagSpecMax_cTp03_50d = zeros(n_probes,1);
for i = 1:n_probes
    eXXmagSpecMax_cTp03_01d(i) = max(eXXmagSpec_cTp03_01d(:,i));
    eXXmagSpecMax_cTp03_03d(i) = max(eXXmagSpec_cTp03_03d(:,i));
    eXXmagSpecMax_cTp03_05d(i) = max(eXXmagSpec_cTp03_05d(:,i));
    eXXmagSpecMax_cTp03_10d(i) = max(eXXmagSpec_cTp03_10d(:,i));
    eXXmagSpecMax_cTp03_50d(i) = max(eXXmagSpec_cTp03_50d(:,i));
end

% =============================================================================================== %
% PARAMETER 04
% =============================================================================================== %

eXXmagSpecMax_cTp04_01d = zeros(n_probes,1);
eXXmagSpecMax_cTp04_03d = zeros(n_probes,1);
eXXmagSpecMax_cTp04_05d = zeros(n_probes,1);
eXXmagSpecMax_cTp04_10d = zeros(n_probes,1);
eXXmagSpecMax_cTp04_50d = zeros(n_probes,1);
for i = 1:n_probes
    eXXmagSpecMax_cTp04_01d(i) = max(eXXmagSpec_cTp04_01d(:,i));
    eXXmagSpecMax_cTp04_03d(i) = max(eXXmagSpec_cTp04_03d(:,i));
    eXXmagSpecMax_cTp04_05d(i) = max(eXXmagSpec_cTp04_05d(:,i));
    eXXmagSpecMax_cTp04_10d(i) = max(eXXmagSpec_cTp04_10d(:,i));
    eXXmagSpecMax_cTp04_50d(i) = max(eXXmagSpec_cTp04_50d(:,i));
end

% =============================================================================================== %
% PARAMETER 05
% =============================================================================================== %

eXXmagSpecMax_cTp05_01d = zeros(n_probes,1);
eXXmagSpecMax_cTp05_03d = zeros(n_probes,1);
eXXmagSpecMax_cTp05_05d = zeros(n_probes,1);
eXXmagSpecMax_cTp05_10d = zeros(n_probes,1);
eXXmagSpecMax_cTp05_50d = zeros(n_probes,1);
for i = 1:n_probes
    eXXmagSpecMax_cTp05_01d(i) = max(eXXmagSpec_cTp05_01d(:,i));
    eXXmagSpecMax_cTp05_03d(i) = max(eXXmagSpec_cTp05_03d(:,i));
    eXXmagSpecMax_cTp05_05d(i) = max(eXXmagSpec_cTp05_05d(:,i));
    eXXmagSpecMax_cTp05_10d(i) = max(eXXmagSpec_cTp05_10d(:,i));
    eXXmagSpecMax_cTp05_50d(i) = max(eXXmagSpec_cTp05_50d(:,i));
end

% =============================================================================================== %
% PARAMETER 06
% =============================================================================================== %

eXXmagSpecMax_cTp06_01d = zeros(n_probes,1);
eXXmagSpecMax_cTp06_03d = zeros(n_probes,1);
eXXmagSpecMax_cTp06_05d = zeros(n_probes,1);
eXXmagSpecMax_cTp06_10d = zeros(n_probes,1);
eXXmagSpecMax_cTp06_50d = zeros(n_probes,1);
for i = 1:n_probes
    eXXmagSpecMax_cTp06_01d(i) = max(eXXmagSpec_cTp06_01d(:,i));
    eXXmagSpecMax_cTp06_03d(i) = max(eXXmagSpec_cTp06_03d(:,i));
    eXXmagSpecMax_cTp06_05d(i) = max(eXXmagSpec_cTp06_05d(:,i));
    eXXmagSpecMax_cTp06_10d(i) = max(eXXmagSpec_cTp06_10d(:,i));
    eXXmagSpecMax_cTp06_50d(i) = max(eXXmagSpec_cTp06_50d(:,i));
end

% =============================================================================================== %
% PARAMETER 07
% =============================================================================================== %

eXXmagSpecMax_cTp07_01d = zeros(n_probes,1);
eXXmagSpecMax_cTp07_03d = zeros(n_probes,1);
eXXmagSpecMax_cTp07_05d = zeros(n_probes,1);
eXXmagSpecMax_cTp07_10d = zeros(n_probes,1);
eXXmagSpecMax_cTp07_50d = zeros(n_probes,1);
for i = 1:n_probes
    eXXmagSpecMax_cTp07_01d(i) = max(eXXmagSpec_cTp07_01d(:,i));
    eXXmagSpecMax_cTp07_03d(i) = max(eXXmagSpec_cTp07_03d(:,i));
    eXXmagSpecMax_cTp07_05d(i) = max(eXXmagSpec_cTp07_05d(:,i));
    eXXmagSpecMax_cTp07_10d(i) = max(eXXmagSpec_cTp07_10d(:,i));
    eXXmagSpecMax_cTp07_50d(i) = max(eXXmagSpec_cTp07_50d(:,i));
end

% =============================================================================================== %
% PARAMETER 08
% =============================================================================================== %

eXXmagSpecMax_cTp08_01d = zeros(n_probes,1);
eXXmagSpecMax_cTp08_03d = zeros(n_probes,1);
eXXmagSpecMax_cTp08_05d = zeros(n_probes,1);
eXXmagSpecMax_cTp08_10d = zeros(n_probes,1);
eXXmagSpecMax_cTp08_50d = zeros(n_probes,1);
for i = 1:n_probes
    eXXmagSpecMax_cTp08_01d(i) = max(eXXmagSpec_cTp08_01d(:,i));
    eXXmagSpecMax_cTp08_03d(i) = max(eXXmagSpec_cTp08_03d(:,i));
    eXXmagSpecMax_cTp08_05d(i) = max(eXXmagSpec_cTp08_05d(:,i));
    eXXmagSpecMax_cTp08_10d(i) = max(eXXmagSpec_cTp08_10d(:,i));
    eXXmagSpecMax_cTp08_50d(i) = max(eXXmagSpec_cTp08_50d(:,i));
end

%% Time Domain Analysis ======================================================================================== %
%
% ============================================================================================================== %



%% Corelation Coef and polyfit to eXXrate_minRateDuration
% eXXrate_minRateDuration_03d_coef = (eXXrate_minRateDuration_03d(end)-eXXrate_minRateDuration_03d(1))/(r(end)-r(1)); %s/m
% eXXrate_minRateDuration_03d_polyFit = polyfit_cTp0(r,eXXrate_minRateDuration_03d,2);
% eXXrate_minRateDuration_03d_polyVal = polyval(eXXrate_minRateDuration_03d_polyFit,r);eZZrate_minRateDuration_03d_coef = (eZZrate_minRateDuration_03d(end)-eZZrate_minRateDuration_03d(1))/(r(end)-r(1)); %s/m
% eZZrate_minRateDuration_03d_polyFit = polyfit(r,eZZrate_minRateDuration_03d,2);
% eZZrate_minRateDuration_03d_polyVal = polyval(eZZrate_minRateDuration_03d_polyFit,r);