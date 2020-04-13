%% modelAnalysis2D_sweepEconf
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

tc_sweepEconf = (x_c^2)/(4*ModelParams_sweepEconf(1).D_frx);

%% Obtain absolute values of strain rates

% =============================================================================================== %
% PARAMETER 01
% =============================================================================================== %
eXXrate_Ec01_01d = abs(eXXrate_Ec01_01d);
eZZrate_Ec01_01d = abs(eZZrate_Ec01_01d);
eTXrate_Ec01_01d = abs(eTXrate_Ec01_01d);
eXXrate_Ec01_03d = abs(eXXrate_Ec01_03d);
eZZrate_Ec01_03d = abs(eZZrate_Ec01_03d);
eTXrate_Ec01_03d = abs(eTXrate_Ec01_03d);
eXXrate_Ec01_05d = abs(eXXrate_Ec01_05d);
eZZrate_Ec01_05d = abs(eZZrate_Ec01_05d);
eTXrate_Ec01_05d = abs(eTXrate_Ec01_05d);
eXXrate_Ec01_10d = abs(eXXrate_Ec01_10d);
eZZrate_Ec01_10d = abs(eZZrate_Ec01_10d);
eTXrate_Ec01_10d = abs(eTXrate_Ec01_10d);
eXXrate_Ec01_50d = abs(eXXrate_Ec01_50d);
eZZrate_Ec01_50d = abs(eZZrate_Ec01_50d);
eTXrate_Ec01_50d = abs(eTXrate_Ec01_50d);

% =============================================================================================== %
% PARAMETER 02
% =============================================================================================== %
eXXrate_Ec02_01d = abs(eXXrate_Ec02_01d);
eZZrate_Ec02_01d = abs(eZZrate_Ec02_01d);
eTXrate_Ec02_01d = abs(eTXrate_Ec02_01d);
eXXrate_Ec02_03d = abs(eXXrate_Ec02_03d);
eZZrate_Ec02_03d = abs(eZZrate_Ec02_03d);
eTXrate_Ec02_03d = abs(eTXrate_Ec02_03d);
eXXrate_Ec02_05d = abs(eXXrate_Ec02_05d);
eZZrate_Ec02_05d = abs(eZZrate_Ec02_05d);
eTXrate_Ec02_05d = abs(eTXrate_Ec02_05d);
eXXrate_Ec02_10d = abs(eXXrate_Ec02_10d);
eZZrate_Ec02_10d = abs(eZZrate_Ec02_10d);
eTXrate_Ec02_10d = abs(eTXrate_Ec02_10d);
eXXrate_Ec02_50d = abs(eXXrate_Ec02_50d);
eZZrate_Ec02_50d = abs(eZZrate_Ec02_50d);
eTXrate_Ec02_50d = abs(eTXrate_Ec02_50d);

% =============================================================================================== %
% PARAMETER 03
% =============================================================================================== %
eXXrate_Ec03_01d = abs(eXXrate_Ec03_01d);
eZZrate_Ec03_01d = abs(eZZrate_Ec03_01d);
eTXrate_Ec03_01d = abs(eTXrate_Ec03_01d);
eXXrate_Ec03_03d = abs(eXXrate_Ec03_03d);
eZZrate_Ec03_03d = abs(eZZrate_Ec03_03d);
eTXrate_Ec03_03d = abs(eTXrate_Ec03_03d);
eXXrate_Ec03_05d = abs(eXXrate_Ec03_05d);
eZZrate_Ec03_05d = abs(eZZrate_Ec03_05d);
eTXrate_Ec03_05d = abs(eTXrate_Ec03_05d);
eXXrate_Ec03_10d = abs(eXXrate_Ec03_10d);
eZZrate_Ec03_10d = abs(eZZrate_Ec03_10d);
eTXrate_Ec03_10d = abs(eTXrate_Ec03_10d);
eXXrate_Ec03_50d = abs(eXXrate_Ec03_50d);
eZZrate_Ec03_50d = abs(eZZrate_Ec03_50d);
eTXrate_Ec03_50d = abs(eTXrate_Ec03_50d);

% =============================================================================================== %
% PARAMETER 04
% =============================================================================================== %
eXXrate_Ec04_01d = abs(eXXrate_Ec04_01d);
eZZrate_Ec04_01d = abs(eZZrate_Ec04_01d);
eTXrate_Ec04_01d = abs(eTXrate_Ec04_01d);
eXXrate_Ec04_03d = abs(eXXrate_Ec04_03d);
eZZrate_Ec04_03d = abs(eZZrate_Ec04_03d);
eTXrate_Ec04_03d = abs(eTXrate_Ec04_03d);
eXXrate_Ec04_05d = abs(eXXrate_Ec04_05d);
eZZrate_Ec04_05d = abs(eZZrate_Ec04_05d);
eTXrate_Ec04_05d = abs(eTXrate_Ec04_05d);
eXXrate_Ec04_10d = abs(eXXrate_Ec04_10d);
eZZrate_Ec04_10d = abs(eZZrate_Ec04_10d);
eTXrate_Ec04_10d = abs(eTXrate_Ec04_10d);
eXXrate_Ec04_50d = abs(eXXrate_Ec04_50d);
eZZrate_Ec04_50d = abs(eZZrate_Ec04_50d);
eTXrate_Ec04_50d = abs(eTXrate_Ec04_50d);

% =============================================================================================== %
% PARAMETER 05
% =============================================================================================== %
eXXrate_Ec05_01d = abs(eXXrate_Ec05_01d);
eZZrate_Ec05_01d = abs(eZZrate_Ec05_01d);
eTXrate_Ec05_01d = abs(eTXrate_Ec05_01d);
eXXrate_Ec05_03d = abs(eXXrate_Ec05_03d);
eZZrate_Ec05_03d = abs(eZZrate_Ec05_03d);
eTXrate_Ec05_03d = abs(eTXrate_Ec05_03d);
eXXrate_Ec05_05d = abs(eXXrate_Ec05_05d);
eZZrate_Ec05_05d = abs(eZZrate_Ec05_05d);
eTXrate_Ec05_05d = abs(eTXrate_Ec05_05d);
eXXrate_Ec05_10d = abs(eXXrate_Ec05_10d);
eZZrate_Ec05_10d = abs(eZZrate_Ec05_10d);
eTXrate_Ec05_10d = abs(eTXrate_Ec05_10d);
eXXrate_Ec05_50d = abs(eXXrate_Ec05_50d);
eZZrate_Ec05_50d = abs(eZZrate_Ec05_50d);
eTXrate_Ec05_50d = abs(eTXrate_Ec05_50d);

%% Compute Magnitude Spectra
[n_samples, eXXmagSpec_Ec01_01d] = magSpectra(eXX_Ec01_01d(:,1),sampleRate);
n_samples = length(n_samples);
clear eXXmagSpec_Ec01_01d

% =============================================================================================== %
% PARAMETER 01
% =============================================================================================== %
eXXmagSpec_Ec01_01d = zeros(n_samples,n_probes);
eXXmagSpec_Ec01_03d = zeros(n_samples,n_probes);
eXXmagSpec_Ec01_05d = zeros(n_samples,n_probes);
eXXmagSpec_Ec01_10d = zeros(n_samples,n_probes);
eXXmagSpec_Ec01_50d = zeros(n_samples,n_probes);
for i = 1:n_probes
    [f_swpEconf, eXXmagSpec_Ec01_01d(:,i)] = magSpectra(eXX_Ec01_01d(:,i),sampleRate);
    [~,          eXXmagSpec_Ec01_03d(:,i)] = magSpectra(eXX_Ec01_03d(:,i),sampleRate);
    [~,          eXXmagSpec_Ec01_05d(:,i)] = magSpectra(eXX_Ec01_05d(:,i),sampleRate);
    [~,          eXXmagSpec_Ec01_10d(:,i)] = magSpectra(eXX_Ec01_10d(:,i),sampleRate);
    [~,          eXXmagSpec_Ec01_50d(:,i)] = magSpectra(eXX_Ec01_50d(:,i),sampleRate);
end

% =============================================================================================== %
% PARAMETER 02
% =============================================================================================== %
eXXmagSpec_Ec02_01d = zeros(n_samples,n_probes);
eXXmagSpec_Ec02_03d = zeros(n_samples,n_probes);
eXXmagSpec_Ec02_05d = zeros(n_samples,n_probes);
eXXmagSpec_Ec02_10d = zeros(n_samples,n_probes);
eXXmagSpec_Ec02_50d = zeros(n_samples,n_probes);
for i = 1:n_probes
    [~,        eXXmagSpec_Ec02_01d(:,i)] = magSpectra(eXX_Ec02_01d(:,i),sampleRate);
    [~,        eXXmagSpec_Ec02_03d(:,i)] = magSpectra(eXX_Ec02_03d(:,i),sampleRate);
    [~,        eXXmagSpec_Ec02_05d(:,i)] = magSpectra(eXX_Ec02_05d(:,i),sampleRate);
    [~,        eXXmagSpec_Ec02_10d(:,i)] = magSpectra(eXX_Ec02_10d(:,i),sampleRate);
    [~,        eXXmagSpec_Ec02_50d(:,i)] = magSpectra(eXX_Ec02_50d(:,i),sampleRate);
end

% =============================================================================================== %
% PARAMETER 03
% =============================================================================================== %
eXXmagSpec_Ec03_01d = zeros(n_samples,n_probes);
eXXmagSpec_Ec03_03d = zeros(n_samples,n_probes);
eXXmagSpec_Ec03_05d = zeros(n_samples,n_probes);
eXXmagSpec_Ec03_10d = zeros(n_samples,n_probes);
eXXmagSpec_Ec03_50d = zeros(n_samples,n_probes);
for i = 1:n_probes
    [~,        eXXmagSpec_Ec03_01d(:,i)] = magSpectra(eXX_Ec03_01d(:,i),sampleRate);
    [~,        eXXmagSpec_Ec03_03d(:,i)] = magSpectra(eXX_Ec03_03d(:,i),sampleRate);
    [~,        eXXmagSpec_Ec03_05d(:,i)] = magSpectra(eXX_Ec03_05d(:,i),sampleRate);
    [~,        eXXmagSpec_Ec03_10d(:,i)] = magSpectra(eXX_Ec03_10d(:,i),sampleRate);
    [~,        eXXmagSpec_Ec03_50d(:,i)] = magSpectra(eXX_Ec03_50d(:,i),sampleRate);
end

% =============================================================================================== %
% PARAMETER 04
% =============================================================================================== %
eXXmagSpec_Ec04_01d = zeros(n_samples,n_probes);
eXXmagSpec_Ec04_03d = zeros(n_samples,n_probes);
eXXmagSpec_Ec04_05d = zeros(n_samples,n_probes);
eXXmagSpec_Ec04_10d = zeros(n_samples,n_probes);
eXXmagSpec_Ec04_50d = zeros(n_samples,n_probes);
for i = 1:n_probes
    [~,        eXXmagSpec_Ec04_01d(:,i)] = magSpectra(eXX_Ec04_01d(:,i),sampleRate);
    [~,        eXXmagSpec_Ec04_03d(:,i)] = magSpectra(eXX_Ec04_03d(:,i),sampleRate);
    [~,        eXXmagSpec_Ec04_05d(:,i)] = magSpectra(eXX_Ec04_05d(:,i),sampleRate);
    [~,        eXXmagSpec_Ec04_10d(:,i)] = magSpectra(eXX_Ec04_10d(:,i),sampleRate);
    [~,        eXXmagSpec_Ec04_50d(:,i)] = magSpectra(eXX_Ec04_50d(:,i),sampleRate);
end

% =============================================================================================== %
% PARAMETER 05
% =============================================================================================== %
eXXmagSpec_Ec05_01d = zeros(n_samples,n_probes);
eXXmagSpec_Ec05_03d = zeros(n_samples,n_probes);
eXXmagSpec_Ec05_05d = zeros(n_samples,n_probes);
eXXmagSpec_Ec05_10d = zeros(n_samples,n_probes);
eXXmagSpec_Ec05_50d = zeros(n_samples,n_probes);
for i = 1:n_probes
    [~,        eXXmagSpec_Ec05_01d(:,i)] = magSpectra(eXX_Ec05_01d(:,i),sampleRate);
    [~,        eXXmagSpec_Ec05_03d(:,i)] = magSpectra(eXX_Ec05_03d(:,i),sampleRate);
    [~,        eXXmagSpec_Ec05_05d(:,i)] = magSpectra(eXX_Ec05_05d(:,i),sampleRate);
    [~,        eXXmagSpec_Ec05_10d(:,i)] = magSpectra(eXX_Ec05_10d(:,i),sampleRate);
    [~,        eXXmagSpec_Ec05_50d(:,i)] = magSpectra(eXX_Ec05_50d(:,i),sampleRate);
end

%% Find Maximum Value of each Magnitude Spectra Series

% =============================================================================================== %
% PARAMETER 01
% =============================================================================================== %

eXXmagSpecMax_Ec01_01d = zeros(n_probes,1);
eXXmagSpecMax_Ec01_03d = zeros(n_probes,1);
eXXmagSpecMax_Ec01_05d = zeros(n_probes,1);
eXXmagSpecMax_Ec01_10d = zeros(n_probes,1);
eXXmagSpecMax_Ec01_50d = zeros(n_probes,1);
for i = 1:n_probes
    eXXmagSpecMax_Ec01_01d(i) = max(eXXmagSpec_Ec01_01d(:,i));
    eXXmagSpecMax_Ec01_03d(i) = max(eXXmagSpec_Ec01_03d(:,i));
    eXXmagSpecMax_Ec01_05d(i) = max(eXXmagSpec_Ec01_05d(:,i));
    eXXmagSpecMax_Ec01_10d(i) = max(eXXmagSpec_Ec01_10d(:,i));
    eXXmagSpecMax_Ec01_50d(i) = max(eXXmagSpec_Ec01_50d(:,i));
end

% =============================================================================================== %
% PARAMETER 02
% =============================================================================================== %

eXXmagSpecMax_Ec02_01d = zeros(n_probes,1);
eXXmagSpecMax_Ec02_03d = zeros(n_probes,1);
eXXmagSpecMax_Ec02_05d = zeros(n_probes,1);
eXXmagSpecMax_Ec02_10d = zeros(n_probes,1);
eXXmagSpecMax_Ec02_50d = zeros(n_probes,1);
for i = 1:n_probes
    eXXmagSpecMax_Ec02_01d(i) = max(eXXmagSpec_Ec02_01d(:,i));
    eXXmagSpecMax_Ec02_03d(i) = max(eXXmagSpec_Ec02_03d(:,i));
    eXXmagSpecMax_Ec02_05d(i) = max(eXXmagSpec_Ec02_05d(:,i));
    eXXmagSpecMax_Ec02_10d(i) = max(eXXmagSpec_Ec02_10d(:,i));
    eXXmagSpecMax_Ec02_50d(i) = max(eXXmagSpec_Ec02_50d(:,i));
end

% =============================================================================================== %
% PARAMETER 03
% =============================================================================================== %

eXXmagSpecMax_Ec03_01d = zeros(n_probes,1);
eXXmagSpecMax_Ec03_03d = zeros(n_probes,1);
eXXmagSpecMax_Ec03_05d = zeros(n_probes,1);
eXXmagSpecMax_Ec03_10d = zeros(n_probes,1);
eXXmagSpecMax_Ec03_50d = zeros(n_probes,1);
for i = 1:n_probes
    eXXmagSpecMax_Ec03_01d(i) = max(eXXmagSpec_Ec03_01d(:,i));
    eXXmagSpecMax_Ec03_03d(i) = max(eXXmagSpec_Ec03_03d(:,i));
    eXXmagSpecMax_Ec03_05d(i) = max(eXXmagSpec_Ec03_05d(:,i));
    eXXmagSpecMax_Ec03_10d(i) = max(eXXmagSpec_Ec03_10d(:,i));
    eXXmagSpecMax_Ec03_50d(i) = max(eXXmagSpec_Ec03_50d(:,i));
end

% =============================================================================================== %
% PARAMETER 04
% =============================================================================================== %

eXXmagSpecMax_Ec04_01d = zeros(n_probes,1);
eXXmagSpecMax_Ec04_03d = zeros(n_probes,1);
eXXmagSpecMax_Ec04_05d = zeros(n_probes,1);
eXXmagSpecMax_Ec04_10d = zeros(n_probes,1);
eXXmagSpecMax_Ec04_50d = zeros(n_probes,1);
for i = 1:n_probes
    eXXmagSpecMax_Ec04_01d(i) = max(eXXmagSpec_Ec04_01d(:,i));
    eXXmagSpecMax_Ec04_03d(i) = max(eXXmagSpec_Ec04_03d(:,i));
    eXXmagSpecMax_Ec04_05d(i) = max(eXXmagSpec_Ec04_05d(:,i));
    eXXmagSpecMax_Ec04_10d(i) = max(eXXmagSpec_Ec04_10d(:,i));
    eXXmagSpecMax_Ec04_50d(i) = max(eXXmagSpec_Ec04_50d(:,i));
end

% =============================================================================================== %
% PARAMETER 05
% =============================================================================================== %

eXXmagSpecMax_Ec05_01d = zeros(n_probes,1);
eXXmagSpecMax_Ec05_03d = zeros(n_probes,1);
eXXmagSpecMax_Ec05_05d = zeros(n_probes,1);
eXXmagSpecMax_Ec05_10d = zeros(n_probes,1);
eXXmagSpecMax_Ec05_50d = zeros(n_probes,1);
for i = 1:n_probes
    eXXmagSpecMax_Ec05_01d(i) = max(eXXmagSpec_Ec05_01d(:,i));
    eXXmagSpecMax_Ec05_03d(i) = max(eXXmagSpec_Ec05_03d(:,i));
    eXXmagSpecMax_Ec05_05d(i) = max(eXXmagSpec_Ec05_05d(:,i));
    eXXmagSpecMax_Ec05_10d(i) = max(eXXmagSpec_Ec05_10d(:,i));
    eXXmagSpecMax_Ec05_50d(i) = max(eXXmagSpec_Ec05_50d(:,i));
end

%% Time Domain Analysis ======================================================================================== %
%
% ============================================================================================================== %



%% Corelation Coef and polyfit to eXXrate_minRateDuration
% eXXrate_minRateDuration_03d_coef = (eXXrate_minRateDuration_03d(end)-eXXrate_minRateDuration_03d(1))/(r(end)-r(1)); %s/m
% eXXrate_minRateDuration_03d_polyFit = polyfit_Ec0(r,eXXrate_minRateDuration_03d,2);
% eXXrate_minRateDuration_03d_polyVal = polyval(eXXrate_minRateDuration_03d_polyFit,r);eZZrate_minRateDuration_03d_coef = (eZZrate_minRateDuration_03d(end)-eZZrate_minRateDuration_03d(1))/(r(end)-r(1)); %s/m
% eZZrate_minRateDuration_03d_polyFit = polyfit(r,eZZrate_minRateDuration_03d,2);
% eZZrate_minRateDuration_03d_polyVal = polyval(eZZrate_minRateDuration_03d_polyFit,r);