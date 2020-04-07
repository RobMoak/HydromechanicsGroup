%% modelAnalysis2D_sweepcTpMult
% Author: R. Moak
% Date: 03/27/20

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

% =============================================================================================== %
% Characteristic Length (x_c)
% =============================================================================================== %
x_c = ModelParams_sweepcTpMult(1).x_c; % [m]

% radial distances of probe locations (% of x_c)
r = [x_c*0.05; x_c*0.25; x_c*0.5; x_c; x_c*1.1; x_c*1.25]; 

% =============================================================================================== %
% Characteristic Time (t_c)
% =============================================================================================== %

tc_swpcTpMult = (ModelParams_sweepcTpMult(1).x_c^2)/(4*ModelParams_sweepcTpMult(1).D_frx);

%% Compute Magnitude Spectra

% =============================================================================================== %
% MODEL SAMPLE RATE
% =============================================================================================== %
sampleRate_cTp01 = 1/ModelParams_sweepcTpMult(1).tStep_HPT_cTp01;
sampleRate_cTp02 = 1/ModelParams_sweepcTpMult(1).tStep_HPT_cTp02;
sampleRate_cTp03 = 1/ModelParams_sweepcTpMult(1).tStep_HPT_cTp03;
sampleRate_cTp04 = 1/ModelParams_sweepcTpMult(1).tStep_HPT_cTp04;
sampleRate_cTp05 = 1/ModelParams_sweepcTpMult(1).tStep_HPT_cTp05;
sampleRate_cTp06 = 1/ModelParams_sweepcTpMult(1).tStep_HPT_cTp06;
sampleRate_cTp07 = 1/ModelParams_sweepcTpMult(1).tStep_HPT_cTp07;
sampleRate_cTp08 = 1/ModelParams_sweepcTpMult(1).tStep_HPT_cTp08;

% parameter 01
[f_cTpMult01,    eXXmagSpec_05w03d_cTpMult01]  = magSpectra(eXX_cTpMult01_03d(:,1),sampleRate_cTp01);
[~,              eXXmagSpec_25w03d_cTpMult01]  = magSpectra(eXX_cTpMult01_03d(:,2),sampleRate_cTp01);
[~,              eXXmagSpec_50w03d_cTpMult01]  = magSpectra(eXX_cTpMult01_03d(:,3),sampleRate_cTp01);
[~,              eXXmagSpec_100w03d_cTpMult01] = magSpectra(eXX_cTpMult01_03d(:,4),sampleRate_cTp01);
[~,              eXXmagSpec_110w03d_cTpMult01] = magSpectra(eXX_cTpMult01_03d(:,5),sampleRate_cTp01);
[~,              eXXmagSpec_125w03d_cTpMult01] = magSpectra(eXX_cTpMult01_03d(:,6),sampleRate_cTp01);

eXXmagSpec_cTpMult01_03d = [eXXmagSpec_05w03d_cTpMult01 eXXmagSpec_25w03d_cTpMult01 eXXmagSpec_50w03d_cTpMult01 eXXmagSpec_100w03d_cTpMult01 eXXmagSpec_110w03d_cTpMult01 eXXmagSpec_125w03d_cTpMult01];
clear eXXmagSpec_05w03d_cTpMult01 eXXmagSpec_25w03d_cTpMult01 eXXmagSpec_50w03d_cTpMult01 eXXmagSpec_100w03d_cTpMult01 eXXmagSpec_110w03d_cTpMult01 eXXmagSpec_125w03d_cTpMult01

% parameter 02
[f_cTpMult02,    eXXmagSpec_05w03d_cTpMult02]  = magSpectra(eXX_cTpMult02_03d(:,1),sampleRate_cTp02);
[~,              eXXmagSpec_25w03d_cTpMult02]  = magSpectra(eXX_cTpMult02_03d(:,2),sampleRate_cTp02);
[~,              eXXmagSpec_50w03d_cTpMult02]  = magSpectra(eXX_cTpMult02_03d(:,3),sampleRate_cTp02);
[~,              eXXmagSpec_100w03d_cTpMult02] = magSpectra(eXX_cTpMult02_03d(:,4),sampleRate_cTp02);
[~,              eXXmagSpec_110w03d_cTpMult02] = magSpectra(eXX_cTpMult02_03d(:,5),sampleRate_cTp02);
[~,              eXXmagSpec_125w03d_cTpMult02] = magSpectra(eXX_cTpMult02_03d(:,6),sampleRate_cTp02);

eXXmagSpec_cTpMult02_03d = [eXXmagSpec_05w03d_cTpMult02 eXXmagSpec_25w03d_cTpMult02 eXXmagSpec_50w03d_cTpMult02 eXXmagSpec_100w03d_cTpMult02 eXXmagSpec_110w03d_cTpMult02 eXXmagSpec_125w03d_cTpMult02];
clear eXXmagSpec_05w03d_cTpMult02 eXXmagSpec_25w03d_cTpMult02 eXXmagSpec_50w03d_cTpMult02 eXXmagSpec_100w03d_cTpMult02 eXXmagSpec_110w03d_cTpMult02 eXXmagSpec_125w03d_cTpMult02

% parameter 03
[f_cTpMult03,    eXXmagSpec_05w03d_cTpMult03]  = magSpectra(eXX_cTpMult03_03d(:,1),sampleRate_cTp03);
[~,              eXXmagSpec_25w03d_cTpMult03]  = magSpectra(eXX_cTpMult03_03d(:,2),sampleRate_cTp03);
[~,              eXXmagSpec_50w03d_cTpMult03]  = magSpectra(eXX_cTpMult03_03d(:,3),sampleRate_cTp03);
[~,              eXXmagSpec_100w03d_cTpMult03] = magSpectra(eXX_cTpMult03_03d(:,4),sampleRate_cTp03);
[~,              eXXmagSpec_110w03d_cTpMult03] = magSpectra(eXX_cTpMult03_03d(:,5),sampleRate_cTp03);
[~,              eXXmagSpec_125w03d_cTpMult03] = magSpectra(eXX_cTpMult03_03d(:,6),sampleRate_cTp03);

eXXmagSpec_cTpMult03_03d = [eXXmagSpec_05w03d_cTpMult03 eXXmagSpec_25w03d_cTpMult03 eXXmagSpec_50w03d_cTpMult03 eXXmagSpec_100w03d_cTpMult03 eXXmagSpec_110w03d_cTpMult03 eXXmagSpec_125w03d_cTpMult03];
clear eXXmagSpec_05w03d_cTpMult03 eXXmagSpec_25w03d_cTpMult03 eXXmagSpec_50w03d_cTpMult03 eXXmagSpec_100w03d_cTpMult03 eXXmagSpec_110w03d_cTpMult03 eXXmagSpec_125w03d_cTpMult03

% parameter 04
[f_cTpMult04,    eXXmagSpec_05w03d_cTpMult04]  = magSpectra(eXX_cTpMult04_03d(:,1),sampleRate_cTp04);
[~,              eXXmagSpec_25w03d_cTpMult04]  = magSpectra(eXX_cTpMult04_03d(:,2),sampleRate_cTp04);
[~,              eXXmagSpec_50w03d_cTpMult04]  = magSpectra(eXX_cTpMult04_03d(:,3),sampleRate_cTp04);
[~,              eXXmagSpec_100w03d_cTpMult04] = magSpectra(eXX_cTpMult04_03d(:,4),sampleRate_cTp04);
[~,              eXXmagSpec_110w03d_cTpMult04] = magSpectra(eXX_cTpMult04_03d(:,5),sampleRate_cTp04);
[~,              eXXmagSpec_125w03d_cTpMult04] = magSpectra(eXX_cTpMult04_03d(:,6),sampleRate_cTp04);

eXXmagSpec_cTpMult04_03d = [eXXmagSpec_05w03d_cTpMult04 eXXmagSpec_25w03d_cTpMult04 eXXmagSpec_50w03d_cTpMult04 eXXmagSpec_100w03d_cTpMult04 eXXmagSpec_110w03d_cTpMult04 eXXmagSpec_125w03d_cTpMult04];
clear eXXmagSpec_05w03d_cTpMult04 eXXmagSpec_25w03d_cTpMult04 eXXmagSpec_50w03d_cTpMult04 eXXmagSpec_100w03d_cTpMult04 eXXmagSpec_110w03d_cTpMult04 eXXmagSpec_125w03d_cTpMult04

% parameter 05
[f_cTpMult05,    eXXmagSpec_05w03d_cTpMult05]  = magSpectra(eXX_cTpMult05_03d(:,1),sampleRate_cTp05);
[~,              eXXmagSpec_25w03d_cTpMult05]  = magSpectra(eXX_cTpMult05_03d(:,2),sampleRate_cTp05);
[~,              eXXmagSpec_50w03d_cTpMult05]  = magSpectra(eXX_cTpMult05_03d(:,3),sampleRate_cTp05);
[~,              eXXmagSpec_100w03d_cTpMult05] = magSpectra(eXX_cTpMult05_03d(:,4),sampleRate_cTp05);
[~,              eXXmagSpec_110w03d_cTpMult05] = magSpectra(eXX_cTpMult05_03d(:,5),sampleRate_cTp05);
[~,              eXXmagSpec_125w03d_cTpMult05] = magSpectra(eXX_cTpMult05_03d(:,6),sampleRate_cTp05);

eXXmagSpec_cTpMult05_03d = [eXXmagSpec_05w03d_cTpMult05 eXXmagSpec_25w03d_cTpMult05 eXXmagSpec_50w03d_cTpMult05 eXXmagSpec_100w03d_cTpMult05 eXXmagSpec_110w03d_cTpMult05 eXXmagSpec_125w03d_cTpMult05];
clear eXXmagSpec_05w03d_cTpMult05 eXXmagSpec_25w03d_cTpMult05 eXXmagSpec_50w03d_cTpMult05 eXXmagSpec_100w03d_cTpMult05 eXXmagSpec_110w03d_cTpMult05 eXXmagSpec_125w03d_cTpMult05

% parameter 06
[f_cTpMult06,    eXXmagSpec_05w03d_cTpMult06]  = magSpectra(eXX_cTpMult06_03d(:,1),sampleRate_cTp06);
[~,              eXXmagSpec_25w03d_cTpMult06]  = magSpectra(eXX_cTpMult06_03d(:,2),sampleRate_cTp06);
[~,              eXXmagSpec_50w03d_cTpMult06]  = magSpectra(eXX_cTpMult06_03d(:,3),sampleRate_cTp06);
[~,              eXXmagSpec_100w03d_cTpMult06] = magSpectra(eXX_cTpMult06_03d(:,4),sampleRate_cTp06);
[~,              eXXmagSpec_110w03d_cTpMult06] = magSpectra(eXX_cTpMult06_03d(:,5),sampleRate_cTp06);
[~,              eXXmagSpec_125w03d_cTpMult06] = magSpectra(eXX_cTpMult06_03d(:,6),sampleRate_cTp06);

eXXmagSpec_cTpMult06_03d = [eXXmagSpec_05w03d_cTpMult06 eXXmagSpec_25w03d_cTpMult06 eXXmagSpec_50w03d_cTpMult06 eXXmagSpec_100w03d_cTpMult06 eXXmagSpec_110w03d_cTpMult06 eXXmagSpec_125w03d_cTpMult06];
clear eXXmagSpec_05w03d_cTpMult06 eXXmagSpec_25w03d_cTpMult06 eXXmagSpec_50w03d_cTpMult06 eXXmagSpec_100w03d_cTpMult06 eXXmagSpec_110w03d_cTpMult06 eXXmagSpec_125w03d_cTpMult06

% parameter 07
[f_cTpMult07,    eXXmagSpec_05w03d_cTpMult07]  = magSpectra(eXX_cTpMult07_03d(:,1),sampleRate_cTp07);
[~,              eXXmagSpec_25w03d_cTpMult07]  = magSpectra(eXX_cTpMult07_03d(:,2),sampleRate_cTp07);
[~,              eXXmagSpec_50w03d_cTpMult07]  = magSpectra(eXX_cTpMult07_03d(:,3),sampleRate_cTp07);
[~,              eXXmagSpec_100w03d_cTpMult07] = magSpectra(eXX_cTpMult07_03d(:,4),sampleRate_cTp07);
[~,              eXXmagSpec_110w03d_cTpMult07] = magSpectra(eXX_cTpMult07_03d(:,5),sampleRate_cTp07);
[~,              eXXmagSpec_125w03d_cTpMult07] = magSpectra(eXX_cTpMult07_03d(:,6),sampleRate_cTp07);

eXXmagSpec_cTpMult07_03d = [eXXmagSpec_05w03d_cTpMult07 eXXmagSpec_25w03d_cTpMult07 eXXmagSpec_50w03d_cTpMult07 eXXmagSpec_100w03d_cTpMult07 eXXmagSpec_110w03d_cTpMult07 eXXmagSpec_125w03d_cTpMult07];
clear eXXmagSpec_05w03d_cTpMult07 eXXmagSpec_25w03d_cTpMult07 eXXmagSpec_50w03d_cTpMult07 eXXmagSpec_100w03d_cTpMult07 eXXmagSpec_110w03d_cTpMult07 eXXmagSpec_125w03d_cTpMult07

% parameter 08
[f_cTpMult08,    eXXmagSpec_05w03d_cTpMult08]  = magSpectra(eXX_cTpMult08_03d(:,1),sampleRate_cTp08);
[~,              eXXmagSpec_25w03d_cTpMult08]  = magSpectra(eXX_cTpMult08_03d(:,2),sampleRate_cTp08);
[~,              eXXmagSpec_50w03d_cTpMult08]  = magSpectra(eXX_cTpMult08_03d(:,3),sampleRate_cTp08);
[~,              eXXmagSpec_100w03d_cTpMult08] = magSpectra(eXX_cTpMult08_03d(:,4),sampleRate_cTp08);
[~,              eXXmagSpec_110w03d_cTpMult08] = magSpectra(eXX_cTpMult08_03d(:,5),sampleRate_cTp08);
[~,              eXXmagSpec_125w03d_cTpMult08] = magSpectra(eXX_cTpMult08_03d(:,6),sampleRate_cTp08);

eXXmagSpec_cTpMult08_03d = [eXXmagSpec_05w03d_cTpMult08 eXXmagSpec_25w03d_cTpMult08 eXXmagSpec_50w03d_cTpMult08 eXXmagSpec_100w03d_cTpMult08 eXXmagSpec_110w03d_cTpMult08 eXXmagSpec_125w03d_cTpMult08];
clear eXXmagSpec_05w03d_cTpMult08 eXXmagSpec_25w03d_cTpMult08 eXXmagSpec_50w03d_cTpMult08 eXXmagSpec_100w03d_cTpMult08 eXXmagSpec_110w03d_cTpMult08 eXXmagSpec_125w03d_cTpMult08

%% Find Maximum Value of each Magnitude Spectra Series

eXXmagSpecMax_cTpMult01_03d = zeros(1,length(r));
eXXmagSpecMax_cTpMult02_03d = zeros(1,length(r));
eXXmagSpecMax_cTpMult03_03d = zeros(1,length(r));
eXXmagSpecMax_cTpMult04_03d = zeros(1,length(r));
eXXmagSpecMax_cTpMult05_03d = zeros(1,length(r));
eXXmagSpecMax_cTpMult06_03d = zeros(1,length(r));
eXXmagSpecMax_cTpMult07_03d = zeros(1,length(r));
eXXmagSpecMax_cTpMult08_03d = zeros(1,length(r));
for i = 1:length(r)
    eXXmagSpecMax_cTpMult01_03d(1,i) = max(eXXmagSpec_cTpMult01_03d(:,i));
    eXXmagSpecMax_cTpMult02_03d(1,i) = max(eXXmagSpec_cTpMult02_03d(:,i));
    eXXmagSpecMax_cTpMult03_03d(1,i) = max(eXXmagSpec_cTpMult03_03d(:,i));
    eXXmagSpecMax_cTpMult04_03d(1,i) = max(eXXmagSpec_cTpMult04_03d(:,i));
    eXXmagSpecMax_cTpMult05_03d(1,i) = max(eXXmagSpec_cTpMult05_03d(:,i));
    eXXmagSpecMax_cTpMult06_03d(1,i) = max(eXXmagSpec_cTpMult06_03d(:,i));
    eXXmagSpecMax_cTpMult07_03d(1,i) = max(eXXmagSpec_cTpMult07_03d(:,i));
    eXXmagSpecMax_cTpMult08_03d(1,i) = max(eXXmagSpec_cTpMult08_03d(:,i));
end


%% Time Domain Analysis ======================================================================================== %
%
% ============================================================================================================== %


%% Corelation Coef and polyfit to eXXrate_minRateDuration
% eXXrate_minRateDuration_03d_coef = (eXXrate_minRateDuration_03d(end)-eXXrate_minRateDuration_03d(1))/(r(end)-r(1)); %s/m
% eXXrate_minRateDuration_03d_polyFit = polyfit_cTpMult0(r,eXXrate_minRateDuration_03d,2);
% eXXrate_minRateDuration_03d_polyVal = polyval(eXXrate_minRateDuration_03d_polyFit,r);eZZrate_minRateDuration_03d_coef = (eZZrate_minRateDuration_03d(end)-eZZrate_minRateDuration_03d(1))/(r(end)-r(1)); %s/m
% eZZrate_minRateDuration_03d_polyFit = polyfit(r,eZZrate_minRateDuration_03d,2);
% eZZrate_minRateDuration_03d_polyVal = polyval(eZZrate_minRateDuration_03d_polyFit,r);