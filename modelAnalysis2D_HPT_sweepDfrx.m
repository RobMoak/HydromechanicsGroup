%% modelAnalysis2D_sweepDfrx
% Author: R. Moak
% Date: 03/05/20

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
minMag = 1E-9; 
minRate = 1E-13; 

%% Calculate Characteristic Parameters

% ===============================================================================================%
% Characteristic Length (x_c)
% ===============================================================================================%
x_c = ModelParams_sweepDfrx(1).x_c; % [m]

% radial distances of probe locations (% of x_c)
r = [x_c*0.05; x_c*0.25; x_c*0.5; x_c; x_c*1.1; x_c*1.25]; 

% ===============================================================================================%
% Characteristic Time (t_c)
% ===============================================================================================%

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

%% Compute Magnitude Spectra

% parameter 01
[f_frxD01,    eXXmagSpec_05w03d_frxD01] = magSpectraWF(eXX_frxD01_03d(:,1),sampleRate_bln);
[~,           eXXmagSpec_25w03d_frxD01] = magSpectraWF(eXX_frxD01_03d(:,2),sampleRate_bln);
[~,           eXXmagSpec_50w03d_frxD01] = magSpectraWF(eXX_frxD01_03d(:,3),sampleRate_bln);
[~,           eXXmagSpec_100w03d_frxD01] = magSpectraWF(eXX_frxD01_03d(:,4),sampleRate_bln);

eXXmagSpec_frxD01_03d = [eXXmagSpec_05w03d_frxD01 eXXmagSpec_25w03d_frxD01 eXXmagSpec_50w03d_frxD01 eXXmagSpec_100w03d_frxD01];
clear eXXmagSpec_05w03d_frxD01 eXXmagSpec_25w03d_frxD01 eXXmagSpec_50w03d_frxD01 eXXmagSpec_100w03d_frxD01

% parameter 02
[f_frxD02,    eXXmagSpec_05w03d_frxD02] = magSpectraWF(eXX_frxD02_03d(:,1),sampleRate_bln);
[~,           eXXmagSpec_25w03d_frxD02] = magSpectraWF(eXX_frxD02_03d(:,2),sampleRate_bln);
[~,           eXXmagSpec_50w03d_frxD02] = magSpectraWF(eXX_frxD02_03d(:,3),sampleRate_bln);
[~,           eXXmagSpec_100w03d_frxD02] = magSpectraWF(eXX_frxD02_03d(:,4),sampleRate_bln);

eXXmagSpec_frxD02_03d = [eXXmagSpec_05w03d_frxD02 eXXmagSpec_25w03d_frxD02 eXXmagSpec_50w03d_frxD02 eXXmagSpec_100w03d_frxD02];
clear eXXmagSpec_05w03d_frxD02 eXXmagSpec_25w03d_frxD02 eXXmagSpec_50w03d_frxD02 eXXmagSpec_100w03d_frxD02

% parameter 03
[f_frxD03,    eXXmagSpec_05w03d_frxD03] = magSpectraWF(eXX_frxD03_03d(:,1),sampleRate_bln);
[~,           eXXmagSpec_25w03d_frxD03] = magSpectraWF(eXX_frxD03_03d(:,2),sampleRate_bln);
[~,           eXXmagSpec_50w03d_frxD03] = magSpectraWF(eXX_frxD03_03d(:,3),sampleRate_bln);
[~,           eXXmagSpec_100w03d_frxD03] = magSpectraWF(eXX_frxD03_03d(:,4),sampleRate_bln);

eXXmagSpec_frxD03_03d = [eXXmagSpec_05w03d_frxD03 eXXmagSpec_25w03d_frxD03 eXXmagSpec_50w03d_frxD03 eXXmagSpec_100w03d_frxD03];
clear eXXmagSpec_05w03d_frxD03 eXXmagSpec_25w03d_frxD03 eXXmagSpec_50w03d_frxD03 eXXmagSpec_100w03d_frxD03

% parameter 04
[f_frxD04,    eXXmagSpec_05w03d_frxD04] = magSpectraWF(eXX_frxD04_03d(:,1),sampleRate_bln);
[~,           eXXmagSpec_25w03d_frxD04] = magSpectraWF(eXX_frxD04_03d(:,2),sampleRate_bln);
[~,           eXXmagSpec_50w03d_frxD04] = magSpectraWF(eXX_frxD04_03d(:,3),sampleRate_bln);
[~,           eXXmagSpec_100w03d_frxD04] = magSpectraWF(eXX_frxD04_03d(:,4),sampleRate_bln);

eXXmagSpec_frxD04_03d = [eXXmagSpec_05w03d_frxD04 eXXmagSpec_25w03d_frxD04 eXXmagSpec_50w03d_frxD04 eXXmagSpec_100w03d_frxD04];
clear eXXmagSpec_05w03d_frxD04 eXXmagSpec_25w03d_frxD04 eXXmagSpec_50w03d_frxD04 eXXmagSpec_100w03d_frxD04

% parameter 05
[f_frxD05,    eXXmagSpec_05w03d_frxD05] = magSpectraWF(eXX_frxD05_03d(:,1),sampleRate_bln);
[~,           eXXmagSpec_25w03d_frxD05] = magSpectraWF(eXX_frxD05_03d(:,2),sampleRate_bln);
[~,           eXXmagSpec_50w03d_frxD05] = magSpectraWF(eXX_frxD05_03d(:,3),sampleRate_bln);
[~,           eXXmagSpec_100w03d_frxD05] = magSpectraWF(eXX_frxD05_03d(:,4),sampleRate_bln);

eXXmagSpec_frxD05_03d = [eXXmagSpec_05w03d_frxD05 eXXmagSpec_25w03d_frxD05 eXXmagSpec_50w03d_frxD05 eXXmagSpec_100w03d_frxD05];
clear eXXmagSpec_05w03d_frxD05 eXXmagSpec_25w03d_frxD05 eXXmagSpec_50w03d_frxD05 eXXmagSpec_100w03d_frxD05

% parameter 06
[f_frxD06,    eXXmagSpec_05w03d_frxD06] = magSpectraWF(eXX_frxD06_03d(:,1),sampleRate_bln);
[~,           eXXmagSpec_25w03d_frxD06] = magSpectraWF(eXX_frxD06_03d(:,2),sampleRate_bln);
[~,           eXXmagSpec_50w03d_frxD06] = magSpectraWF(eXX_frxD06_03d(:,3),sampleRate_bln);
[~,           eXXmagSpec_100w03d_frxD06] = magSpectraWF(eXX_frxD06_03d(:,4),sampleRate_bln);

eXXmagSpec_frxD06_03d = [eXXmagSpec_05w03d_frxD06 eXXmagSpec_25w03d_frxD06 eXXmagSpec_50w03d_frxD06 eXXmagSpec_100w03d_frxD06];
clear eXXmagSpec_05w03d_frxD06 eXXmagSpec_25w03d_frxD06 eXXmagSpec_50w03d_frxD06 eXXmagSpec_100w03d_frxD06

% parameter 07
[f_frxD07,    eXXmagSpec_05w03d_frxD07] = magSpectraWF(eXX_frxD07_03d(:,1),sampleRate_bln);
[~,           eXXmagSpec_25w03d_frxD07] = magSpectraWF(eXX_frxD07_03d(:,2),sampleRate_bln);
[~,           eXXmagSpec_50w03d_frxD07] = magSpectraWF(eXX_frxD07_03d(:,3),sampleRate_bln);
[~,           eXXmagSpec_100w03d_frxD07] = magSpectraWF(eXX_frxD07_03d(:,4),sampleRate_bln);

eXXmagSpec_frxD07_03d = [eXXmagSpec_05w03d_frxD07 eXXmagSpec_25w03d_frxD07 eXXmagSpec_50w03d_frxD07 eXXmagSpec_100w03d_frxD07];
clear eXXmagSpec_05w03d_frxD07 eXXmagSpec_25w03d_frxD07 eXXmagSpec_50w03d_frxD07 eXXmagSpec_100w03d_frxD07

% parameter 08
[f_frxD08,    eXXmagSpec_05w03d_frxD08] = magSpectraWF(eXX_frxD08_03d(:,1),sampleRate_bln);
[~,           eXXmagSpec_25w03d_frxD08] = magSpectraWF(eXX_frxD08_03d(:,2),sampleRate_bln);
[~,           eXXmagSpec_50w03d_frxD08] = magSpectraWF(eXX_frxD08_03d(:,3),sampleRate_bln);
[~,           eXXmagSpec_100w03d_frxD08] = magSpectraWF(eXX_frxD08_03d(:,4),sampleRate_bln);

eXXmagSpec_frxD08_03d = [eXXmagSpec_05w03d_frxD08 eXXmagSpec_25w03d_frxD08 eXXmagSpec_50w03d_frxD08 eXXmagSpec_100w03d_frxD08];
clear eXXmagSpec_05w03d_frxD08 eXXmagSpec_25w03d_frxD08 eXXmagSpec_50w03d_frxD08 eXXmagSpec_100w03d_frxD08

% parameter 09
[f_frxD09,    eXXmagSpec_05w03d_frxD09] = magSpectraWF(eXX_frxD09_03d(:,1),sampleRate_bln);
[~,           eXXmagSpec_25w03d_frxD09] = magSpectraWF(eXX_frxD09_03d(:,2),sampleRate_bln);
[~,           eXXmagSpec_50w03d_frxD09] = magSpectraWF(eXX_frxD09_03d(:,3),sampleRate_bln);
[~,           eXXmagSpec_100w03d_frxD09] = magSpectraWF(eXX_frxD09_03d(:,4),sampleRate_bln);

eXXmagSpec_frxD09_03d = [eXXmagSpec_05w03d_frxD09 eXXmagSpec_25w03d_frxD09 eXXmagSpec_50w03d_frxD09 eXXmagSpec_100w03d_frxD09];
clear eXXmagSpec_05w03d_frxD09 eXXmagSpec_25w03d_frxD09 eXXmagSpec_50w03d_frxD09 eXXmagSpec_100w03d_frxD09

% parameter 10
[f_frxD10,    eXXmagSpec_05w03d_frxD10] = magSpectraWF(eXX_frxD10_03d(:,1),sampleRate_bln);
[~,           eXXmagSpec_25w03d_frxD10] = magSpectraWF(eXX_frxD10_03d(:,2),sampleRate_bln);
[~,           eXXmagSpec_50w03d_frxD10] = magSpectraWF(eXX_frxD10_03d(:,3),sampleRate_bln);
[~,           eXXmagSpec_100w03d_frxD10] = magSpectraWF(eXX_frxD10_03d(:,4),sampleRate_bln);

eXXmagSpec_frxD10_03d = [eXXmagSpec_05w03d_frxD10 eXXmagSpec_25w03d_frxD10 eXXmagSpec_50w03d_frxD10 eXXmagSpec_100w03d_frxD10];
clear eXXmagSpec_05w03d_frxD10 eXXmagSpec_25w03d_frxD10 eXXmagSpec_50w03d_frxD10 eXXmagSpec_100w03d_frxD10

%% Find Maximum Value of each Magnitude Spectra Series

eXXmagSpecMax_frxD01_03d = zeros(1,length(r));
eXXmagSpecMax_frxD02_03d = zeros(1,length(r));
eXXmagSpecMax_frxD03_03d = zeros(1,length(r));
eXXmagSpecMax_frxD04_03d = zeros(1,length(r));
eXXmagSpecMax_frxD05_03d = zeros(1,length(r));
eXXmagSpecMax_frxD06_03d = zeros(1,length(r));
eXXmagSpecMax_frxD07_03d = zeros(1,length(r));
eXXmagSpecMax_frxD08_03d = zeros(1,length(r));
eXXmagSpecMax_frxD09_03d = zeros(1,length(r));
eXXmagSpecMax_frxD10_03d = zeros(1,length(r));
for i = 1:length(r)
    eXXmagSpecMax_frxD01_03d(1,i) = max(eXXmagSpec_frxD01_03d(:,i));
    eXXmagSpecMax_frxD02_03d(1,i) = max(eXXmagSpec_frxD02_03d(:,i));
    eXXmagSpecMax_frxD03_03d(1,i) = max(eXXmagSpec_frxD03_03d(:,i));
    eXXmagSpecMax_frxD04_03d(1,i) = max(eXXmagSpec_frxD04_03d(:,i));
    eXXmagSpecMax_frxD05_03d(1,i) = max(eXXmagSpec_frxD05_03d(:,i));
    eXXmagSpecMax_frxD06_03d(1,i) = max(eXXmagSpec_frxD06_03d(:,i));
    eXXmagSpecMax_frxD07_03d(1,i) = max(eXXmagSpec_frxD07_03d(:,i));
    eXXmagSpecMax_frxD08_03d(1,i) = max(eXXmagSpec_frxD08_03d(:,i));
    eXXmagSpecMax_frxD09_03d(1,i) = max(eXXmagSpec_frxD09_03d(:,i));
    eXXmagSpecMax_frxD10_03d(1,i) = max(eXXmagSpec_frxD10_03d(:,i));
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