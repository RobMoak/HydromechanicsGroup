%% modelAnalysis2D_sweepDfrx_cTp
% Author: R. Moak
% Date: 03/25/20

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

% ===============================================================================================%
% Characteristic Length (x_c)
% ===============================================================================================%
x_c = ModelParams_sweepDfrx_cTp(1).x_c; % [m]

% radial distances of probe locations (% of x_c)
r = [x_c*0.05; x_c*0.25; x_c*0.5; x_c; x_c*1.1; x_c*1.25]; 

% ===============================================================================================%
% Characteristic Time (t_c)
% ===============================================================================================%
tc_frxD01 = (ModelParams_sweepDfrx_cTp(1).x_c^2)/(4*ModelParams_sweepDfrx_cTp(1).D01_frx);
tc_frxD02 = (ModelParams_sweepDfrx_cTp(1).x_c^2)/(4*ModelParams_sweepDfrx_cTp(1).D02_frx);
tc_frxD03 = (ModelParams_sweepDfrx_cTp(1).x_c^2)/(4*ModelParams_sweepDfrx_cTp(1).D03_frx);
tc_frxD04 = (ModelParams_sweepDfrx_cTp(1).x_c^2)/(4*ModelParams_sweepDfrx_cTp(1).D04_frx);
tc_frxD05 = (ModelParams_sweepDfrx_cTp(1).x_c^2)/(4*ModelParams_sweepDfrx_cTp(1).D05_frx);
tc_frxD06 = (ModelParams_sweepDfrx_cTp(1).x_c^2)/(4*ModelParams_sweepDfrx_cTp(1).D06_frx);
tc_frxD07 = (ModelParams_sweepDfrx_cTp(1).x_c^2)/(4*ModelParams_sweepDfrx_cTp(1).D07_frx);
tc_frxD08 = (ModelParams_sweepDfrx_cTp(1).x_c^2)/(4*ModelParams_sweepDfrx_cTp(1).D08_frx);
tc_frxD09 = (ModelParams_sweepDfrx_cTp(1).x_c^2)/(4*ModelParams_sweepDfrx_cTp(1).D09_frx);
tc_frxD10 = (ModelParams_sweepDfrx_cTp(1).x_c^2)/(4*ModelParams_sweepDfrx_cTp(1).D10_frx);

tc_swpDfrx_cTp = [tc_frxD01 tc_frxD02 tc_frxD03 tc_frxD04 tc_frxD05 tc_frxD06 tc_frxD07 tc_frxD08 tc_frxD09 tc_frxD10];
clear tc_frxD01 tc_frxD02 tc_frxD03 tc_frxD04 tc_frxD05 tc_frxD06 tc_frxD07 tc_frxD08 tc_frxD09 tc_frxD10

% Characteristc HPT Period (cTp)
cTp_mult = ModelParams_sweepDfrx_cTp(1).cTp_mult;
cTp_frxD01 = tc_frxD01*cTp_mult;
cTp_frxD02 = tc_frxD02*cTp_mult;
cTp_frxD03 = tc_frxD03*cTp_mult;
cTp_frxD04 = tc_frxD04*cTp_mult;
cTp_frxD05 = tc_frxD05*cTp_mult;
cTp_frxD06 = tc_frxD06*cTp_mult;
cTp_frxD07 = tc_frxD07*cTp_mult;
cTp_frxD08 = tc_frxD08*cTp_mult;
cTp_frxD09 = tc_frxD09*cTp_mult;
cTp_frxD10 = tc_frxD10*cTp_mult;

cTp_sweepDfrx = [cTp_frxD01 cTp_frxD02 cTp_frxD03 cTp_frxD04 cTp_frxD05 cTp_frxD0 cTp_frxD07 cTp_frxD08 cTp_frxD09 cTp_frxD10];
clear cTp_frxD01 cTp_frxD02 cTp_frxD03 cTp_frxD04 cTp_frxD05 cTp_frxD0 cTp_frxD07 cTp_frxD08 cTp_frxD09 cTp_frxD10

% Simulation Time Step (Scaled to cTp)
sampleRate_cTp01 = cTp_frxD01/25;
sampleRate_cTp02 = cTp_frxD02/25;
sampleRate_cTp03 = cTp_frxD03/25;
sampleRate_cTp04 = cTp_frxD04/25;
sampleRate_cTp05 = cTp_frxD05/25;
sampleRate_cTp06 = cTp_frxD06/25;
sampleRate_cTp07 = cTp_frxD07/25;
sampleRate_cTp08 = cTp_frxD08/25;
sampleRate_cTp09 = cTp_frxD09/25;
sampleRate_cTp10 = cTp_frxD10/25;

sampleRate_swpcTp = [sampleRate_cTp01 sampleRate_cTp02 sampleRate_cTp03 sampleRate_cTp04 sampleRate_cTp05 sampleRate_cTp06 sampleRate_cTp07 sampleRate_cTp08 sampleRate_cTp09 sampleRate_cTp10];
clear sampleRate_cTp01 sampleRate_cTp02 sampleRate_cTp03 sampleRate_cTp04 sampleRate_cTp05 sampleRate_cTp06 sampleRate_cTp07 sampleRate_cTp08 sampleRate_cTp09 sampleRate_cTp10


%% Frequency Domain Analysis ==================================================================== %
% 
% =============================================================================================== %

%% Calculate Magnitude Spectra
% parameter 01
[fcTp_frxD01, eXXmagSpec_05w03d_frxD01]  = magSpectraWF(eXX_frxD01cTp_03d(:,1),sampleRate_cTp01);
[~,           eXXmagSpec_25w03d_frxD01]  = magSpectraWF(eXX_frxD01cTp_03d(:,2),sampleRate_cTp01);
[~,           eXXmagSpec_50w03d_frxD01]  = magSpectraWF(eXX_frxD01cTp_03d(:,3),sampleRate_cTp01);
[~,           eXXmagSpec_100w03d_frxD01] = magSpectraWF(eXX_frxD01cTp_03d(:,4),sampleRate_cTp01);
[~,           eXXmagSpec_110w03d_frxD01] = magSpectraWF(eXX_frxD01cTp_03d(:,5),sampleRate_cTp01);
[~,           eXXmagSpec_125w03d_frxD01] = magSpectraWF(eXX_frxD01cTp_03d(:,6),sampleRate_cTp01);

eXXmagSpec_frxD01cTp_03d = [eXXmagSpec_05w03d_frxD01 eXXmagSpec_25w03d_frxD01 eXXmagSpec_50w03d_frxD01 eXXmagSpec_100w03d_frxD01 eXXmagSpec_110w03d_frxD01 eXXmagSpec_125w03d_frxD01];
clear eXXmagSpec_05w03d_frxD01 eXXmagSpec_25w03d_frxD01 eXXmagSpec_50w03d_frxD01 eXXmagSpec_100w03d_frxD01 eXXmagSpec_110w03d_frxD01 eXXmagSpec_125w03d_frxD01

% parameter 02
[fcTp_frxD02, eXXmagSpec_05w03d_frxD02]  = magSpectraWF(eXX_frxD02cTp_03d(:,1),sampleRate_cTp02);
[~,           eXXmagSpec_25w03d_frxD02]  = magSpectraWF(eXX_frxD02cTp_03d(:,2),sampleRate_cTp02);
[~,           eXXmagSpec_50w03d_frxD02]  = magSpectraWF(eXX_frxD02cTp_03d(:,3),sampleRate_cTp02);
[~,           eXXmagSpec_100w03d_frxD02] = magSpectraWF(eXX_frxD02cTp_03d(:,4),sampleRate_cTp02);
[~,           eXXmagSpec_110w03d_frxD02] = magSpectraWF(eXX_frxD02cTp_03d(:,5),sampleRate_cTp02);
[~,           eXXmagSpec_125w03d_frxD02] = magSpectraWF(eXX_frxD02cTp_03d(:,6),sampleRate_cTp02);

eXXmagSpec_frxD02cTp_03d = [eXXmagSpec_05w03d_frxD02 eXXmagSpec_25w03d_frxD02 eXXmagSpec_50w03d_frxD02 eXXmagSpec_100w03d_frxD02 eXXmagSpec_110w03d_frxD02 eXXmagSpec_125w03d_frxD02];
clear eXXmagSpec_05w03d_frxD02 eXXmagSpec_25w03d_frxD02 eXXmagSpec_50w03d_frxD02 eXXmagSpec_100w03d_frxD02 eXXmagSpec_110w03d_frxD02 eXXmagSpec_125w03d_frxD02

% parameter 03
[fcTp_frxD03, eXXmagSpec_05w03d_frxD03]  = magSpectraWF(eXX_frxD03cTp_03d(:,1),sampleRate_cTp03);
[~,           eXXmagSpec_25w03d_frxD03]  = magSpectraWF(eXX_frxD03cTp_03d(:,2),sampleRate_cTp03);
[~,           eXXmagSpec_50w03d_frxD03]  = magSpectraWF(eXX_frxD03cTp_03d(:,3),sampleRate_cTp03);
[~,           eXXmagSpec_100w03d_frxD03] = magSpectraWF(eXX_frxD03cTp_03d(:,4),sampleRate_cTp03);
[~,           eXXmagSpec_110w03d_frxD03] = magSpectraWF(eXX_frxD03cTp_03d(:,5),sampleRate_cTp03);
[~,           eXXmagSpec_125w03d_frxD03] = magSpectraWF(eXX_frxD03cTp_03d(:,6),sampleRate_cTp03);

eXXmagSpec_frxD03cTp_03d = [eXXmagSpec_05w03d_frxD03 eXXmagSpec_25w03d_frxD03 eXXmagSpec_50w03d_frxD03 eXXmagSpec_100w03d_frxD03 eXXmagSpec_110w03d_frxD03 eXXmagSpec_125w03d_frxD03];
clear eXXmagSpec_05w03d_frxD03 eXXmagSpec_25w03d_frxD03 eXXmagSpec_50w03d_frxD03 eXXmagSpec_100w03d_frxD03 eXXmagSpec_110w03d_frxD03 eXXmagSpec_125w03d_frxD03

% parameter 04
[fcTp_frxD04, eXXmagSpec_05w03d_frxD04]  = magSpectraWF(eXX_frxD04cTp_03d(:,1),sampleRate_cTp04);
[~,           eXXmagSpec_25w03d_frxD04]  = magSpectraWF(eXX_frxD04cTp_03d(:,2),sampleRate_cTp04);
[~,           eXXmagSpec_50w03d_frxD04]  = magSpectraWF(eXX_frxD04cTp_03d(:,3),sampleRate_cTp04);
[~,           eXXmagSpec_100w03d_frxD04] = magSpectraWF(eXX_frxD04cTp_03d(:,4),sampleRate_cTp04);
[~,           eXXmagSpec_110w03d_frxD04] = magSpectraWF(eXX_frxD04cTp_03d(:,5),sampleRate_cTp04);
[~,           eXXmagSpec_125w03d_frxD04] = magSpectraWF(eXX_frxD04cTp_03d(:,6),sampleRate_cTp04);

eXXmagSpec_frxD04cTp_03d = [eXXmagSpec_05w03d_frxD04 eXXmagSpec_25w03d_frxD04 eXXmagSpec_50w03d_frxD04 eXXmagSpec_100w03d_frxD04 eXXmagSpec_110w03d_frxD04 eXXmagSpec_125w03d_frxD04];
clear eXXmagSpec_05w03d_frxD04 eXXmagSpec_25w03d_frxD04 eXXmagSpec_50w03d_frxD04 eXXmagSpec_100w03d_frxD04 eXXmagSpec_110w03d_frxD04 eXXmagSpec_125w03d_frxD04

% parameter 05
[fcTp_frxD05, eXXmagSpec_05w03d_frxD05]  = magSpectraWF(eXX_frxD05cTp_03d(:,1),sampleRate_cTp05);
[~,           eXXmagSpec_25w03d_frxD05]  = magSpectraWF(eXX_frxD05cTp_03d(:,2),sampleRate_cTp05);
[~,           eXXmagSpec_50w03d_frxD05]  = magSpectraWF(eXX_frxD05cTp_03d(:,3),sampleRate_cTp05);
[~,           eXXmagSpec_100w03d_frxD05] = magSpectraWF(eXX_frxD05cTp_03d(:,4),sampleRate_cTp05);
[~,           eXXmagSpec_110w03d_frxD05] = magSpectraWF(eXX_frxD05cTp_03d(:,5),sampleRate_cTp05);
[~,           eXXmagSpec_125w03d_frxD05] = magSpectraWF(eXX_frxD05cTp_03d(:,6),sampleRate_cTp05);

eXXmagSpec_frxD05cTp_03d = [eXXmagSpec_05w03d_frxD05 eXXmagSpec_25w03d_frxD05 eXXmagSpec_50w03d_frxD05 eXXmagSpec_100w03d_frxD05 eXXmagSpec_110w03d_frxD05 eXXmagSpec_125w03d_frxD05];
clear eXXmagSpec_05w03d_frxD05 eXXmagSpec_25w03d_frxD05 eXXmagSpec_50w03d_frxD05 eXXmagSpec_100w03d_frxD05 eXXmagSpec_110w03d_frxD05 eXXmagSpec_125w03d_frxD05

% parameter 06
[fcTp_frxD06, eXXmagSpec_05w03d_frxD06]  = magSpectraWF(eXX_frxD06cTp_03d(:,1),sampleRate_cTp06);
[~,           eXXmagSpec_25w03d_frxD06]  = magSpectraWF(eXX_frxD06cTp_03d(:,2),sampleRate_cTp06);
[~,           eXXmagSpec_50w03d_frxD06]  = magSpectraWF(eXX_frxD06cTp_03d(:,3),sampleRate_cTp06);
[~,           eXXmagSpec_100w03d_frxD06] = magSpectraWF(eXX_frxD06cTp_03d(:,4),sampleRate_cTp06);
[~,           eXXmagSpec_110w03d_frxD06] = magSpectraWF(eXX_frxD06cTp_03d(:,5),sampleRate_cTp06);
[~,           eXXmagSpec_125w03d_frxD06] = magSpectraWF(eXX_frxD06cTp_03d(:,6),sampleRate_cTp06);

eXXmagSpec_frxD06cTp_03d = [eXXmagSpec_05w03d_frxD06 eXXmagSpec_25w03d_frxD06 eXXmagSpec_50w03d_frxD06 eXXmagSpec_100w03d_frxD06 eXXmagSpec_110w03d_frxD06 eXXmagSpec_125w03d_frxD06];
clear eXXmagSpec_05w03d_frxD06 eXXmagSpec_25w03d_frxD06 eXXmagSpec_50w03d_frxD06 eXXmagSpec_100w03d_frxD06 eXXmagSpec_110w03d_frxD06 eXXmagSpec_125w03d_frxD06

% parameter 07
[fcTp_frxD07, eXXmagSpec_05w03d_frxD07]  = magSpectraWF(eXX_frxD07cTp_03d(:,1),sampleRate_cTp07);
[~,           eXXmagSpec_25w03d_frxD07]  = magSpectraWF(eXX_frxD07cTp_03d(:,2),sampleRate_cTp07);
[~,           eXXmagSpec_50w03d_frxD07]  = magSpectraWF(eXX_frxD07cTp_03d(:,3),sampleRate_cTp07);
[~,           eXXmagSpec_100w03d_frxD07] = magSpectraWF(eXX_frxD07cTp_03d(:,4),sampleRate_cTp07);
[~,           eXXmagSpec_110w03d_frxD07] = magSpectraWF(eXX_frxD07cTp_03d(:,5),sampleRate_cTp07);
[~,           eXXmagSpec_125w03d_frxD07] = magSpectraWF(eXX_frxD07cTp_03d(:,6),sampleRate_cTp07);

eXXmagSpec_frxD07cTp_03d = [eXXmagSpec_05w03d_frxD07 eXXmagSpec_25w03d_frxD07 eXXmagSpec_50w03d_frxD07 eXXmagSpec_100w03d_frxD07 eXXmagSpec_110w03d_frxD07 eXXmagSpec_125w03d_frxD07];
clear eXXmagSpec_05w03d_frxD07 eXXmagSpec_25w03d_frxD07 eXXmagSpec_50w03d_frxD07 eXXmagSpec_100w03d_frxD07 eXXmagSpec_110w03d_frxD07 eXXmagSpec_125w03d_frxD07

% parameter 08
[fcTp_frxD08, eXXmagSpec_05w03d_frxD08]  = magSpectraWF(eXX_frxD08cTp_03d(:,1),sampleRate_cTp08);
[~,           eXXmagSpec_25w03d_frxD08]  = magSpectraWF(eXX_frxD08cTp_03d(:,2),sampleRate_cTp08);
[~,           eXXmagSpec_50w03d_frxD08]  = magSpectraWF(eXX_frxD08cTp_03d(:,3),sampleRate_cTp08);
[~,           eXXmagSpec_100w03d_frxD08] = magSpectraWF(eXX_frxD08cTp_03d(:,4),sampleRate_cTp08);
[~,           eXXmagSpec_110w03d_frxD08] = magSpectraWF(eXX_frxD08cTp_03d(:,5),sampleRate_cTp08);
[~,           eXXmagSpec_125w03d_frxD08] = magSpectraWF(eXX_frxD08cTp_03d(:,6),sampleRate_cTp08);

eXXmagSpec_frxD08cTp_03d = [eXXmagSpec_05w03d_frxD08 eXXmagSpec_25w03d_frxD08 eXXmagSpec_50w03d_frxD08 eXXmagSpec_100w03d_frxD08 eXXmagSpec_110w03d_frxD08 eXXmagSpec_125w03d_frxD08];
clear eXXmagSpec_05w03d_frxD08 eXXmagSpec_25w03d_frxD08 eXXmagSpec_50w03d_frxD08 eXXmagSpec_100w03d_frxD08 eXXmagSpec_110w03d_frxD08 eXXmagSpec_125w03d_frxD08

% parameter 09
[fcTp_frxD09, eXXmagSpec_05w03d_frxD09]  = magSpectraWF(eXX_frxD09cTp_03d(:,1),sampleRate_cTp09);
[~,           eXXmagSpec_25w03d_frxD09]  = magSpectraWF(eXX_frxD09cTp_03d(:,2),sampleRate_cTp09);
[~,           eXXmagSpec_50w03d_frxD09]  = magSpectraWF(eXX_frxD09cTp_03d(:,3),sampleRate_cTp09);
[~,           eXXmagSpec_100w03d_frxD09] = magSpectraWF(eXX_frxD09cTp_03d(:,4),sampleRate_cTp09);
[~,           eXXmagSpec_110w03d_frxD09] = magSpectraWF(eXX_frxD09cTp_03d(:,5),sampleRate_cTp09);
[~,           eXXmagSpec_125w03d_frxD09] = magSpectraWF(eXX_frxD09cTp_03d(:,6),sampleRate_cTp09);

eXXmagSpec_frxD09cTp_03d = [eXXmagSpec_05w03d_frxD09 eXXmagSpec_25w03d_frxD09 eXXmagSpec_50w03d_frxD09 eXXmagSpec_100w03d_frxD09 eXXmagSpec_110w03d_frxD09 eXXmagSpec_125w03d_frxD09];
clear eXXmagSpec_05w03d_frxD09 eXXmagSpec_25w03d_frxD09 eXXmagSpec_50w03d_frxD09 eXXmagSpec_100w03d_frxD09 eXXmagSpec_110w03d_frxD09 eXXmagSpec_125w03d_frxD09

% parameter 10
[fcTp_frxD10, eXXmagSpec_05w03d_frxD10]  = magSpectraWF(eXX_frxD10cTp_03d(:,1),sampleRate_cTp10);
[~,           eXXmagSpec_25w03d_frxD10]  = magSpectraWF(eXX_frxD10cTp_03d(:,2),sampleRate_cTp10);
[~,           eXXmagSpec_50w03d_frxD10]  = magSpectraWF(eXX_frxD10cTp_03d(:,3),sampleRate_cTp10);
[~,           eXXmagSpec_100w03d_frxD10] = magSpectraWF(eXX_frxD10cTp_03d(:,4),sampleRate_cTp10);
[~,           eXXmagSpec_110w03d_frxD10] = magSpectraWF(eXX_frxD10cTp_03d(:,5),sampleRate_cTp10);
[~,           eXXmagSpec_125w03d_frxD10] = magSpectraWF(eXX_frxD10cTp_03d(:,6),sampleRate_cTp10);

eXXmagSpec_frxD10cTp_03d = [eXXmagSpec_05w03d_frxD10 eXXmagSpec_25w03d_frxD10 eXXmagSpec_50w03d_frxD10 eXXmagSpec_100w03d_frxD10 eXXmagSpec_110w03d_frxD10 eXXmagSpec_125w03d_frxD10];
clear eXXmagSpec_05w03d_frxD10 eXXmagSpec_25w03d_frxD10 eXXmagSpec_50w03d_frxD10 eXXmagSpec_100w03d_frxD10 eXXmagSpec_110w03d_frxD10 eXXmagSpec_125w03d_frxD10

%% Find Maximum Value of each Magnitude Spectra Series

eXXmagSpecMax_frxD01cTp_03d = zeros(1,length(r));
eXXmagSpecMax_frxD02cTp_03d = zeros(1,length(r));
eXXmagSpecMax_frxD03cTp_03d = zeros(1,length(r));
eXXmagSpecMax_frxD04cTp_03d = zeros(1,length(r));
eXXmagSpecMax_frxD05cTp_03d = zeros(1,length(r));
eXXmagSpecMax_frxD06cTp_03d = zeros(1,length(r));
eXXmagSpecMax_frxD07cTp_03d = zeros(1,length(r));
eXXmagSpecMax_frxD08cTp_03d = zeros(1,length(r));
eXXmagSpecMax_frxD09cTp_03d = zeros(1,length(r));
eXXmagSpecMax_frxD10cTp_03d = zeros(1,length(r));
for i = 1:length(r)
    eXXmagSpecMax_frxD01cTp_03d(1,i) = max(eXXmagSpec_frxD01cTp_03d(:,i));
    eXXmagSpecMax_frxD02cTp_03d(1,i) = max(eXXmagSpec_frxD02cTp_03d(:,i));
    eXXmagSpecMax_frxD03cTp_03d(1,i) = max(eXXmagSpec_frxD03cTp_03d(:,i));
    eXXmagSpecMax_frxD04cTp_03d(1,i) = max(eXXmagSpec_frxD04cTp_03d(:,i));
    eXXmagSpecMax_frxD05cTp_03d(1,i) = max(eXXmagSpec_frxD05cTp_03d(:,i));
    eXXmagSpecMax_frxD06cTp_03d(1,i) = max(eXXmagSpec_frxD06cTp_03d(:,i));
    eXXmagSpecMax_frxD07cTp_03d(1,i) = max(eXXmagSpec_frxD07cTp_03d(:,i));
    eXXmagSpecMax_frxD08cTp_03d(1,i) = max(eXXmagSpec_frxD08cTp_03d(:,i));
    eXXmagSpecMax_frxD09cTp_03d(1,i) = max(eXXmagSpec_frxD09cTp_03d(:,i));
    eXXmagSpecMax_frxD10cTp_03d(1,i) = max(eXXmagSpec_frxD10cTp_03d(:,i));
end

%% Calculate Phase between each Probe Location and Applied Pressure

% [xx,yy,p] = ellipseFit(x,y);


%% Time Domain Analysis ========================================================================= %
%
% =============================================================================================== %

%% Obtain absolute values of strain rates
%
% =============================================================================================== %

% Parameter 01
eXXrate_frxD01cTp_03d = abs(eXXrate_frxD01cTp_03d);
eZZrate_frxD01cTp_03d = abs(eZZrate_frxD01cTp_03d);

% Parameter 02
eXXrate_frxD02cTp_03d = abs(eXXrate_frxD02cTp_03d);
eZZrate_frxD02cTp_03d = abs(eZZrate_frxD02cTp_03d);

% Parameter 03
eXXrate_frxD03cTp_03d = abs(eXXrate_frxD03cTp_03d);
eZZrate_frxD03cTp_03d = abs(eZZrate_frxD03cTp_03d);

% Parameter 04
eXXrate_frxD04cTp_03d = abs(eXXrate_frxD04cTp_03d);
eZZrate_frxD04cTp_03d = abs(eZZrate_frxD04cTp_03d);

% Parameter 05
eXXrate_frxD05cTp_03d = abs(eXXrate_frxD05cTp_03d);
eZZrate_frxD05cTp_03d = abs(eZZrate_frxD05cTp_03d);

% Parameter 06
eXXrate_frxD06cTp_03d = abs(eXXrate_frxD06cTp_03d);
eZZrate_frxD06cTp_03d = abs(eZZrate_frxD06cTp_03d);

% Parameter 07
eXXrate_frxD07cTp_03d = abs(eXXrate_frxD07cTp_03d);
eZZrate_frxD07cTp_03d = abs(eZZrate_frxD07cTp_03d);

% Parameter 08
eXXrate_frxD08cTp_03d = abs(eXXrate_frxD08cTp_03d);
eZZrate_frxD08cTp_03d = abs(eZZrate_frxD08cTp_03d);

% Parameter 09
eXXrate_frxD09cTp_03d = abs(eXXrate_frxD09cTp_03d);
eZZrate_frxD09cTp_03d = abs(eZZrate_frxD09cTp_03d);

% Parameter 10
eXXrate_frxD10cTp_03d = abs(eXXrate_frxD10cTp_03d);
eZZrate_frxD10cTp_03d = abs(eZZrate_frxD10cTp_03d);

%% Maximum Strain Rate 
%
% =============================================================================================== %

eXXrateMax_frxD01cTp_03d = zeros(1,length(r));
eZZrateMax_frxD01cTp_03d = zeros(1,length(r));
eXXrateMax_frxD02cTp_03d = zeros(1,length(r));
eZZrateMax_frxD02cTp_03d = zeros(1,length(r));
eXXrateMax_frxD03cTp_03d = zeros(1,length(r));
eZZrateMax_frxD03cTp_03d = zeros(1,length(r));
eXXrateMax_frxD04cTp_03d = zeros(1,length(r));
eZZrateMax_frxD04cTp_03d = zeros(1,length(r));
eXXrateMax_frxD05cTp_03d = zeros(1,length(r));
eZZrateMax_frxD05cTp_03d = zeros(1,length(r));
eXXrateMax_frxD06cTp_03d = zeros(1,length(r));
eZZrateMax_frxD06cTp_03d = zeros(1,length(r));
eXXrateMax_frxD07cTp_03d = zeros(1,length(r));
eZZrateMax_frxD07cTp_03d = zeros(1,length(r));
eXXrateMax_frxD08cTp_03d = zeros(1,length(r));
eZZrateMax_frxD08cTp_03d = zeros(1,length(r));
eXXrateMax_frxD09cTp_03d = zeros(1,length(r));
eZZrateMax_frxD09cTp_03d = zeros(1,length(r));
eXXrateMax_frxD10cTp_03d = zeros(1,length(r));
eZZrateMax_frxD10cTp_03d = zeros(1,length(r));
for i = 1:length(r)
% Parameter 01
    eXXrateMax_frxD01cTp_03d(i) = max(eXXrate_frxD01cTp_03d(:,i));
    eZZrateMax_frxD01cTp_03d(i) = max(eZZrate_frxD01cTp_03d(:,i));
% Parameter 02
    eXXrateMax_frxD02cTp_03d(i) = max(eXXrate_frxD02cTp_03d(:,i));
    eZZrateMax_frxD02cTp_03d(i) = max(eZZrate_frxD02cTp_03d(:,i));
% Parameter 03
    eXXrateMax_frxD03cTp_03d(i) = max(eXXrate_frxD03cTp_03d(:,i));
    eZZrateMax_frxD03cTp_03d(i) = max(eZZrate_frxD03cTp_03d(:,i));
% Parameter 04
    eXXrateMax_frxD04cTp_03d(i) = max(eXXrate_frxD04cTp_03d(:,i));
    eZZrateMax_frxD04cTp_03d(i) = max(eZZrate_frxD04cTp_03d(:,i));
% Parameter 05
    eXXrateMax_frxD05cTp_03d(i) = max(eXXrate_frxD05cTp_03d(:,i));
    eZZrateMax_frxD05cTp_03d(i) = max(eZZrate_frxD05cTp_03d(:,i));
% Parameter 06
    eXXrateMax_frxD06cTp_03d(i) = max(eXXrate_frxD06cTp_03d(:,i));
    eZZrateMax_frxD06cTp_03d(i) = max(eZZrate_frxD06cTp_03d(:,i));
% Parameter 07
    eXXrateMax_frxD07cTp_03d(i) = max(eXXrate_frxD07cTp_03d(:,i));
    eZZrateMax_frxD07cTp_03d(i) = max(eZZrate_frxD07cTp_03d(:,i));
% Parameter 08
    eXXrateMax_frxD08cTp_03d(i) = max(eXXrate_frxD08cTp_03d(:,i));
    eZZrateMax_frxD08cTp_03d(i) = max(eZZrate_frxD08cTp_03d(:,i));
% Parameter 09
    eXXrateMax_frxD09cTp_03d(i) = max(eXXrate_frxD09cTp_03d(:,i));
    eZZrateMax_frxD09cTp_03d(i) = max(eZZrate_frxD09cTp_03d(:,i));
% Parameter 10
    eXXrateMax_frxD10cTp_03d(i) = max(eXXrate_frxD10cTp_03d(:,i));
    eZZrateMax_frxD10cTp_03d(i) = max(eZZrate_frxD10cTp_03d(:,i));
end

%% Average Strain Rate 
%
% =============================================================================================== %

eXXrateMean_frxD01cTp_03d = zeros(1,length(r));
eZZrateMean_frxD01cTp_03d = zeros(1,length(r));
eXXrateMean_frxD02cTp_03d = zeros(1,length(r));
eZZrateMean_frxD02cTp_03d = zeros(1,length(r));
eXXrateMean_frxD03cTp_03d = zeros(1,length(r));
eZZrateMean_frxD03cTp_03d = zeros(1,length(r));
eXXrateMean_frxD04cTp_03d = zeros(1,length(r));
eZZrateMean_frxD04cTp_03d = zeros(1,length(r));
eXXrateMean_frxD05cTp_03d = zeros(1,length(r));
eZZrateMean_frxD05cTp_03d = zeros(1,length(r));
eXXrateMean_frxD06cTp_03d = zeros(1,length(r));
eZZrateMean_frxD06cTp_03d = zeros(1,length(r));
eXXrateMean_frxD07cTp_03d = zeros(1,length(r));
eZZrateMean_frxD07cTp_03d = zeros(1,length(r));
eXXrateMean_frxD08cTp_03d = zeros(1,length(r));
eZZrateMean_frxD08cTp_03d = zeros(1,length(r));
eXXrateMean_frxD09cTp_03d = zeros(1,length(r));
eZZrateMean_frxD09cTp_03d = zeros(1,length(r));
eXXrateMean_frxD10cTp_03d = zeros(1,length(r));
eZZrateMean_frxD10cTp_03d = zeros(1,length(r));
for i = 1:length(r)
% Parameter 01
    eXXrateMean_frxD01cTp_03d(i) = mean(eXXrate_frxD01cTp_03d(:,i));
    eZZrateMean_frxD01cTp_03d(i) = mean(eZZrate_frxD01cTp_03d(:,i));
% Parameter 02
    eXXrateMean_frxD02cTp_03d(i) = mean(eXXrate_frxD02cTp_03d(:,i));
    eZZrateMean_frxD02cTp_03d(i) = mean(eZZrate_frxD02cTp_03d(:,i));
% Parameter 03
    eXXrateMean_frxD03cTp_03d(i) = mean(eXXrate_frxD03cTp_03d(:,i));
    eZZrateMean_frxD03cTp_03d(i) = mean(eZZrate_frxD03cTp_03d(:,i));
% Parameter 04
    eXXrateMean_frxD04cTp_03d(i) = mean(eXXrate_frxD04cTp_03d(:,i));
    eZZrateMean_frxD04cTp_03d(i) = mean(eZZrate_frxD04cTp_03d(:,i));
% Parameter 05
    eXXrateMean_frxD05cTp_03d(i) = mean(eXXrate_frxD05cTp_03d(:,i));
    eZZrateMean_frxD05cTp_03d(i) = mean(eZZrate_frxD05cTp_03d(:,i));
% Parameter 06
    eXXrateMean_frxD06cTp_03d(i) = mean(eXXrate_frxD06cTp_03d(:,i));
    eZZrateMean_frxD06cTp_03d(i) = mean(eZZrate_frxD06cTp_03d(:,i));
% Parameter 07
    eXXrateMean_frxD07cTp_03d(i) = mean(eXXrate_frxD07cTp_03d(:,i));
    eZZrateMean_frxD07cTp_03d(i) = mean(eZZrate_frxD07cTp_03d(:,i));
% Parameter 08
    eXXrateMean_frxD08cTp_03d(i) = mean(eXXrate_frxD08cTp_03d(:,i));
    eZZrateMean_frxD08cTp_03d(i) = mean(eZZrate_frxD08cTp_03d(:,i));
% Parameter 09
    eXXrateMean_frxD09cTp_03d(i) = mean(eXXrate_frxD09cTp_03d(:,i));
    eZZrateMean_frxD09cTp_03d(i) = mean(eZZrate_frxD09cTp_03d(:,i));
% Parameter 10
    eXXrateMean_frxD10cTp_03d(i) = mean(eXXrate_frxD10cTp_03d(:,i));
    eZZrateMean_frxD10cTp_03d(i) = mean(eZZrate_frxD10cTp_03d(:,i));
end



%% Corelation Coef and polyfit to eXXrate_minRateDuration
% eXXrate_minRateDuration_03d_coef = (eXXrate_minRateDuration_03d(end)-eXXrate_minRateDuration_03d(1))/(r(end)-r(1)); %s/m
% eXXrate_minRateDuration_03d_polyFit = polyfit_frxD0(r,eXXrate_minRateDuration_03d,2);
% eXXrate_minRateDuration_03d_polyVal = polyval(eXXrate_minRateDuration_03d_polyFit,r);eZZrate_minRateDuration_03d_coef = (eZZrate_minRateDuration_03d(end)-eZZrate_minRateDuration_03d(1))/(r(end)-r(1)); %s/m
% eZZrate_minRateDuration_03d_polyFit = polyfit(r,eZZrate_minRateDuration_03d,2);
% eZZrate_minRateDuration_03d_polyVal = polyval(eZZrate_minRateDuration_03d_polyFit,r);