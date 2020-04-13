%% modelAnalysis2D_frxSurf_bln
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

%% Calculate Characteristic Parameters

% Characteristic Length
x_c = ModelParams_bln(1).x_c; % [m]

% Characteristic Time
tc_frx_bln = (x_c^2)/(4*ModelParams_bln(1).D_frx);
% tc_frx_bln = tc_frx_bln/86400;

%% Define Key Values ============================================================================ %
%
% =============================================================================================== %

% load probe information
probeInfo;

% lower detection thresholds for strain magnitude and rate
minCriteria;

% Simulation Sample Rate
sampleRate = 1/tStep;

%% Obtain absolute values of strain rates

eXXrate_bln_01d = abs(eXXrate_bln_01d);
eZZrate_bln_01d = abs(eZZrate_bln_01d);
eTXrate_bln_01d = abs(eTXrate_bln_01d);
eXXrate_bln_03d = abs(eXXrate_bln_03d);
eZZrate_bln_03d = abs(eZZrate_bln_03d);
eTXrate_bln_03d = abs(eTXrate_bln_03d);
eXXrate_bln_05d = abs(eXXrate_bln_05d);
eZZrate_bln_05d = abs(eZZrate_bln_05d);
eTXrate_bln_05d = abs(eTXrate_bln_05d);
eXXrate_bln_10d = abs(eXXrate_bln_10d);
eZZrate_bln_10d = abs(eZZrate_bln_10d);
eTXrate_bln_10d = abs(eTXrate_bln_10d);
eXXrate_bln_50d = abs(eXXrate_bln_50d);
eZZrate_bln_50d = abs(eZZrate_bln_50d);
eTXrate_bln_50d = abs(eTXrate_bln_50d);

%% Compute Magnitude Spectra

% Obtain length of magSpectra
[f_bln, eXXmagSpec_bln_01d] = magSpectra(eXX_bln_01d,sampleRate);
n_samples = length(eXXmagSpec_bln_01d);
clear eXXmagSpec_bln_01d

eXXmagSpec_bln_01d = zeros(n_samples,n_probes);
eXXmagSpec_bln_03d = zeros(n_samples,n_probes);
eXXmagSpec_bln_05d = zeros(n_samples,n_probes);
eXXmagSpec_bln_10d = zeros(n_samples,n_probes);
eXXmagSpec_bln_50d = zeros(n_samples,n_probes);
for i = 1:n_probes
    [f_bln, eXXmagSpec_bln_01d(:,i)] = magSpectra(eXX_bln_01d(:,i),sampleRate);
    [~,     eXXmagSpec_bln_03d(:,i)] = magSpectra(eXX_bln_03d(:,i),sampleRate);
    [~,     eXXmagSpec_bln_05d(:,i)] = magSpectra(eXX_bln_05d(:,i),sampleRate);
    [~,     eXXmagSpec_bln_10d(:,i)] = magSpectra(eXX_bln_10d(:,i),sampleRate);
    [~,     eXXmagSpec_bln_50d(:,i)] = magSpectra(eXX_bln_50d(:,i),sampleRate);
end


%% Find Maximum Value of each Magnitude Spectra Series

eXXmagSpecMax_bln_01d = zeros(n_probes,1);
eXXmagSpecMax_bln_03d = zeros(n_probes,1);
eXXmagSpecMax_bln_05d = zeros(n_probes,1);
eXXmagSpecMax_bln_10d = zeros(n_probes,1);
eXXmagSpecMax_bln_50d = zeros(n_probes,1);
for i = 1:n_probes
    eXXmagSpecMax_bln_01d(i) = max(eXXmagSpec_bln_01d(:,i));
    eXXmagSpecMax_bln_03d(i) = max(eXXmagSpec_bln_03d(:,i));
    eXXmagSpecMax_bln_05d(i) = max(eXXmagSpec_bln_05d(:,i));
    eXXmagSpecMax_bln_10d(i) = max(eXXmagSpec_bln_10d(:,i));
    eXXmagSpecMax_bln_50d(i) = max(eXXmagSpec_bln_50d(:,i));
end

%% Find Time at which Maximum Value of Magnitude Spectra Occurs

t_eXXmagSpecMax_bln_01d = zeros(n_probes,1);
t_eXXmagSpecMax_bln_03d = zeros(n_probes,1);
t_eXXmagSpecMax_bln_05d = zeros(n_probes,1);
t_eXXmagSpecMax_bln_10d = zeros(n_probes,1);
t_eXXmagSpecMax_bln_50d = zeros(n_probes,1);
for i = 1:n_probes
    t_eXXmagSpecMax_bln_01d(i) = t(find(eXXmagSpec_bln_01d(:,i) == eXXmagSpecMax_bln_01d(i)));
    t_eXXmagSpecMax_bln_03d(i) = t(find(eXXmagSpec_bln_03d(:,i) == eXXmagSpecMax_bln_03d(i)));
    t_eXXmagSpecMax_bln_05d(i) = t(find(eXXmagSpec_bln_05d(:,i) == eXXmagSpecMax_bln_05d(i)));
    t_eXXmagSpecMax_bln_10d(i) = t(find(eXXmagSpec_bln_10d(:,i) == eXXmagSpecMax_bln_10d(i)));
    t_eXXmagSpecMax_bln_50d(i) = t(find(eXXmagSpec_bln_50d(:,i) == eXXmagSpecMax_bln_50d(i)));
end


%% Corelation Coef and polyfit to eXXrate_minRateDuration
% eXXrate_minRateDuration_03d_coef = (eXXrate_minRateDuration_03d(end)-eXXrate_minRateDuration_03d(1))/(r(end)-r(1)); %s/m
% eXXrate_minRateDuration_03d_polyFit = polyfit(r,eXXrate_minRateDuration_03d,2);
% eXXrate_minRateDuration_03d_polyVal = polyval(eXXrate_minRateDuration_03d_polyFit,r);eZZrate_minRateDuration_03d_coef = (eZZrate_minRateDuration_03d(end)-eZZrate_minRateDuration_03d(1))/(r(end)-r(1)); %s/m
% eZZrate_minRateDuration_03d_polyFit = polyfit(r,eZZrate_minRateDuration_03d,2);
% eZZrate_minRateDuration_03d_polyVal = polyval(eZZrate_minRateDuration_03d_polyFit,r);
% 
% % Plot Results
% figure('Name','eXXrate_minRateDuration','NumberTitle','off');
% plot(r,eXXrate_minRateDuration_03d,'o-b','LineWidth',3);grid on
% hold on
% plot(r,eXXrate_minRateDuration_03d_polyVal,'r','LineWidth',3)
% hold off
% title('Horizontal Strain Rate with Radial Distance from Frx','FontSize',18)
% ylabel('Duration eXX > eXX_minRate [d]','FontSize',18)
% xlabel('Radial Distance [% of depth]','FontSize',18)
% 
% plotModelData;
