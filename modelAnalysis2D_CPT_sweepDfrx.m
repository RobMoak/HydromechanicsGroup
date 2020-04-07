%% modelAnalysis2D_frxSurf_sweepDfrx
% Author: R. Moak
% Date: 03/30/20

%% Evaluate effect of Parameter on Pressure & Strain Signals ========================================================= %
% % This code evaluates:
% 1) maximum strain rate
% 2) time after injection maximum strain rate occurs
% 3) times strain rate is above a minimum threshold
% 4) duration strain rate is above a minimum threshold
% 5) strain magnitude while strain rate is above threshold
% 6) detectable strains based on minMag and minRate
% 7) duration strain meets threshold criteria
% 8) perfoms correlations and polynomial fits to data for interpretation
% ==================================================================================================================== % 

%% Define Sweep Parameters
sweepDfrx_paramVals = [ModelParams_sweepDfrx(1).D01_frx; 
                       ModelParams_sweepDfrx(1).D02_frx;
                       ModelParams_sweepDfrx(1).D03_frx;
                       ModelParams_sweepDfrx(1).D04_frx;
                       ModelParams_sweepDfrx(1).D05_frx;
                       ModelParams_sweepDfrx(1).D06_frx;
                       ModelParams_sweepDfrx(1).D07_frx;
                       ModelParams_sweepDfrx(1).D08_frx;
                       ModelParams_sweepDfrx(1).D09_frx;
                       ModelParams_sweepDfrx(1).D10_frx;];
                   
n_paramVals = length(sweepDfrx_paramVals);

%% Calculate Characteristic Parameters
% ==================================================================================================== %
% Characteristic Length
% ==================================================================================================== %
x_c = ModelParams_sweepDfrx(1).x_c; % [m]

% ==================================================================================================== %
% Characteristic Time
% ==================================================================================================== %
tc_sweepDfrx = zeros(1,n_paramVals);

for i = 1:n_paramVals
    tc_sweepDfrx(i) = (x_c^2)/(4*sweepDfrx_paramVals(i)); % [s]
end

n_tSteps = length(t_swpDfrx);

%% Define Key Values

% lower detection thresholds for strain magnitude and rate
minMag  = 1E-9; 
minRate = 1E-13; 

% radial distances of probe locations [m]
r        = [x_c*0.05; x_c*0.25; x_c*0.50; x_c; x_c*1.1; x_c*1.25; x_c*1.5; x_c*2.0];
n_probes = length(r);

% depth of probe locations [m]
d = [x_c*0.01; x_c*0.03; x_c*0.05; x_c*0.1; x_c*0.50];

% start time of injection
injStart = t_swpDfrx(find(p_frxBot_sweepDfrx(:,1)>0,1));

%% Obtain absolute values of strain rates

% ==================================================================================================== %
% Depth 1%
% ==================================================================================================== %
% parameter 01
eXXrate_frxD01_01d = abs(eXXrate_frxD01_01d);
eZZrate_frxD01_01d = abs(eZZrate_frxD01_01d);
eTXrate_frxD01_01d = abs(eTXrate_frxD01_01d);
% parameter 02
eXXrate_frxD02_01d = abs(eXXrate_frxD02_01d);
eZZrate_frxD02_01d = abs(eZZrate_frxD02_01d);
eTXrate_frxD02_01d = abs(eTXrate_frxD02_01d);
% parameter 03
eXXrate_frxD03_01d = abs(eXXrate_frxD03_01d);
eZZrate_frxD03_01d = abs(eZZrate_frxD03_01d);
eTXrate_frxD03_01d = abs(eTXrate_frxD03_01d);
% parameter 04
eXXrate_frxD04_01d = abs(eXXrate_frxD04_01d);
eZZrate_frxD04_01d = abs(eZZrate_frxD04_01d);
eTXrate_frxD04_01d = abs(eTXrate_frxD04_01d);
% parameter 05
eXXrate_frxD05_01d = abs(eXXrate_frxD05_01d);
eZZrate_frxD05_01d = abs(eZZrate_frxD05_01d);
eTXrate_frxD05_01d = abs(eTXrate_frxD05_01d);
% parameter 06
eXXrate_frxD06_01d = abs(eXXrate_frxD06_01d);
eZZrate_frxD06_01d = abs(eZZrate_frxD06_01d);
eTXrate_frxD06_01d = abs(eTXrate_frxD06_01d);
% parameter 07
eXXrate_frxD07_01d = abs(eXXrate_frxD07_01d);
eZZrate_frxD07_01d = abs(eZZrate_frxD07_01d);
eTXrate_frxD07_01d = abs(eTXrate_frxD07_01d);
% parameter 08
eXXrate_frxD08_01d = abs(eXXrate_frxD08_01d);
eZZrate_frxD08_01d = abs(eZZrate_frxD08_01d);
eTXrate_frxD08_01d = abs(eTXrate_frxD08_01d);
% parameter 09
eXXrate_frxD09_01d = abs(eXXrate_frxD09_01d);
eZZrate_frxD09_01d = abs(eZZrate_frxD09_01d);
eTXrate_frxD09_01d = abs(eTXrate_frxD09_01d);
% parameter 10
eXXrate_frxD10_01d = abs(eXXrate_frxD10_01d);
eZZrate_frxD10_01d = abs(eZZrate_frxD10_01d);
eTXrate_frxD10_01d = abs(eTXrate_frxD10_01d);

% ==================================================================================================== %
% Depth 3%
% ==================================================================================================== %
% parameter 01
eXXrate_frxD01_03d = abs(eXXrate_frxD01_03d);
eZZrate_frxD01_03d = abs(eZZrate_frxD01_03d);
eTXrate_frxD01_03d = abs(eTXrate_frxD01_03d);
% parameter 02
eXXrate_frxD02_03d = abs(eXXrate_frxD02_03d);
eZZrate_frxD02_03d = abs(eZZrate_frxD02_03d);
eTXrate_frxD02_03d = abs(eTXrate_frxD02_03d);
% parameter 03
eXXrate_frxD03_03d = abs(eXXrate_frxD03_03d);
eZZrate_frxD03_03d = abs(eZZrate_frxD03_03d);
eTXrate_frxD03_03d = abs(eTXrate_frxD03_03d);
% parameter 04
eXXrate_frxD04_03d = abs(eXXrate_frxD04_03d);
eZZrate_frxD04_03d = abs(eZZrate_frxD04_03d);
eTXrate_frxD04_03d = abs(eTXrate_frxD04_03d);
% parameter 05
eXXrate_frxD05_03d = abs(eXXrate_frxD05_03d);
eZZrate_frxD05_03d = abs(eZZrate_frxD05_03d);
eTXrate_frxD05_03d = abs(eTXrate_frxD05_03d);
% parameter 06
eXXrate_frxD06_03d = abs(eXXrate_frxD06_03d);
eZZrate_frxD06_03d = abs(eZZrate_frxD06_03d);
eTXrate_frxD06_03d = abs(eTXrate_frxD06_03d);
% parameter 07
eXXrate_frxD07_03d = abs(eXXrate_frxD07_03d);
eZZrate_frxD07_03d = abs(eZZrate_frxD07_03d);
eTXrate_frxD07_03d = abs(eTXrate_frxD07_03d);
% parameter 08
eXXrate_frxD08_03d = abs(eXXrate_frxD08_03d);
eZZrate_frxD08_03d = abs(eZZrate_frxD08_03d);
eTXrate_frxD08_03d = abs(eTXrate_frxD08_03d);
% parameter 09
eXXrate_frxD09_03d = abs(eXXrate_frxD09_03d);
eZZrate_frxD09_03d = abs(eZZrate_frxD09_03d);
eTXrate_frxD09_03d = abs(eTXrate_frxD09_03d);
% parameter 10
eXXrate_frxD10_03d = abs(eXXrate_frxD10_03d);
eZZrate_frxD10_03d = abs(eZZrate_frxD10_03d);
eTXrate_frxD10_03d = abs(eTXrate_frxD10_03d);

% ==================================================================================================== %
% Depth 5%
% ==================================================================================================== %
% parameter 01
eXXrate_frxD01_05d = abs(eXXrate_frxD01_05d);
eZZrate_frxD01_05d = abs(eZZrate_frxD01_05d);
eTXrate_frxD01_05d = abs(eTXrate_frxD01_05d);
% parameter 02
eXXrate_frxD02_05d = abs(eXXrate_frxD02_05d);
eZZrate_frxD02_05d = abs(eZZrate_frxD02_05d);
eTXrate_frxD02_05d = abs(eTXrate_frxD02_05d);
% parameter 03
eXXrate_frxD03_05d = abs(eXXrate_frxD03_05d);
eZZrate_frxD03_05d = abs(eZZrate_frxD03_05d);
eTXrate_frxD03_05d = abs(eTXrate_frxD03_05d);
% parameter 04
eXXrate_frxD04_05d = abs(eXXrate_frxD04_05d);
eZZrate_frxD04_05d = abs(eZZrate_frxD04_05d);
eTXrate_frxD04_05d = abs(eTXrate_frxD04_05d);
% parameter 05
eXXrate_frxD05_05d = abs(eXXrate_frxD05_05d);
eZZrate_frxD05_05d = abs(eZZrate_frxD05_05d);
eTXrate_frxD05_05d = abs(eTXrate_frxD05_05d);
% parameter 06
eXXrate_frxD06_05d = abs(eXXrate_frxD06_05d);
eZZrate_frxD06_05d = abs(eZZrate_frxD06_05d);
eTXrate_frxD06_05d = abs(eTXrate_frxD06_05d);
% parameter 07
eXXrate_frxD07_05d = abs(eXXrate_frxD07_05d);
eZZrate_frxD07_05d = abs(eZZrate_frxD07_05d);
eTXrate_frxD07_05d = abs(eTXrate_frxD07_05d);
% parameter 08
eXXrate_frxD08_05d = abs(eXXrate_frxD08_05d);
eZZrate_frxD08_05d = abs(eZZrate_frxD08_05d);
eTXrate_frxD08_05d = abs(eTXrate_frxD08_05d);
% parameter 09
eXXrate_frxD09_05d = abs(eXXrate_frxD09_05d);
eZZrate_frxD09_05d = abs(eZZrate_frxD09_05d);
eTXrate_frxD09_05d = abs(eTXrate_frxD09_05d);
% parameter 10
eXXrate_frxD10_05d = abs(eXXrate_frxD10_05d);
eZZrate_frxD10_05d = abs(eZZrate_frxD10_05d);
eTXrate_frxD10_05d = abs(eTXrate_frxD10_05d);

% ==================================================================================================== %
% Depth 10%
% ==================================================================================================== %
% parameter 01
eXXrate_frxD01_10d = abs(eXXrate_frxD01_10d);
eZZrate_frxD01_10d = abs(eZZrate_frxD01_10d);
eTXrate_frxD01_10d = abs(eTXrate_frxD01_10d);
% parameter 02
eXXrate_frxD02_10d = abs(eXXrate_frxD02_10d);
eZZrate_frxD02_10d = abs(eZZrate_frxD02_10d);
eTXrate_frxD02_10d = abs(eTXrate_frxD02_10d);
% parameter 03
eXXrate_frxD03_10d = abs(eXXrate_frxD03_10d);
eZZrate_frxD03_10d = abs(eZZrate_frxD03_10d);
eTXrate_frxD03_10d = abs(eTXrate_frxD03_10d);
% parameter 04
eXXrate_frxD04_10d = abs(eXXrate_frxD04_10d);
eZZrate_frxD04_10d = abs(eZZrate_frxD04_10d);
eTXrate_frxD04_10d = abs(eTXrate_frxD04_10d);
% parameter 05
eXXrate_frxD05_10d = abs(eXXrate_frxD05_10d);
eZZrate_frxD05_10d = abs(eZZrate_frxD05_10d);
eTXrate_frxD05_10d = abs(eTXrate_frxD05_10d);
% parameter 06
eXXrate_frxD06_10d = abs(eXXrate_frxD06_10d);
eZZrate_frxD06_10d = abs(eZZrate_frxD06_10d);
eTXrate_frxD06_10d = abs(eTXrate_frxD06_10d);
% parameter 07
eXXrate_frxD07_10d = abs(eXXrate_frxD07_10d);
eZZrate_frxD07_10d = abs(eZZrate_frxD07_10d);
eTXrate_frxD07_10d = abs(eTXrate_frxD07_10d);
% parameter 08
eXXrate_frxD08_10d = abs(eXXrate_frxD08_10d);
eZZrate_frxD08_10d = abs(eZZrate_frxD08_10d);
eTXrate_frxD08_10d = abs(eTXrate_frxD08_10d);
% parameter 09
eXXrate_frxD09_10d = abs(eXXrate_frxD09_10d);
eZZrate_frxD09_10d = abs(eZZrate_frxD09_10d);
eTXrate_frxD09_10d = abs(eTXrate_frxD09_10d);
% parameter 10
eXXrate_frxD10_10d = abs(eXXrate_frxD10_10d);
eZZrate_frxD10_10d = abs(eZZrate_frxD10_10d);
eTXrate_frxD10_10d = abs(eTXrate_frxD10_10d);

% ==================================================================================================== %
% Depth 50%
% ==================================================================================================== %
% parameter 01
eXXrate_frxD01_50d = abs(eXXrate_frxD01_50d);
eZZrate_frxD01_50d = abs(eZZrate_frxD01_50d);
eTXrate_frxD01_50d = abs(eTXrate_frxD01_50d);
% parameter 02
eXXrate_frxD02_50d = abs(eXXrate_frxD02_50d);
eZZrate_frxD02_50d = abs(eZZrate_frxD02_50d);
eTXrate_frxD02_50d = abs(eTXrate_frxD02_50d);
% parameter 03
eXXrate_frxD03_50d = abs(eXXrate_frxD03_50d);
eZZrate_frxD03_50d = abs(eZZrate_frxD03_50d);
eTXrate_frxD03_50d = abs(eTXrate_frxD03_50d);
% parameter 04
eXXrate_frxD04_50d = abs(eXXrate_frxD04_50d);
eZZrate_frxD04_50d = abs(eZZrate_frxD04_50d);
eTXrate_frxD04_50d = abs(eTXrate_frxD04_50d);
% parameter 05
eXXrate_frxD05_50d = abs(eXXrate_frxD05_50d);
eZZrate_frxD05_50d = abs(eZZrate_frxD05_50d);
eTXrate_frxD05_50d = abs(eTXrate_frxD05_50d);
% parameter 06
eXXrate_frxD06_50d = abs(eXXrate_frxD06_50d);
eZZrate_frxD06_50d = abs(eZZrate_frxD06_50d);
eTXrate_frxD06_50d = abs(eTXrate_frxD06_50d);
% parameter 07
eXXrate_frxD07_50d = abs(eXXrate_frxD07_50d);
eZZrate_frxD07_50d = abs(eZZrate_frxD07_50d);
eTXrate_frxD07_50d = abs(eTXrate_frxD07_50d);
% parameter 08
eXXrate_frxD08_50d = abs(eXXrate_frxD08_50d);
eZZrate_frxD08_50d = abs(eZZrate_frxD08_50d);
eTXrate_frxD08_50d = abs(eTXrate_frxD08_50d);
% parameter 09
eXXrate_frxD09_50d = abs(eXXrate_frxD09_50d);
eZZrate_frxD09_50d = abs(eZZrate_frxD09_50d);
eTXrate_frxD09_50d = abs(eTXrate_frxD09_50d);
% parameter 10
eXXrate_frxD10_50d = abs(eXXrate_frxD10_50d);
eZZrate_frxD10_50d = abs(eZZrate_frxD10_50d);
eTXrate_frxD10_50d = abs(eTXrate_frxD10_50d);

%% Maximum Strain Rate

% parameter 01
eXXrateMax_frxD01_01d = zeros(n_tSteps,n_probes);
eZZrateMax_frxD01_01d = zeros(n_tSteps,n_probes);
eTXrateMax_frxD01_01d = zeros(n_tSteps,n_probes);
eXXrateMax_frxD01_03d = zeros(n_tSteps,n_probes);
eZZrateMax_frxD01_03d = zeros(n_tSteps,n_probes);
eTXrateMax_frxD01_03d = zeros(n_tSteps,n_probes);
eXXrateMax_frxD01_05d = zeros(n_tSteps,n_probes);
eZZrateMax_frxD01_05d = zeros(n_tSteps,n_probes);
eTXrateMax_frxD01_05d = zeros(n_tSteps,n_probes);
eXXrateMax_frxD01_10d = zeros(n_tSteps,n_probes);
eZZrateMax_frxD01_10d = zeros(n_tSteps,n_probes);
eTXrateMax_frxD01_10d = zeros(n_tSteps,n_probes);
eXXrateMax_frxD01_50d = zeros(n_tSteps,n_probes);
eZZrateMax_frxD01_50d = zeros(n_tSteps,n_probes);
eTXrateMax_frxD01_50d = zeros(n_tSteps,n_probes);
% parameter 02
eXXrateMax_frxD02_01d = zeros(n_tSteps,n_probes);
eZZrateMax_frxD02_01d = zeros(n_tSteps,n_probes);
eTXrateMax_frxD02_01d = zeros(n_tSteps,n_probes);
eXXrateMax_frxD02_03d = zeros(n_tSteps,n_probes);
eZZrateMax_frxD02_03d = zeros(n_tSteps,n_probes);
eTXrateMax_frxD02_03d = zeros(n_tSteps,n_probes);
eXXrateMax_frxD02_05d = zeros(n_tSteps,n_probes);
eZZrateMax_frxD02_05d = zeros(n_tSteps,n_probes);
eTXrateMax_frxD02_05d = zeros(n_tSteps,n_probes);
eXXrateMax_frxD02_10d = zeros(n_tSteps,n_probes);
eZZrateMax_frxD02_10d = zeros(n_tSteps,n_probes);
eTXrateMax_frxD02_10d = zeros(n_tSteps,n_probes);
eXXrateMax_frxD02_50d = zeros(n_tSteps,n_probes);
eZZrateMax_frxD02_50d = zeros(n_tSteps,n_probes);
eTXrateMax_frxD02_50d = zeros(n_tSteps,n_probes);
% parameter 03
eXXrateMax_frxD03_01d = zeros(n_tSteps,n_probes);
eZZrateMax_frxD03_01d = zeros(n_tSteps,n_probes);
eTXrateMax_frxD03_01d = zeros(n_tSteps,n_probes);
eXXrateMax_frxD03_03d = zeros(n_tSteps,n_probes);
eZZrateMax_frxD03_03d = zeros(n_tSteps,n_probes);
eTXrateMax_frxD03_03d = zeros(n_tSteps,n_probes);
eXXrateMax_frxD03_05d = zeros(n_tSteps,n_probes);
eZZrateMax_frxD03_05d = zeros(n_tSteps,n_probes);
eTXrateMax_frxD03_05d = zeros(n_tSteps,n_probes);
eXXrateMax_frxD03_10d = zeros(n_tSteps,n_probes);
eZZrateMax_frxD03_10d = zeros(n_tSteps,n_probes);
eTXrateMax_frxD03_10d = zeros(n_tSteps,n_probes);
eXXrateMax_frxD03_50d = zeros(n_tSteps,n_probes);
eZZrateMax_frxD03_50d = zeros(n_tSteps,n_probes);
eTXrateMax_frxD03_50d = zeros(n_tSteps,n_probes);
% parameter 04
eXXrateMax_frxD04_01d = zeros(n_tSteps,n_probes);
eZZrateMax_frxD04_01d = zeros(n_tSteps,n_probes);
eTXrateMax_frxD04_01d = zeros(n_tSteps,n_probes);
eXXrateMax_frxD04_03d = zeros(n_tSteps,n_probes);
eZZrateMax_frxD04_03d = zeros(n_tSteps,n_probes);
eTXrateMax_frxD04_03d = zeros(n_tSteps,n_probes);
eXXrateMax_frxD04_05d = zeros(n_tSteps,n_probes);
eZZrateMax_frxD04_05d = zeros(n_tSteps,n_probes);
eTXrateMax_frxD04_05d = zeros(n_tSteps,n_probes);
eXXrateMax_frxD04_10d = zeros(n_tSteps,n_probes);
eZZrateMax_frxD04_10d = zeros(n_tSteps,n_probes);
eTXrateMax_frxD04_10d = zeros(n_tSteps,n_probes);
eXXrateMax_frxD04_50d = zeros(n_tSteps,n_probes);
eZZrateMax_frxD04_50d = zeros(n_tSteps,n_probes);
eTXrateMax_frxD04_50d = zeros(n_tSteps,n_probes);
% parameter 05
eXXrateMax_frxD05_01d = zeros(n_tSteps,n_probes);
eZZrateMax_frxD05_01d = zeros(n_tSteps,n_probes);
eTXrateMax_frxD05_01d = zeros(n_tSteps,n_probes);
eXXrateMax_frxD05_03d = zeros(n_tSteps,n_probes);
eZZrateMax_frxD05_03d = zeros(n_tSteps,n_probes);
eTXrateMax_frxD05_03d = zeros(n_tSteps,n_probes);
eXXrateMax_frxD05_05d = zeros(n_tSteps,n_probes);
eZZrateMax_frxD05_05d = zeros(n_tSteps,n_probes);
eTXrateMax_frxD05_05d = zeros(n_tSteps,n_probes);
eXXrateMax_frxD05_10d = zeros(n_tSteps,n_probes);
eZZrateMax_frxD05_10d = zeros(n_tSteps,n_probes);
eTXrateMax_frxD05_10d = zeros(n_tSteps,n_probes);
eXXrateMax_frxD05_50d = zeros(n_tSteps,n_probes);
eZZrateMax_frxD05_50d = zeros(n_tSteps,n_probes);
eTXrateMax_frxD05_50d = zeros(n_tSteps,n_probes);
% parameter 06
eXXrateMax_frxD06_01d = zeros(n_tSteps,n_probes);
eZZrateMax_frxD06_01d = zeros(n_tSteps,n_probes);
eTXrateMax_frxD06_01d = zeros(n_tSteps,n_probes);
eXXrateMax_frxD06_03d = zeros(n_tSteps,n_probes);
eZZrateMax_frxD06_03d = zeros(n_tSteps,n_probes);
eTXrateMax_frxD06_03d = zeros(n_tSteps,n_probes);
eXXrateMax_frxD06_05d = zeros(n_tSteps,n_probes);
eZZrateMax_frxD06_05d = zeros(n_tSteps,n_probes);
eTXrateMax_frxD06_05d = zeros(n_tSteps,n_probes);
eXXrateMax_frxD06_10d = zeros(n_tSteps,n_probes);
eZZrateMax_frxD06_10d = zeros(n_tSteps,n_probes);
eTXrateMax_frxD06_10d = zeros(n_tSteps,n_probes);
eXXrateMax_frxD06_50d = zeros(n_tSteps,n_probes);
eZZrateMax_frxD06_50d = zeros(n_tSteps,n_probes);
eTXrateMax_frxD06_50d = zeros(n_tSteps,n_probes);
% parameter 07
eXXrateMax_frxD07_01d = zeros(n_tSteps,n_probes);
eZZrateMax_frxD07_01d = zeros(n_tSteps,n_probes);
eTXrateMax_frxD07_01d = zeros(n_tSteps,n_probes);
eXXrateMax_frxD07_03d = zeros(n_tSteps,n_probes);
eZZrateMax_frxD07_03d = zeros(n_tSteps,n_probes);
eTXrateMax_frxD07_03d = zeros(n_tSteps,n_probes);
eXXrateMax_frxD07_05d = zeros(n_tSteps,n_probes);
eZZrateMax_frxD07_05d = zeros(n_tSteps,n_probes);
eTXrateMax_frxD07_05d = zeros(n_tSteps,n_probes);
eXXrateMax_frxD07_10d = zeros(n_tSteps,n_probes);
eZZrateMax_frxD07_10d = zeros(n_tSteps,n_probes);
eTXrateMax_frxD07_10d = zeros(n_tSteps,n_probes);
eXXrateMax_frxD07_50d = zeros(n_tSteps,n_probes);
eZZrateMax_frxD07_50d = zeros(n_tSteps,n_probes);
eTXrateMax_frxD07_50d = zeros(n_tSteps,n_probes);
% parameter 08
eXXrateMax_frxD08_01d = zeros(n_tSteps,n_probes);
eZZrateMax_frxD08_01d = zeros(n_tSteps,n_probes);
eTXrateMax_frxD08_01d = zeros(n_tSteps,n_probes);
eXXrateMax_frxD08_03d = zeros(n_tSteps,n_probes);
eZZrateMax_frxD08_03d = zeros(n_tSteps,n_probes);
eTXrateMax_frxD08_03d = zeros(n_tSteps,n_probes);
eXXrateMax_frxD08_05d = zeros(n_tSteps,n_probes);
eZZrateMax_frxD08_05d = zeros(n_tSteps,n_probes);
eTXrateMax_frxD08_05d = zeros(n_tSteps,n_probes);
eXXrateMax_frxD08_10d = zeros(n_tSteps,n_probes);
eZZrateMax_frxD08_10d = zeros(n_tSteps,n_probes);
eTXrateMax_frxD08_10d = zeros(n_tSteps,n_probes);
eXXrateMax_frxD08_50d = zeros(n_tSteps,n_probes);
eZZrateMax_frxD08_50d = zeros(n_tSteps,n_probes);
eTXrateMax_frxD08_50d = zeros(n_tSteps,n_probes);
% parameter 09
eXXrateMax_frxD09_01d = zeros(n_tSteps,n_probes);
eZZrateMax_frxD09_01d = zeros(n_tSteps,n_probes);
eTXrateMax_frxD09_01d = zeros(n_tSteps,n_probes);
eXXrateMax_frxD09_03d = zeros(n_tSteps,n_probes);
eZZrateMax_frxD09_03d = zeros(n_tSteps,n_probes);
eTXrateMax_frxD09_03d = zeros(n_tSteps,n_probes);
eXXrateMax_frxD09_05d = zeros(n_tSteps,n_probes);
eZZrateMax_frxD09_05d = zeros(n_tSteps,n_probes);
eTXrateMax_frxD09_05d = zeros(n_tSteps,n_probes);
eXXrateMax_frxD09_10d = zeros(n_tSteps,n_probes);
eZZrateMax_frxD09_10d = zeros(n_tSteps,n_probes);
eTXrateMax_frxD09_10d = zeros(n_tSteps,n_probes);
eXXrateMax_frxD09_50d = zeros(n_tSteps,n_probes);
eZZrateMax_frxD09_50d = zeros(n_tSteps,n_probes);
eTXrateMax_frxD09_50d = zeros(n_tSteps,n_probes);
% parameter 10
eXXrateMax_frxD10_01d = zeros(n_tSteps,n_probes);
eZZrateMax_frxD10_01d = zeros(n_tSteps,n_probes);
eTXrateMax_frxD10_01d = zeros(n_tSteps,n_probes);
eXXrateMax_frxD10_03d = zeros(n_tSteps,n_probes);
eZZrateMax_frxD10_03d = zeros(n_tSteps,n_probes);
eTXrateMax_frxD10_03d = zeros(n_tSteps,n_probes);
eXXrateMax_frxD10_05d = zeros(n_tSteps,n_probes);
eZZrateMax_frxD10_05d = zeros(n_tSteps,n_probes);
eTXrateMax_frxD10_05d = zeros(n_tSteps,n_probes);
eXXrateMax_frxD10_10d = zeros(n_tSteps,n_probes);
eZZrateMax_frxD10_10d = zeros(n_tSteps,n_probes);
eTXrateMax_frxD10_10d = zeros(n_tSteps,n_probes);
eXXrateMax_frxD10_50d = zeros(n_tSteps,n_probes);
eZZrateMax_frxD10_50d = zeros(n_tSteps,n_probes);
eTXrateMax_frxD10_50d = zeros(n_tSteps,n_probes);

for i = 1:n_probes
% ==================================================================================================== %
% Depth 1%
% ==================================================================================================== %
% parameter 01
    eXXrateMax_frxD01_01d(i) = max(eXXrate_frxD01_01d(:,i));
    eZZrateMax_frxD01_01d(i) = max(eZZrate_frxD01_01d(:,i));
    eTXrateMax_frxD01_01d(i) = max(eTXrate_frxD01_01d(:,i));
% parameter 02
    eXXrateMax_frxD02_01d(i) = max(eXXrate_frxD02_01d(:,i));
    eZZrateMax_frxD02_01d(i) = max(eZZrate_frxD02_01d(:,i));
    eTXrateMax_frxD02_01d(i) = max(eTXrate_frxD02_01d(:,i));
% parameter 03
    eXXrateMax_frxD03_01d(i) = max(eXXrate_frxD03_01d(:,i));
    eZZrateMax_frxD03_01d(i) = max(eZZrate_frxD03_01d(:,i));
    eTXrateMax_frxD03_01d(i) = max(eTXrate_frxD03_01d(:,i));
% parameter 04
    eXXrateMax_frxD04_01d(i) = max(eXXrate_frxD04_01d(:,i));
    eZZrateMax_frxD04_01d(i) = max(eZZrate_frxD04_01d(:,i));
    eTXrateMax_frxD04_01d(i) = max(eTXrate_frxD04_01d(:,i));
% parameter 05
    eXXrateMax_frxD05_01d(i) = max(eXXrate_frxD05_01d(:,i));
    eZZrateMax_frxD05_01d(i) = max(eZZrate_frxD05_01d(:,i));
    eTXrateMax_frxD05_01d(i) = max(eTXrate_frxD05_01d(:,i));
% parameter 06
    eXXrateMax_frxD06_01d(i) = max(eXXrate_frxD06_01d(:,i));
    eZZrateMax_frxD06_01d(i) = max(eZZrate_frxD06_01d(:,i));
    eTXrateMax_frxD06_01d(i) = max(eTXrate_frxD06_01d(:,i));
% parameter 07
    eXXrateMax_frxD07_01d(i) = max(eXXrate_frxD07_01d(:,i));
    eZZrateMax_frxD07_01d(i) = max(eZZrate_frxD07_01d(:,i));
    eTXrateMax_frxD07_01d(i) = max(eTXrate_frxD07_01d(:,i));
% parameter 08
    eXXrateMax_frxD08_01d(i) = max(eXXrate_frxD08_01d(:,i));
    eZZrateMax_frxD08_01d(i) = max(eZZrate_frxD08_01d(:,i));
    eTXrateMax_frxD08_01d(i) = max(eTXrate_frxD08_01d(:,i));
% parameter 09
    eXXrateMax_frxD09_01d(i) = max(eXXrate_frxD09_01d(:,i));
    eZZrateMax_frxD09_01d(i) = max(eZZrate_frxD09_01d(:,i));
    eTXrateMax_frxD09_01d(i) = max(eTXrate_frxD09_01d(:,i));
% parameter 10
    eXXrateMax_frxD10_01d(i) = max(eXXrate_frxD10_01d(:,i));
    eZZrateMax_frxD10_01d(i) = max(eZZrate_frxD10_01d(:,i));
    eTXrateMax_frxD10_01d(i) = max(eTXrate_frxD10_01d(:,i));

% ==================================================================================================== %
% Depth 3%
% ==================================================================================================== %
% parameter 01
    eXXrateMax_frxD01_03d(i) = max(eXXrate_frxD01_03d(:,i));
    eZZrateMax_frxD01_03d(i) = max(eZZrate_frxD01_03d(:,i));
    eTXrateMax_frxD01_03d(i) = max(eTXrate_frxD01_03d(:,i));
% parameter 02
    eXXrateMax_frxD02_03d(i) = max(eXXrate_frxD02_03d(:,i));
    eZZrateMax_frxD02_03d(i) = max(eZZrate_frxD02_03d(:,i));
    eTXrateMax_frxD02_03d(i) = max(eTXrate_frxD02_03d(:,i));
% parameter 03
    eXXrateMax_frxD03_03d(i) = max(eXXrate_frxD03_03d(:,i));
    eZZrateMax_frxD03_03d(i) = max(eZZrate_frxD03_03d(:,i));
    eTXrateMax_frxD03_03d(i) = max(eTXrate_frxD03_03d(:,i));
% parameter 04
    eXXrateMax_frxD04_03d(i) = max(eXXrate_frxD04_03d(:,i));
    eZZrateMax_frxD04_03d(i) = max(eZZrate_frxD04_03d(:,i));
    eTXrateMax_frxD04_03d(i) = max(eTXrate_frxD04_03d(:,i));
% parameter 05
    eXXrateMax_frxD05_03d(i) = max(eXXrate_frxD05_03d(:,i));
    eZZrateMax_frxD05_03d(i) = max(eZZrate_frxD05_03d(:,i));
    eTXrateMax_frxD05_03d(i) = max(eTXrate_frxD05_03d(:,i));
% parameter 06
    eXXrateMax_frxD06_03d(i) = max(eXXrate_frxD06_03d(:,i));
    eZZrateMax_frxD06_03d(i) = max(eZZrate_frxD06_03d(:,i));
    eTXrateMax_frxD06_03d(i) = max(eTXrate_frxD06_03d(:,i));
% parameter 07
    eXXrateMax_frxD07_03d(i) = max(eXXrate_frxD07_03d(:,i));
    eZZrateMax_frxD07_03d(i) = max(eZZrate_frxD07_03d(:,i));
    eTXrateMax_frxD07_03d(i) = max(eTXrate_frxD07_03d(:,i));
% parameter 08
    eXXrateMax_frxD08_03d(i) = max(eXXrate_frxD08_03d(:,i));
    eZZrateMax_frxD08_03d(i) = max(eZZrate_frxD08_03d(:,i));
    eTXrateMax_frxD08_03d(i) = max(eTXrate_frxD08_03d(:,i));
% parameter 09
    eXXrateMax_frxD09_03d(i) = max(eXXrate_frxD09_03d(:,i));
    eZZrateMax_frxD09_03d(i) = max(eZZrate_frxD09_03d(:,i));
    eTXrateMax_frxD09_03d(i) = max(eTXrate_frxD09_03d(:,i));
% parameter 10
    eXXrateMax_frxD10_03d(i) = max(eXXrate_frxD10_03d(:,i));
    eZZrateMax_frxD10_03d(i) = max(eZZrate_frxD10_03d(:,i));
    eTXrateMax_frxD10_03d(i) = max(eTXrate_frxD10_03d(:,i));
    
% ==================================================================================================== %
% Depth 5%
% ==================================================================================================== %
% parameter 01
    eXXrateMax_frxD01_05d(i) = max(eXXrate_frxD01_05d(:,i));
    eZZrateMax_frxD01_05d(i) = max(eZZrate_frxD01_05d(:,i));
    eTXrateMax_frxD01_05d(i) = max(eTXrate_frxD01_05d(:,i));
% parameter 02
    eXXrateMax_frxD02_05d(i) = max(eXXrate_frxD02_05d(:,i));
    eZZrateMax_frxD02_05d(i) = max(eZZrate_frxD02_05d(:,i));
    eTXrateMax_frxD02_05d(i) = max(eTXrate_frxD02_05d(:,i));
% parameter 03
    eXXrateMax_frxD03_05d(i) = max(eXXrate_frxD03_05d(:,i));
    eZZrateMax_frxD03_05d(i) = max(eZZrate_frxD03_05d(:,i));
    eTXrateMax_frxD03_05d(i) = max(eTXrate_frxD03_05d(:,i));
% parameter 04
    eXXrateMax_frxD04_05d(i) = max(eXXrate_frxD04_05d(:,i));
    eZZrateMax_frxD04_05d(i) = max(eZZrate_frxD04_05d(:,i));
    eTXrateMax_frxD04_05d(i) = max(eTXrate_frxD04_05d(:,i));
% parameter 05
    eXXrateMax_frxD05_05d(i) = max(eXXrate_frxD05_05d(:,i));
    eZZrateMax_frxD05_05d(i) = max(eZZrate_frxD05_05d(:,i));
    eTXrateMax_frxD05_05d(i) = max(eTXrate_frxD05_05d(:,i));
% parameter 06
    eXXrateMax_frxD06_05d(i) = max(eXXrate_frxD06_05d(:,i));
    eZZrateMax_frxD06_05d(i) = max(eZZrate_frxD06_05d(:,i));
    eTXrateMax_frxD06_05d(i) = max(eTXrate_frxD06_05d(:,i));
% parameter 07
    eXXrateMax_frxD07_05d(i) = max(eXXrate_frxD07_05d(:,i));
    eZZrateMax_frxD07_05d(i) = max(eZZrate_frxD07_05d(:,i));
    eTXrateMax_frxD07_05d(i) = max(eTXrate_frxD07_05d(:,i));
% parameter 08
    eXXrateMax_frxD08_05d(i) = max(eXXrate_frxD08_05d(:,i));
    eZZrateMax_frxD08_05d(i) = max(eZZrate_frxD08_05d(:,i));
    eTXrateMax_frxD08_05d(i) = max(eTXrate_frxD08_05d(:,i));
% parameter 09
    eXXrateMax_frxD09_05d(i) = max(eXXrate_frxD09_05d(:,i));
    eZZrateMax_frxD09_05d(i) = max(eZZrate_frxD09_05d(:,i));
    eTXrateMax_frxD09_05d(i) = max(eTXrate_frxD09_05d(:,i));
% parameter 10
    eXXrateMax_frxD10_05d(i) = max(eXXrate_frxD10_05d(:,i));
    eZZrateMax_frxD10_05d(i) = max(eZZrate_frxD10_05d(:,i));
    eTXrateMax_frxD10_05d(i) = max(eTXrate_frxD10_05d(:,i));
    
% ==================================================================================================== %
% Depth 10%
% ==================================================================================================== %
% parameter 01
    eXXrateMax_frxD01_10d(i) = max(eXXrate_frxD01_10d(:,i));
    eZZrateMax_frxD01_10d(i) = max(eZZrate_frxD01_10d(:,i));
    eTXrateMax_frxD01_10d(i) = max(eTXrate_frxD01_10d(:,i));
% parameter 02
    eXXrateMax_frxD02_10d(i) = max(eXXrate_frxD02_10d(:,i));
    eZZrateMax_frxD02_10d(i) = max(eZZrate_frxD02_10d(:,i));
    eTXrateMax_frxD02_10d(i) = max(eTXrate_frxD02_10d(:,i));
% parameter 03
    eXXrateMax_frxD03_10d(i) = max(eXXrate_frxD03_10d(:,i));
    eZZrateMax_frxD03_10d(i) = max(eZZrate_frxD03_10d(:,i));
    eTXrateMax_frxD03_10d(i) = max(eTXrate_frxD03_10d(:,i));
% parameter 04
    eXXrateMax_frxD04_10d(i) = max(eXXrate_frxD04_10d(:,i));
    eZZrateMax_frxD04_10d(i) = max(eZZrate_frxD04_10d(:,i));
    eTXrateMax_frxD04_10d(i) = max(eTXrate_frxD04_10d(:,i));
% parameter 05
    eXXrateMax_frxD05_10d(i) = max(eXXrate_frxD05_10d(:,i));
    eZZrateMax_frxD05_10d(i) = max(eZZrate_frxD05_10d(:,i));
    eTXrateMax_frxD05_10d(i) = max(eTXrate_frxD05_10d(:,i));
% parameter 06
    eXXrateMax_frxD06_10d(i) = max(eXXrate_frxD06_10d(:,i));
    eZZrateMax_frxD06_10d(i) = max(eZZrate_frxD06_10d(:,i));
    eTXrateMax_frxD06_10d(i) = max(eTXrate_frxD06_10d(:,i));
% parameter 07
    eXXrateMax_frxD07_10d(i) = max(eXXrate_frxD07_10d(:,i));
    eZZrateMax_frxD07_10d(i) = max(eZZrate_frxD07_10d(:,i));
    eTXrateMax_frxD07_10d(i) = max(eTXrate_frxD07_10d(:,i));
% parameter 08
    eXXrateMax_frxD08_10d(i) = max(eXXrate_frxD08_10d(:,i));
    eZZrateMax_frxD08_10d(i) = max(eZZrate_frxD08_10d(:,i));
    eTXrateMax_frxD08_10d(i) = max(eTXrate_frxD08_10d(:,i));
% parameter 09
    eXXrateMax_frxD09_10d(i) = max(eXXrate_frxD09_10d(:,i));
    eZZrateMax_frxD09_10d(i) = max(eZZrate_frxD09_10d(:,i));
    eTXrateMax_frxD09_10d(i) = max(eTXrate_frxD09_10d(:,i));
% parameter 10
    eXXrateMax_frxD10_10d(i) = max(eXXrate_frxD10_10d(:,i));
    eZZrateMax_frxD10_10d(i) = max(eZZrate_frxD10_10d(:,i));
    eTXrateMax_frxD10_10d(i) = max(eTXrate_frxD10_10d(:,i));
    
% ==================================================================================================== %
% Depth 50%
% ==================================================================================================== %
% parameter 01
    eXXrateMax_frxD01_50d(i) = max(eXXrate_frxD01_50d(:,i));
    eZZrateMax_frxD01_50d(i) = max(eZZrate_frxD01_50d(:,i));
    eTXrateMax_frxD01_50d(i) = max(eTXrate_frxD01_50d(:,i));
% parameter 02
    eXXrateMax_frxD02_50d(i) = max(eXXrate_frxD02_50d(:,i));
    eZZrateMax_frxD02_50d(i) = max(eZZrate_frxD02_50d(:,i));
    eTXrateMax_frxD02_50d(i) = max(eTXrate_frxD02_50d(:,i));
% parameter 03
    eXXrateMax_frxD03_50d(i) = max(eXXrate_frxD03_50d(:,i));
    eZZrateMax_frxD03_50d(i) = max(eZZrate_frxD03_50d(:,i));
    eTXrateMax_frxD03_50d(i) = max(eTXrate_frxD03_50d(:,i));
% parameter 04
    eXXrateMax_frxD04_50d(i) = max(eXXrate_frxD04_50d(:,i));
    eZZrateMax_frxD04_50d(i) = max(eZZrate_frxD04_50d(:,i));
    eTXrateMax_frxD04_50d(i) = max(eTXrate_frxD04_50d(:,i));
% parameter 05
    eXXrateMax_frxD05_50d(i) = max(eXXrate_frxD05_50d(:,i));
    eZZrateMax_frxD05_50d(i) = max(eZZrate_frxD05_50d(:,i));
    eTXrateMax_frxD05_50d(i) = max(eTXrate_frxD05_50d(:,i));
% parameter 06
    eXXrateMax_frxD06_50d(i) = max(eXXrate_frxD06_50d(:,i));
    eZZrateMax_frxD06_50d(i) = max(eZZrate_frxD06_50d(:,i));
    eTXrateMax_frxD06_50d(i) = max(eTXrate_frxD06_50d(:,i));
% parameter 07
    eXXrateMax_frxD07_50d(i) = max(eXXrate_frxD07_50d(:,i));
    eZZrateMax_frxD07_50d(i) = max(eZZrate_frxD07_50d(:,i));
    eTXrateMax_frxD07_50d(i) = max(eTXrate_frxD07_50d(:,i));
% parameter 08
    eXXrateMax_frxD08_50d(i) = max(eXXrate_frxD08_50d(:,i));
    eZZrateMax_frxD08_50d(i) = max(eZZrate_frxD08_50d(:,i));
    eTXrateMax_frxD08_50d(i) = max(eTXrate_frxD08_50d(:,i));
% parameter 09
    eXXrateMax_frxD09_50d(i) = max(eXXrate_frxD09_50d(:,i));
    eZZrateMax_frxD09_50d(i) = max(eZZrate_frxD09_50d(:,i));
    eTXrateMax_frxD09_50d(i) = max(eTXrate_frxD09_50d(:,i));
% parameter 10
    eXXrateMax_frxD10_50d(i) = max(eXXrate_frxD10_50d(:,i));
    eZZrateMax_frxD10_50d(i) = max(eZZrate_frxD10_50d(:,i));
    eTXrateMax_frxD10_50d(i) = max(eTXrate_frxD10_50d(:,i));
end

%% Time after injection at which maximum strain rate occurs

t_eXXrateMax_frxD01_01d = zeros(1,n_probes);
t_eZZrateMax_frxD01_01d = zeros(1,n_probes);
t_eTXrateMax_frxD01_01d = zeros(1,n_probes);
t_eXXrateMax_frxD01_03d = zeros(1,n_probes);
t_eZZrateMax_frxD01_03d = zeros(1,n_probes);
t_eTXrateMax_frxD01_03d = zeros(1,n_probes);
t_eXXrateMax_frxD01_05d = zeros(1,n_probes);
t_eZZrateMax_frxD01_05d = zeros(1,n_probes);
t_eTXrateMax_frxD01_05d = zeros(1,n_probes);
t_eXXrateMax_frxD01_10d = zeros(1,n_probes);
t_eZZrateMax_frxD01_10d = zeros(1,n_probes);
t_eTXrateMax_frxD01_10d = zeros(1,n_probes);
t_eXXrateMax_frxD01_50d = zeros(1,n_probes);
t_eZZrateMax_frxD01_50d = zeros(1,n_probes);
t_eTXrateMax_frxD01_50d = zeros(1,n_probes);
% parameter 02
t_eXXrateMax_frxD02_01d = zeros(1,n_probes);
t_eZZrateMax_frxD02_01d = zeros(1,n_probes);
t_eTXrateMax_frxD02_01d = zeros(1,n_probes);
t_eXXrateMax_frxD02_03d = zeros(1,n_probes);
t_eZZrateMax_frxD02_03d = zeros(1,n_probes);
t_eTXrateMax_frxD02_03d = zeros(1,n_probes);
t_eXXrateMax_frxD02_05d = zeros(1,n_probes);
t_eZZrateMax_frxD02_05d = zeros(1,n_probes);
t_eTXrateMax_frxD02_05d = zeros(1,n_probes);
t_eXXrateMax_frxD02_10d = zeros(1,n_probes);
t_eZZrateMax_frxD02_10d = zeros(1,n_probes);
t_eTXrateMax_frxD02_10d = zeros(1,n_probes);
t_eXXrateMax_frxD02_50d = zeros(1,n_probes);
t_eZZrateMax_frxD02_50d = zeros(1,n_probes);
t_eTXrateMax_frxD02_50d = zeros(1,n_probes);
% parameter 03
t_eXXrateMax_frxD03_01d = zeros(1,n_probes);
t_eZZrateMax_frxD03_01d = zeros(1,n_probes);
t_eTXrateMax_frxD03_01d = zeros(1,n_probes);
t_eXXrateMax_frxD03_03d = zeros(1,n_probes);
t_eZZrateMax_frxD03_03d = zeros(1,n_probes);
t_eTXrateMax_frxD03_03d = zeros(1,n_probes);
t_eXXrateMax_frxD03_05d = zeros(1,n_probes);
t_eZZrateMax_frxD03_05d = zeros(1,n_probes);
t_eTXrateMax_frxD03_05d = zeros(1,n_probes);
t_eXXrateMax_frxD03_10d = zeros(1,n_probes);
t_eZZrateMax_frxD03_10d = zeros(1,n_probes);
t_eTXrateMax_frxD03_10d = zeros(1,n_probes);
t_eXXrateMax_frxD03_50d = zeros(1,n_probes);
t_eZZrateMax_frxD03_50d = zeros(1,n_probes);
t_eTXrateMax_frxD03_50d = zeros(1,n_probes);
% parameter 04
t_eXXrateMax_frxD04_01d = zeros(1,n_probes);
t_eZZrateMax_frxD04_01d = zeros(1,n_probes);
t_eTXrateMax_frxD04_01d = zeros(1,n_probes);
t_eXXrateMax_frxD04_03d = zeros(1,n_probes);
t_eZZrateMax_frxD04_03d = zeros(1,n_probes);
t_eTXrateMax_frxD04_03d = zeros(1,n_probes);
t_eXXrateMax_frxD04_05d = zeros(1,n_probes);
t_eZZrateMax_frxD04_05d = zeros(1,n_probes);
t_eTXrateMax_frxD04_05d = zeros(1,n_probes);
t_eXXrateMax_frxD04_10d = zeros(1,n_probes);
t_eZZrateMax_frxD04_10d = zeros(1,n_probes);
t_eTXrateMax_frxD04_10d = zeros(1,n_probes);
t_eXXrateMax_frxD04_50d = zeros(1,n_probes);
t_eZZrateMax_frxD04_50d = zeros(1,n_probes);
t_eTXrateMax_frxD04_50d = zeros(1,n_probes);
% parameter 05
t_eXXrateMax_frxD05_01d = zeros(1,n_probes);
t_eZZrateMax_frxD05_01d = zeros(1,n_probes);
t_eTXrateMax_frxD05_01d = zeros(1,n_probes);
t_eXXrateMax_frxD05_03d = zeros(1,n_probes);
t_eZZrateMax_frxD05_03d = zeros(1,n_probes);
t_eTXrateMax_frxD05_03d = zeros(1,n_probes);
t_eXXrateMax_frxD05_05d = zeros(1,n_probes);
t_eZZrateMax_frxD05_05d = zeros(1,n_probes);
t_eTXrateMax_frxD05_05d = zeros(1,n_probes);
t_eXXrateMax_frxD05_10d = zeros(1,n_probes);
t_eZZrateMax_frxD05_10d = zeros(1,n_probes);
t_eTXrateMax_frxD05_10d = zeros(1,n_probes);
t_eXXrateMax_frxD05_50d = zeros(1,n_probes);
t_eZZrateMax_frxD05_50d = zeros(1,n_probes);
t_eTXrateMax_frxD05_50d = zeros(1,n_probes);
% parameter 06
t_eXXrateMax_frxD06_01d = zeros(1,n_probes);
t_eZZrateMax_frxD06_01d = zeros(1,n_probes);
t_eTXrateMax_frxD06_01d = zeros(1,n_probes);
t_eXXrateMax_frxD06_03d = zeros(1,n_probes);
t_eZZrateMax_frxD06_03d = zeros(1,n_probes);
t_eTXrateMax_frxD06_03d = zeros(1,n_probes);
t_eXXrateMax_frxD06_05d = zeros(1,n_probes);
t_eZZrateMax_frxD06_05d = zeros(1,n_probes);
t_eTXrateMax_frxD06_05d = zeros(1,n_probes);
t_eXXrateMax_frxD06_10d = zeros(1,n_probes);
t_eZZrateMax_frxD06_10d = zeros(1,n_probes);
t_eTXrateMax_frxD06_10d = zeros(1,n_probes);
t_eXXrateMax_frxD06_50d = zeros(1,n_probes);
t_eZZrateMax_frxD06_50d = zeros(1,n_probes);
t_eTXrateMax_frxD06_50d = zeros(1,n_probes);
% parameter 07
t_eXXrateMax_frxD07_01d = zeros(1,n_probes);
t_eZZrateMax_frxD07_01d = zeros(1,n_probes);
t_eTXrateMax_frxD07_01d = zeros(1,n_probes);
t_eXXrateMax_frxD07_03d = zeros(1,n_probes);
t_eZZrateMax_frxD07_03d = zeros(1,n_probes);
t_eTXrateMax_frxD07_03d = zeros(1,n_probes);
t_eXXrateMax_frxD07_05d = zeros(1,n_probes);
t_eZZrateMax_frxD07_05d = zeros(1,n_probes);
t_eTXrateMax_frxD07_05d = zeros(1,n_probes);
t_eXXrateMax_frxD07_10d = zeros(1,n_probes);
t_eZZrateMax_frxD07_10d = zeros(1,n_probes);
t_eTXrateMax_frxD07_10d = zeros(1,n_probes);
t_eXXrateMax_frxD07_50d = zeros(1,n_probes);
t_eZZrateMax_frxD07_50d = zeros(1,n_probes);
t_eTXrateMax_frxD07_50d = zeros(1,n_probes);
% parameter 08
t_eXXrateMax_frxD08_01d = zeros(1,n_probes);
t_eZZrateMax_frxD08_01d = zeros(1,n_probes);
t_eTXrateMax_frxD08_01d = zeros(1,n_probes);
t_eXXrateMax_frxD08_03d = zeros(1,n_probes);
t_eZZrateMax_frxD08_03d = zeros(1,n_probes);
t_eTXrateMax_frxD08_03d = zeros(1,n_probes);
t_eXXrateMax_frxD08_05d = zeros(1,n_probes);
t_eZZrateMax_frxD08_05d = zeros(1,n_probes);
t_eTXrateMax_frxD08_05d = zeros(1,n_probes);
t_eXXrateMax_frxD08_10d = zeros(1,n_probes);
t_eZZrateMax_frxD08_10d = zeros(1,n_probes);
t_eTXrateMax_frxD08_10d = zeros(1,n_probes);
t_eXXrateMax_frxD08_50d = zeros(1,n_probes);
t_eZZrateMax_frxD08_50d = zeros(1,n_probes);
t_eTXrateMax_frxD08_50d = zeros(1,n_probes);
% parameter 09
t_eXXrateMax_frxD09_01d = zeros(1,n_probes);
t_eZZrateMax_frxD09_01d = zeros(1,n_probes);
t_eTXrateMax_frxD09_01d = zeros(1,n_probes);
t_eXXrateMax_frxD09_03d = zeros(1,n_probes);
t_eZZrateMax_frxD09_03d = zeros(1,n_probes);
t_eTXrateMax_frxD09_03d = zeros(1,n_probes);
t_eXXrateMax_frxD09_05d = zeros(1,n_probes);
t_eZZrateMax_frxD09_05d = zeros(1,n_probes);
t_eTXrateMax_frxD09_05d = zeros(1,n_probes);
t_eXXrateMax_frxD09_10d = zeros(1,n_probes);
t_eZZrateMax_frxD09_10d = zeros(1,n_probes);
t_eTXrateMax_frxD09_10d = zeros(1,n_probes);
t_eXXrateMax_frxD09_50d = zeros(1,n_probes);
t_eZZrateMax_frxD09_50d = zeros(1,n_probes);
t_eTXrateMax_frxD09_50d = zeros(1,n_probes);
% parameter 10
t_eXXrateMax_frxD10_01d = zeros(1,n_probes);
t_eZZrateMax_frxD10_01d = zeros(1,n_probes);
t_eTXrateMax_frxD10_01d = zeros(1,n_probes);
t_eXXrateMax_frxD10_03d = zeros(1,n_probes);
t_eZZrateMax_frxD10_03d = zeros(1,n_probes);
t_eTXrateMax_frxD10_03d = zeros(1,n_probes);
t_eXXrateMax_frxD10_05d = zeros(1,n_probes);
t_eZZrateMax_frxD10_05d = zeros(1,n_probes);
t_eTXrateMax_frxD10_05d = zeros(1,n_probes);
t_eXXrateMax_frxD10_10d = zeros(1,n_probes);
t_eZZrateMax_frxD10_10d = zeros(1,n_probes);
t_eTXrateMax_frxD10_10d = zeros(1,n_probes);
t_eXXrateMax_frxD10_50d = zeros(1,n_probes);
t_eZZrateMax_frxD10_50d = zeros(1,n_probes);
t_eTXrateMax_frxD10_50d = zeros(1,n_probes);
    
for i = 1:n_probes
% ==================================================================================================== %
% Depth 1%
% ==================================================================================================== %
% parameter 01
    t_eXXrateMax_frxD01_01d(i) = t_swpDfrx(find(eXXrate_frxD01_01d(:,i)==eXXrateMax_frxD01_01d(i),1))-injStart;
    t_eZZrateMax_frxD01_01d(i) = t_swpDfrx(find(eZZrate_frxD01_01d(:,i)==eZZrateMax_frxD01_01d(i),1))-injStart;
    t_eTXrateMax_frxD01_01d(i) = t_swpDfrx(find(eTXrate_frxD01_01d(:,i)==eTXrateMax_frxD01_01d(i),1))-injStart;
% parameter 02
    t_eXXrateMax_frxD02_01d(i) = t_swpDfrx(find(eXXrate_frxD02_01d(:,i)==eXXrateMax_frxD02_01d(i),1))-injStart;
    t_eZZrateMax_frxD02_01d(i) = t_swpDfrx(find(eZZrate_frxD02_01d(:,i)==eZZrateMax_frxD02_01d(i),1))-injStart;
    t_eTXrateMax_frxD02_01d(i) = t_swpDfrx(find(eTXrate_frxD02_01d(:,i)==eTXrateMax_frxD02_01d(i),1))-injStart;
% parameter 03
    t_eXXrateMax_frxD03_01d(i) = t_swpDfrx(find(eXXrate_frxD03_01d(:,i)==eXXrateMax_frxD03_01d(i),1))-injStart;
    t_eZZrateMax_frxD03_01d(i) = t_swpDfrx(find(eZZrate_frxD03_01d(:,i)==eZZrateMax_frxD03_01d(i),1))-injStart;
    t_eTXrateMax_frxD03_01d(i) = t_swpDfrx(find(eTXrate_frxD03_01d(:,i)==eTXrateMax_frxD03_01d(i),1))-injStart;
% parameter 04
    t_eXXrateMax_frxD04_01d(i) = t_swpDfrx(find(eXXrate_frxD04_01d(:,i)==eXXrateMax_frxD04_01d(i),1))-injStart;
    t_eZZrateMax_frxD04_01d(i) = t_swpDfrx(find(eZZrate_frxD04_01d(:,i)==eZZrateMax_frxD04_01d(i),1))-injStart;
    t_eTXrateMax_frxD04_01d(i) = t_swpDfrx(find(eTXrate_frxD04_01d(:,i)==eTXrateMax_frxD04_01d(i),1))-injStart;
% parameter 05
    t_eXXrateMax_frxD05_01d(i) = t_swpDfrx(find(eXXrate_frxD05_01d(:,i)==eXXrateMax_frxD05_01d(i),1))-injStart;
    t_eZZrateMax_frxD05_01d(i) = t_swpDfrx(find(eZZrate_frxD05_01d(:,i)==eZZrateMax_frxD05_01d(i),1))-injStart;
    t_eTXrateMax_frxD05_01d(i) = t_swpDfrx(find(eTXrate_frxD05_01d(:,i)==eTXrateMax_frxD05_01d(i),1))-injStart;
% parameter 06
    t_eXXrateMax_frxD06_01d(i) = t_swpDfrx(find(eXXrate_frxD06_01d(:,i)==eXXrateMax_frxD06_01d(i),1))-injStart;
    t_eZZrateMax_frxD06_01d(i) = t_swpDfrx(find(eZZrate_frxD06_01d(:,i)==eZZrateMax_frxD06_01d(i),1))-injStart;
    t_eTXrateMax_frxD06_01d(i) = t_swpDfrx(find(eTXrate_frxD06_01d(:,i)==eTXrateMax_frxD06_01d(i),1))-injStart;
% parameter 07
    t_eXXrateMax_frxD07_01d(i) = t_swpDfrx(find(eXXrate_frxD07_01d(:,i)==eXXrateMax_frxD07_01d(i),1))-injStart;
    t_eZZrateMax_frxD07_01d(i) = t_swpDfrx(find(eZZrate_frxD07_01d(:,i)==eZZrateMax_frxD07_01d(i),1))-injStart;
    t_eTXrateMax_frxD07_01d(i) = t_swpDfrx(find(eTXrate_frxD07_01d(:,i)==eTXrateMax_frxD07_01d(i),1))-injStart;
% parameter 08
    t_eXXrateMax_frxD08_01d(i) = t_swpDfrx(find(eXXrate_frxD08_01d(:,i)==eXXrateMax_frxD08_01d(i),1))-injStart;
    t_eZZrateMax_frxD08_01d(i) = t_swpDfrx(find(eZZrate_frxD08_01d(:,i)==eZZrateMax_frxD08_01d(i),1))-injStart;
    t_eTXrateMax_frxD08_01d(i) = t_swpDfrx(find(eTXrate_frxD08_01d(:,i)==eTXrateMax_frxD08_01d(i),1))-injStart;
% parameter 09
    t_eXXrateMax_frxD09_01d(i) = t_swpDfrx(find(eXXrate_frxD09_01d(:,i)==eXXrateMax_frxD09_01d(i),1))-injStart;
    t_eZZrateMax_frxD09_01d(i) = t_swpDfrx(find(eZZrate_frxD09_01d(:,i)==eZZrateMax_frxD09_01d(i),1))-injStart;
    t_eTXrateMax_frxD09_01d(i) = t_swpDfrx(find(eTXrate_frxD09_01d(:,i)==eTXrateMax_frxD09_01d(i),1))-injStart;
% parameter 10
    t_eXXrateMax_frxD10_01d(i) = t_swpDfrx(find(eXXrate_frxD10_01d(:,i)==eXXrateMax_frxD10_01d(i),1))-injStart;
    t_eZZrateMax_frxD10_01d(i) = t_swpDfrx(find(eZZrate_frxD10_01d(:,i)==eZZrateMax_frxD10_01d(i),1))-injStart;
    t_eTXrateMax_frxD10_01d(i) = t_swpDfrx(find(eTXrate_frxD10_01d(:,i)==eTXrateMax_frxD10_01d(i),1))-injStart;
    
% ==================================================================================================== %
% Depth 3%
% ==================================================================================================== %
% parameter 01
    t_eXXrateMax_frxD01_03d(i) = t_swpDfrx(find(eXXrate_frxD01_03d(:,i)==eXXrateMax_frxD01_03d(i),1))-injStart;
    t_eZZrateMax_frxD01_03d(i) = t_swpDfrx(find(eZZrate_frxD01_03d(:,i)==eZZrateMax_frxD01_03d(i),1))-injStart;
    t_eTXrateMax_frxD01_03d(i) = t_swpDfrx(find(eTXrate_frxD01_03d(:,i)==eTXrateMax_frxD01_03d(i),1))-injStart;
% parameter 02
    t_eXXrateMax_frxD02_03d(i) = t_swpDfrx(find(eXXrate_frxD02_03d(:,i)==eXXrateMax_frxD02_03d(i),1))-injStart;
    t_eZZrateMax_frxD02_03d(i) = t_swpDfrx(find(eZZrate_frxD02_03d(:,i)==eZZrateMax_frxD02_03d(i),1))-injStart;
    t_eTXrateMax_frxD02_03d(i) = t_swpDfrx(find(eTXrate_frxD02_03d(:,i)==eTXrateMax_frxD02_03d(i),1))-injStart;
% parameter 03
    t_eXXrateMax_frxD03_03d(i) = t_swpDfrx(find(eXXrate_frxD03_03d(:,i)==eXXrateMax_frxD03_03d(i),1))-injStart;
    t_eZZrateMax_frxD03_03d(i) = t_swpDfrx(find(eZZrate_frxD03_03d(:,i)==eZZrateMax_frxD03_03d(i),1))-injStart;
    t_eTXrateMax_frxD03_03d(i) = t_swpDfrx(find(eTXrate_frxD03_03d(:,i)==eTXrateMax_frxD03_03d(i),1))-injStart;
% parameter 04
    t_eXXrateMax_frxD04_03d(i) = t_swpDfrx(find(eXXrate_frxD04_03d(:,i)==eXXrateMax_frxD04_03d(i),1))-injStart;
    t_eZZrateMax_frxD04_03d(i) = t_swpDfrx(find(eZZrate_frxD04_03d(:,i)==eZZrateMax_frxD04_03d(i),1))-injStart;
    t_eTXrateMax_frxD04_03d(i) = t_swpDfrx(find(eTXrate_frxD04_03d(:,i)==eTXrateMax_frxD04_03d(i),1))-injStart;
% parameter 05
    t_eXXrateMax_frxD05_03d(i) = t_swpDfrx(find(eXXrate_frxD05_03d(:,i)==eXXrateMax_frxD05_03d(i),1))-injStart;
    t_eZZrateMax_frxD05_03d(i) = t_swpDfrx(find(eZZrate_frxD05_03d(:,i)==eZZrateMax_frxD05_03d(i),1))-injStart;
    t_eTXrateMax_frxD05_03d(i) = t_swpDfrx(find(eTXrate_frxD05_03d(:,i)==eTXrateMax_frxD05_03d(i),1))-injStart;
% parameter 06
    t_eXXrateMax_frxD06_03d(i) = t_swpDfrx(find(eXXrate_frxD06_03d(:,i)==eXXrateMax_frxD06_03d(i),1))-injStart;
    t_eZZrateMax_frxD06_03d(i) = t_swpDfrx(find(eZZrate_frxD06_03d(:,i)==eZZrateMax_frxD06_03d(i),1))-injStart;
    t_eTXrateMax_frxD06_03d(i) = t_swpDfrx(find(eTXrate_frxD06_03d(:,i)==eTXrateMax_frxD06_03d(i),1))-injStart;
% parameter 07
    t_eXXrateMax_frxD07_03d(i) = t_swpDfrx(find(eXXrate_frxD07_03d(:,i)==eXXrateMax_frxD07_03d(i),1))-injStart;
    t_eZZrateMax_frxD07_03d(i) = t_swpDfrx(find(eZZrate_frxD07_03d(:,i)==eZZrateMax_frxD07_03d(i),1))-injStart;
    t_eTXrateMax_frxD07_03d(i) = t_swpDfrx(find(eTXrate_frxD07_03d(:,i)==eTXrateMax_frxD07_03d(i),1))-injStart;
% parameter 08
    t_eXXrateMax_frxD08_03d(i) = t_swpDfrx(find(eXXrate_frxD08_03d(:,i)==eXXrateMax_frxD08_03d(i),1))-injStart;
    t_eZZrateMax_frxD08_03d(i) = t_swpDfrx(find(eZZrate_frxD08_03d(:,i)==eZZrateMax_frxD08_03d(i),1))-injStart;
    t_eTXrateMax_frxD08_03d(i) = t_swpDfrx(find(eTXrate_frxD08_03d(:,i)==eTXrateMax_frxD08_03d(i),1))-injStart;
% parameter 09
    t_eXXrateMax_frxD09_03d(i) = t_swpDfrx(find(eXXrate_frxD09_03d(:,i)==eXXrateMax_frxD09_03d(i),1))-injStart;
    t_eZZrateMax_frxD09_03d(i) = t_swpDfrx(find(eZZrate_frxD09_03d(:,i)==eZZrateMax_frxD09_03d(i),1))-injStart;
    t_eTXrateMax_frxD09_03d(i) = t_swpDfrx(find(eTXrate_frxD09_03d(:,i)==eTXrateMax_frxD09_03d(i),1))-injStart;
% parameter 10
    t_eXXrateMax_frxD10_03d(i) = t_swpDfrx(find(eXXrate_frxD10_03d(:,i)==eXXrateMax_frxD10_03d(i),1))-injStart;
    t_eZZrateMax_frxD10_03d(i) = t_swpDfrx(find(eZZrate_frxD10_03d(:,i)==eZZrateMax_frxD10_03d(i),1))-injStart;
    t_eTXrateMax_frxD10_03d(i) = t_swpDfrx(find(eTXrate_frxD10_03d(:,i)==eTXrateMax_frxD10_03d(i),1))-injStart;
    
% ==================================================================================================== %
% Depth 5%
% ==================================================================================================== %
% parameter 01
    t_eXXrateMax_frxD01_05d(i) = t_swpDfrx(find(eXXrate_frxD01_05d(:,i)==eXXrateMax_frxD01_05d(i),1))-injStart;
    t_eZZrateMax_frxD01_05d(i) = t_swpDfrx(find(eZZrate_frxD01_05d(:,i)==eZZrateMax_frxD01_05d(i),1))-injStart;
    t_eTXrateMax_frxD01_05d(i) = t_swpDfrx(find(eTXrate_frxD01_05d(:,i)==eTXrateMax_frxD01_05d(i),1))-injStart;
% parameter 02
    t_eXXrateMax_frxD02_05d(i) = t_swpDfrx(find(eXXrate_frxD02_05d(:,i)==eXXrateMax_frxD02_05d(i),1))-injStart;
    t_eZZrateMax_frxD02_05d(i) = t_swpDfrx(find(eZZrate_frxD02_05d(:,i)==eZZrateMax_frxD02_05d(i),1))-injStart;
    t_eTXrateMax_frxD02_05d(i) = t_swpDfrx(find(eTXrate_frxD02_05d(:,i)==eTXrateMax_frxD02_05d(i),1))-injStart;
% parameter 03
    t_eXXrateMax_frxD03_05d(i) = t_swpDfrx(find(eXXrate_frxD03_05d(:,i)==eXXrateMax_frxD03_05d(i),1))-injStart;
    t_eZZrateMax_frxD03_05d(i) = t_swpDfrx(find(eZZrate_frxD03_05d(:,i)==eZZrateMax_frxD03_05d(i),1))-injStart;
    t_eTXrateMax_frxD03_05d(i) = t_swpDfrx(find(eTXrate_frxD03_05d(:,i)==eTXrateMax_frxD03_05d(i),1))-injStart;
% parameter 04
    t_eXXrateMax_frxD04_05d(i) = t_swpDfrx(find(eXXrate_frxD04_05d(:,i)==eXXrateMax_frxD04_05d(i),1))-injStart;
    t_eZZrateMax_frxD04_05d(i) = t_swpDfrx(find(eZZrate_frxD04_05d(:,i)==eZZrateMax_frxD04_05d(i),1))-injStart;
    t_eTXrateMax_frxD04_05d(i) = t_swpDfrx(find(eTXrate_frxD04_05d(:,i)==eTXrateMax_frxD04_05d(i),1))-injStart;
% parameter 05
    t_eXXrateMax_frxD05_05d(i) = t_swpDfrx(find(eXXrate_frxD05_05d(:,i)==eXXrateMax_frxD05_05d(i),1))-injStart;
    t_eZZrateMax_frxD05_05d(i) = t_swpDfrx(find(eZZrate_frxD05_05d(:,i)==eZZrateMax_frxD05_05d(i),1))-injStart;
    t_eTXrateMax_frxD05_05d(i) = t_swpDfrx(find(eTXrate_frxD05_05d(:,i)==eTXrateMax_frxD05_05d(i),1))-injStart;
% parameter 06
    t_eXXrateMax_frxD06_05d(i) = t_swpDfrx(find(eXXrate_frxD06_05d(:,i)==eXXrateMax_frxD06_05d(i),1))-injStart;
    t_eZZrateMax_frxD06_05d(i) = t_swpDfrx(find(eZZrate_frxD06_05d(:,i)==eZZrateMax_frxD06_05d(i),1))-injStart;
    t_eTXrateMax_frxD06_05d(i) = t_swpDfrx(find(eTXrate_frxD06_05d(:,i)==eTXrateMax_frxD06_05d(i),1))-injStart;
% parameter 07
    t_eXXrateMax_frxD07_05d(i) = t_swpDfrx(find(eXXrate_frxD07_05d(:,i)==eXXrateMax_frxD07_05d(i),1))-injStart;
    t_eZZrateMax_frxD07_05d(i) = t_swpDfrx(find(eZZrate_frxD07_05d(:,i)==eZZrateMax_frxD07_05d(i),1))-injStart;
    t_eTXrateMax_frxD07_05d(i) = t_swpDfrx(find(eTXrate_frxD07_05d(:,i)==eTXrateMax_frxD07_05d(i),1))-injStart;
% parameter 08
    t_eXXrateMax_frxD08_05d(i) = t_swpDfrx(find(eXXrate_frxD08_05d(:,i)==eXXrateMax_frxD08_05d(i),1))-injStart;
    t_eZZrateMax_frxD08_05d(i) = t_swpDfrx(find(eZZrate_frxD08_05d(:,i)==eZZrateMax_frxD08_05d(i),1))-injStart;
    t_eTXrateMax_frxD08_05d(i) = t_swpDfrx(find(eTXrate_frxD08_05d(:,i)==eTXrateMax_frxD08_05d(i),1))-injStart;
% parameter 09
    t_eXXrateMax_frxD09_05d(i) = t_swpDfrx(find(eXXrate_frxD09_05d(:,i)==eXXrateMax_frxD09_05d(i),1))-injStart;
    t_eZZrateMax_frxD09_05d(i) = t_swpDfrx(find(eZZrate_frxD09_05d(:,i)==eZZrateMax_frxD09_05d(i),1))-injStart;
    t_eTXrateMax_frxD09_05d(i) = t_swpDfrx(find(eTXrate_frxD09_05d(:,i)==eTXrateMax_frxD09_05d(i),1))-injStart;
% parameter 10
    t_eXXrateMax_frxD10_05d(i) = t_swpDfrx(find(eXXrate_frxD10_05d(:,i)==eXXrateMax_frxD10_05d(i),1))-injStart;
    t_eZZrateMax_frxD10_05d(i) = t_swpDfrx(find(eZZrate_frxD10_05d(:,i)==eZZrateMax_frxD10_05d(i),1))-injStart;
    t_eTXrateMax_frxD10_05d(i) = t_swpDfrx(find(eTXrate_frxD10_05d(:,i)==eTXrateMax_frxD10_05d(i),1))-injStart;
    
% ==================================================================================================== %
% Depth 10%
% ==================================================================================================== %
% parameter 01
    t_eXXrateMax_frxD01_10d(i) = t_swpDfrx(find(eXXrate_frxD01_10d(:,i)==eXXrateMax_frxD01_10d(i),1))-injStart;
    t_eZZrateMax_frxD01_10d(i) = t_swpDfrx(find(eZZrate_frxD01_10d(:,i)==eZZrateMax_frxD01_10d(i),1))-injStart;
    t_eTXrateMax_frxD01_10d(i) = t_swpDfrx(find(eTXrate_frxD01_10d(:,i)==eTXrateMax_frxD01_10d(i),1))-injStart;
% parameter 02
    t_eXXrateMax_frxD02_10d(i) = t_swpDfrx(find(eXXrate_frxD02_10d(:,i)==eXXrateMax_frxD02_10d(i),1))-injStart;
    t_eZZrateMax_frxD02_10d(i) = t_swpDfrx(find(eZZrate_frxD02_10d(:,i)==eZZrateMax_frxD02_10d(i),1))-injStart;
    t_eTXrateMax_frxD02_10d(i) = t_swpDfrx(find(eTXrate_frxD02_10d(:,i)==eTXrateMax_frxD02_10d(i),1))-injStart;
% parameter 03
    t_eXXrateMax_frxD03_10d(i) = t_swpDfrx(find(eXXrate_frxD03_10d(:,i)==eXXrateMax_frxD03_10d(i),1))-injStart;
    t_eZZrateMax_frxD03_10d(i) = t_swpDfrx(find(eZZrate_frxD03_10d(:,i)==eZZrateMax_frxD03_10d(i),1))-injStart;
    t_eTXrateMax_frxD03_10d(i) = t_swpDfrx(find(eTXrate_frxD03_10d(:,i)==eTXrateMax_frxD03_10d(i),1))-injStart;
% parameter 04
    t_eXXrateMax_frxD04_10d(i) = t_swpDfrx(find(eXXrate_frxD04_10d(:,i)==eXXrateMax_frxD04_10d(i),1))-injStart;
    t_eZZrateMax_frxD04_10d(i) = t_swpDfrx(find(eZZrate_frxD04_10d(:,i)==eZZrateMax_frxD04_10d(i),1))-injStart;
    t_eTXrateMax_frxD04_10d(i) = t_swpDfrx(find(eTXrate_frxD04_10d(:,i)==eTXrateMax_frxD04_10d(i),1))-injStart;
% parameter 05
    t_eXXrateMax_frxD05_10d(i) = t_swpDfrx(find(eXXrate_frxD05_10d(:,i)==eXXrateMax_frxD05_10d(i),1))-injStart;
    t_eZZrateMax_frxD05_10d(i) = t_swpDfrx(find(eZZrate_frxD05_10d(:,i)==eZZrateMax_frxD05_10d(i),1))-injStart;
    t_eTXrateMax_frxD05_10d(i) = t_swpDfrx(find(eTXrate_frxD05_10d(:,i)==eTXrateMax_frxD05_10d(i),1))-injStart;
% parameter 06
    t_eXXrateMax_frxD06_10d(i) = t_swpDfrx(find(eXXrate_frxD06_10d(:,i)==eXXrateMax_frxD06_10d(i),1))-injStart;
    t_eZZrateMax_frxD06_10d(i) = t_swpDfrx(find(eZZrate_frxD06_10d(:,i)==eZZrateMax_frxD06_10d(i),1))-injStart;
    t_eTXrateMax_frxD06_10d(i) = t_swpDfrx(find(eTXrate_frxD06_10d(:,i)==eTXrateMax_frxD06_10d(i),1))-injStart;
% parameter 07
    t_eXXrateMax_frxD07_10d(i) = t_swpDfrx(find(eXXrate_frxD07_10d(:,i)==eXXrateMax_frxD07_10d(i),1))-injStart;
    t_eZZrateMax_frxD07_10d(i) = t_swpDfrx(find(eZZrate_frxD07_10d(:,i)==eZZrateMax_frxD07_10d(i),1))-injStart;
    t_eTXrateMax_frxD07_10d(i) = t_swpDfrx(find(eTXrate_frxD07_10d(:,i)==eTXrateMax_frxD07_10d(i),1))-injStart;
% parameter 08
    t_eXXrateMax_frxD08_10d(i) = t_swpDfrx(find(eXXrate_frxD08_10d(:,i)==eXXrateMax_frxD08_10d(i),1))-injStart;
    t_eZZrateMax_frxD08_10d(i) = t_swpDfrx(find(eZZrate_frxD08_10d(:,i)==eZZrateMax_frxD08_10d(i),1))-injStart;
    t_eTXrateMax_frxD08_10d(i) = t_swpDfrx(find(eTXrate_frxD08_10d(:,i)==eTXrateMax_frxD08_10d(i),1))-injStart;
% parameter 09
    t_eXXrateMax_frxD09_10d(i) = t_swpDfrx(find(eXXrate_frxD09_10d(:,i)==eXXrateMax_frxD09_10d(i),1))-injStart;
    t_eZZrateMax_frxD09_10d(i) = t_swpDfrx(find(eZZrate_frxD09_10d(:,i)==eZZrateMax_frxD09_10d(i),1))-injStart;
    t_eTXrateMax_frxD09_10d(i) = t_swpDfrx(find(eTXrate_frxD09_10d(:,i)==eTXrateMax_frxD09_10d(i),1))-injStart;
% parameter 10
    t_eXXrateMax_frxD10_10d(i) = t_swpDfrx(find(eXXrate_frxD10_10d(:,i)==eXXrateMax_frxD10_10d(i),1))-injStart;
    t_eZZrateMax_frxD10_10d(i) = t_swpDfrx(find(eZZrate_frxD10_10d(:,i)==eZZrateMax_frxD10_10d(i),1))-injStart;
    t_eTXrateMax_frxD10_10d(i) = t_swpDfrx(find(eTXrate_frxD10_10d(:,i)==eTXrateMax_frxD10_10d(i),1))-injStart;
    
% ==================================================================================================== %
% Depth 50%
% ==================================================================================================== %
% parameter 01
    t_eXXrateMax_frxD01_50d(i) = t_swpDfrx(find(eXXrate_frxD01_50d(:,i)==eXXrateMax_frxD01_50d(i),1))-injStart;
    t_eZZrateMax_frxD01_50d(i) = t_swpDfrx(find(eZZrate_frxD01_50d(:,i)==eZZrateMax_frxD01_50d(i),1))-injStart;
    t_eTXrateMax_frxD01_50d(i) = t_swpDfrx(find(eTXrate_frxD01_50d(:,i)==eTXrateMax_frxD01_50d(i),1))-injStart;
% parameter 02
    t_eXXrateMax_frxD02_50d(i) = t_swpDfrx(find(eXXrate_frxD02_50d(:,i)==eXXrateMax_frxD02_50d(i),1))-injStart;
    t_eZZrateMax_frxD02_50d(i) = t_swpDfrx(find(eZZrate_frxD02_50d(:,i)==eZZrateMax_frxD02_50d(i),1))-injStart;
    t_eTXrateMax_frxD02_50d(i) = t_swpDfrx(find(eTXrate_frxD02_50d(:,i)==eTXrateMax_frxD02_50d(i),1))-injStart;
% parameter 03
    t_eXXrateMax_frxD03_50d(i) = t_swpDfrx(find(eXXrate_frxD03_50d(:,i)==eXXrateMax_frxD03_50d(i),1))-injStart;
    t_eZZrateMax_frxD03_50d(i) = t_swpDfrx(find(eZZrate_frxD03_50d(:,i)==eZZrateMax_frxD03_50d(i),1))-injStart;
    t_eTXrateMax_frxD03_50d(i) = t_swpDfrx(find(eTXrate_frxD03_50d(:,i)==eTXrateMax_frxD03_50d(i),1))-injStart;
% parameter 04
    t_eXXrateMax_frxD04_50d(i) = t_swpDfrx(find(eXXrate_frxD04_50d(:,i)==eXXrateMax_frxD04_50d(i),1))-injStart;
    t_eZZrateMax_frxD04_50d(i) = t_swpDfrx(find(eZZrate_frxD04_50d(:,i)==eZZrateMax_frxD04_50d(i),1))-injStart;
    t_eTXrateMax_frxD04_50d(i) = t_swpDfrx(find(eTXrate_frxD04_50d(:,i)==eTXrateMax_frxD04_50d(i),1))-injStart;
% parameter 05
    t_eXXrateMax_frxD05_50d(i) = t_swpDfrx(find(eXXrate_frxD05_50d(:,i)==eXXrateMax_frxD05_50d(i),1))-injStart;
    t_eZZrateMax_frxD05_50d(i) = t_swpDfrx(find(eZZrate_frxD05_50d(:,i)==eZZrateMax_frxD05_50d(i),1))-injStart;
    t_eTXrateMax_frxD05_50d(i) = t_swpDfrx(find(eTXrate_frxD05_50d(:,i)==eTXrateMax_frxD05_50d(i),1))-injStart;
% parameter 06
    t_eXXrateMax_frxD06_50d(i) = t_swpDfrx(find(eXXrate_frxD06_50d(:,i)==eXXrateMax_frxD06_50d(i),1))-injStart;
    t_eZZrateMax_frxD06_50d(i) = t_swpDfrx(find(eZZrate_frxD06_50d(:,i)==eZZrateMax_frxD06_50d(i),1))-injStart;
    t_eTXrateMax_frxD06_50d(i) = t_swpDfrx(find(eTXrate_frxD06_50d(:,i)==eTXrateMax_frxD06_50d(i),1))-injStart;
% parameter 07
    t_eXXrateMax_frxD07_50d(i) = t_swpDfrx(find(eXXrate_frxD07_50d(:,i)==eXXrateMax_frxD07_50d(i),1))-injStart;
    t_eZZrateMax_frxD07_50d(i) = t_swpDfrx(find(eZZrate_frxD07_50d(:,i)==eZZrateMax_frxD07_50d(i),1))-injStart;
    t_eTXrateMax_frxD07_50d(i) = t_swpDfrx(find(eTXrate_frxD07_50d(:,i)==eTXrateMax_frxD07_50d(i),1))-injStart;
% parameter 08
    t_eXXrateMax_frxD08_50d(i) = t_swpDfrx(find(eXXrate_frxD08_50d(:,i)==eXXrateMax_frxD08_50d(i),1))-injStart;
    t_eZZrateMax_frxD08_50d(i) = t_swpDfrx(find(eZZrate_frxD08_50d(:,i)==eZZrateMax_frxD08_50d(i),1))-injStart;
    t_eTXrateMax_frxD08_50d(i) = t_swpDfrx(find(eTXrate_frxD08_50d(:,i)==eTXrateMax_frxD08_50d(i),1))-injStart;
% parameter 09
    t_eXXrateMax_frxD09_50d(i) = t_swpDfrx(find(eXXrate_frxD09_50d(:,i)==eXXrateMax_frxD09_50d(i),1))-injStart;
    t_eZZrateMax_frxD09_50d(i) = t_swpDfrx(find(eZZrate_frxD09_50d(:,i)==eZZrateMax_frxD09_50d(i),1))-injStart;
    t_eTXrateMax_frxD09_50d(i) = t_swpDfrx(find(eTXrate_frxD09_50d(:,i)==eTXrateMax_frxD09_50d(i),1))-injStart;
% parameter 10
    t_eXXrateMax_frxD10_50d(i) = t_swpDfrx(find(eXXrate_frxD10_50d(:,i)==eXXrateMax_frxD10_50d(i),1))-injStart;
    t_eZZrateMax_frxD10_50d(i) = t_swpDfrx(find(eZZrate_frxD10_50d(:,i)==eZZrateMax_frxD10_50d(i),1))-injStart;
    t_eTXrateMax_frxD10_50d(i) = t_swpDfrx(find(eTXrate_frxD10_50d(:,i)==eTXrateMax_frxD10_50d(i),1))-injStart;
end

%% Times during which Strain Rate > minRate

% ==================================================================================================== %
% Logical array of samples meeting criteria
% ==================================================================================================== %

% parameter 01
eXX_minRateCriteria_frxD01_01d = false(n_tSteps,n_probes);
eZZ_minRateCriteria_frxD01_01d = false(n_tSteps,n_probes);
eXX_minRateCriteria_frxD01_03d = false(n_tSteps,n_probes);
eZZ_minRateCriteria_frxD01_03d = false(n_tSteps,n_probes);
eXX_minRateCriteria_frxD01_05d = false(n_tSteps,n_probes);
eZZ_minRateCriteria_frxD01_05d = false(n_tSteps,n_probes);
eXX_minRateCriteria_frxD01_10d = false(n_tSteps,n_probes);
eZZ_minRateCriteria_frxD01_10d = false(n_tSteps,n_probes);
eXX_minRateCriteria_frxD01_50d = false(n_tSteps,n_probes);
eZZ_minRateCriteria_frxD01_50d = false(n_tSteps,n_probes);
% parameter 02
eXX_minRateCriteria_frxD02_01d = false(n_tSteps,n_probes);
eZZ_minRateCriteria_frxD02_01d = false(n_tSteps,n_probes);
eXX_minRateCriteria_frxD02_03d = false(n_tSteps,n_probes);
eZZ_minRateCriteria_frxD02_03d = false(n_tSteps,n_probes);
eXX_minRateCriteria_frxD02_05d = false(n_tSteps,n_probes);
eZZ_minRateCriteria_frxD02_05d = false(n_tSteps,n_probes);
eXX_minRateCriteria_frxD02_10d = false(n_tSteps,n_probes);
eZZ_minRateCriteria_frxD02_10d = false(n_tSteps,n_probes);
eXX_minRateCriteria_frxD02_50d = false(n_tSteps,n_probes);
eZZ_minRateCriteria_frxD02_50d = false(n_tSteps,n_probes);
% parameter 03
eXX_minRateCriteria_frxD03_01d = false(n_tSteps,n_probes);
eZZ_minRateCriteria_frxD03_01d = false(n_tSteps,n_probes);
eXX_minRateCriteria_frxD03_03d = false(n_tSteps,n_probes);
eZZ_minRateCriteria_frxD03_03d = false(n_tSteps,n_probes);
eXX_minRateCriteria_frxD03_05d = false(n_tSteps,n_probes);
eZZ_minRateCriteria_frxD03_05d = false(n_tSteps,n_probes);
eXX_minRateCriteria_frxD03_10d = false(n_tSteps,n_probes);
eZZ_minRateCriteria_frxD03_10d = false(n_tSteps,n_probes);
eXX_minRateCriteria_frxD03_50d = false(n_tSteps,n_probes);
eZZ_minRateCriteria_frxD03_50d = false(n_tSteps,n_probes);
% parameter 04
eXX_minRateCriteria_frxD04_01d = false(n_tSteps,n_probes);
eZZ_minRateCriteria_frxD04_01d = false(n_tSteps,n_probes);
eXX_minRateCriteria_frxD04_03d = false(n_tSteps,n_probes);
eZZ_minRateCriteria_frxD04_03d = false(n_tSteps,n_probes);
eXX_minRateCriteria_frxD04_05d = false(n_tSteps,n_probes);
eZZ_minRateCriteria_frxD04_05d = false(n_tSteps,n_probes);
eXX_minRateCriteria_frxD04_10d = false(n_tSteps,n_probes);
eZZ_minRateCriteria_frxD04_10d = false(n_tSteps,n_probes);
eXX_minRateCriteria_frxD04_50d = false(n_tSteps,n_probes);
eZZ_minRateCriteria_frxD04_50d = false(n_tSteps,n_probes);
% parameter 05
eXX_minRateCriteria_frxD05_01d = false(n_tSteps,n_probes);
eZZ_minRateCriteria_frxD05_01d = false(n_tSteps,n_probes);
eXX_minRateCriteria_frxD05_03d = false(n_tSteps,n_probes);
eZZ_minRateCriteria_frxD05_03d = false(n_tSteps,n_probes);
eXX_minRateCriteria_frxD05_05d = false(n_tSteps,n_probes);
eZZ_minRateCriteria_frxD05_05d = false(n_tSteps,n_probes);
eXX_minRateCriteria_frxD05_10d = false(n_tSteps,n_probes);
eZZ_minRateCriteria_frxD05_10d = false(n_tSteps,n_probes);
eXX_minRateCriteria_frxD05_50d = false(n_tSteps,n_probes);
eZZ_minRateCriteria_frxD05_50d = false(n_tSteps,n_probes);
% parameter 06
eXX_minRateCriteria_frxD06_01d = false(n_tSteps,n_probes);
eZZ_minRateCriteria_frxD06_01d = false(n_tSteps,n_probes);
eXX_minRateCriteria_frxD06_03d = false(n_tSteps,n_probes);
eZZ_minRateCriteria_frxD06_03d = false(n_tSteps,n_probes);
eXX_minRateCriteria_frxD06_05d = false(n_tSteps,n_probes);
eZZ_minRateCriteria_frxD06_05d = false(n_tSteps,n_probes);
eXX_minRateCriteria_frxD06_10d = false(n_tSteps,n_probes);
eZZ_minRateCriteria_frxD06_10d = false(n_tSteps,n_probes);
eXX_minRateCriteria_frxD06_50d = false(n_tSteps,n_probes);
eZZ_minRateCriteria_frxD06_50d = false(n_tSteps,n_probes);
% parameter 07
eXX_minRateCriteria_frxD07_01d = false(n_tSteps,n_probes);
eZZ_minRateCriteria_frxD07_01d = false(n_tSteps,n_probes);
eXX_minRateCriteria_frxD07_03d = false(n_tSteps,n_probes);
eZZ_minRateCriteria_frxD07_03d = false(n_tSteps,n_probes);
eXX_minRateCriteria_frxD07_05d = false(n_tSteps,n_probes);
eZZ_minRateCriteria_frxD07_05d = false(n_tSteps,n_probes);
eXX_minRateCriteria_frxD07_10d = false(n_tSteps,n_probes);
eZZ_minRateCriteria_frxD07_10d = false(n_tSteps,n_probes);
eXX_minRateCriteria_frxD07_50d = false(n_tSteps,n_probes);
eZZ_minRateCriteria_frxD07_50d = false(n_tSteps,n_probes);
% parameter 08
eXX_minRateCriteria_frxD08_01d = false(n_tSteps,n_probes);
eZZ_minRateCriteria_frxD08_01d = false(n_tSteps,n_probes);
eXX_minRateCriteria_frxD08_03d = false(n_tSteps,n_probes);
eZZ_minRateCriteria_frxD08_03d = false(n_tSteps,n_probes);
eXX_minRateCriteria_frxD08_05d = false(n_tSteps,n_probes);
eZZ_minRateCriteria_frxD08_05d = false(n_tSteps,n_probes);
eXX_minRateCriteria_frxD08_10d = false(n_tSteps,n_probes);
eZZ_minRateCriteria_frxD08_10d = false(n_tSteps,n_probes);
eXX_minRateCriteria_frxD08_50d = false(n_tSteps,n_probes);
eZZ_minRateCriteria_frxD08_50d = false(n_tSteps,n_probes);
% parameter 09
eXX_minRateCriteria_frxD09_01d = false(n_tSteps,n_probes);
eZZ_minRateCriteria_frxD09_01d = false(n_tSteps,n_probes);
eXX_minRateCriteria_frxD09_03d = false(n_tSteps,n_probes);
eZZ_minRateCriteria_frxD09_03d = false(n_tSteps,n_probes);
eXX_minRateCriteria_frxD09_05d = false(n_tSteps,n_probes);
eZZ_minRateCriteria_frxD09_05d = false(n_tSteps,n_probes);
eXX_minRateCriteria_frxD09_10d = false(n_tSteps,n_probes);
eZZ_minRateCriteria_frxD09_10d = false(n_tSteps,n_probes);
eXX_minRateCriteria_frxD09_50d = false(n_tSteps,n_probes);
eZZ_minRateCriteria_frxD09_50d = false(n_tSteps,n_probes);
% parameter 10
eXX_minRateCriteria_frxD10_01d = false(n_tSteps,n_probes);
eZZ_minRateCriteria_frxD10_01d = false(n_tSteps,n_probes);
eXX_minRateCriteria_frxD10_03d = false(n_tSteps,n_probes);
eZZ_minRateCriteria_frxD10_03d = false(n_tSteps,n_probes);
eXX_minRateCriteria_frxD10_05d = false(n_tSteps,n_probes);
eZZ_minRateCriteria_frxD10_05d = false(n_tSteps,n_probes);
eXX_minRateCriteria_frxD10_10d = false(n_tSteps,n_probes);
eZZ_minRateCriteria_frxD10_10d = false(n_tSteps,n_probes);
eXX_minRateCriteria_frxD10_50d = false(n_tSteps,n_probes);
eZZ_minRateCriteria_frxD10_50d = false(n_tSteps,n_probes);

for i = 1:n_probes
% ==================================================================================================== %
% Depth 1%
% ==================================================================================================== %
% parameter 01
    eXX_minRateCriteria_frxD01_01d(:,i) = eXXrate_frxD01_01d(:,i)>minRate;
    eZZ_minRateCriteria_frxD01_01d(:,i) = eXXrate_frxD01_01d(:,i)>minRate;
% parameter 02
    eXX_minRateCriteria_frxD02_01d(:,i) = eXXrate_frxD02_01d(:,i)>minRate;
    eZZ_minRateCriteria_frxD02_01d(:,i) = eXXrate_frxD02_01d(:,i)>minRate;
% parameter 03
    eXX_minRateCriteria_frxD03_01d(:,i) = eXXrate_frxD03_01d(:,i)>minRate;
    eZZ_minRateCriteria_frxD03_01d(:,i) = eXXrate_frxD03_01d(:,i)>minRate;
% parameter 04
    eXX_minRateCriteria_frxD04_01d(:,i) = eXXrate_frxD04_01d(:,i)>minRate;
    eZZ_minRateCriteria_frxD04_01d(:,i) = eXXrate_frxD04_01d(:,i)>minRate;
% parameter 05
    eXX_minRateCriteria_frxD05_01d(:,i) = eXXrate_frxD05_01d(:,i)>minRate;
    eZZ_minRateCriteria_frxD05_01d(:,i) = eXXrate_frxD05_01d(:,i)>minRate;
% parameter 06
    eXX_minRateCriteria_frxD06_01d(:,i) = eXXrate_frxD06_01d(:,i)>minRate;
    eZZ_minRateCriteria_frxD06_01d(:,i) = eXXrate_frxD06_01d(:,i)>minRate;
% parameter 07
    eXX_minRateCriteria_frxD07_01d(:,i) = eXXrate_frxD07_01d(:,i)>minRate;
    eZZ_minRateCriteria_frxD07_01d(:,i) = eXXrate_frxD07_01d(:,i)>minRate;
% parameter 08
    eXX_minRateCriteria_frxD08_01d(:,i) = eXXrate_frxD08_01d(:,i)>minRate;
    eZZ_minRateCriteria_frxD08_01d(:,i) = eXXrate_frxD08_01d(:,i)>minRate;
% parameter 09
    eXX_minRateCriteria_frxD09_01d(:,i) = eXXrate_frxD09_01d(:,i)>minRate;
    eZZ_minRateCriteria_frxD09_01d(:,i) = eXXrate_frxD09_01d(:,i)>minRate;
% parameter 10
    eXX_minRateCriteria_frxD10_01d(:,i) = eXXrate_frxD10_01d(:,i)>minRate;
    eZZ_minRateCriteria_frxD10_01d(:,i) = eXXrate_frxD10_01d(:,i)>minRate;
    
% ==================================================================================================== %
% Depth 3%
% ==================================================================================================== %
% parameter 01
    eXX_minRateCriteria_frxD01_03d(:,i) = eXXrate_frxD01_03d(:,i)>minRate;
    eZZ_minRateCriteria_frxD01_03d(:,i) = eXXrate_frxD01_03d(:,i)>minRate;
% parameter 02
    eXX_minRateCriteria_frxD02_03d(:,i) = eXXrate_frxD02_03d(:,i)>minRate;
    eZZ_minRateCriteria_frxD02_03d(:,i) = eXXrate_frxD02_03d(:,i)>minRate;
% parameter 03
    eXX_minRateCriteria_frxD03_03d(:,i) = eXXrate_frxD03_03d(:,i)>minRate;
    eZZ_minRateCriteria_frxD03_03d(:,i) = eXXrate_frxD03_03d(:,i)>minRate;
% parameter 04
    eXX_minRateCriteria_frxD04_03d(:,i) = eXXrate_frxD04_03d(:,i)>minRate;
    eZZ_minRateCriteria_frxD04_03d(:,i) = eXXrate_frxD04_03d(:,i)>minRate;
% parameter 05
    eXX_minRateCriteria_frxD05_03d(:,i) = eXXrate_frxD05_03d(:,i)>minRate;
    eZZ_minRateCriteria_frxD05_03d(:,i) = eXXrate_frxD05_03d(:,i)>minRate;
% parameter 06
    eXX_minRateCriteria_frxD06_03d(:,i) = eXXrate_frxD06_03d(:,i)>minRate;
    eZZ_minRateCriteria_frxD06_03d(:,i) = eXXrate_frxD06_03d(:,i)>minRate;
% parameter 07
    eXX_minRateCriteria_frxD07_03d(:,i) = eXXrate_frxD07_03d(:,i)>minRate;
    eZZ_minRateCriteria_frxD07_03d(:,i) = eXXrate_frxD07_03d(:,i)>minRate;
% parameter 08
    eXX_minRateCriteria_frxD08_03d(:,i) = eXXrate_frxD08_03d(:,i)>minRate;
    eZZ_minRateCriteria_frxD08_03d(:,i) = eXXrate_frxD08_03d(:,i)>minRate;
% parameter 09
    eXX_minRateCriteria_frxD09_03d(:,i) = eXXrate_frxD09_03d(:,i)>minRate;
    eZZ_minRateCriteria_frxD09_03d(:,i) = eXXrate_frxD09_03d(:,i)>minRate;
% parameter 10
    eXX_minRateCriteria_frxD10_03d(:,i) = eXXrate_frxD10_03d(:,i)>minRate;
    eZZ_minRateCriteria_frxD10_03d(:,i) = eXXrate_frxD10_03d(:,i)>minRate;
    
% ==================================================================================================== %
% Depth 5%
% ==================================================================================================== %
% parameter 01
    eXX_minRateCriteria_frxD01_05d(:,i) = eXXrate_frxD01_05d(:,i)>minRate;
    eZZ_minRateCriteria_frxD01_05d(:,i) = eXXrate_frxD01_05d(:,i)>minRate;
% parameter 02
    eXX_minRateCriteria_frxD02_05d(:,i) = eXXrate_frxD02_05d(:,i)>minRate;
    eZZ_minRateCriteria_frxD02_05d(:,i) = eXXrate_frxD02_05d(:,i)>minRate;
% parameter 03
    eXX_minRateCriteria_frxD03_05d(:,i) = eXXrate_frxD03_05d(:,i)>minRate;
    eZZ_minRateCriteria_frxD03_05d(:,i) = eXXrate_frxD03_05d(:,i)>minRate;
% parameter 04
    eXX_minRateCriteria_frxD04_05d(:,i) = eXXrate_frxD04_05d(:,i)>minRate;
    eZZ_minRateCriteria_frxD04_05d(:,i) = eXXrate_frxD04_05d(:,i)>minRate;
% parameter 05
    eXX_minRateCriteria_frxD05_05d(:,i) = eXXrate_frxD05_05d(:,i)>minRate;
    eZZ_minRateCriteria_frxD05_05d(:,i) = eXXrate_frxD05_05d(:,i)>minRate;
% parameter 06
    eXX_minRateCriteria_frxD06_05d(:,i) = eXXrate_frxD06_05d(:,i)>minRate;
    eZZ_minRateCriteria_frxD06_05d(:,i) = eXXrate_frxD06_05d(:,i)>minRate;
% parameter 07
    eXX_minRateCriteria_frxD07_05d(:,i) = eXXrate_frxD07_05d(:,i)>minRate;
    eZZ_minRateCriteria_frxD07_05d(:,i) = eXXrate_frxD07_05d(:,i)>minRate;
% parameter 08
    eXX_minRateCriteria_frxD08_05d(:,i) = eXXrate_frxD08_05d(:,i)>minRate;
    eZZ_minRateCriteria_frxD08_05d(:,i) = eXXrate_frxD08_05d(:,i)>minRate;
% parameter 09
    eXX_minRateCriteria_frxD09_05d(:,i) = eXXrate_frxD09_05d(:,i)>minRate;
    eZZ_minRateCriteria_frxD09_05d(:,i) = eXXrate_frxD09_05d(:,i)>minRate;
% parameter 10
    eXX_minRateCriteria_frxD10_05d(:,i) = eXXrate_frxD10_05d(:,i)>minRate;
    eZZ_minRateCriteria_frxD10_05d(:,i) = eXXrate_frxD10_05d(:,i)>minRate;
    
% ==================================================================================================== %
% Depth 10%
% ==================================================================================================== %
% parameter 01
    eXX_minRateCriteria_frxD01_10d(:,i) = eXXrate_frxD01_10d(:,i)>minRate;
    eZZ_minRateCriteria_frxD01_10d(:,i) = eXXrate_frxD01_10d(:,i)>minRate;
% parameter 02
    eXX_minRateCriteria_frxD02_10d(:,i) = eXXrate_frxD02_10d(:,i)>minRate;
    eZZ_minRateCriteria_frxD02_10d(:,i) = eXXrate_frxD02_10d(:,i)>minRate;
% parameter 03
    eXX_minRateCriteria_frxD03_10d(:,i) = eXXrate_frxD03_10d(:,i)>minRate;
    eZZ_minRateCriteria_frxD03_10d(:,i) = eXXrate_frxD03_10d(:,i)>minRate;
% parameter 04
    eXX_minRateCriteria_frxD04_10d(:,i) = eXXrate_frxD04_10d(:,i)>minRate;
    eZZ_minRateCriteria_frxD04_10d(:,i) = eXXrate_frxD04_10d(:,i)>minRate;
% parameter 05
    eXX_minRateCriteria_frxD05_10d(:,i) = eXXrate_frxD05_10d(:,i)>minRate;
    eZZ_minRateCriteria_frxD05_10d(:,i) = eXXrate_frxD05_10d(:,i)>minRate;
% parameter 06
    eXX_minRateCriteria_frxD06_10d(:,i) = eXXrate_frxD06_10d(:,i)>minRate;
    eZZ_minRateCriteria_frxD06_10d(:,i) = eXXrate_frxD06_10d(:,i)>minRate;
% parameter 07
    eXX_minRateCriteria_frxD07_10d(:,i) = eXXrate_frxD07_10d(:,i)>minRate;
    eZZ_minRateCriteria_frxD07_10d(:,i) = eXXrate_frxD07_10d(:,i)>minRate;
% parameter 08
    eXX_minRateCriteria_frxD08_10d(:,i) = eXXrate_frxD08_10d(:,i)>minRate;
    eZZ_minRateCriteria_frxD08_10d(:,i) = eXXrate_frxD08_10d(:,i)>minRate;
% parameter 09
    eXX_minRateCriteria_frxD09_10d(:,i) = eXXrate_frxD09_10d(:,i)>minRate;
    eZZ_minRateCriteria_frxD09_10d(:,i) = eXXrate_frxD09_10d(:,i)>minRate;
% parameter 10
    eXX_minRateCriteria_frxD10_10d(:,i) = eXXrate_frxD10_10d(:,i)>minRate;
    eZZ_minRateCriteria_frxD10_10d(:,i) = eXXrate_frxD10_10d(:,i)>minRate;
    
% ==================================================================================================== %
% Depth 50%
% ==================================================================================================== %
% parameter 01
    eXX_minRateCriteria_frxD01_50d(:,i) = eXXrate_frxD01_50d(:,i)>minRate;
    eZZ_minRateCriteria_frxD01_50d(:,i) = eXXrate_frxD01_50d(:,i)>minRate;
% parameter 02
    eXX_minRateCriteria_frxD02_50d(:,i) = eXXrate_frxD02_50d(:,i)>minRate;
    eZZ_minRateCriteria_frxD02_50d(:,i) = eXXrate_frxD02_50d(:,i)>minRate;
% parameter 03
    eXX_minRateCriteria_frxD03_50d(:,i) = eXXrate_frxD03_50d(:,i)>minRate;
    eZZ_minRateCriteria_frxD03_50d(:,i) = eXXrate_frxD03_50d(:,i)>minRate;
% parameter 04
    eXX_minRateCriteria_frxD04_50d(:,i) = eXXrate_frxD04_50d(:,i)>minRate;
    eZZ_minRateCriteria_frxD04_50d(:,i) = eXXrate_frxD04_50d(:,i)>minRate;
% parameter 05
    eXX_minRateCriteria_frxD05_50d(:,i) = eXXrate_frxD05_50d(:,i)>minRate;
    eZZ_minRateCriteria_frxD05_50d(:,i) = eXXrate_frxD05_50d(:,i)>minRate;
% parameter 06
    eXX_minRateCriteria_frxD06_50d(:,i) = eXXrate_frxD06_50d(:,i)>minRate;
    eZZ_minRateCriteria_frxD06_50d(:,i) = eXXrate_frxD06_50d(:,i)>minRate;
% parameter 07
    eXX_minRateCriteria_frxD07_50d(:,i) = eXXrate_frxD07_50d(:,i)>minRate;
    eZZ_minRateCriteria_frxD07_50d(:,i) = eXXrate_frxD07_50d(:,i)>minRate;
% parameter 08
    eXX_minRateCriteria_frxD08_50d(:,i) = eXXrate_frxD08_50d(:,i)>minRate;
    eZZ_minRateCriteria_frxD08_50d(:,i) = eXXrate_frxD08_50d(:,i)>minRate;
% parameter 09
    eXX_minRateCriteria_frxD09_50d(:,i) = eXXrate_frxD09_50d(:,i)>minRate;
    eZZ_minRateCriteria_frxD09_50d(:,i) = eXXrate_frxD09_50d(:,i)>minRate;
% parameter 10
    eXX_minRateCriteria_frxD10_50d(:,i) = eXXrate_frxD10_50d(:,i)>minRate;
    eZZ_minRateCriteria_frxD10_50d(:,i) = eXXrate_frxD10_50d(:,i)>minRate;
    
end

% ==================================================================================================== %
% Times meeting criteria
% ==================================================================================================== %
% parameter 01
t_aboveMinRate_eXX_frxD01_01d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eZZ_frxD01_01d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eXX_frxD01_03d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eZZ_frxD01_03d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eXX_frxD01_05d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eZZ_frxD01_05d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eXX_frxD01_10d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eZZ_frxD01_10d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eXX_frxD01_50d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eZZ_frxD01_50d = zeros(n_tSteps,n_probes);
% parameter 02
t_aboveMinRate_eXX_frxD02_01d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eZZ_frxD02_01d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eXX_frxD02_03d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eZZ_frxD02_03d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eXX_frxD02_05d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eZZ_frxD02_05d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eXX_frxD02_10d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eZZ_frxD02_10d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eXX_frxD02_50d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eZZ_frxD02_50d = zeros(n_tSteps,n_probes);
% parameter 03
t_aboveMinRate_eXX_frxD03_01d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eZZ_frxD03_01d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eXX_frxD03_03d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eZZ_frxD03_03d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eXX_frxD03_05d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eZZ_frxD03_05d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eXX_frxD03_10d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eZZ_frxD03_10d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eXX_frxD03_50d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eZZ_frxD03_50d = zeros(n_tSteps,n_probes);
% parameter 04
t_aboveMinRate_eXX_frxD04_01d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eZZ_frxD04_01d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eXX_frxD04_03d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eZZ_frxD04_03d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eXX_frxD04_05d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eZZ_frxD04_05d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eXX_frxD04_10d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eZZ_frxD04_10d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eXX_frxD04_50d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eZZ_frxD04_50d = zeros(n_tSteps,n_probes);
% parameter 05
t_aboveMinRate_eXX_frxD05_01d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eZZ_frxD05_01d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eXX_frxD05_03d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eZZ_frxD05_03d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eXX_frxD05_05d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eZZ_frxD05_05d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eXX_frxD05_10d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eZZ_frxD05_10d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eXX_frxD05_50d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eZZ_frxD05_50d = zeros(n_tSteps,n_probes);
% parameter 06
t_aboveMinRate_eXX_frxD06_01d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eZZ_frxD06_01d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eXX_frxD06_03d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eZZ_frxD06_03d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eXX_frxD06_05d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eZZ_frxD06_05d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eXX_frxD06_10d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eZZ_frxD06_10d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eXX_frxD06_50d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eZZ_frxD06_50d = zeros(n_tSteps,n_probes);
% parameter 07
t_aboveMinRate_eXX_frxD07_01d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eZZ_frxD07_01d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eXX_frxD07_03d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eZZ_frxD07_03d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eXX_frxD07_05d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eZZ_frxD07_05d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eXX_frxD07_10d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eZZ_frxD07_10d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eXX_frxD07_50d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eZZ_frxD07_50d = zeros(n_tSteps,n_probes);
% parameter 08
t_aboveMinRate_eXX_frxD08_01d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eZZ_frxD08_01d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eXX_frxD08_03d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eZZ_frxD08_03d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eXX_frxD08_05d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eZZ_frxD08_05d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eXX_frxD08_10d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eZZ_frxD08_10d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eXX_frxD08_50d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eZZ_frxD08_50d = zeros(n_tSteps,n_probes);
% parameter 09
t_aboveMinRate_eXX_frxD09_01d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eZZ_frxD09_01d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eXX_frxD09_03d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eZZ_frxD09_03d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eXX_frxD09_05d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eZZ_frxD09_05d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eXX_frxD09_10d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eZZ_frxD09_10d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eXX_frxD09_50d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eZZ_frxD09_50d = zeros(n_tSteps,n_probes);
% parameter 10
t_aboveMinRate_eXX_frxD10_01d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eZZ_frxD10_01d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eXX_frxD10_03d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eZZ_frxD10_03d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eXX_frxD10_05d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eZZ_frxD10_05d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eXX_frxD10_10d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eZZ_frxD10_10d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eXX_frxD10_50d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eZZ_frxD10_50d = zeros(n_tSteps,n_probes);

for i = 1:n_probes
% ==================================================================================================== %
% Depth 1%
% ==================================================================================================== %
% parameter 01
    if sum(eXX_minRateCriteria_frxD01_01d(:,i)) > 0
        t_aboveMinRate_eXX_frxD01_01d(eXX_minRateCriteria_frxD01_01d(:,i),i) = t_swpDfrx(eXX_minRateCriteria_frxD01_01d(:,i));
    end
    if sum(eZZ_minRateCriteria_frxD01_01d(:,i)) > 0
        t_aboveMinRate_eZZ_frxD01_01d(eZZ_minRateCriteria_frxD01_01d(:,i),i) = t_swpDfrx(eZZ_minRateCriteria_frxD01_01d(:,i));
    end
% parameter 02
    if sum(eXX_minRateCriteria_frxD02_01d(:,i)) > 0
        t_aboveMinRate_eXX_frxD02_01d(eXX_minRateCriteria_frxD02_01d(:,i),i) = t_swpDfrx(eXX_minRateCriteria_frxD02_01d(:,i));
    end
    if sum(eZZ_minRateCriteria_frxD02_01d(:,i)) > 0
        t_aboveMinRate_eZZ_frxD02_01d(eZZ_minRateCriteria_frxD02_01d(:,i),i) = t_swpDfrx(eZZ_minRateCriteria_frxD02_01d(:,i));
    end
% parameter 03
    if sum(eXX_minRateCriteria_frxD03_01d(:,i)) > 0
        t_aboveMinRate_eXX_frxD03_01d(eXX_minRateCriteria_frxD03_01d(:,i),i) = t_swpDfrx(eXX_minRateCriteria_frxD03_01d(:,i));
    end
    if sum(eZZ_minRateCriteria_frxD03_01d(:,i)) > 0
        t_aboveMinRate_eZZ_frxD03_01d(eZZ_minRateCriteria_frxD03_01d(:,i),i) = t_swpDfrx(eZZ_minRateCriteria_frxD03_01d(:,i));
    end
% parameter 04
    if sum(eXX_minRateCriteria_frxD04_01d(:,i)) > 0
        t_aboveMinRate_eXX_frxD04_01d(eXX_minRateCriteria_frxD04_01d(:,i),i) = t_swpDfrx(eXX_minRateCriteria_frxD04_01d(:,i));
    end
    if sum(eZZ_minRateCriteria_frxD04_01d(:,i)) > 0
        t_aboveMinRate_eZZ_frxD04_01d(eZZ_minRateCriteria_frxD04_01d(:,i),i) = t_swpDfrx(eZZ_minRateCriteria_frxD04_01d(:,i));
    end
% parameter 05
    if sum(eXX_minRateCriteria_frxD05_01d(:,i)) > 0
        t_aboveMinRate_eXX_frxD05_01d(eXX_minRateCriteria_frxD05_01d(:,i),i) = t_swpDfrx(eXX_minRateCriteria_frxD05_01d(:,i));
    end
    if sum(eZZ_minRateCriteria_frxD05_01d(:,i)) > 0
        t_aboveMinRate_eZZ_frxD05_01d(eZZ_minRateCriteria_frxD05_01d(:,i),i) = t_swpDfrx(eZZ_minRateCriteria_frxD05_01d(:,i));
    end
% parameter 06
    if sum(eXX_minRateCriteria_frxD06_01d(:,i)) > 0
        t_aboveMinRate_eXX_frxD06_01d(eXX_minRateCriteria_frxD06_01d(:,i),i) = t_swpDfrx(eXX_minRateCriteria_frxD06_01d(:,i));
    end
    if sum(eZZ_minRateCriteria_frxD06_01d(:,i)) > 0
        t_aboveMinRate_eZZ_frxD06_01d(eZZ_minRateCriteria_frxD06_01d(:,i),i) = t_swpDfrx(eZZ_minRateCriteria_frxD06_01d(:,i));
    end
% parameter 07
    if sum(eXX_minRateCriteria_frxD07_01d(:,i)) > 0
        t_aboveMinRate_eXX_frxD07_01d(eXX_minRateCriteria_frxD07_01d(:,i),i) = t_swpDfrx(eXX_minRateCriteria_frxD07_01d(:,i));
    end
    if sum(eZZ_minRateCriteria_frxD07_01d(:,i)) > 0
        t_aboveMinRate_eZZ_frxD07_01d(eZZ_minRateCriteria_frxD07_01d(:,i),i) = t_swpDfrx(eZZ_minRateCriteria_frxD07_01d(:,i));
    end
% parameter 08
    if sum(eXX_minRateCriteria_frxD08_01d(:,i)) > 0
        t_aboveMinRate_eXX_frxD08_01d(eXX_minRateCriteria_frxD08_01d(:,i),i) = t_swpDfrx(eXX_minRateCriteria_frxD08_01d(:,i));
    end
    if sum(eZZ_minRateCriteria_frxD08_01d(:,i)) > 0
        t_aboveMinRate_eZZ_frxD08_01d(eZZ_minRateCriteria_frxD08_01d(:,i),i) = t_swpDfrx(eZZ_minRateCriteria_frxD08_01d(:,i));
    end
% parameter 09
    if sum(eXX_minRateCriteria_frxD09_01d(:,i)) > 0
        t_aboveMinRate_eXX_frxD09_01d(eXX_minRateCriteria_frxD09_01d(:,i),i) = t_swpDfrx(eXX_minRateCriteria_frxD09_01d(:,i));
    end
    if sum(eZZ_minRateCriteria_frxD09_01d(:,i)) > 0
        t_aboveMinRate_eZZ_frxD09_01d(eZZ_minRateCriteria_frxD09_01d(:,i),i) = t_swpDfrx(eZZ_minRateCriteria_frxD09_01d(:,i));
    end
% parameter 10
    if sum(eXX_minRateCriteria_frxD10_01d(:,i)) > 0
        t_aboveMinRate_eXX_frxD10_01d(eXX_minRateCriteria_frxD10_01d(:,i),i) = t_swpDfrx(eXX_minRateCriteria_frxD10_01d(:,i));
    end
    if sum(eZZ_minRateCriteria_frxD10_01d(:,i)) > 0
        t_aboveMinRate_eZZ_frxD10_01d(eZZ_minRateCriteria_frxD10_01d(:,i),i) = t_swpDfrx(eZZ_minRateCriteria_frxD10_01d(:,i));
    end
    
% ==================================================================================================== %
% Depth 3%
% ==================================================================================================== %
% parameter 01
    if sum(eXX_minRateCriteria_frxD01_03d(:,i)) > 0
        t_aboveMinRate_eXX_frxD01_03d(eXX_minRateCriteria_frxD01_03d(:,i),i) = t_swpDfrx(eXX_minRateCriteria_frxD01_03d(:,i));
    end
    if sum(eZZ_minRateCriteria_frxD01_03d(:,i)) > 0
        t_aboveMinRate_eZZ_frxD01_03d(eZZ_minRateCriteria_frxD01_03d(:,i),i) = t_swpDfrx(eZZ_minRateCriteria_frxD01_03d(:,i));
    end
% parameter 02
    if sum(eXX_minRateCriteria_frxD02_03d(:,i)) > 0
        t_aboveMinRate_eXX_frxD02_03d(eXX_minRateCriteria_frxD02_03d(:,i),i) = t_swpDfrx(eXX_minRateCriteria_frxD02_03d(:,i));
    end
    if sum(eZZ_minRateCriteria_frxD02_03d(:,i)) > 0
        t_aboveMinRate_eZZ_frxD02_03d(eZZ_minRateCriteria_frxD02_03d(:,i),i) = t_swpDfrx(eZZ_minRateCriteria_frxD02_03d(:,i));
    end
% parameter 03
    if sum(eXX_minRateCriteria_frxD03_03d(:,i)) > 0
        t_aboveMinRate_eXX_frxD03_03d(eXX_minRateCriteria_frxD03_03d(:,i),i) = t_swpDfrx(eXX_minRateCriteria_frxD03_03d(:,i));
    end
    if sum(eZZ_minRateCriteria_frxD03_03d(:,i)) > 0
        t_aboveMinRate_eZZ_frxD03_03d(eZZ_minRateCriteria_frxD03_03d(:,i),i) = t_swpDfrx(eZZ_minRateCriteria_frxD03_03d(:,i));
    end
% parameter 04
    if sum(eXX_minRateCriteria_frxD04_03d(:,i)) > 0
        t_aboveMinRate_eXX_frxD04_03d(eXX_minRateCriteria_frxD04_03d(:,i),i) = t_swpDfrx(eXX_minRateCriteria_frxD04_03d(:,i));
    end
    if sum(eZZ_minRateCriteria_frxD04_03d(:,i)) > 0
        t_aboveMinRate_eZZ_frxD04_03d(eZZ_minRateCriteria_frxD04_03d(:,i),i) = t_swpDfrx(eZZ_minRateCriteria_frxD04_03d(:,i));
    end
% parameter 05
    if sum(eXX_minRateCriteria_frxD05_03d(:,i)) > 0
        t_aboveMinRate_eXX_frxD05_03d(eXX_minRateCriteria_frxD05_03d(:,i),i) = t_swpDfrx(eXX_minRateCriteria_frxD05_03d(:,i));
    end
    if sum(eZZ_minRateCriteria_frxD05_03d(:,i)) > 0
        t_aboveMinRate_eZZ_frxD05_03d(eZZ_minRateCriteria_frxD05_03d(:,i),i) = t_swpDfrx(eZZ_minRateCriteria_frxD05_03d(:,i));
    end
% parameter 06
    if sum(eXX_minRateCriteria_frxD06_03d(:,i)) > 0
        t_aboveMinRate_eXX_frxD06_03d(eXX_minRateCriteria_frxD06_03d(:,i),i) = t_swpDfrx(eXX_minRateCriteria_frxD06_03d(:,i));
    end
    if sum(eZZ_minRateCriteria_frxD06_03d(:,i)) > 0
        t_aboveMinRate_eZZ_frxD06_03d(eZZ_minRateCriteria_frxD06_03d(:,i),i) = t_swpDfrx(eZZ_minRateCriteria_frxD06_03d(:,i));
    end
% parameter 07
    if sum(eXX_minRateCriteria_frxD07_03d(:,i)) > 0
        t_aboveMinRate_eXX_frxD07_03d(eXX_minRateCriteria_frxD07_03d(:,i),i) = t_swpDfrx(eXX_minRateCriteria_frxD07_03d(:,i));
    end
    if sum(eZZ_minRateCriteria_frxD07_03d(:,i)) > 0
        t_aboveMinRate_eZZ_frxD07_03d(eZZ_minRateCriteria_frxD07_03d(:,i),i) = t_swpDfrx(eZZ_minRateCriteria_frxD07_03d(:,i));
    end
% parameter 08
    if sum(eXX_minRateCriteria_frxD08_03d(:,i)) > 0
        t_aboveMinRate_eXX_frxD08_03d(eXX_minRateCriteria_frxD08_03d(:,i),i) = t_swpDfrx(eXX_minRateCriteria_frxD08_03d(:,i));
    end
    if sum(eZZ_minRateCriteria_frxD08_03d(:,i)) > 0
        t_aboveMinRate_eZZ_frxD08_03d(eZZ_minRateCriteria_frxD08_03d(:,i),i) = t_swpDfrx(eZZ_minRateCriteria_frxD08_03d(:,i));
    end
% parameter 09
    if sum(eXX_minRateCriteria_frxD09_03d(:,i)) > 0
        t_aboveMinRate_eXX_frxD09_03d(eXX_minRateCriteria_frxD09_03d(:,i),i) = t_swpDfrx(eXX_minRateCriteria_frxD09_03d(:,i));
    end
    if sum(eZZ_minRateCriteria_frxD09_03d(:,i)) > 0
        t_aboveMinRate_eZZ_frxD09_03d(eZZ_minRateCriteria_frxD09_03d(:,i),i) = t_swpDfrx(eZZ_minRateCriteria_frxD09_03d(:,i));
    end
% parameter 10
    if sum(eXX_minRateCriteria_frxD10_03d(:,i)) > 0
        t_aboveMinRate_eXX_frxD10_03d(eXX_minRateCriteria_frxD10_03d(:,i),i) = t_swpDfrx(eXX_minRateCriteria_frxD10_03d(:,i));
    end
    if sum(eZZ_minRateCriteria_frxD10_03d(:,i)) > 0
        t_aboveMinRate_eZZ_frxD10_03d(eZZ_minRateCriteria_frxD10_03d(:,i),i) = t_swpDfrx(eZZ_minRateCriteria_frxD10_03d(:,i));
    end
    
% ==================================================================================================== %
% Depth 5%
% ==================================================================================================== %
% parameter 01
    if sum(eXX_minRateCriteria_frxD01_05d(:,i)) > 0
        t_aboveMinRate_eXX_frxD01_05d(eXX_minRateCriteria_frxD01_05d(:,i),i) = t_swpDfrx(eXX_minRateCriteria_frxD01_05d(:,i));
    end
    if sum(eZZ_minRateCriteria_frxD01_05d(:,i)) > 0
        t_aboveMinRate_eZZ_frxD01_05d(eZZ_minRateCriteria_frxD01_05d(:,i),i) = t_swpDfrx(eZZ_minRateCriteria_frxD01_05d(:,i));
    end
% parameter 02
    if sum(eXX_minRateCriteria_frxD02_05d(:,i)) > 0
        t_aboveMinRate_eXX_frxD02_05d(eXX_minRateCriteria_frxD02_05d(:,i),i) = t_swpDfrx(eXX_minRateCriteria_frxD02_05d(:,i));
    end
    if sum(eZZ_minRateCriteria_frxD02_05d(:,i)) > 0
        t_aboveMinRate_eZZ_frxD02_05d(eZZ_minRateCriteria_frxD02_05d(:,i),i) = t_swpDfrx(eZZ_minRateCriteria_frxD02_05d(:,i));
    end
% parameter 03
    if sum(eXX_minRateCriteria_frxD03_05d(:,i)) > 0
        t_aboveMinRate_eXX_frxD03_05d(eXX_minRateCriteria_frxD03_05d(:,i),i) = t_swpDfrx(eXX_minRateCriteria_frxD03_05d(:,i));
    end
    if sum(eZZ_minRateCriteria_frxD03_05d(:,i)) > 0
        t_aboveMinRate_eZZ_frxD03_05d(eZZ_minRateCriteria_frxD03_05d(:,i),i) = t_swpDfrx(eZZ_minRateCriteria_frxD03_05d(:,i));
    end
% parameter 04
    if sum(eXX_minRateCriteria_frxD04_05d(:,i)) > 0
        t_aboveMinRate_eXX_frxD04_05d(eXX_minRateCriteria_frxD04_05d(:,i),i) = t_swpDfrx(eXX_minRateCriteria_frxD04_05d(:,i));
    end
    if sum(eZZ_minRateCriteria_frxD04_05d(:,i)) > 0
        t_aboveMinRate_eZZ_frxD04_05d(eZZ_minRateCriteria_frxD04_05d(:,i),i) = t_swpDfrx(eZZ_minRateCriteria_frxD04_05d(:,i));
    end
% parameter 05
    if sum(eXX_minRateCriteria_frxD05_05d(:,i)) > 0
        t_aboveMinRate_eXX_frxD05_05d(eXX_minRateCriteria_frxD05_05d(:,i),i) = t_swpDfrx(eXX_minRateCriteria_frxD05_05d(:,i));
    end
    if sum(eZZ_minRateCriteria_frxD05_05d(:,i)) > 0
        t_aboveMinRate_eZZ_frxD05_05d(eZZ_minRateCriteria_frxD05_05d(:,i),i) = t_swpDfrx(eZZ_minRateCriteria_frxD05_05d(:,i));
    end
% parameter 06
    if sum(eXX_minRateCriteria_frxD06_05d(:,i)) > 0
        t_aboveMinRate_eXX_frxD06_05d(eXX_minRateCriteria_frxD06_05d(:,i),i) = t_swpDfrx(eXX_minRateCriteria_frxD06_05d(:,i));
    end
    if sum(eZZ_minRateCriteria_frxD06_05d(:,i)) > 0
        t_aboveMinRate_eZZ_frxD06_05d(eZZ_minRateCriteria_frxD06_05d(:,i),i) = t_swpDfrx(eZZ_minRateCriteria_frxD06_05d(:,i));
    end
% parameter 07
    if sum(eXX_minRateCriteria_frxD07_05d(:,i)) > 0
        t_aboveMinRate_eXX_frxD07_05d(eXX_minRateCriteria_frxD07_05d(:,i),i) = t_swpDfrx(eXX_minRateCriteria_frxD07_05d(:,i));
    end
    if sum(eZZ_minRateCriteria_frxD07_05d(:,i)) > 0
        t_aboveMinRate_eZZ_frxD07_05d(eZZ_minRateCriteria_frxD07_05d(:,i),i) = t_swpDfrx(eZZ_minRateCriteria_frxD07_05d(:,i));
    end
% parameter 08
    if sum(eXX_minRateCriteria_frxD08_05d(:,i)) > 0
        t_aboveMinRate_eXX_frxD08_05d(eXX_minRateCriteria_frxD08_05d(:,i),i) = t_swpDfrx(eXX_minRateCriteria_frxD08_05d(:,i));
    end
    if sum(eZZ_minRateCriteria_frxD08_05d(:,i)) > 0
        t_aboveMinRate_eZZ_frxD08_05d(eZZ_minRateCriteria_frxD08_05d(:,i),i) = t_swpDfrx(eZZ_minRateCriteria_frxD08_05d(:,i));
    end
% parameter 09
    if sum(eXX_minRateCriteria_frxD09_05d(:,i)) > 0
        t_aboveMinRate_eXX_frxD09_05d(eXX_minRateCriteria_frxD09_05d(:,i),i) = t_swpDfrx(eXX_minRateCriteria_frxD09_05d(:,i));
    end
    if sum(eZZ_minRateCriteria_frxD09_05d(:,i)) > 0
        t_aboveMinRate_eZZ_frxD09_05d(eZZ_minRateCriteria_frxD09_05d(:,i),i) = t_swpDfrx(eZZ_minRateCriteria_frxD09_05d(:,i));
    end
% parameter 10
    if sum(eXX_minRateCriteria_frxD10_05d(:,i)) > 0
        t_aboveMinRate_eXX_frxD10_05d(eXX_minRateCriteria_frxD10_05d(:,i),i) = t_swpDfrx(eXX_minRateCriteria_frxD10_05d(:,i));
    end
    if sum(eZZ_minRateCriteria_frxD10_05d(:,i)) > 0
        t_aboveMinRate_eZZ_frxD10_05d(eZZ_minRateCriteria_frxD10_05d(:,i),i) = t_swpDfrx(eZZ_minRateCriteria_frxD10_05d(:,i));
    end
    
% ==================================================================================================== %
% Depth 10%
% ==================================================================================================== %
% parameter 01
    if sum(eXX_minRateCriteria_frxD01_10d(:,i)) > 0
        t_aboveMinRate_eXX_frxD01_10d(eXX_minRateCriteria_frxD01_10d(:,i),i) = t_swpDfrx(eXX_minRateCriteria_frxD01_10d(:,i));
    end
    if sum(eZZ_minRateCriteria_frxD01_10d(:,i)) > 0
        t_aboveMinRate_eZZ_frxD01_10d(eZZ_minRateCriteria_frxD01_10d(:,i),i) = t_swpDfrx(eZZ_minRateCriteria_frxD01_10d(:,i));
    end
% parameter 02
    if sum(eXX_minRateCriteria_frxD02_10d(:,i)) > 0
        t_aboveMinRate_eXX_frxD02_10d(eXX_minRateCriteria_frxD02_10d(:,i),i) = t_swpDfrx(eXX_minRateCriteria_frxD02_10d(:,i));
    end
    if sum(eZZ_minRateCriteria_frxD02_10d(:,i)) > 0
        t_aboveMinRate_eZZ_frxD02_10d(eZZ_minRateCriteria_frxD02_10d(:,i),i) = t_swpDfrx(eZZ_minRateCriteria_frxD02_10d(:,i));
    end
% parameter 03
    if sum(eXX_minRateCriteria_frxD03_10d(:,i)) > 0
        t_aboveMinRate_eXX_frxD03_10d(eXX_minRateCriteria_frxD03_10d(:,i),i) = t_swpDfrx(eXX_minRateCriteria_frxD03_10d(:,i));
    end
    if sum(eZZ_minRateCriteria_frxD03_10d(:,i)) > 0
        t_aboveMinRate_eZZ_frxD03_10d(eZZ_minRateCriteria_frxD03_10d(:,i),i) = t_swpDfrx(eZZ_minRateCriteria_frxD03_10d(:,i));
    end
% parameter 04
    if sum(eXX_minRateCriteria_frxD04_10d(:,i)) > 0
        t_aboveMinRate_eXX_frxD04_10d(eXX_minRateCriteria_frxD04_10d(:,i),i) = t_swpDfrx(eXX_minRateCriteria_frxD04_10d(:,i));
    end
    if sum(eZZ_minRateCriteria_frxD04_10d(:,i)) > 0
        t_aboveMinRate_eZZ_frxD04_10d(eZZ_minRateCriteria_frxD04_10d(:,i),i) = t_swpDfrx(eZZ_minRateCriteria_frxD04_10d(:,i));
    end
% parameter 05
    if sum(eXX_minRateCriteria_frxD05_10d(:,i)) > 0
        t_aboveMinRate_eXX_frxD05_10d(eXX_minRateCriteria_frxD05_10d(:,i),i) = t_swpDfrx(eXX_minRateCriteria_frxD05_10d(:,i));
    end
    if sum(eZZ_minRateCriteria_frxD05_10d(:,i)) > 0
        t_aboveMinRate_eZZ_frxD05_10d(eZZ_minRateCriteria_frxD05_10d(:,i),i) = t_swpDfrx(eZZ_minRateCriteria_frxD05_10d(:,i));
    end
% parameter 06
    if sum(eXX_minRateCriteria_frxD06_10d(:,i)) > 0
        t_aboveMinRate_eXX_frxD06_10d(eXX_minRateCriteria_frxD06_10d(:,i),i) = t_swpDfrx(eXX_minRateCriteria_frxD06_10d(:,i));
    end
    if sum(eZZ_minRateCriteria_frxD06_10d(:,i)) > 0
        t_aboveMinRate_eZZ_frxD06_10d(eZZ_minRateCriteria_frxD06_10d(:,i),i) = t_swpDfrx(eZZ_minRateCriteria_frxD06_10d(:,i));
    end
% parameter 07
    if sum(eXX_minRateCriteria_frxD07_10d(:,i)) > 0
        t_aboveMinRate_eXX_frxD07_10d(eXX_minRateCriteria_frxD07_10d(:,i),i) = t_swpDfrx(eXX_minRateCriteria_frxD07_10d(:,i));
    end
    if sum(eZZ_minRateCriteria_frxD07_10d(:,i)) > 0
        t_aboveMinRate_eZZ_frxD07_10d(eZZ_minRateCriteria_frxD07_10d(:,i),i) = t_swpDfrx(eZZ_minRateCriteria_frxD07_10d(:,i));
    end
% parameter 08
    if sum(eXX_minRateCriteria_frxD08_10d(:,i)) > 0
        t_aboveMinRate_eXX_frxD08_10d(eXX_minRateCriteria_frxD08_10d(:,i),i) = t_swpDfrx(eXX_minRateCriteria_frxD08_10d(:,i));
    end
    if sum(eZZ_minRateCriteria_frxD08_10d(:,i)) > 0
        t_aboveMinRate_eZZ_frxD08_10d(eZZ_minRateCriteria_frxD08_10d(:,i),i) = t_swpDfrx(eZZ_minRateCriteria_frxD08_10d(:,i));
    end
% parameter 09
    if sum(eXX_minRateCriteria_frxD09_10d(:,i)) > 0
        t_aboveMinRate_eXX_frxD09_10d(eXX_minRateCriteria_frxD09_10d(:,i),i) = t_swpDfrx(eXX_minRateCriteria_frxD09_10d(:,i));
    end
    if sum(eZZ_minRateCriteria_frxD09_10d(:,i)) > 0
        t_aboveMinRate_eZZ_frxD09_10d(eZZ_minRateCriteria_frxD09_10d(:,i),i) = t_swpDfrx(eZZ_minRateCriteria_frxD09_10d(:,i));
    end
% parameter 10
    if sum(eXX_minRateCriteria_frxD10_10d(:,i)) > 0
        t_aboveMinRate_eXX_frxD10_10d(eXX_minRateCriteria_frxD10_10d(:,i),i) = t_swpDfrx(eXX_minRateCriteria_frxD10_10d(:,i));
    end
    if sum(eZZ_minRateCriteria_frxD10_10d(:,i)) > 0
        t_aboveMinRate_eZZ_frxD10_10d(eZZ_minRateCriteria_frxD10_10d(:,i),i) = t_swpDfrx(eZZ_minRateCriteria_frxD10_10d(:,i));
    end
    
% ==================================================================================================== %
% Depth 50%
% ==================================================================================================== %
% parameter 01
    if sum(eXX_minRateCriteria_frxD01_50d(:,i)) > 0
        t_aboveMinRate_eXX_frxD01_50d(eXX_minRateCriteria_frxD01_50d(:,i),i) = t_swpDfrx(eXX_minRateCriteria_frxD01_50d(:,i));
    end
    if sum(eZZ_minRateCriteria_frxD01_50d(:,i)) > 0
        t_aboveMinRate_eZZ_frxD01_50d(eZZ_minRateCriteria_frxD01_50d(:,i),i) = t_swpDfrx(eZZ_minRateCriteria_frxD01_50d(:,i));
    end
% parameter 02
    if sum(eXX_minRateCriteria_frxD02_50d(:,i)) > 0
        t_aboveMinRate_eXX_frxD02_50d(eXX_minRateCriteria_frxD02_50d(:,i),i) = t_swpDfrx(eXX_minRateCriteria_frxD02_50d(:,i));
    end
    if sum(eZZ_minRateCriteria_frxD02_50d(:,i)) > 0
        t_aboveMinRate_eZZ_frxD02_50d(eZZ_minRateCriteria_frxD02_50d(:,i),i) = t_swpDfrx(eZZ_minRateCriteria_frxD02_50d(:,i));
    end
% parameter 03
    if sum(eXX_minRateCriteria_frxD03_50d(:,i)) > 0
        t_aboveMinRate_eXX_frxD03_50d(eXX_minRateCriteria_frxD03_50d(:,i),i) = t_swpDfrx(eXX_minRateCriteria_frxD03_50d(:,i));
    end
    if sum(eZZ_minRateCriteria_frxD03_50d(:,i)) > 0
        t_aboveMinRate_eZZ_frxD03_50d(eZZ_minRateCriteria_frxD03_50d(:,i),i) = t_swpDfrx(eZZ_minRateCriteria_frxD03_50d(:,i));
    end
% parameter 04
    if sum(eXX_minRateCriteria_frxD04_50d(:,i)) > 0
        t_aboveMinRate_eXX_frxD04_50d(eXX_minRateCriteria_frxD04_50d(:,i),i) = t_swpDfrx(eXX_minRateCriteria_frxD04_50d(:,i));
    end
    if sum(eZZ_minRateCriteria_frxD04_50d(:,i)) > 0
        t_aboveMinRate_eZZ_frxD04_50d(eZZ_minRateCriteria_frxD04_50d(:,i),i) = t_swpDfrx(eZZ_minRateCriteria_frxD04_50d(:,i));
    end
% parameter 05
    if sum(eXX_minRateCriteria_frxD05_50d(:,i)) > 0
        t_aboveMinRate_eXX_frxD05_50d(eXX_minRateCriteria_frxD05_50d(:,i),i) = t_swpDfrx(eXX_minRateCriteria_frxD05_50d(:,i));
    end
    if sum(eZZ_minRateCriteria_frxD05_50d(:,i)) > 0
        t_aboveMinRate_eZZ_frxD05_50d(eZZ_minRateCriteria_frxD05_50d(:,i),i) = t_swpDfrx(eZZ_minRateCriteria_frxD05_50d(:,i));
    end
% parameter 06
    if sum(eXX_minRateCriteria_frxD06_50d(:,i)) > 0
        t_aboveMinRate_eXX_frxD06_50d(eXX_minRateCriteria_frxD06_50d(:,i),i) = t_swpDfrx(eXX_minRateCriteria_frxD06_50d(:,i));
    end
    if sum(eZZ_minRateCriteria_frxD06_50d(:,i)) > 0
        t_aboveMinRate_eZZ_frxD06_50d(eZZ_minRateCriteria_frxD06_50d(:,i),i) = t_swpDfrx(eZZ_minRateCriteria_frxD06_50d(:,i));
    end
% parameter 07
    if sum(eXX_minRateCriteria_frxD07_50d(:,i)) > 0
        t_aboveMinRate_eXX_frxD07_50d(eXX_minRateCriteria_frxD07_50d(:,i),i) = t_swpDfrx(eXX_minRateCriteria_frxD07_50d(:,i));
    end
    if sum(eZZ_minRateCriteria_frxD07_50d(:,i)) > 0
        t_aboveMinRate_eZZ_frxD07_50d(eZZ_minRateCriteria_frxD07_50d(:,i),i) = t_swpDfrx(eZZ_minRateCriteria_frxD07_50d(:,i));
    end
% parameter 08
    if sum(eXX_minRateCriteria_frxD08_50d(:,i)) > 0
        t_aboveMinRate_eXX_frxD08_50d(eXX_minRateCriteria_frxD08_50d(:,i),i) = t_swpDfrx(eXX_minRateCriteria_frxD08_50d(:,i));
    end
    if sum(eZZ_minRateCriteria_frxD08_50d(:,i)) > 0
        t_aboveMinRate_eZZ_frxD08_50d(eZZ_minRateCriteria_frxD08_50d(:,i),i) = t_swpDfrx(eZZ_minRateCriteria_frxD08_50d(:,i));
    end
% parameter 09
    if sum(eXX_minRateCriteria_frxD09_50d(:,i)) > 0
        t_aboveMinRate_eXX_frxD09_50d(eXX_minRateCriteria_frxD09_50d(:,i),i) = t_swpDfrx(eXX_minRateCriteria_frxD09_50d(:,i));
    end
    if sum(eZZ_minRateCriteria_frxD09_50d(:,i)) > 0
        t_aboveMinRate_eZZ_frxD09_50d(eZZ_minRateCriteria_frxD09_50d(:,i),i) = t_swpDfrx(eZZ_minRateCriteria_frxD09_50d(:,i));
    end
% parameter 10
    if sum(eXX_minRateCriteria_frxD10_50d(:,i)) > 0
        t_aboveMinRate_eXX_frxD10_50d(eXX_minRateCriteria_frxD10_50d(:,i),i) = t_swpDfrx(eXX_minRateCriteria_frxD10_50d(:,i));
    end
    if sum(eZZ_minRateCriteria_frxD10_50d(:,i)) > 0
        t_aboveMinRate_eZZ_frxD10_50d(eZZ_minRateCriteria_frxD10_50d(:,i),i) = t_swpDfrx(eZZ_minRateCriteria_frxD10_50d(:,i));
    end
    
end

%% Duration during which strain rate > minRate

% parameter 01
tFirst_aboveMinRate_eXX_frxD01_01d = zeros(1,n_probes);
tLast_aboveMinRate_eXX_frxD01_01d  = zeros(1,n_probes);
tFirst_aboveMinRate_eZZ_frxD01_01d = zeros(1,n_probes);
tLast_aboveMinRate_eZZ_frxD01_01d  = zeros(1,n_probes);
tFirst_aboveMinRate_eXX_frxD01_03d = zeros(1,n_probes);
tLast_aboveMinRate_eXX_frxD01_03d  = zeros(1,n_probes);
tFirst_aboveMinRate_eZZ_frxD01_03d = zeros(1,n_probes);
tLast_aboveMinRate_eZZ_frxD01_03d  = zeros(1,n_probes);
tFirst_aboveMinRate_eXX_frxD01_05d = zeros(1,n_probes);
tLast_aboveMinRate_eXX_frxD01_05d  = zeros(1,n_probes);
tFirst_aboveMinRate_eZZ_frxD01_05d = zeros(1,n_probes);
tLast_aboveMinRate_eZZ_frxD01_05d  = zeros(1,n_probes);
tFirst_aboveMinRate_eXX_frxD01_10d = zeros(1,n_probes);
tLast_aboveMinRate_eXX_frxD01_10d  = zeros(1,n_probes);
tFirst_aboveMinRate_eZZ_frxD01_10d = zeros(1,n_probes);
tLast_aboveMinRate_eZZ_frxD01_10d  = zeros(1,n_probes);
tFirst_aboveMinRate_eXX_frxD01_50d = zeros(1,n_probes);
tLast_aboveMinRate_eXX_frxD01_50d  = zeros(1,n_probes);
tFirst_aboveMinRate_eZZ_frxD01_50d = zeros(1,n_probes);
tLast_aboveMinRate_eZZ_frxD01_50d  = zeros(1,n_probes);
% parameter 02
tFirst_aboveMinRate_eXX_frxD02_01d = zeros(1,n_probes);
tLast_aboveMinRate_eXX_frxD02_01d  = zeros(1,n_probes);
tFirst_aboveMinRate_eZZ_frxD02_01d = zeros(1,n_probes);
tLast_aboveMinRate_eZZ_frxD02_01d  = zeros(1,n_probes);
tFirst_aboveMinRate_eXX_frxD02_03d = zeros(1,n_probes);
tLast_aboveMinRate_eXX_frxD02_03d  = zeros(1,n_probes);
tFirst_aboveMinRate_eZZ_frxD02_03d = zeros(1,n_probes);
tLast_aboveMinRate_eZZ_frxD02_03d  = zeros(1,n_probes);
tFirst_aboveMinRate_eXX_frxD02_05d = zeros(1,n_probes);
tLast_aboveMinRate_eXX_frxD02_05d  = zeros(1,n_probes);
tFirst_aboveMinRate_eZZ_frxD02_05d = zeros(1,n_probes);
tLast_aboveMinRate_eZZ_frxD02_05d  = zeros(1,n_probes);
tFirst_aboveMinRate_eXX_frxD02_10d = zeros(1,n_probes);
tLast_aboveMinRate_eXX_frxD02_10d  = zeros(1,n_probes);
tFirst_aboveMinRate_eZZ_frxD02_10d = zeros(1,n_probes);
tLast_aboveMinRate_eZZ_frxD02_10d  = zeros(1,n_probes);
tFirst_aboveMinRate_eXX_frxD02_50d = zeros(1,n_probes);
tLast_aboveMinRate_eXX_frxD02_50d  = zeros(1,n_probes);
tFirst_aboveMinRate_eZZ_frxD02_50d = zeros(1,n_probes);
tLast_aboveMinRate_eZZ_frxD02_50d  = zeros(1,n_probes);
% parameter 03
tFirst_aboveMinRate_eXX_frxD03_01d = zeros(1,n_probes);
tLast_aboveMinRate_eXX_frxD03_01d  = zeros(1,n_probes);
tFirst_aboveMinRate_eZZ_frxD03_01d = zeros(1,n_probes);
tLast_aboveMinRate_eZZ_frxD03_01d  = zeros(1,n_probes);
tFirst_aboveMinRate_eXX_frxD03_03d = zeros(1,n_probes);
tLast_aboveMinRate_eXX_frxD03_03d  = zeros(1,n_probes);
tFirst_aboveMinRate_eZZ_frxD03_03d = zeros(1,n_probes);
tLast_aboveMinRate_eZZ_frxD03_03d  = zeros(1,n_probes);
tFirst_aboveMinRate_eXX_frxD03_05d = zeros(1,n_probes);
tLast_aboveMinRate_eXX_frxD03_05d  = zeros(1,n_probes);
tFirst_aboveMinRate_eZZ_frxD03_05d = zeros(1,n_probes);
tLast_aboveMinRate_eZZ_frxD03_05d  = zeros(1,n_probes);
tFirst_aboveMinRate_eXX_frxD03_10d = zeros(1,n_probes);
tLast_aboveMinRate_eXX_frxD03_10d  = zeros(1,n_probes);
tFirst_aboveMinRate_eZZ_frxD03_10d = zeros(1,n_probes);
tLast_aboveMinRate_eZZ_frxD03_10d  = zeros(1,n_probes);
tFirst_aboveMinRate_eXX_frxD03_50d = zeros(1,n_probes);
tLast_aboveMinRate_eXX_frxD03_50d  = zeros(1,n_probes);
tFirst_aboveMinRate_eZZ_frxD03_50d = zeros(1,n_probes);
tLast_aboveMinRate_eZZ_frxD03_50d  = zeros(1,n_probes);
% parameter 04
tFirst_aboveMinRate_eXX_frxD04_01d = zeros(1,n_probes);
tLast_aboveMinRate_eXX_frxD04_01d  = zeros(1,n_probes);
tFirst_aboveMinRate_eZZ_frxD04_01d = zeros(1,n_probes);
tLast_aboveMinRate_eZZ_frxD04_01d  = zeros(1,n_probes);
tFirst_aboveMinRate_eXX_frxD04_03d = zeros(1,n_probes);
tLast_aboveMinRate_eXX_frxD04_03d  = zeros(1,n_probes);
tFirst_aboveMinRate_eZZ_frxD04_03d = zeros(1,n_probes);
tLast_aboveMinRate_eZZ_frxD04_03d  = zeros(1,n_probes);
tFirst_aboveMinRate_eXX_frxD04_05d = zeros(1,n_probes);
tLast_aboveMinRate_eXX_frxD04_05d  = zeros(1,n_probes);
tFirst_aboveMinRate_eZZ_frxD04_05d = zeros(1,n_probes);
tLast_aboveMinRate_eZZ_frxD04_05d  = zeros(1,n_probes);
tFirst_aboveMinRate_eXX_frxD04_10d = zeros(1,n_probes);
tLast_aboveMinRate_eXX_frxD04_10d  = zeros(1,n_probes);
tFirst_aboveMinRate_eZZ_frxD04_10d = zeros(1,n_probes);
tLast_aboveMinRate_eZZ_frxD04_10d  = zeros(1,n_probes);
tFirst_aboveMinRate_eXX_frxD04_50d = zeros(1,n_probes);
tLast_aboveMinRate_eXX_frxD04_50d  = zeros(1,n_probes);
tFirst_aboveMinRate_eZZ_frxD04_50d = zeros(1,n_probes);
tLast_aboveMinRate_eZZ_frxD04_50d  = zeros(1,n_probes);
% parameter 05
tFirst_aboveMinRate_eXX_frxD05_01d = zeros(1,n_probes);
tLast_aboveMinRate_eXX_frxD05_01d  = zeros(1,n_probes);
tFirst_aboveMinRate_eZZ_frxD05_01d = zeros(1,n_probes);
tLast_aboveMinRate_eZZ_frxD05_01d  = zeros(1,n_probes);
tFirst_aboveMinRate_eXX_frxD05_03d = zeros(1,n_probes);
tLast_aboveMinRate_eXX_frxD05_03d  = zeros(1,n_probes);
tFirst_aboveMinRate_eZZ_frxD05_03d = zeros(1,n_probes);
tLast_aboveMinRate_eZZ_frxD05_03d  = zeros(1,n_probes);
tFirst_aboveMinRate_eXX_frxD05_05d = zeros(1,n_probes);
tLast_aboveMinRate_eXX_frxD05_05d  = zeros(1,n_probes);
tFirst_aboveMinRate_eZZ_frxD05_05d = zeros(1,n_probes);
tLast_aboveMinRate_eZZ_frxD05_05d  = zeros(1,n_probes);
tFirst_aboveMinRate_eXX_frxD05_10d = zeros(1,n_probes);
tLast_aboveMinRate_eXX_frxD05_10d  = zeros(1,n_probes);
tFirst_aboveMinRate_eZZ_frxD05_10d = zeros(1,n_probes);
tLast_aboveMinRate_eZZ_frxD05_10d  = zeros(1,n_probes);
tFirst_aboveMinRate_eXX_frxD05_50d = zeros(1,n_probes);
tLast_aboveMinRate_eXX_frxD05_50d  = zeros(1,n_probes);
tFirst_aboveMinRate_eZZ_frxD05_50d = zeros(1,n_probes);
tLast_aboveMinRate_eZZ_frxD05_50d  = zeros(1,n_probes);
% parameter 06
tFirst_aboveMinRate_eXX_frxD06_01d = zeros(1,n_probes);
tLast_aboveMinRate_eXX_frxD06_01d  = zeros(1,n_probes);
tFirst_aboveMinRate_eZZ_frxD06_01d = zeros(1,n_probes);
tLast_aboveMinRate_eZZ_frxD06_01d  = zeros(1,n_probes);
tFirst_aboveMinRate_eXX_frxD06_03d = zeros(1,n_probes);
tLast_aboveMinRate_eXX_frxD06_03d  = zeros(1,n_probes);
tFirst_aboveMinRate_eZZ_frxD06_03d = zeros(1,n_probes);
tLast_aboveMinRate_eZZ_frxD06_03d  = zeros(1,n_probes);
tFirst_aboveMinRate_eXX_frxD06_05d = zeros(1,n_probes);
tLast_aboveMinRate_eXX_frxD06_05d  = zeros(1,n_probes);
tFirst_aboveMinRate_eZZ_frxD06_05d = zeros(1,n_probes);
tLast_aboveMinRate_eZZ_frxD06_05d  = zeros(1,n_probes);
tFirst_aboveMinRate_eXX_frxD06_10d = zeros(1,n_probes);
tLast_aboveMinRate_eXX_frxD06_10d  = zeros(1,n_probes);
tFirst_aboveMinRate_eZZ_frxD06_10d = zeros(1,n_probes);
tLast_aboveMinRate_eZZ_frxD06_10d  = zeros(1,n_probes);
tFirst_aboveMinRate_eXX_frxD06_50d = zeros(1,n_probes);
tLast_aboveMinRate_eXX_frxD06_50d  = zeros(1,n_probes);
tFirst_aboveMinRate_eZZ_frxD06_50d = zeros(1,n_probes);
tLast_aboveMinRate_eZZ_frxD06_50d  = zeros(1,n_probes);
% parameter 07
tFirst_aboveMinRate_eXX_frxD07_01d = zeros(1,n_probes);
tLast_aboveMinRate_eXX_frxD07_01d  = zeros(1,n_probes);
tFirst_aboveMinRate_eZZ_frxD07_01d = zeros(1,n_probes);
tLast_aboveMinRate_eZZ_frxD07_01d  = zeros(1,n_probes);
tFirst_aboveMinRate_eXX_frxD07_03d = zeros(1,n_probes);
tLast_aboveMinRate_eXX_frxD07_03d  = zeros(1,n_probes);
tFirst_aboveMinRate_eZZ_frxD07_03d = zeros(1,n_probes);
tLast_aboveMinRate_eZZ_frxD07_03d  = zeros(1,n_probes);
tFirst_aboveMinRate_eXX_frxD07_05d = zeros(1,n_probes);
tLast_aboveMinRate_eXX_frxD07_05d  = zeros(1,n_probes);
tFirst_aboveMinRate_eZZ_frxD07_05d = zeros(1,n_probes);
tLast_aboveMinRate_eZZ_frxD07_05d  = zeros(1,n_probes);
tFirst_aboveMinRate_eXX_frxD07_10d = zeros(1,n_probes);
tLast_aboveMinRate_eXX_frxD07_10d  = zeros(1,n_probes);
tFirst_aboveMinRate_eZZ_frxD07_10d = zeros(1,n_probes);
tLast_aboveMinRate_eZZ_frxD07_10d  = zeros(1,n_probes);
tFirst_aboveMinRate_eXX_frxD07_50d = zeros(1,n_probes);
tLast_aboveMinRate_eXX_frxD07_50d  = zeros(1,n_probes);
tFirst_aboveMinRate_eZZ_frxD07_50d = zeros(1,n_probes);
tLast_aboveMinRate_eZZ_frxD07_50d  = zeros(1,n_probes);
% parameter 08
tFirst_aboveMinRate_eXX_frxD08_01d = zeros(1,n_probes);
tLast_aboveMinRate_eXX_frxD08_01d  = zeros(1,n_probes);
tFirst_aboveMinRate_eZZ_frxD08_01d = zeros(1,n_probes);
tLast_aboveMinRate_eZZ_frxD08_01d  = zeros(1,n_probes);
tFirst_aboveMinRate_eXX_frxD08_03d = zeros(1,n_probes);
tLast_aboveMinRate_eXX_frxD08_03d  = zeros(1,n_probes);
tFirst_aboveMinRate_eZZ_frxD08_03d = zeros(1,n_probes);
tLast_aboveMinRate_eZZ_frxD08_03d  = zeros(1,n_probes);
tFirst_aboveMinRate_eXX_frxD08_05d = zeros(1,n_probes);
tLast_aboveMinRate_eXX_frxD08_05d  = zeros(1,n_probes);
tFirst_aboveMinRate_eZZ_frxD08_05d = zeros(1,n_probes);
tLast_aboveMinRate_eZZ_frxD08_05d  = zeros(1,n_probes);
tFirst_aboveMinRate_eXX_frxD08_10d = zeros(1,n_probes);
tLast_aboveMinRate_eXX_frxD08_10d  = zeros(1,n_probes);
tFirst_aboveMinRate_eZZ_frxD08_10d = zeros(1,n_probes);
tLast_aboveMinRate_eZZ_frxD08_10d  = zeros(1,n_probes);
tFirst_aboveMinRate_eXX_frxD08_50d = zeros(1,n_probes);
tLast_aboveMinRate_eXX_frxD08_50d  = zeros(1,n_probes);
tFirst_aboveMinRate_eZZ_frxD08_50d = zeros(1,n_probes);
tLast_aboveMinRate_eZZ_frxD08_50d  = zeros(1,n_probes);
% parameter 09
tFirst_aboveMinRate_eXX_frxD09_01d = zeros(1,n_probes);
tLast_aboveMinRate_eXX_frxD09_01d  = zeros(1,n_probes);
tFirst_aboveMinRate_eZZ_frxD09_01d = zeros(1,n_probes);
tLast_aboveMinRate_eZZ_frxD09_01d  = zeros(1,n_probes);
tFirst_aboveMinRate_eXX_frxD09_03d = zeros(1,n_probes);
tLast_aboveMinRate_eXX_frxD09_03d  = zeros(1,n_probes);
tFirst_aboveMinRate_eZZ_frxD09_03d = zeros(1,n_probes);
tLast_aboveMinRate_eZZ_frxD09_03d  = zeros(1,n_probes);
tFirst_aboveMinRate_eXX_frxD09_05d = zeros(1,n_probes);
tLast_aboveMinRate_eXX_frxD09_05d  = zeros(1,n_probes);
tFirst_aboveMinRate_eZZ_frxD09_05d = zeros(1,n_probes);
tLast_aboveMinRate_eZZ_frxD09_05d  = zeros(1,n_probes);
tFirst_aboveMinRate_eXX_frxD09_10d = zeros(1,n_probes);
tLast_aboveMinRate_eXX_frxD09_10d  = zeros(1,n_probes);
tFirst_aboveMinRate_eZZ_frxD09_10d = zeros(1,n_probes);
tLast_aboveMinRate_eZZ_frxD09_10d  = zeros(1,n_probes);
tFirst_aboveMinRate_eXX_frxD09_50d = zeros(1,n_probes);
tLast_aboveMinRate_eXX_frxD09_50d  = zeros(1,n_probes);
tFirst_aboveMinRate_eZZ_frxD09_50d = zeros(1,n_probes);
tLast_aboveMinRate_eZZ_frxD09_50d  = zeros(1,n_probes);
% parameter 10
tFirst_aboveMinRate_eXX_frxD10_01d = zeros(1,n_probes);
tLast_aboveMinRate_eXX_frxD10_01d  = zeros(1,n_probes);
tFirst_aboveMinRate_eZZ_frxD10_01d = zeros(1,n_probes);
tLast_aboveMinRate_eZZ_frxD10_01d  = zeros(1,n_probes);
tFirst_aboveMinRate_eXX_frxD10_03d = zeros(1,n_probes);
tLast_aboveMinRate_eXX_frxD10_03d  = zeros(1,n_probes);
tFirst_aboveMinRate_eZZ_frxD10_03d = zeros(1,n_probes);
tLast_aboveMinRate_eZZ_frxD10_03d  = zeros(1,n_probes);
tFirst_aboveMinRate_eXX_frxD10_05d = zeros(1,n_probes);
tLast_aboveMinRate_eXX_frxD10_05d  = zeros(1,n_probes);
tFirst_aboveMinRate_eZZ_frxD10_05d = zeros(1,n_probes);
tLast_aboveMinRate_eZZ_frxD10_05d  = zeros(1,n_probes);
tFirst_aboveMinRate_eXX_frxD10_10d = zeros(1,n_probes);
tLast_aboveMinRate_eXX_frxD10_10d  = zeros(1,n_probes);
tFirst_aboveMinRate_eZZ_frxD10_10d = zeros(1,n_probes);
tLast_aboveMinRate_eZZ_frxD10_10d  = zeros(1,n_probes);
tFirst_aboveMinRate_eXX_frxD10_50d = zeros(1,n_probes);
tLast_aboveMinRate_eXX_frxD10_50d  = zeros(1,n_probes);
tFirst_aboveMinRate_eZZ_frxD10_50d = zeros(1,n_probes);
tLast_aboveMinRate_eZZ_frxD10_50d  = zeros(1,n_probes);

% ==================================================================================================== %
% First time at which eXXrate > minRate (last non-zero value)
% ==================================================================================================== %
for i = 1:n_probes
% ==================================================================================================== %
% Depth 1%
% ==================================================================================================== %
% parameter 01
    if sum(t_aboveMinRate_eXX_frxD01_01d(:,i)) > 0
        tFirst_aboveMinRate_eXX_frxD01_01d(i) = t_aboveMinRate_eXX_frxD01_01d(find(t_aboveMinRate_eXX_frxD01_01d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_frxD01_01d(i)  = t_aboveMinRate_eXX_frxD01_01d(find(t_aboveMinRate_eXX_frxD01_01d(:,i),1,'last'));
    end
    if sum(t_aboveMinRate_eZZ_frxD01_01d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_frxD01_01d(i) = t_aboveMinRate_eZZ_frxD01_01d(find(t_aboveMinRate_eZZ_frxD01_01d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_frxD01_01d(i)  = t_aboveMinRate_eZZ_frxD01_01d(find(t_aboveMinRate_eZZ_frxD01_01d(:,i),1,'last'));
    end
% parameter 02
    if sum(t_aboveMinRate_eXX_frxD02_01d(:,i)) > 0
        tFirst_aboveMinRate_eXX_frxD02_01d(i) = t_aboveMinRate_eXX_frxD02_01d(find(t_aboveMinRate_eXX_frxD02_01d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_frxD02_01d(i)  = t_aboveMinRate_eXX_frxD02_01d(find(t_aboveMinRate_eXX_frxD02_01d(:,i),1,'last'));
    end
    if sum(t_aboveMinRate_eZZ_frxD02_01d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_frxD02_01d(i) = t_aboveMinRate_eZZ_frxD02_01d(find(t_aboveMinRate_eZZ_frxD02_01d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_frxD02_01d(i)  = t_aboveMinRate_eZZ_frxD02_01d(find(t_aboveMinRate_eZZ_frxD02_01d(:,i),1,'last'));
    end
% parameter 03
    if sum(t_aboveMinRate_eXX_frxD03_01d(:,i)) > 0
        tFirst_aboveMinRate_eXX_frxD03_01d(i) = t_aboveMinRate_eXX_frxD03_01d(find(t_aboveMinRate_eXX_frxD03_01d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_frxD03_01d(i)  = t_aboveMinRate_eXX_frxD03_01d(find(t_aboveMinRate_eXX_frxD03_01d(:,i),1,'last'));
    end
    if sum(t_aboveMinRate_eZZ_frxD03_01d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_frxD03_01d(i) = t_aboveMinRate_eZZ_frxD03_01d(find(t_aboveMinRate_eZZ_frxD03_01d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_frxD03_01d(i)  = t_aboveMinRate_eZZ_frxD03_01d(find(t_aboveMinRate_eZZ_frxD03_01d(:,i),1,'last'));
    end
% parameter 04
    if sum(t_aboveMinRate_eXX_frxD04_01d(:,i)) > 0
        tFirst_aboveMinRate_eXX_frxD04_01d(i) = t_aboveMinRate_eXX_frxD04_01d(find(t_aboveMinRate_eXX_frxD04_01d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_frxD04_01d(i)  = t_aboveMinRate_eXX_frxD04_01d(find(t_aboveMinRate_eXX_frxD04_01d(:,i),1,'last'));
    end
    if sum(t_aboveMinRate_eZZ_frxD04_01d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_frxD04_01d(i) = t_aboveMinRate_eZZ_frxD04_01d(find(t_aboveMinRate_eZZ_frxD04_01d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_frxD04_01d(i)  = t_aboveMinRate_eZZ_frxD04_01d(find(t_aboveMinRate_eZZ_frxD04_01d(:,i),1,'last'));
    end
% parameter 05
    if sum(t_aboveMinRate_eXX_frxD05_01d(:,i)) > 0
        tFirst_aboveMinRate_eXX_frxD05_01d(i) = t_aboveMinRate_eXX_frxD05_01d(find(t_aboveMinRate_eXX_frxD05_01d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_frxD05_01d(i)  = t_aboveMinRate_eXX_frxD05_01d(find(t_aboveMinRate_eXX_frxD05_01d(:,i),1,'last'));
    end
    if sum(t_aboveMinRate_eZZ_frxD05_01d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_frxD05_01d(i) = t_aboveMinRate_eZZ_frxD05_01d(find(t_aboveMinRate_eZZ_frxD05_01d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_frxD05_01d(i)  = t_aboveMinRate_eZZ_frxD05_01d(find(t_aboveMinRate_eZZ_frxD05_01d(:,i),1,'last'));
    end
% parameter 06
    if sum(t_aboveMinRate_eXX_frxD06_01d(:,i)) > 0
        tFirst_aboveMinRate_eXX_frxD06_01d(i) = t_aboveMinRate_eXX_frxD06_01d(find(t_aboveMinRate_eXX_frxD06_01d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_frxD06_01d(i)  = t_aboveMinRate_eXX_frxD06_01d(find(t_aboveMinRate_eXX_frxD06_01d(:,i),1,'last'));
    end
    if sum(t_aboveMinRate_eZZ_frxD06_01d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_frxD06_01d(i) = t_aboveMinRate_eZZ_frxD06_01d(find(t_aboveMinRate_eZZ_frxD06_01d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_frxD06_01d(i)  = t_aboveMinRate_eZZ_frxD06_01d(find(t_aboveMinRate_eZZ_frxD06_01d(:,i),1,'last'));
    end
% parameter 07
    if sum(t_aboveMinRate_eXX_frxD07_01d(:,i)) > 0
        tFirst_aboveMinRate_eXX_frxD07_01d(i) = t_aboveMinRate_eXX_frxD07_01d(find(t_aboveMinRate_eXX_frxD07_01d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_frxD07_01d(i)  = t_aboveMinRate_eXX_frxD07_01d(find(t_aboveMinRate_eXX_frxD07_01d(:,i),1,'last'));
    end
    if sum(t_aboveMinRate_eZZ_frxD07_01d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_frxD07_01d(i) = t_aboveMinRate_eZZ_frxD07_01d(find(t_aboveMinRate_eZZ_frxD07_01d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_frxD07_01d(i)  = t_aboveMinRate_eZZ_frxD07_01d(find(t_aboveMinRate_eZZ_frxD07_01d(:,i),1,'last'));
    end
% parameter 08
    if sum(t_aboveMinRate_eXX_frxD08_01d(:,i)) > 0
        tFirst_aboveMinRate_eXX_frxD08_01d(i) = t_aboveMinRate_eXX_frxD08_01d(find(t_aboveMinRate_eXX_frxD08_01d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_frxD08_01d(i)  = t_aboveMinRate_eXX_frxD08_01d(find(t_aboveMinRate_eXX_frxD08_01d(:,i),1,'last'));
    end
    if sum(t_aboveMinRate_eZZ_frxD08_01d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_frxD08_01d(i) = t_aboveMinRate_eZZ_frxD08_01d(find(t_aboveMinRate_eZZ_frxD08_01d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_frxD08_01d(i)  = t_aboveMinRate_eZZ_frxD08_01d(find(t_aboveMinRate_eZZ_frxD08_01d(:,i),1,'last'));
    end
% parameter 09
    if sum(t_aboveMinRate_eXX_frxD09_01d(:,i)) > 0
        tFirst_aboveMinRate_eXX_frxD09_01d(i) = t_aboveMinRate_eXX_frxD09_01d(find(t_aboveMinRate_eXX_frxD09_01d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_frxD09_01d(i)  = t_aboveMinRate_eXX_frxD09_01d(find(t_aboveMinRate_eXX_frxD09_01d(:,i),1,'last'));
    end
    if sum(t_aboveMinRate_eZZ_frxD09_01d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_frxD09_01d(i) = t_aboveMinRate_eZZ_frxD09_01d(find(t_aboveMinRate_eZZ_frxD09_01d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_frxD09_01d(i)  = t_aboveMinRate_eZZ_frxD09_01d(find(t_aboveMinRate_eZZ_frxD09_01d(:,i),1,'last'));
    end
% parameter 10
    if sum(t_aboveMinRate_eXX_frxD10_01d(:,i)) > 0
        tFirst_aboveMinRate_eXX_frxD10_01d(i) = t_aboveMinRate_eXX_frxD10_01d(find(t_aboveMinRate_eXX_frxD10_01d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_frxD10_01d(i)  = t_aboveMinRate_eXX_frxD10_01d(find(t_aboveMinRate_eXX_frxD10_01d(:,i),1,'last'));
    end
    if sum(t_aboveMinRate_eZZ_frxD10_01d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_frxD10_01d(i) = t_aboveMinRate_eZZ_frxD10_01d(find(t_aboveMinRate_eZZ_frxD10_01d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_frxD10_01d(i)  = t_aboveMinRate_eZZ_frxD10_01d(find(t_aboveMinRate_eZZ_frxD10_01d(:,i),1,'last'));
    end
    
% ==================================================================================================== %
% Depth 3%
% ==================================================================================================== %
% parameter 01
    if sum(t_aboveMinRate_eXX_frxD01_03d(:,i)) > 0
        tFirst_aboveMinRate_eXX_frxD01_03d(i) = t_aboveMinRate_eXX_frxD01_03d(find(t_aboveMinRate_eXX_frxD01_03d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_frxD01_03d(i)  = t_aboveMinRate_eXX_frxD01_03d(find(t_aboveMinRate_eXX_frxD01_03d(:,i),1,'last'));
    end
    if sum(t_aboveMinRate_eZZ_frxD01_03d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_frxD01_03d(i) = t_aboveMinRate_eZZ_frxD01_03d(find(t_aboveMinRate_eZZ_frxD01_03d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_frxD01_03d(i)  = t_aboveMinRate_eZZ_frxD01_03d(find(t_aboveMinRate_eZZ_frxD01_03d(:,i),1,'last'));
    end
% parameter 02
    if sum(t_aboveMinRate_eXX_frxD02_03d(:,i)) > 0
        tFirst_aboveMinRate_eXX_frxD02_03d(i) = t_aboveMinRate_eXX_frxD02_03d(find(t_aboveMinRate_eXX_frxD02_03d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_frxD02_03d(i)  = t_aboveMinRate_eXX_frxD02_03d(find(t_aboveMinRate_eXX_frxD02_03d(:,i),1,'last'));
    end
    if sum(t_aboveMinRate_eZZ_frxD02_03d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_frxD02_03d(i) = t_aboveMinRate_eZZ_frxD02_03d(find(t_aboveMinRate_eZZ_frxD02_03d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_frxD02_03d(i)  = t_aboveMinRate_eZZ_frxD02_03d(find(t_aboveMinRate_eZZ_frxD02_03d(:,i),1,'last'));
    end
% parameter 03
    if sum(t_aboveMinRate_eXX_frxD03_03d(:,i)) > 0
        tFirst_aboveMinRate_eXX_frxD03_03d(i) = t_aboveMinRate_eXX_frxD03_03d(find(t_aboveMinRate_eXX_frxD03_03d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_frxD03_03d(i)  = t_aboveMinRate_eXX_frxD03_03d(find(t_aboveMinRate_eXX_frxD03_03d(:,i),1,'last'));
    end
    if sum(t_aboveMinRate_eZZ_frxD03_03d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_frxD03_03d(i) = t_aboveMinRate_eZZ_frxD03_03d(find(t_aboveMinRate_eZZ_frxD03_03d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_frxD03_03d(i)  = t_aboveMinRate_eZZ_frxD03_03d(find(t_aboveMinRate_eZZ_frxD03_03d(:,i),1,'last'));
    end
% parameter 04
    if sum(t_aboveMinRate_eXX_frxD04_03d(:,i)) > 0
        tFirst_aboveMinRate_eXX_frxD04_03d(i) = t_aboveMinRate_eXX_frxD04_03d(find(t_aboveMinRate_eXX_frxD04_03d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_frxD04_03d(i)  = t_aboveMinRate_eXX_frxD04_03d(find(t_aboveMinRate_eXX_frxD04_03d(:,i),1,'last'));
    end
    if sum(t_aboveMinRate_eZZ_frxD04_03d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_frxD04_03d(i) = t_aboveMinRate_eZZ_frxD04_03d(find(t_aboveMinRate_eZZ_frxD04_03d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_frxD04_03d(i)  = t_aboveMinRate_eZZ_frxD04_03d(find(t_aboveMinRate_eZZ_frxD04_03d(:,i),1,'last'));
    end
% parameter 05
    if sum(t_aboveMinRate_eXX_frxD05_03d(:,i)) > 0
        tFirst_aboveMinRate_eXX_frxD05_03d(i) = t_aboveMinRate_eXX_frxD05_03d(find(t_aboveMinRate_eXX_frxD05_03d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_frxD05_03d(i)  = t_aboveMinRate_eXX_frxD05_03d(find(t_aboveMinRate_eXX_frxD05_03d(:,i),1,'last'));
    end
    if sum(t_aboveMinRate_eZZ_frxD05_03d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_frxD05_03d(i) = t_aboveMinRate_eZZ_frxD05_03d(find(t_aboveMinRate_eZZ_frxD05_03d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_frxD05_03d(i)  = t_aboveMinRate_eZZ_frxD05_03d(find(t_aboveMinRate_eZZ_frxD05_03d(:,i),1,'last'));
    end
% parameter 06
    if sum(t_aboveMinRate_eXX_frxD06_03d(:,i)) > 0
        tFirst_aboveMinRate_eXX_frxD06_03d(i) = t_aboveMinRate_eXX_frxD06_03d(find(t_aboveMinRate_eXX_frxD06_03d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_frxD06_03d(i)  = t_aboveMinRate_eXX_frxD06_03d(find(t_aboveMinRate_eXX_frxD06_03d(:,i),1,'last'));
    end
    if sum(t_aboveMinRate_eZZ_frxD06_03d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_frxD06_03d(i) = t_aboveMinRate_eZZ_frxD06_03d(find(t_aboveMinRate_eZZ_frxD06_03d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_frxD06_03d(i)  = t_aboveMinRate_eZZ_frxD06_03d(find(t_aboveMinRate_eZZ_frxD06_03d(:,i),1,'last'));
    end
% parameter 07
    if sum(t_aboveMinRate_eXX_frxD07_03d(:,i)) > 0
        tFirst_aboveMinRate_eXX_frxD07_03d(i) = t_aboveMinRate_eXX_frxD07_03d(find(t_aboveMinRate_eXX_frxD07_03d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_frxD07_03d(i)  = t_aboveMinRate_eXX_frxD07_03d(find(t_aboveMinRate_eXX_frxD07_03d(:,i),1,'last'));
    end
    if sum(t_aboveMinRate_eZZ_frxD07_03d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_frxD07_03d(i) = t_aboveMinRate_eZZ_frxD07_03d(find(t_aboveMinRate_eZZ_frxD07_03d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_frxD07_03d(i)  = t_aboveMinRate_eZZ_frxD07_03d(find(t_aboveMinRate_eZZ_frxD07_03d(:,i),1,'last'));
    end
% parameter 08
    if sum(t_aboveMinRate_eXX_frxD08_03d(:,i)) > 0
        tFirst_aboveMinRate_eXX_frxD08_03d(i) = t_aboveMinRate_eXX_frxD08_03d(find(t_aboveMinRate_eXX_frxD08_03d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_frxD08_03d(i)  = t_aboveMinRate_eXX_frxD08_03d(find(t_aboveMinRate_eXX_frxD08_03d(:,i),1,'last'));
    end
    if sum(t_aboveMinRate_eZZ_frxD08_03d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_frxD08_03d(i) = t_aboveMinRate_eZZ_frxD08_03d(find(t_aboveMinRate_eZZ_frxD08_03d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_frxD08_03d(i)  = t_aboveMinRate_eZZ_frxD08_03d(find(t_aboveMinRate_eZZ_frxD08_03d(:,i),1,'last'));
    end
% parameter 09
    if sum(t_aboveMinRate_eXX_frxD09_03d(:,i)) > 0
        tFirst_aboveMinRate_eXX_frxD09_03d(i) = t_aboveMinRate_eXX_frxD09_03d(find(t_aboveMinRate_eXX_frxD09_03d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_frxD09_03d(i)  = t_aboveMinRate_eXX_frxD09_03d(find(t_aboveMinRate_eXX_frxD09_03d(:,i),1,'last'));
    end
    if sum(t_aboveMinRate_eZZ_frxD09_03d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_frxD09_03d(i) = t_aboveMinRate_eZZ_frxD09_03d(find(t_aboveMinRate_eZZ_frxD09_03d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_frxD09_03d(i)  = t_aboveMinRate_eZZ_frxD09_03d(find(t_aboveMinRate_eZZ_frxD09_03d(:,i),1,'last'));
    end
% parameter 10
    if sum(t_aboveMinRate_eXX_frxD10_03d(:,i)) > 0
        tFirst_aboveMinRate_eXX_frxD10_03d(i) = t_aboveMinRate_eXX_frxD10_03d(find(t_aboveMinRate_eXX_frxD10_03d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_frxD10_03d(i)  = t_aboveMinRate_eXX_frxD10_03d(find(t_aboveMinRate_eXX_frxD10_03d(:,i),1,'last'));
    end
    if sum(t_aboveMinRate_eZZ_frxD10_03d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_frxD10_03d(i) = t_aboveMinRate_eZZ_frxD10_03d(find(t_aboveMinRate_eZZ_frxD10_03d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_frxD10_03d(i)  = t_aboveMinRate_eZZ_frxD10_03d(find(t_aboveMinRate_eZZ_frxD10_03d(:,i),1,'last'));
    end
    
% ==================================================================================================== %
% Depth 5%
% ==================================================================================================== %
% parameter 01
    if sum(t_aboveMinRate_eXX_frxD01_05d(:,i)) > 0
        tFirst_aboveMinRate_eXX_frxD01_05d(i) = t_aboveMinRate_eXX_frxD01_05d(find(t_aboveMinRate_eXX_frxD01_05d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_frxD01_05d(i)  = t_aboveMinRate_eXX_frxD01_05d(find(t_aboveMinRate_eXX_frxD01_05d(:,i),1,'last'));
    end
    if sum(t_aboveMinRate_eZZ_frxD01_05d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_frxD01_05d(i) = t_aboveMinRate_eZZ_frxD01_05d(find(t_aboveMinRate_eZZ_frxD01_05d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_frxD01_05d(i)  = t_aboveMinRate_eZZ_frxD01_05d(find(t_aboveMinRate_eZZ_frxD01_05d(:,i),1,'last'));
    end
% parameter 02
    if sum(t_aboveMinRate_eXX_frxD02_05d(:,i)) > 0
        tFirst_aboveMinRate_eXX_frxD02_05d(i) = t_aboveMinRate_eXX_frxD02_05d(find(t_aboveMinRate_eXX_frxD02_05d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_frxD02_05d(i)  = t_aboveMinRate_eXX_frxD02_05d(find(t_aboveMinRate_eXX_frxD02_05d(:,i),1,'last'));
    end
    if sum(t_aboveMinRate_eZZ_frxD02_05d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_frxD02_05d(i) = t_aboveMinRate_eZZ_frxD02_05d(find(t_aboveMinRate_eZZ_frxD02_05d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_frxD02_05d(i)  = t_aboveMinRate_eZZ_frxD02_05d(find(t_aboveMinRate_eZZ_frxD02_05d(:,i),1,'last'));
    end
% parameter 03
    if sum(t_aboveMinRate_eXX_frxD03_05d(:,i)) > 0
        tFirst_aboveMinRate_eXX_frxD03_05d(i) = t_aboveMinRate_eXX_frxD03_05d(find(t_aboveMinRate_eXX_frxD03_05d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_frxD03_05d(i)  = t_aboveMinRate_eXX_frxD03_05d(find(t_aboveMinRate_eXX_frxD03_05d(:,i),1,'last'));
    end
    if sum(t_aboveMinRate_eZZ_frxD03_05d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_frxD03_05d(i) = t_aboveMinRate_eZZ_frxD03_05d(find(t_aboveMinRate_eZZ_frxD03_05d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_frxD03_05d(i)  = t_aboveMinRate_eZZ_frxD03_05d(find(t_aboveMinRate_eZZ_frxD03_05d(:,i),1,'last'));
    end
% parameter 04
    if sum(t_aboveMinRate_eXX_frxD04_05d(:,i)) > 0
        tFirst_aboveMinRate_eXX_frxD04_05d(i) = t_aboveMinRate_eXX_frxD04_05d(find(t_aboveMinRate_eXX_frxD04_05d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_frxD04_05d(i)  = t_aboveMinRate_eXX_frxD04_05d(find(t_aboveMinRate_eXX_frxD04_05d(:,i),1,'last'));
    end
    if sum(t_aboveMinRate_eZZ_frxD04_05d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_frxD04_05d(i) = t_aboveMinRate_eZZ_frxD04_05d(find(t_aboveMinRate_eZZ_frxD04_05d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_frxD04_05d(i)  = t_aboveMinRate_eZZ_frxD04_05d(find(t_aboveMinRate_eZZ_frxD04_05d(:,i),1,'last'));
    end
% parameter 05
    if sum(t_aboveMinRate_eXX_frxD05_05d(:,i)) > 0
        tFirst_aboveMinRate_eXX_frxD05_05d(i) = t_aboveMinRate_eXX_frxD05_05d(find(t_aboveMinRate_eXX_frxD05_05d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_frxD05_05d(i)  = t_aboveMinRate_eXX_frxD05_05d(find(t_aboveMinRate_eXX_frxD05_05d(:,i),1,'last'));
    end
    if sum(t_aboveMinRate_eZZ_frxD05_05d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_frxD05_05d(i) = t_aboveMinRate_eZZ_frxD05_05d(find(t_aboveMinRate_eZZ_frxD05_05d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_frxD05_05d(i)  = t_aboveMinRate_eZZ_frxD05_05d(find(t_aboveMinRate_eZZ_frxD05_05d(:,i),1,'last'));
    end
% parameter 06
    if sum(t_aboveMinRate_eXX_frxD06_05d(:,i)) > 0
        tFirst_aboveMinRate_eXX_frxD06_05d(i) = t_aboveMinRate_eXX_frxD06_05d(find(t_aboveMinRate_eXX_frxD06_05d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_frxD06_05d(i)  = t_aboveMinRate_eXX_frxD06_05d(find(t_aboveMinRate_eXX_frxD06_05d(:,i),1,'last'));
    end
    if sum(t_aboveMinRate_eZZ_frxD06_05d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_frxD06_05d(i) = t_aboveMinRate_eZZ_frxD06_05d(find(t_aboveMinRate_eZZ_frxD06_05d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_frxD06_05d(i)  = t_aboveMinRate_eZZ_frxD06_05d(find(t_aboveMinRate_eZZ_frxD06_05d(:,i),1,'last'));
    end
% parameter 07
    if sum(t_aboveMinRate_eXX_frxD07_05d(:,i)) > 0
        tFirst_aboveMinRate_eXX_frxD07_05d(i) = t_aboveMinRate_eXX_frxD07_05d(find(t_aboveMinRate_eXX_frxD07_05d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_frxD07_05d(i)  = t_aboveMinRate_eXX_frxD07_05d(find(t_aboveMinRate_eXX_frxD07_05d(:,i),1,'last'));
    end
    if sum(t_aboveMinRate_eZZ_frxD07_05d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_frxD07_05d(i) = t_aboveMinRate_eZZ_frxD07_05d(find(t_aboveMinRate_eZZ_frxD07_05d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_frxD07_05d(i)  = t_aboveMinRate_eZZ_frxD07_05d(find(t_aboveMinRate_eZZ_frxD07_05d(:,i),1,'last'));
    end
% parameter 08
    if sum(t_aboveMinRate_eXX_frxD08_05d(:,i)) > 0
        tFirst_aboveMinRate_eXX_frxD08_05d(i) = t_aboveMinRate_eXX_frxD08_05d(find(t_aboveMinRate_eXX_frxD08_05d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_frxD08_05d(i)  = t_aboveMinRate_eXX_frxD08_05d(find(t_aboveMinRate_eXX_frxD08_05d(:,i),1,'last'));
    end
    if sum(t_aboveMinRate_eZZ_frxD08_05d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_frxD08_05d(i) = t_aboveMinRate_eZZ_frxD08_05d(find(t_aboveMinRate_eZZ_frxD08_05d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_frxD08_05d(i)  = t_aboveMinRate_eZZ_frxD08_05d(find(t_aboveMinRate_eZZ_frxD08_05d(:,i),1,'last'));
    end
% parameter 09
    if sum(t_aboveMinRate_eXX_frxD09_05d(:,i)) > 0
        tFirst_aboveMinRate_eXX_frxD09_05d(i) = t_aboveMinRate_eXX_frxD09_05d(find(t_aboveMinRate_eXX_frxD09_05d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_frxD09_05d(i)  = t_aboveMinRate_eXX_frxD09_05d(find(t_aboveMinRate_eXX_frxD09_05d(:,i),1,'last'));
    end
    if sum(t_aboveMinRate_eZZ_frxD09_05d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_frxD09_05d(i) = t_aboveMinRate_eZZ_frxD09_05d(find(t_aboveMinRate_eZZ_frxD09_05d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_frxD09_05d(i)  = t_aboveMinRate_eZZ_frxD09_05d(find(t_aboveMinRate_eZZ_frxD09_05d(:,i),1,'last'));
    end
% parameter 10
    if sum(t_aboveMinRate_eXX_frxD10_05d(:,i)) > 0
        tFirst_aboveMinRate_eXX_frxD10_05d(i) = t_aboveMinRate_eXX_frxD10_05d(find(t_aboveMinRate_eXX_frxD10_05d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_frxD10_05d(i)  = t_aboveMinRate_eXX_frxD10_05d(find(t_aboveMinRate_eXX_frxD10_05d(:,i),1,'last'));
    end
    if sum(t_aboveMinRate_eZZ_frxD10_05d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_frxD10_05d(i) = t_aboveMinRate_eZZ_frxD10_05d(find(t_aboveMinRate_eZZ_frxD10_05d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_frxD10_05d(i)  = t_aboveMinRate_eZZ_frxD10_05d(find(t_aboveMinRate_eZZ_frxD10_05d(:,i),1,'last'));
    end
    
% ==================================================================================================== %
% Depth 10%
% ==================================================================================================== %
% parameter 01
    if sum(t_aboveMinRate_eXX_frxD01_10d(:,i)) > 0
        tFirst_aboveMinRate_eXX_frxD01_10d(i) = t_aboveMinRate_eXX_frxD01_10d(find(t_aboveMinRate_eXX_frxD01_10d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_frxD01_10d(i)  = t_aboveMinRate_eXX_frxD01_10d(find(t_aboveMinRate_eXX_frxD01_10d(:,i),1,'last'));
    end
    if sum(t_aboveMinRate_eZZ_frxD01_10d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_frxD01_10d(i) = t_aboveMinRate_eZZ_frxD01_10d(find(t_aboveMinRate_eZZ_frxD01_10d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_frxD01_10d(i)  = t_aboveMinRate_eZZ_frxD01_10d(find(t_aboveMinRate_eZZ_frxD01_10d(:,i),1,'last'));
    end
% parameter 02
    if sum(t_aboveMinRate_eXX_frxD02_10d(:,i)) > 0
        tFirst_aboveMinRate_eXX_frxD02_10d(i) = t_aboveMinRate_eXX_frxD02_10d(find(t_aboveMinRate_eXX_frxD02_10d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_frxD02_10d(i)  = t_aboveMinRate_eXX_frxD02_10d(find(t_aboveMinRate_eXX_frxD02_10d(:,i),1,'last'));
    end
    if sum(t_aboveMinRate_eZZ_frxD02_10d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_frxD02_10d(i) = t_aboveMinRate_eZZ_frxD02_10d(find(t_aboveMinRate_eZZ_frxD02_10d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_frxD02_10d(i)  = t_aboveMinRate_eZZ_frxD02_10d(find(t_aboveMinRate_eZZ_frxD02_10d(:,i),1,'last'));
    end
% parameter 03
    if sum(t_aboveMinRate_eXX_frxD03_10d(:,i)) > 0
        tFirst_aboveMinRate_eXX_frxD03_10d(i) = t_aboveMinRate_eXX_frxD03_10d(find(t_aboveMinRate_eXX_frxD03_10d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_frxD03_10d(i)  = t_aboveMinRate_eXX_frxD03_10d(find(t_aboveMinRate_eXX_frxD03_10d(:,i),1,'last'));
    end
    if sum(t_aboveMinRate_eZZ_frxD03_10d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_frxD03_10d(i) = t_aboveMinRate_eZZ_frxD03_10d(find(t_aboveMinRate_eZZ_frxD03_10d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_frxD03_10d(i)  = t_aboveMinRate_eZZ_frxD03_10d(find(t_aboveMinRate_eZZ_frxD03_10d(:,i),1,'last'));
    end
% parameter 04
    if sum(t_aboveMinRate_eXX_frxD04_10d(:,i)) > 0
        tFirst_aboveMinRate_eXX_frxD04_10d(i) = t_aboveMinRate_eXX_frxD04_10d(find(t_aboveMinRate_eXX_frxD04_10d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_frxD04_10d(i)  = t_aboveMinRate_eXX_frxD04_10d(find(t_aboveMinRate_eXX_frxD04_10d(:,i),1,'last'));
    end
    if sum(t_aboveMinRate_eZZ_frxD04_10d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_frxD04_10d(i) = t_aboveMinRate_eZZ_frxD04_10d(find(t_aboveMinRate_eZZ_frxD04_10d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_frxD04_10d(i)  = t_aboveMinRate_eZZ_frxD04_10d(find(t_aboveMinRate_eZZ_frxD04_10d(:,i),1,'last'));
    end
% parameter 05
    if sum(t_aboveMinRate_eXX_frxD05_10d(:,i)) > 0
        tFirst_aboveMinRate_eXX_frxD05_10d(i) = t_aboveMinRate_eXX_frxD05_10d(find(t_aboveMinRate_eXX_frxD05_10d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_frxD05_10d(i)  = t_aboveMinRate_eXX_frxD05_10d(find(t_aboveMinRate_eXX_frxD05_10d(:,i),1,'last'));
    end
    if sum(t_aboveMinRate_eZZ_frxD05_10d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_frxD05_10d(i) = t_aboveMinRate_eZZ_frxD05_10d(find(t_aboveMinRate_eZZ_frxD05_10d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_frxD05_10d(i)  = t_aboveMinRate_eZZ_frxD05_10d(find(t_aboveMinRate_eZZ_frxD05_10d(:,i),1,'last'));
    end
% parameter 06
    if sum(t_aboveMinRate_eXX_frxD06_10d(:,i)) > 0
        tFirst_aboveMinRate_eXX_frxD06_10d(i) = t_aboveMinRate_eXX_frxD06_10d(find(t_aboveMinRate_eXX_frxD06_10d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_frxD06_10d(i)  = t_aboveMinRate_eXX_frxD06_10d(find(t_aboveMinRate_eXX_frxD06_10d(:,i),1,'last'));
    end
    if sum(t_aboveMinRate_eZZ_frxD06_10d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_frxD06_10d(i) = t_aboveMinRate_eZZ_frxD06_10d(find(t_aboveMinRate_eZZ_frxD06_10d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_frxD06_10d(i)  = t_aboveMinRate_eZZ_frxD06_10d(find(t_aboveMinRate_eZZ_frxD06_10d(:,i),1,'last'));
    end
% parameter 07
    if sum(t_aboveMinRate_eXX_frxD07_10d(:,i)) > 0
        tFirst_aboveMinRate_eXX_frxD07_10d(i) = t_aboveMinRate_eXX_frxD07_10d(find(t_aboveMinRate_eXX_frxD07_10d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_frxD07_10d(i)  = t_aboveMinRate_eXX_frxD07_10d(find(t_aboveMinRate_eXX_frxD07_10d(:,i),1,'last'));
    end
    if sum(t_aboveMinRate_eZZ_frxD07_10d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_frxD07_10d(i) = t_aboveMinRate_eZZ_frxD07_10d(find(t_aboveMinRate_eZZ_frxD07_10d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_frxD07_10d(i)  = t_aboveMinRate_eZZ_frxD07_10d(find(t_aboveMinRate_eZZ_frxD07_10d(:,i),1,'last'));
    end
% parameter 08
    if sum(t_aboveMinRate_eXX_frxD08_10d(:,i)) > 0
        tFirst_aboveMinRate_eXX_frxD08_10d(i) = t_aboveMinRate_eXX_frxD08_10d(find(t_aboveMinRate_eXX_frxD08_10d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_frxD08_10d(i)  = t_aboveMinRate_eXX_frxD08_10d(find(t_aboveMinRate_eXX_frxD08_10d(:,i),1,'last'));
    end
    if sum(t_aboveMinRate_eZZ_frxD08_10d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_frxD08_10d(i) = t_aboveMinRate_eZZ_frxD08_10d(find(t_aboveMinRate_eZZ_frxD08_10d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_frxD08_10d(i)  = t_aboveMinRate_eZZ_frxD08_10d(find(t_aboveMinRate_eZZ_frxD08_10d(:,i),1,'last'));
    end
% parameter 09
    if sum(t_aboveMinRate_eXX_frxD09_10d(:,i)) > 0
        tFirst_aboveMinRate_eXX_frxD09_10d(i) = t_aboveMinRate_eXX_frxD09_10d(find(t_aboveMinRate_eXX_frxD09_10d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_frxD09_10d(i)  = t_aboveMinRate_eXX_frxD09_10d(find(t_aboveMinRate_eXX_frxD09_10d(:,i),1,'last'));
    end
    if sum(t_aboveMinRate_eZZ_frxD09_10d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_frxD09_10d(i) = t_aboveMinRate_eZZ_frxD09_10d(find(t_aboveMinRate_eZZ_frxD09_10d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_frxD09_10d(i)  = t_aboveMinRate_eZZ_frxD09_10d(find(t_aboveMinRate_eZZ_frxD09_10d(:,i),1,'last'));
    end
% parameter 10
    if sum(t_aboveMinRate_eXX_frxD10_10d(:,i)) > 0
        tFirst_aboveMinRate_eXX_frxD10_10d(i) = t_aboveMinRate_eXX_frxD10_10d(find(t_aboveMinRate_eXX_frxD10_10d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_frxD10_10d(i)  = t_aboveMinRate_eXX_frxD10_10d(find(t_aboveMinRate_eXX_frxD10_10d(:,i),1,'last'));
    end
    if sum(t_aboveMinRate_eZZ_frxD10_10d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_frxD10_10d(i) = t_aboveMinRate_eZZ_frxD10_10d(find(t_aboveMinRate_eZZ_frxD10_10d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_frxD10_10d(i)  = t_aboveMinRate_eZZ_frxD10_10d(find(t_aboveMinRate_eZZ_frxD10_10d(:,i),1,'last'));
    end
    
% ==================================================================================================== %
% Depth 50%
% ==================================================================================================== %
% parameter 01
    if sum(t_aboveMinRate_eXX_frxD01_50d(:,i)) > 0
        tFirst_aboveMinRate_eXX_frxD01_50d(i) = t_aboveMinRate_eXX_frxD01_50d(find(t_aboveMinRate_eXX_frxD01_50d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_frxD01_50d(i)  = t_aboveMinRate_eXX_frxD01_50d(find(t_aboveMinRate_eXX_frxD01_50d(:,i),1,'last'));
    end
    if sum(t_aboveMinRate_eZZ_frxD01_50d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_frxD01_50d(i) = t_aboveMinRate_eZZ_frxD01_50d(find(t_aboveMinRate_eZZ_frxD01_50d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_frxD01_50d(i)  = t_aboveMinRate_eZZ_frxD01_50d(find(t_aboveMinRate_eZZ_frxD01_50d(:,i),1,'last'));
    end
% parameter 02
    if sum(t_aboveMinRate_eXX_frxD02_50d(:,i)) > 0
        tFirst_aboveMinRate_eXX_frxD02_50d(i) = t_aboveMinRate_eXX_frxD02_50d(find(t_aboveMinRate_eXX_frxD02_50d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_frxD02_50d(i)  = t_aboveMinRate_eXX_frxD02_50d(find(t_aboveMinRate_eXX_frxD02_50d(:,i),1,'last'));
    end
    if sum(t_aboveMinRate_eZZ_frxD02_50d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_frxD02_50d(i) = t_aboveMinRate_eZZ_frxD02_50d(find(t_aboveMinRate_eZZ_frxD02_50d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_frxD02_50d(i)  = t_aboveMinRate_eZZ_frxD02_50d(find(t_aboveMinRate_eZZ_frxD02_50d(:,i),1,'last'));
    end
% parameter 03
    if sum(t_aboveMinRate_eXX_frxD03_50d(:,i)) > 0
        tFirst_aboveMinRate_eXX_frxD03_50d(i) = t_aboveMinRate_eXX_frxD03_50d(find(t_aboveMinRate_eXX_frxD03_50d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_frxD03_50d(i)  = t_aboveMinRate_eXX_frxD03_50d(find(t_aboveMinRate_eXX_frxD03_50d(:,i),1,'last'));
    end
    if sum(t_aboveMinRate_eZZ_frxD03_50d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_frxD03_50d(i) = t_aboveMinRate_eZZ_frxD03_50d(find(t_aboveMinRate_eZZ_frxD03_50d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_frxD03_50d(i)  = t_aboveMinRate_eZZ_frxD03_50d(find(t_aboveMinRate_eZZ_frxD03_50d(:,i),1,'last'));
    end
% parameter 04
    if sum(t_aboveMinRate_eXX_frxD04_50d(:,i)) > 0
        tFirst_aboveMinRate_eXX_frxD04_50d(i) = t_aboveMinRate_eXX_frxD04_50d(find(t_aboveMinRate_eXX_frxD04_50d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_frxD04_50d(i)  = t_aboveMinRate_eXX_frxD04_50d(find(t_aboveMinRate_eXX_frxD04_50d(:,i),1,'last'));
    end
    if sum(t_aboveMinRate_eZZ_frxD04_50d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_frxD04_50d(i) = t_aboveMinRate_eZZ_frxD04_50d(find(t_aboveMinRate_eZZ_frxD04_50d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_frxD04_50d(i)  = t_aboveMinRate_eZZ_frxD04_50d(find(t_aboveMinRate_eZZ_frxD04_50d(:,i),1,'last'));
    end
% parameter 05
    if sum(t_aboveMinRate_eXX_frxD05_50d(:,i)) > 0
        tFirst_aboveMinRate_eXX_frxD05_50d(i) = t_aboveMinRate_eXX_frxD05_50d(find(t_aboveMinRate_eXX_frxD05_50d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_frxD05_50d(i)  = t_aboveMinRate_eXX_frxD05_50d(find(t_aboveMinRate_eXX_frxD05_50d(:,i),1,'last'));
    end
    if sum(t_aboveMinRate_eZZ_frxD05_50d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_frxD05_50d(i) = t_aboveMinRate_eZZ_frxD05_50d(find(t_aboveMinRate_eZZ_frxD05_50d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_frxD05_50d(i)  = t_aboveMinRate_eZZ_frxD05_50d(find(t_aboveMinRate_eZZ_frxD05_50d(:,i),1,'last'));
    end
% parameter 06
    if sum(t_aboveMinRate_eXX_frxD06_50d(:,i)) > 0
        tFirst_aboveMinRate_eXX_frxD06_50d(i) = t_aboveMinRate_eXX_frxD06_50d(find(t_aboveMinRate_eXX_frxD06_50d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_frxD06_50d(i)  = t_aboveMinRate_eXX_frxD06_50d(find(t_aboveMinRate_eXX_frxD06_50d(:,i),1,'last'));
    end
    if sum(t_aboveMinRate_eZZ_frxD06_50d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_frxD06_50d(i) = t_aboveMinRate_eZZ_frxD06_50d(find(t_aboveMinRate_eZZ_frxD06_50d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_frxD06_50d(i)  = t_aboveMinRate_eZZ_frxD06_50d(find(t_aboveMinRate_eZZ_frxD06_50d(:,i),1,'last'));
    end
% parameter 07
    if sum(t_aboveMinRate_eXX_frxD07_50d(:,i)) > 0
        tFirst_aboveMinRate_eXX_frxD07_50d(i) = t_aboveMinRate_eXX_frxD07_50d(find(t_aboveMinRate_eXX_frxD07_50d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_frxD07_50d(i)  = t_aboveMinRate_eXX_frxD07_50d(find(t_aboveMinRate_eXX_frxD07_50d(:,i),1,'last'));
    end
    if sum(t_aboveMinRate_eZZ_frxD07_50d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_frxD07_50d(i) = t_aboveMinRate_eZZ_frxD07_50d(find(t_aboveMinRate_eZZ_frxD07_50d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_frxD07_50d(i)  = t_aboveMinRate_eZZ_frxD07_50d(find(t_aboveMinRate_eZZ_frxD07_50d(:,i),1,'last'));
    end
% parameter 08
    if sum(t_aboveMinRate_eXX_frxD08_50d(:,i)) > 0
        tFirst_aboveMinRate_eXX_frxD08_50d(i) = t_aboveMinRate_eXX_frxD08_50d(find(t_aboveMinRate_eXX_frxD08_50d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_frxD08_50d(i)  = t_aboveMinRate_eXX_frxD08_50d(find(t_aboveMinRate_eXX_frxD08_50d(:,i),1,'last'));
    end
    if sum(t_aboveMinRate_eZZ_frxD08_50d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_frxD08_50d(i) = t_aboveMinRate_eZZ_frxD08_50d(find(t_aboveMinRate_eZZ_frxD08_50d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_frxD08_50d(i)  = t_aboveMinRate_eZZ_frxD08_50d(find(t_aboveMinRate_eZZ_frxD08_50d(:,i),1,'last'));
    end
% parameter 09
    if sum(t_aboveMinRate_eXX_frxD09_50d(:,i)) > 0
        tFirst_aboveMinRate_eXX_frxD09_50d(i) = t_aboveMinRate_eXX_frxD09_50d(find(t_aboveMinRate_eXX_frxD09_50d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_frxD09_50d(i)  = t_aboveMinRate_eXX_frxD09_50d(find(t_aboveMinRate_eXX_frxD09_50d(:,i),1,'last'));
    end
    if sum(t_aboveMinRate_eZZ_frxD09_50d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_frxD09_50d(i) = t_aboveMinRate_eZZ_frxD09_50d(find(t_aboveMinRate_eZZ_frxD09_50d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_frxD09_50d(i)  = t_aboveMinRate_eZZ_frxD09_50d(find(t_aboveMinRate_eZZ_frxD09_50d(:,i),1,'last'));
    end
% parameter 10
    if sum(t_aboveMinRate_eXX_frxD10_50d(:,i)) > 0
        tFirst_aboveMinRate_eXX_frxD10_50d(i) = t_aboveMinRate_eXX_frxD10_50d(find(t_aboveMinRate_eXX_frxD10_50d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_frxD10_50d(i)  = t_aboveMinRate_eXX_frxD10_50d(find(t_aboveMinRate_eXX_frxD10_50d(:,i),1,'last'));
    end
    if sum(t_aboveMinRate_eZZ_frxD10_50d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_frxD10_50d(i) = t_aboveMinRate_eZZ_frxD10_50d(find(t_aboveMinRate_eZZ_frxD10_50d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_frxD10_50d(i)  = t_aboveMinRate_eZZ_frxD10_50d(find(t_aboveMinRate_eZZ_frxD10_50d(:,i),1,'last'));
    end
    
end

% ==================================================================================================== %
% Durations for which strain rate > minRate
% ==================================================================================================== %
% parameter 01
t_aboveMinRateDuration_eXX_frxD01_01d = zeros(1,n_probes);
t_aboveMinRateDuration_eZZ_frxD01_01d = zeros(1,n_probes);
t_aboveMinRateDuration_eXX_frxD01_03d = zeros(1,n_probes);
t_aboveMinRateDuration_eZZ_frxD01_03d = zeros(1,n_probes);
t_aboveMinRateDuration_eXX_frxD01_05d = zeros(1,n_probes);
t_aboveMinRateDuration_eZZ_frxD01_05d = zeros(1,n_probes);
t_aboveMinRateDuration_eXX_frxD01_10d = zeros(1,n_probes);
t_aboveMinRateDuration_eZZ_frxD01_10d = zeros(1,n_probes);
t_aboveMinRateDuration_eXX_frxD01_50d = zeros(1,n_probes);
t_aboveMinRateDuration_eZZ_frxD01_50d = zeros(1,n_probes);
% parameter 02
t_aboveMinRateDuration_eXX_frxD02_01d = zeros(1,n_probes);
t_aboveMinRateDuration_eZZ_frxD02_01d = zeros(1,n_probes);
t_aboveMinRateDuration_eXX_frxD02_03d = zeros(1,n_probes);
t_aboveMinRateDuration_eZZ_frxD02_03d = zeros(1,n_probes);
t_aboveMinRateDuration_eXX_frxD02_05d = zeros(1,n_probes);
t_aboveMinRateDuration_eZZ_frxD02_05d = zeros(1,n_probes);
t_aboveMinRateDuration_eXX_frxD02_10d = zeros(1,n_probes);
t_aboveMinRateDuration_eZZ_frxD02_10d = zeros(1,n_probes);
t_aboveMinRateDuration_eXX_frxD02_50d = zeros(1,n_probes);
t_aboveMinRateDuration_eZZ_frxD02_50d = zeros(1,n_probes);
% parameter 03
t_aboveMinRateDuration_eXX_frxD03_01d = zeros(1,n_probes);
t_aboveMinRateDuration_eZZ_frxD03_01d = zeros(1,n_probes);
t_aboveMinRateDuration_eXX_frxD03_03d = zeros(1,n_probes);
t_aboveMinRateDuration_eZZ_frxD03_03d = zeros(1,n_probes);
t_aboveMinRateDuration_eXX_frxD03_05d = zeros(1,n_probes);
t_aboveMinRateDuration_eZZ_frxD03_05d = zeros(1,n_probes);
t_aboveMinRateDuration_eXX_frxD03_10d = zeros(1,n_probes);
t_aboveMinRateDuration_eZZ_frxD03_10d = zeros(1,n_probes);
t_aboveMinRateDuration_eXX_frxD03_50d = zeros(1,n_probes);
t_aboveMinRateDuration_eZZ_frxD03_50d = zeros(1,n_probes);
% parameter 04
t_aboveMinRateDuration_eXX_frxD04_01d = zeros(1,n_probes);
t_aboveMinRateDuration_eZZ_frxD04_01d = zeros(1,n_probes);
t_aboveMinRateDuration_eXX_frxD04_03d = zeros(1,n_probes);
t_aboveMinRateDuration_eZZ_frxD04_03d = zeros(1,n_probes);
t_aboveMinRateDuration_eXX_frxD04_05d = zeros(1,n_probes);
t_aboveMinRateDuration_eZZ_frxD04_05d = zeros(1,n_probes);
t_aboveMinRateDuration_eXX_frxD04_10d = zeros(1,n_probes);
t_aboveMinRateDuration_eZZ_frxD04_10d = zeros(1,n_probes);
t_aboveMinRateDuration_eXX_frxD04_50d = zeros(1,n_probes);
t_aboveMinRateDuration_eZZ_frxD04_50d = zeros(1,n_probes);
% parameter 05
t_aboveMinRateDuration_eXX_frxD05_01d = zeros(1,n_probes);
t_aboveMinRateDuration_eZZ_frxD05_01d = zeros(1,n_probes);
t_aboveMinRateDuration_eXX_frxD05_03d = zeros(1,n_probes);
t_aboveMinRateDuration_eZZ_frxD05_03d = zeros(1,n_probes);
t_aboveMinRateDuration_eXX_frxD05_05d = zeros(1,n_probes);
t_aboveMinRateDuration_eZZ_frxD05_05d = zeros(1,n_probes);
t_aboveMinRateDuration_eXX_frxD05_10d = zeros(1,n_probes);
t_aboveMinRateDuration_eZZ_frxD05_10d = zeros(1,n_probes);
t_aboveMinRateDuration_eXX_frxD05_50d = zeros(1,n_probes);
t_aboveMinRateDuration_eZZ_frxD05_50d = zeros(1,n_probes);
% parameter 06
t_aboveMinRateDuration_eXX_frxD06_01d = zeros(1,n_probes);
t_aboveMinRateDuration_eZZ_frxD06_01d = zeros(1,n_probes);
t_aboveMinRateDuration_eXX_frxD06_03d = zeros(1,n_probes);
t_aboveMinRateDuration_eZZ_frxD06_03d = zeros(1,n_probes);
t_aboveMinRateDuration_eXX_frxD06_05d = zeros(1,n_probes);
t_aboveMinRateDuration_eZZ_frxD06_05d = zeros(1,n_probes);
t_aboveMinRateDuration_eXX_frxD06_10d = zeros(1,n_probes);
t_aboveMinRateDuration_eZZ_frxD06_10d = zeros(1,n_probes);
t_aboveMinRateDuration_eXX_frxD06_50d = zeros(1,n_probes);
t_aboveMinRateDuration_eZZ_frxD06_50d = zeros(1,n_probes);
% parameter 07
t_aboveMinRateDuration_eXX_frxD07_01d = zeros(1,n_probes);
t_aboveMinRateDuration_eZZ_frxD07_01d = zeros(1,n_probes);
t_aboveMinRateDuration_eXX_frxD07_03d = zeros(1,n_probes);
t_aboveMinRateDuration_eZZ_frxD07_03d = zeros(1,n_probes);
t_aboveMinRateDuration_eXX_frxD07_05d = zeros(1,n_probes);
t_aboveMinRateDuration_eZZ_frxD07_05d = zeros(1,n_probes);
t_aboveMinRateDuration_eXX_frxD07_10d = zeros(1,n_probes);
t_aboveMinRateDuration_eZZ_frxD07_10d = zeros(1,n_probes);
t_aboveMinRateDuration_eXX_frxD07_50d = zeros(1,n_probes);
t_aboveMinRateDuration_eZZ_frxD07_50d = zeros(1,n_probes);
% parameter 08
t_aboveMinRateDuration_eXX_frxD08_01d = zeros(1,n_probes);
t_aboveMinRateDuration_eZZ_frxD08_01d = zeros(1,n_probes);
t_aboveMinRateDuration_eXX_frxD08_03d = zeros(1,n_probes);
t_aboveMinRateDuration_eZZ_frxD08_03d = zeros(1,n_probes);
t_aboveMinRateDuration_eXX_frxD08_05d = zeros(1,n_probes);
t_aboveMinRateDuration_eZZ_frxD08_05d = zeros(1,n_probes);
t_aboveMinRateDuration_eXX_frxD08_10d = zeros(1,n_probes);
t_aboveMinRateDuration_eZZ_frxD08_10d = zeros(1,n_probes);
t_aboveMinRateDuration_eXX_frxD08_50d = zeros(1,n_probes);
t_aboveMinRateDuration_eZZ_frxD08_50d = zeros(1,n_probes);
% parameter 09
t_aboveMinRateDuration_eXX_frxD09_01d = zeros(1,n_probes);
t_aboveMinRateDuration_eZZ_frxD09_01d = zeros(1,n_probes);
t_aboveMinRateDuration_eXX_frxD09_03d = zeros(1,n_probes);
t_aboveMinRateDuration_eZZ_frxD09_03d = zeros(1,n_probes);
t_aboveMinRateDuration_eXX_frxD09_05d = zeros(1,n_probes);
t_aboveMinRateDuration_eZZ_frxD09_05d = zeros(1,n_probes);
t_aboveMinRateDuration_eXX_frxD09_10d = zeros(1,n_probes);
t_aboveMinRateDuration_eZZ_frxD09_10d = zeros(1,n_probes);
t_aboveMinRateDuration_eXX_frxD09_50d = zeros(1,n_probes);
t_aboveMinRateDuration_eZZ_frxD09_50d = zeros(1,n_probes);
% parameter 10
t_aboveMinRateDuration_eXX_frxD10_01d = zeros(1,n_probes);
t_aboveMinRateDuration_eZZ_frxD10_01d = zeros(1,n_probes);
t_aboveMinRateDuration_eXX_frxD10_03d = zeros(1,n_probes);
t_aboveMinRateDuration_eZZ_frxD10_03d = zeros(1,n_probes);
t_aboveMinRateDuration_eXX_frxD10_05d = zeros(1,n_probes);
t_aboveMinRateDuration_eZZ_frxD10_05d = zeros(1,n_probes);
t_aboveMinRateDuration_eXX_frxD10_10d = zeros(1,n_probes);
t_aboveMinRateDuration_eZZ_frxD10_10d = zeros(1,n_probes);
t_aboveMinRateDuration_eXX_frxD10_50d = zeros(1,n_probes);
t_aboveMinRateDuration_eZZ_frxD10_50d = zeros(1,n_probes);

for i = 1:n_probes
% ==================================================================================================== %
% Depth 1%
% ==================================================================================================== %
% parameter 01
    t_aboveMinRateDuration_eXX_frxD01_01d(1,i) = tLast_aboveMinRate_eXX_frxD01_01d(1,i)-tFirst_aboveMinRate_eXX_frxD01_01d(1,i);
    t_aboveMinRateDuration_eZZ_frxD01_01d(1,i) = tLast_aboveMinRate_eZZ_frxD01_01d(1,i)-tFirst_aboveMinRate_eZZ_frxD01_01d(1,i);
% parameter 02
    t_aboveMinRateDuration_eXX_frxD02_01d(1,i) = tLast_aboveMinRate_eXX_frxD02_01d(1,i)-tFirst_aboveMinRate_eXX_frxD02_01d(1,i);
    t_aboveMinRateDuration_eZZ_frxD02_01d(1,i) = tLast_aboveMinRate_eZZ_frxD02_01d(1,i)-tFirst_aboveMinRate_eZZ_frxD02_01d(1,i);
% parameter 03
    t_aboveMinRateDuration_eXX_frxD03_01d(1,i) = tLast_aboveMinRate_eXX_frxD03_01d(1,i)-tFirst_aboveMinRate_eXX_frxD03_01d(1,i);
    t_aboveMinRateDuration_eZZ_frxD03_01d(1,i) = tLast_aboveMinRate_eZZ_frxD03_01d(1,i)-tFirst_aboveMinRate_eZZ_frxD03_01d(1,i);
% parameter 04
    t_aboveMinRateDuration_eXX_frxD04_01d(1,i) = tLast_aboveMinRate_eXX_frxD04_01d(1,i)-tFirst_aboveMinRate_eXX_frxD04_01d(1,i);
    t_aboveMinRateDuration_eZZ_frxD04_01d(1,i) = tLast_aboveMinRate_eZZ_frxD04_01d(1,i)-tFirst_aboveMinRate_eZZ_frxD04_01d(1,i);
% parameter 05
    t_aboveMinRateDuration_eXX_frxD05_01d(1,i) = tLast_aboveMinRate_eXX_frxD05_01d(1,i)-tFirst_aboveMinRate_eXX_frxD05_01d(1,i);
    t_aboveMinRateDuration_eZZ_frxD05_01d(1,i) = tLast_aboveMinRate_eZZ_frxD05_01d(1,i)-tFirst_aboveMinRate_eZZ_frxD05_01d(1,i);
% parameter 06
    t_aboveMinRateDuration_eXX_frxD06_01d(1,i) = tLast_aboveMinRate_eXX_frxD06_01d(1,i)-tFirst_aboveMinRate_eXX_frxD06_01d(1,i);
    t_aboveMinRateDuration_eZZ_frxD06_01d(1,i) = tLast_aboveMinRate_eZZ_frxD06_01d(1,i)-tFirst_aboveMinRate_eZZ_frxD06_01d(1,i);
% parameter 07
    t_aboveMinRateDuration_eXX_frxD07_01d(1,i) = tLast_aboveMinRate_eXX_frxD07_01d(1,i)-tFirst_aboveMinRate_eXX_frxD07_01d(1,i);
    t_aboveMinRateDuration_eZZ_frxD07_01d(1,i) = tLast_aboveMinRate_eZZ_frxD07_01d(1,i)-tFirst_aboveMinRate_eZZ_frxD07_01d(1,i);
% parameter 08
    t_aboveMinRateDuration_eXX_frxD08_01d(1,i) = tLast_aboveMinRate_eXX_frxD08_01d(1,i)-tFirst_aboveMinRate_eXX_frxD08_01d(1,i);
    t_aboveMinRateDuration_eZZ_frxD08_01d(1,i) = tLast_aboveMinRate_eZZ_frxD08_01d(1,i)-tFirst_aboveMinRate_eZZ_frxD08_01d(1,i);
% parameter 09
    t_aboveMinRateDuration_eXX_frxD09_01d(1,i) = tLast_aboveMinRate_eXX_frxD09_01d(1,i)-tFirst_aboveMinRate_eXX_frxD09_01d(1,i);
    t_aboveMinRateDuration_eZZ_frxD09_01d(1,i) = tLast_aboveMinRate_eZZ_frxD09_01d(1,i)-tFirst_aboveMinRate_eZZ_frxD09_01d(1,i);
% parameter 10
    t_aboveMinRateDuration_eXX_frxD10_01d(1,i) = tLast_aboveMinRate_eXX_frxD10_01d(1,i)-tFirst_aboveMinRate_eXX_frxD10_01d(1,i);
    t_aboveMinRateDuration_eZZ_frxD10_01d(1,i) = tLast_aboveMinRate_eZZ_frxD10_01d(1,i)-tFirst_aboveMinRate_eZZ_frxD10_01d(1,i);
    
% ==================================================================================================== %
% Depth 3%
% ==================================================================================================== %
% parameter 01
    t_aboveMinRateDuration_eXX_frxD01_03d(1,i) = tLast_aboveMinRate_eXX_frxD01_03d(1,i)-tFirst_aboveMinRate_eXX_frxD01_03d(1,i);
    t_aboveMinRateDuration_eZZ_frxD01_03d(1,i) = tLast_aboveMinRate_eZZ_frxD01_03d(1,i)-tFirst_aboveMinRate_eZZ_frxD01_03d(1,i);
% parameter 02
    t_aboveMinRateDuration_eXX_frxD02_03d(1,i) = tLast_aboveMinRate_eXX_frxD02_03d(1,i)-tFirst_aboveMinRate_eXX_frxD02_03d(1,i);
    t_aboveMinRateDuration_eZZ_frxD02_03d(1,i) = tLast_aboveMinRate_eZZ_frxD02_03d(1,i)-tFirst_aboveMinRate_eZZ_frxD02_03d(1,i);
% parameter 03
    t_aboveMinRateDuration_eXX_frxD03_03d(1,i) = tLast_aboveMinRate_eXX_frxD03_03d(1,i)-tFirst_aboveMinRate_eXX_frxD03_03d(1,i);
    t_aboveMinRateDuration_eZZ_frxD03_03d(1,i) = tLast_aboveMinRate_eZZ_frxD03_03d(1,i)-tFirst_aboveMinRate_eZZ_frxD03_03d(1,i);
% parameter 04
    t_aboveMinRateDuration_eXX_frxD04_03d(1,i) = tLast_aboveMinRate_eXX_frxD04_03d(1,i)-tFirst_aboveMinRate_eXX_frxD04_03d(1,i);
    t_aboveMinRateDuration_eZZ_frxD04_03d(1,i) = tLast_aboveMinRate_eZZ_frxD04_03d(1,i)-tFirst_aboveMinRate_eZZ_frxD04_03d(1,i);
% parameter 05
    t_aboveMinRateDuration_eXX_frxD05_03d(1,i) = tLast_aboveMinRate_eXX_frxD05_03d(1,i)-tFirst_aboveMinRate_eXX_frxD05_03d(1,i);
    t_aboveMinRateDuration_eZZ_frxD05_03d(1,i) = tLast_aboveMinRate_eZZ_frxD05_03d(1,i)-tFirst_aboveMinRate_eZZ_frxD05_03d(1,i);
% parameter 06
    t_aboveMinRateDuration_eXX_frxD06_03d(1,i) = tLast_aboveMinRate_eXX_frxD06_03d(1,i)-tFirst_aboveMinRate_eXX_frxD06_03d(1,i);
    t_aboveMinRateDuration_eZZ_frxD06_03d(1,i) = tLast_aboveMinRate_eZZ_frxD06_03d(1,i)-tFirst_aboveMinRate_eZZ_frxD06_03d(1,i);
% parameter 07
    t_aboveMinRateDuration_eXX_frxD07_03d(1,i) = tLast_aboveMinRate_eXX_frxD07_03d(1,i)-tFirst_aboveMinRate_eXX_frxD07_03d(1,i);
    t_aboveMinRateDuration_eZZ_frxD07_03d(1,i) = tLast_aboveMinRate_eZZ_frxD07_03d(1,i)-tFirst_aboveMinRate_eZZ_frxD07_03d(1,i);
% parameter 08
    t_aboveMinRateDuration_eXX_frxD08_03d(1,i) = tLast_aboveMinRate_eXX_frxD08_03d(1,i)-tFirst_aboveMinRate_eXX_frxD08_03d(1,i);
    t_aboveMinRateDuration_eZZ_frxD08_03d(1,i) = tLast_aboveMinRate_eZZ_frxD08_03d(1,i)-tFirst_aboveMinRate_eZZ_frxD08_03d(1,i);
% parameter 09
    t_aboveMinRateDuration_eXX_frxD09_03d(1,i) = tLast_aboveMinRate_eXX_frxD09_03d(1,i)-tFirst_aboveMinRate_eXX_frxD09_03d(1,i);
    t_aboveMinRateDuration_eZZ_frxD09_03d(1,i) = tLast_aboveMinRate_eZZ_frxD09_03d(1,i)-tFirst_aboveMinRate_eZZ_frxD09_03d(1,i);
% parameter 10
    t_aboveMinRateDuration_eXX_frxD10_03d(1,i) = tLast_aboveMinRate_eXX_frxD10_03d(1,i)-tFirst_aboveMinRate_eXX_frxD10_03d(1,i);
    t_aboveMinRateDuration_eZZ_frxD10_03d(1,i) = tLast_aboveMinRate_eZZ_frxD10_03d(1,i)-tFirst_aboveMinRate_eZZ_frxD10_03d(1,i);
    
% ==================================================================================================== %
% Depth 5%
% ==================================================================================================== %
% parameter 01
    t_aboveMinRateDuration_eXX_frxD01_05d(1,i) = tLast_aboveMinRate_eXX_frxD01_05d(1,i)-tFirst_aboveMinRate_eXX_frxD01_05d(1,i);
    t_aboveMinRateDuration_eZZ_frxD01_05d(1,i) = tLast_aboveMinRate_eZZ_frxD01_05d(1,i)-tFirst_aboveMinRate_eZZ_frxD01_05d(1,i);
% parameter 02
    t_aboveMinRateDuration_eXX_frxD02_05d(1,i) = tLast_aboveMinRate_eXX_frxD02_05d(1,i)-tFirst_aboveMinRate_eXX_frxD02_05d(1,i);
    t_aboveMinRateDuration_eZZ_frxD02_05d(1,i) = tLast_aboveMinRate_eZZ_frxD02_05d(1,i)-tFirst_aboveMinRate_eZZ_frxD02_05d(1,i);
% parameter 03
    t_aboveMinRateDuration_eXX_frxD03_05d(1,i) = tLast_aboveMinRate_eXX_frxD03_05d(1,i)-tFirst_aboveMinRate_eXX_frxD03_05d(1,i);
    t_aboveMinRateDuration_eZZ_frxD03_05d(1,i) = tLast_aboveMinRate_eZZ_frxD03_05d(1,i)-tFirst_aboveMinRate_eZZ_frxD03_05d(1,i);
% parameter 04
    t_aboveMinRateDuration_eXX_frxD04_05d(1,i) = tLast_aboveMinRate_eXX_frxD04_05d(1,i)-tFirst_aboveMinRate_eXX_frxD04_05d(1,i);
    t_aboveMinRateDuration_eZZ_frxD04_05d(1,i) = tLast_aboveMinRate_eZZ_frxD04_05d(1,i)-tFirst_aboveMinRate_eZZ_frxD04_05d(1,i);
% parameter 05
    t_aboveMinRateDuration_eXX_frxD05_05d(1,i) = tLast_aboveMinRate_eXX_frxD05_05d(1,i)-tFirst_aboveMinRate_eXX_frxD05_05d(1,i);
    t_aboveMinRateDuration_eZZ_frxD05_05d(1,i) = tLast_aboveMinRate_eZZ_frxD05_05d(1,i)-tFirst_aboveMinRate_eZZ_frxD05_05d(1,i);
% parameter 06
    t_aboveMinRateDuration_eXX_frxD06_05d(1,i) = tLast_aboveMinRate_eXX_frxD06_05d(1,i)-tFirst_aboveMinRate_eXX_frxD06_05d(1,i);
    t_aboveMinRateDuration_eZZ_frxD06_05d(1,i) = tLast_aboveMinRate_eZZ_frxD06_05d(1,i)-tFirst_aboveMinRate_eZZ_frxD06_05d(1,i);
% parameter 07
    t_aboveMinRateDuration_eXX_frxD07_05d(1,i) = tLast_aboveMinRate_eXX_frxD07_05d(1,i)-tFirst_aboveMinRate_eXX_frxD07_05d(1,i);
    t_aboveMinRateDuration_eZZ_frxD07_05d(1,i) = tLast_aboveMinRate_eZZ_frxD07_05d(1,i)-tFirst_aboveMinRate_eZZ_frxD07_05d(1,i);
% parameter 08
    t_aboveMinRateDuration_eXX_frxD08_05d(1,i) = tLast_aboveMinRate_eXX_frxD08_05d(1,i)-tFirst_aboveMinRate_eXX_frxD08_05d(1,i);
    t_aboveMinRateDuration_eZZ_frxD08_05d(1,i) = tLast_aboveMinRate_eZZ_frxD08_05d(1,i)-tFirst_aboveMinRate_eZZ_frxD08_05d(1,i);
% parameter 09
    t_aboveMinRateDuration_eXX_frxD09_05d(1,i) = tLast_aboveMinRate_eXX_frxD09_05d(1,i)-tFirst_aboveMinRate_eXX_frxD09_05d(1,i);
    t_aboveMinRateDuration_eZZ_frxD09_05d(1,i) = tLast_aboveMinRate_eZZ_frxD09_05d(1,i)-tFirst_aboveMinRate_eZZ_frxD09_05d(1,i);
% parameter 10
    t_aboveMinRateDuration_eXX_frxD10_05d(1,i) = tLast_aboveMinRate_eXX_frxD10_05d(1,i)-tFirst_aboveMinRate_eXX_frxD10_05d(1,i);
    t_aboveMinRateDuration_eZZ_frxD10_05d(1,i) = tLast_aboveMinRate_eZZ_frxD10_05d(1,i)-tFirst_aboveMinRate_eZZ_frxD10_05d(1,i);
    
% ==================================================================================================== %
% Depth 10%
% ==================================================================================================== %
% parameter 01
    t_aboveMinRateDuration_eXX_frxD01_10d(1,i) = tLast_aboveMinRate_eXX_frxD01_10d(1,i)-tFirst_aboveMinRate_eXX_frxD01_10d(1,i);
    t_aboveMinRateDuration_eZZ_frxD01_10d(1,i) = tLast_aboveMinRate_eZZ_frxD01_10d(1,i)-tFirst_aboveMinRate_eZZ_frxD01_10d(1,i);
% parameter 02
    t_aboveMinRateDuration_eXX_frxD02_10d(1,i) = tLast_aboveMinRate_eXX_frxD02_10d(1,i)-tFirst_aboveMinRate_eXX_frxD02_10d(1,i);
    t_aboveMinRateDuration_eZZ_frxD02_10d(1,i) = tLast_aboveMinRate_eZZ_frxD02_10d(1,i)-tFirst_aboveMinRate_eZZ_frxD02_10d(1,i);
% parameter 03
    t_aboveMinRateDuration_eXX_frxD03_10d(1,i) = tLast_aboveMinRate_eXX_frxD03_10d(1,i)-tFirst_aboveMinRate_eXX_frxD03_10d(1,i);
    t_aboveMinRateDuration_eZZ_frxD03_10d(1,i) = tLast_aboveMinRate_eZZ_frxD03_10d(1,i)-tFirst_aboveMinRate_eZZ_frxD03_10d(1,i);
% parameter 04
    t_aboveMinRateDuration_eXX_frxD04_10d(1,i) = tLast_aboveMinRate_eXX_frxD04_10d(1,i)-tFirst_aboveMinRate_eXX_frxD04_10d(1,i);
    t_aboveMinRateDuration_eZZ_frxD04_10d(1,i) = tLast_aboveMinRate_eZZ_frxD04_10d(1,i)-tFirst_aboveMinRate_eZZ_frxD04_10d(1,i);
% parameter 05
    t_aboveMinRateDuration_eXX_frxD05_10d(1,i) = tLast_aboveMinRate_eXX_frxD05_10d(1,i)-tFirst_aboveMinRate_eXX_frxD05_10d(1,i);
    t_aboveMinRateDuration_eZZ_frxD05_10d(1,i) = tLast_aboveMinRate_eZZ_frxD05_10d(1,i)-tFirst_aboveMinRate_eZZ_frxD05_10d(1,i);
% parameter 06
    t_aboveMinRateDuration_eXX_frxD06_10d(1,i) = tLast_aboveMinRate_eXX_frxD06_10d(1,i)-tFirst_aboveMinRate_eXX_frxD06_10d(1,i);
    t_aboveMinRateDuration_eZZ_frxD06_10d(1,i) = tLast_aboveMinRate_eZZ_frxD06_10d(1,i)-tFirst_aboveMinRate_eZZ_frxD06_10d(1,i);
% parameter 07
    t_aboveMinRateDuration_eXX_frxD07_10d(1,i) = tLast_aboveMinRate_eXX_frxD07_10d(1,i)-tFirst_aboveMinRate_eXX_frxD07_10d(1,i);
    t_aboveMinRateDuration_eZZ_frxD07_10d(1,i) = tLast_aboveMinRate_eZZ_frxD07_10d(1,i)-tFirst_aboveMinRate_eZZ_frxD07_10d(1,i);
% parameter 08
    t_aboveMinRateDuration_eXX_frxD08_10d(1,i) = tLast_aboveMinRate_eXX_frxD08_10d(1,i)-tFirst_aboveMinRate_eXX_frxD08_10d(1,i);
    t_aboveMinRateDuration_eZZ_frxD08_10d(1,i) = tLast_aboveMinRate_eZZ_frxD08_10d(1,i)-tFirst_aboveMinRate_eZZ_frxD08_10d(1,i);
% parameter 09
    t_aboveMinRateDuration_eXX_frxD09_10d(1,i) = tLast_aboveMinRate_eXX_frxD09_10d(1,i)-tFirst_aboveMinRate_eXX_frxD09_10d(1,i);
    t_aboveMinRateDuration_eZZ_frxD09_10d(1,i) = tLast_aboveMinRate_eZZ_frxD09_10d(1,i)-tFirst_aboveMinRate_eZZ_frxD09_10d(1,i);
% parameter 10
    t_aboveMinRateDuration_eXX_frxD10_10d(1,i) = tLast_aboveMinRate_eXX_frxD10_10d(1,i)-tFirst_aboveMinRate_eXX_frxD10_10d(1,i);
    t_aboveMinRateDuration_eZZ_frxD10_10d(1,i) = tLast_aboveMinRate_eZZ_frxD10_10d(1,i)-tFirst_aboveMinRate_eZZ_frxD10_10d(1,i);
    
% ==================================================================================================== %
% Depth 50%
% ==================================================================================================== %
% parameter 01
    t_aboveMinRateDuration_eXX_frxD01_50d(1,i) = tLast_aboveMinRate_eXX_frxD01_50d(1,i)-tFirst_aboveMinRate_eXX_frxD01_50d(1,i);
    t_aboveMinRateDuration_eZZ_frxD01_50d(1,i) = tLast_aboveMinRate_eZZ_frxD01_50d(1,i)-tFirst_aboveMinRate_eZZ_frxD01_50d(1,i);
% parameter 02
    t_aboveMinRateDuration_eXX_frxD02_50d(1,i) = tLast_aboveMinRate_eXX_frxD02_50d(1,i)-tFirst_aboveMinRate_eXX_frxD02_50d(1,i);
    t_aboveMinRateDuration_eZZ_frxD02_50d(1,i) = tLast_aboveMinRate_eZZ_frxD02_50d(1,i)-tFirst_aboveMinRate_eZZ_frxD02_50d(1,i);
% parameter 03
    t_aboveMinRateDuration_eXX_frxD03_50d(1,i) = tLast_aboveMinRate_eXX_frxD03_50d(1,i)-tFirst_aboveMinRate_eXX_frxD03_50d(1,i);
    t_aboveMinRateDuration_eZZ_frxD03_50d(1,i) = tLast_aboveMinRate_eZZ_frxD03_50d(1,i)-tFirst_aboveMinRate_eZZ_frxD03_50d(1,i);
% parameter 04
    t_aboveMinRateDuration_eXX_frxD04_50d(1,i) = tLast_aboveMinRate_eXX_frxD04_50d(1,i)-tFirst_aboveMinRate_eXX_frxD04_50d(1,i);
    t_aboveMinRateDuration_eZZ_frxD04_50d(1,i) = tLast_aboveMinRate_eZZ_frxD04_50d(1,i)-tFirst_aboveMinRate_eZZ_frxD04_50d(1,i);
% parameter 05
    t_aboveMinRateDuration_eXX_frxD05_50d(1,i) = tLast_aboveMinRate_eXX_frxD05_50d(1,i)-tFirst_aboveMinRate_eXX_frxD05_50d(1,i);
    t_aboveMinRateDuration_eZZ_frxD05_50d(1,i) = tLast_aboveMinRate_eZZ_frxD05_50d(1,i)-tFirst_aboveMinRate_eZZ_frxD05_50d(1,i);
% parameter 06
    t_aboveMinRateDuration_eXX_frxD06_50d(1,i) = tLast_aboveMinRate_eXX_frxD06_50d(1,i)-tFirst_aboveMinRate_eXX_frxD06_50d(1,i);
    t_aboveMinRateDuration_eZZ_frxD06_50d(1,i) = tLast_aboveMinRate_eZZ_frxD06_50d(1,i)-tFirst_aboveMinRate_eZZ_frxD06_50d(1,i);
% parameter 07
    t_aboveMinRateDuration_eXX_frxD07_50d(1,i) = tLast_aboveMinRate_eXX_frxD07_50d(1,i)-tFirst_aboveMinRate_eXX_frxD07_50d(1,i);
    t_aboveMinRateDuration_eZZ_frxD07_50d(1,i) = tLast_aboveMinRate_eZZ_frxD07_50d(1,i)-tFirst_aboveMinRate_eZZ_frxD07_50d(1,i);
% parameter 08
    t_aboveMinRateDuration_eXX_frxD08_50d(1,i) = tLast_aboveMinRate_eXX_frxD08_50d(1,i)-tFirst_aboveMinRate_eXX_frxD08_50d(1,i);
    t_aboveMinRateDuration_eZZ_frxD08_50d(1,i) = tLast_aboveMinRate_eZZ_frxD08_50d(1,i)-tFirst_aboveMinRate_eZZ_frxD08_50d(1,i);
% parameter 09
    t_aboveMinRateDuration_eXX_frxD09_50d(1,i) = tLast_aboveMinRate_eXX_frxD09_50d(1,i)-tFirst_aboveMinRate_eXX_frxD09_50d(1,i);
    t_aboveMinRateDuration_eZZ_frxD09_50d(1,i) = tLast_aboveMinRate_eZZ_frxD09_50d(1,i)-tFirst_aboveMinRate_eZZ_frxD09_50d(1,i);
% parameter 10
    t_aboveMinRateDuration_eXX_frxD10_50d(1,i) = tLast_aboveMinRate_eXX_frxD10_50d(1,i)-tFirst_aboveMinRate_eXX_frxD10_50d(1,i);
    t_aboveMinRateDuration_eZZ_frxD10_50d(1,i) = tLast_aboveMinRate_eZZ_frxD10_50d(1,i)-tFirst_aboveMinRate_eZZ_frxD10_50d(1,i);
    
end

% parameter 01
clear tFirst_aboveMinRate_eXX_frxD01_01d    tLast_aboveMinRate_eXX_frxD01_01d
clear tFirst_aboveMinRate_eZZ_frxD01_01d    tLast_aboveMinRate_eZZ_frxD01_01d
clear tFirst_aboveMinRate_eXX_frxD01_03d    tLast_aboveMinRate_eXX_frxD01_03d
clear tFirst_aboveMinRate_eZZ_frxD01_03d    tLast_aboveMinRate_eZZ_frxD01_03d
clear tFirst_aboveMinRate_eXX_frxD01_05d    tLast_aboveMinRate_eXX_frxD01_05d
clear tFirst_aboveMinRate_eZZ_frxD01_05d    tLast_aboveMinRate_eZZ_frxD01_05d
clear tFirst_aboveMinRate_eXX_frxD01_10d    tLast_aboveMinRate_eXX_frxD01_10d
clear tFirst_aboveMinRate_eZZ_frxD01_10d    tLast_aboveMinRate_eZZ_frxD01_10d
clear tFirst_aboveMinRate_eXX_frxD01_50d    tLast_aboveMinRate_eXX_frxD01_50d
clear tFirst_aboveMinRate_eZZ_frxD01_50d    tLast_aboveMinRate_eZZ_frxD01_50d
% parameter 02
clear tFirst_aboveMinRate_eXX_frxD02_01d    tLast_aboveMinRate_eXX_frxD02_01d
clear tFirst_aboveMinRate_eZZ_frxD02_01d    tLast_aboveMinRate_eZZ_frxD02_01d
clear tFirst_aboveMinRate_eXX_frxD02_03d    tLast_aboveMinRate_eXX_frxD02_03d
clear tFirst_aboveMinRate_eZZ_frxD02_03d    tLast_aboveMinRate_eZZ_frxD02_03d
clear tFirst_aboveMinRate_eXX_frxD02_05d    tLast_aboveMinRate_eXX_frxD02_05d
clear tFirst_aboveMinRate_eZZ_frxD02_05d    tLast_aboveMinRate_eZZ_frxD02_05d
clear tFirst_aboveMinRate_eXX_frxD02_10d    tLast_aboveMinRate_eXX_frxD02_10d
clear tFirst_aboveMinRate_eZZ_frxD02_10d    tLast_aboveMinRate_eZZ_frxD02_10d
clear tFirst_aboveMinRate_eXX_frxD02_50d    tLast_aboveMinRate_eXX_frxD02_50d
clear tFirst_aboveMinRate_eZZ_frxD02_50d    tLast_aboveMinRate_eZZ_frxD02_50d
% parameter 03
clear tFirst_aboveMinRate_eXX_frxD03_01d    tLast_aboveMinRate_eXX_frxD03_01d
clear tFirst_aboveMinRate_eZZ_frxD03_01d    tLast_aboveMinRate_eZZ_frxD03_01d
clear tFirst_aboveMinRate_eXX_frxD03_03d    tLast_aboveMinRate_eXX_frxD03_03d
clear tFirst_aboveMinRate_eZZ_frxD03_03d    tLast_aboveMinRate_eZZ_frxD03_03d
clear tFirst_aboveMinRate_eXX_frxD03_05d    tLast_aboveMinRate_eXX_frxD03_05d
clear tFirst_aboveMinRate_eZZ_frxD03_05d    tLast_aboveMinRate_eZZ_frxD03_05d
clear tFirst_aboveMinRate_eXX_frxD03_10d    tLast_aboveMinRate_eXX_frxD03_10d
clear tFirst_aboveMinRate_eZZ_frxD03_10d    tLast_aboveMinRate_eZZ_frxD03_10d
clear tFirst_aboveMinRate_eXX_frxD03_50d    tLast_aboveMinRate_eXX_frxD03_50d
clear tFirst_aboveMinRate_eZZ_frxD03_50d    tLast_aboveMinRate_eZZ_frxD03_50d
% parameter 04
clear tFirst_aboveMinRate_eXX_frxD04_01d    tLast_aboveMinRate_eXX_frxD04_01d
clear tFirst_aboveMinRate_eZZ_frxD04_01d    tLast_aboveMinRate_eZZ_frxD04_01d
clear tFirst_aboveMinRate_eXX_frxD04_03d    tLast_aboveMinRate_eXX_frxD04_03d
clear tFirst_aboveMinRate_eZZ_frxD04_03d    tLast_aboveMinRate_eZZ_frxD04_03d
clear tFirst_aboveMinRate_eXX_frxD04_05d    tLast_aboveMinRate_eXX_frxD04_05d
clear tFirst_aboveMinRate_eZZ_frxD04_05d    tLast_aboveMinRate_eZZ_frxD04_05d
clear tFirst_aboveMinRate_eXX_frxD04_10d    tLast_aboveMinRate_eXX_frxD04_10d
clear tFirst_aboveMinRate_eZZ_frxD04_10d    tLast_aboveMinRate_eZZ_frxD04_10d
clear tFirst_aboveMinRate_eXX_frxD04_50d    tLast_aboveMinRate_eXX_frxD04_50d
clear tFirst_aboveMinRate_eZZ_frxD04_50d    tLast_aboveMinRate_eZZ_frxD04_50d
% parameter 05
clear tFirst_aboveMinRate_eXX_frxD05_01d    tLast_aboveMinRate_eXX_frxD05_01d
clear tFirst_aboveMinRate_eZZ_frxD05_01d    tLast_aboveMinRate_eZZ_frxD05_01d
clear tFirst_aboveMinRate_eXX_frxD05_03d    tLast_aboveMinRate_eXX_frxD05_03d
clear tFirst_aboveMinRate_eZZ_frxD05_03d    tLast_aboveMinRate_eZZ_frxD05_03d
clear tFirst_aboveMinRate_eXX_frxD05_05d    tLast_aboveMinRate_eXX_frxD05_05d
clear tFirst_aboveMinRate_eZZ_frxD05_05d    tLast_aboveMinRate_eZZ_frxD05_05d
clear tFirst_aboveMinRate_eXX_frxD05_10d    tLast_aboveMinRate_eXX_frxD05_10d
clear tFirst_aboveMinRate_eZZ_frxD05_10d    tLast_aboveMinRate_eZZ_frxD05_10d
clear tFirst_aboveMinRate_eXX_frxD05_50d    tLast_aboveMinRate_eXX_frxD05_50d
clear tFirst_aboveMinRate_eZZ_frxD05_50d    tLast_aboveMinRate_eZZ_frxD05_50d
% parameter 06
clear tFirst_aboveMinRate_eXX_frxD06_01d    tLast_aboveMinRate_eXX_frxD06_01d
clear tFirst_aboveMinRate_eZZ_frxD06_01d    tLast_aboveMinRate_eZZ_frxD06_01d
clear tFirst_aboveMinRate_eXX_frxD06_03d    tLast_aboveMinRate_eXX_frxD06_03d
clear tFirst_aboveMinRate_eZZ_frxD06_03d    tLast_aboveMinRate_eZZ_frxD06_03d
clear tFirst_aboveMinRate_eXX_frxD06_05d    tLast_aboveMinRate_eXX_frxD06_05d
clear tFirst_aboveMinRate_eZZ_frxD06_05d    tLast_aboveMinRate_eZZ_frxD06_05d
clear tFirst_aboveMinRate_eXX_frxD06_10d    tLast_aboveMinRate_eXX_frxD06_10d
clear tFirst_aboveMinRate_eZZ_frxD06_10d    tLast_aboveMinRate_eZZ_frxD06_10d
clear tFirst_aboveMinRate_eXX_frxD06_50d    tLast_aboveMinRate_eXX_frxD06_50d
clear tFirst_aboveMinRate_eZZ_frxD06_50d    tLast_aboveMinRate_eZZ_frxD06_50d
% parameter 07
clear tFirst_aboveMinRate_eXX_frxD07_01d    tLast_aboveMinRate_eXX_frxD07_01d
clear tFirst_aboveMinRate_eZZ_frxD07_01d    tLast_aboveMinRate_eZZ_frxD07_01d
clear tFirst_aboveMinRate_eXX_frxD07_03d    tLast_aboveMinRate_eXX_frxD07_03d
clear tFirst_aboveMinRate_eZZ_frxD07_03d    tLast_aboveMinRate_eZZ_frxD07_03d
clear tFirst_aboveMinRate_eXX_frxD07_05d    tLast_aboveMinRate_eXX_frxD07_05d
clear tFirst_aboveMinRate_eZZ_frxD07_05d    tLast_aboveMinRate_eZZ_frxD07_05d
clear tFirst_aboveMinRate_eXX_frxD07_10d    tLast_aboveMinRate_eXX_frxD07_10d
clear tFirst_aboveMinRate_eZZ_frxD07_10d    tLast_aboveMinRate_eZZ_frxD07_10d
clear tFirst_aboveMinRate_eXX_frxD07_50d    tLast_aboveMinRate_eXX_frxD07_50d
clear tFirst_aboveMinRate_eZZ_frxD07_50d    tLast_aboveMinRate_eZZ_frxD07_50d
% parameter 08
clear tFirst_aboveMinRate_eXX_frxD08_01d    tLast_aboveMinRate_eXX_frxD08_01d
clear tFirst_aboveMinRate_eZZ_frxD08_01d    tLast_aboveMinRate_eZZ_frxD08_01d
clear tFirst_aboveMinRate_eXX_frxD08_03d    tLast_aboveMinRate_eXX_frxD08_03d
clear tFirst_aboveMinRate_eZZ_frxD08_03d    tLast_aboveMinRate_eZZ_frxD08_03d
clear tFirst_aboveMinRate_eXX_frxD08_05d    tLast_aboveMinRate_eXX_frxD08_05d
clear tFirst_aboveMinRate_eZZ_frxD08_05d    tLast_aboveMinRate_eZZ_frxD08_05d
clear tFirst_aboveMinRate_eXX_frxD08_10d    tLast_aboveMinRate_eXX_frxD08_10d
clear tFirst_aboveMinRate_eZZ_frxD08_10d    tLast_aboveMinRate_eZZ_frxD08_10d
clear tFirst_aboveMinRate_eXX_frxD08_50d    tLast_aboveMinRate_eXX_frxD08_50d
clear tFirst_aboveMinRate_eZZ_frxD08_50d    tLast_aboveMinRate_eZZ_frxD08_50d
% parameter 09
clear tFirst_aboveMinRate_eXX_frxD09_01d    tLast_aboveMinRate_eXX_frxD09_01d
clear tFirst_aboveMinRate_eZZ_frxD09_01d    tLast_aboveMinRate_eZZ_frxD09_01d
clear tFirst_aboveMinRate_eXX_frxD09_03d    tLast_aboveMinRate_eXX_frxD09_03d
clear tFirst_aboveMinRate_eZZ_frxD09_03d    tLast_aboveMinRate_eZZ_frxD09_03d
clear tFirst_aboveMinRate_eXX_frxD09_05d    tLast_aboveMinRate_eXX_frxD09_05d
clear tFirst_aboveMinRate_eZZ_frxD09_05d    tLast_aboveMinRate_eZZ_frxD09_05d
clear tFirst_aboveMinRate_eXX_frxD09_10d    tLast_aboveMinRate_eXX_frxD09_10d
clear tFirst_aboveMinRate_eZZ_frxD09_10d    tLast_aboveMinRate_eZZ_frxD09_10d
clear tFirst_aboveMinRate_eXX_frxD09_50d    tLast_aboveMinRate_eXX_frxD09_50d
clear tFirst_aboveMinRate_eZZ_frxD09_50d    tLast_aboveMinRate_eZZ_frxD09_50d
% parameter 10
clear tFirst_aboveMinRate_eXX_frxD10_01d    tLast_aboveMinRate_eXX_frxD10_01d
clear tFirst_aboveMinRate_eZZ_frxD10_01d    tLast_aboveMinRate_eZZ_frxD10_01d
clear tFirst_aboveMinRate_eXX_frxD10_03d    tLast_aboveMinRate_eXX_frxD10_03d
clear tFirst_aboveMinRate_eZZ_frxD10_03d    tLast_aboveMinRate_eZZ_frxD10_03d
clear tFirst_aboveMinRate_eXX_frxD10_05d    tLast_aboveMinRate_eXX_frxD10_05d
clear tFirst_aboveMinRate_eZZ_frxD10_05d    tLast_aboveMinRate_eZZ_frxD10_05d
clear tFirst_aboveMinRate_eXX_frxD10_10d    tLast_aboveMinRate_eXX_frxD10_10d
clear tFirst_aboveMinRate_eZZ_frxD10_10d    tLast_aboveMinRate_eZZ_frxD10_10d
clear tFirst_aboveMinRate_eXX_frxD10_50d    tLast_aboveMinRate_eXX_frxD10_50d
clear tFirst_aboveMinRate_eZZ_frxD10_50d    tLast_aboveMinRate_eZZ_frxD10_50d

%% Magnitude while strain rate > minRate

% parameter 01
eXX_magAboveMinRate_frxD01_01d = zeros(n_tSteps,n_probes);
eZZ_magAboveMinRate_frxD01_01d = zeros(n_tSteps,n_probes);
eXX_magAboveMinRate_frxD01_03d = zeros(n_tSteps,n_probes);
eZZ_magAboveMinRate_frxD01_03d = zeros(n_tSteps,n_probes);
eXX_magAboveMinRate_frxD01_05d = zeros(n_tSteps,n_probes);
eZZ_magAboveMinRate_frxD01_05d = zeros(n_tSteps,n_probes);
eXX_magAboveMinRate_frxD01_10d = zeros(n_tSteps,n_probes);
eZZ_magAboveMinRate_frxD01_10d = zeros(n_tSteps,n_probes);
eXX_magAboveMinRate_frxD01_50d = zeros(n_tSteps,n_probes);
eZZ_magAboveMinRate_frxD01_50d = zeros(n_tSteps,n_probes);
% parameter 02
eXX_magAboveMinRate_frxD02_01d = zeros(n_tSteps,n_probes);
eZZ_magAboveMinRate_frxD02_01d = zeros(n_tSteps,n_probes);
eXX_magAboveMinRate_frxD02_03d = zeros(n_tSteps,n_probes);
eZZ_magAboveMinRate_frxD02_03d = zeros(n_tSteps,n_probes);
eXX_magAboveMinRate_frxD02_05d = zeros(n_tSteps,n_probes);
eZZ_magAboveMinRate_frxD02_05d = zeros(n_tSteps,n_probes);
eXX_magAboveMinRate_frxD02_10d = zeros(n_tSteps,n_probes);
eZZ_magAboveMinRate_frxD02_10d = zeros(n_tSteps,n_probes);
eXX_magAboveMinRate_frxD02_50d = zeros(n_tSteps,n_probes);
eZZ_magAboveMinRate_frxD02_50d = zeros(n_tSteps,n_probes);
% parameter 03
eXX_magAboveMinRate_frxD03_01d = zeros(n_tSteps,n_probes);
eZZ_magAboveMinRate_frxD03_01d = zeros(n_tSteps,n_probes);
eXX_magAboveMinRate_frxD03_03d = zeros(n_tSteps,n_probes);
eZZ_magAboveMinRate_frxD03_03d = zeros(n_tSteps,n_probes);
eXX_magAboveMinRate_frxD03_05d = zeros(n_tSteps,n_probes);
eZZ_magAboveMinRate_frxD03_05d = zeros(n_tSteps,n_probes);
eXX_magAboveMinRate_frxD03_10d = zeros(n_tSteps,n_probes);
eZZ_magAboveMinRate_frxD03_10d = zeros(n_tSteps,n_probes);
eXX_magAboveMinRate_frxD03_50d = zeros(n_tSteps,n_probes);
eZZ_magAboveMinRate_frxD03_50d = zeros(n_tSteps,n_probes);
% parameter 04
eXX_magAboveMinRate_frxD04_01d = zeros(n_tSteps,n_probes);
eZZ_magAboveMinRate_frxD04_01d = zeros(n_tSteps,n_probes);
eXX_magAboveMinRate_frxD04_03d = zeros(n_tSteps,n_probes);
eZZ_magAboveMinRate_frxD04_03d = zeros(n_tSteps,n_probes);
eXX_magAboveMinRate_frxD04_05d = zeros(n_tSteps,n_probes);
eZZ_magAboveMinRate_frxD04_05d = zeros(n_tSteps,n_probes);
eXX_magAboveMinRate_frxD04_10d = zeros(n_tSteps,n_probes);
eZZ_magAboveMinRate_frxD04_10d = zeros(n_tSteps,n_probes);
eXX_magAboveMinRate_frxD04_50d = zeros(n_tSteps,n_probes);
eZZ_magAboveMinRate_frxD04_50d = zeros(n_tSteps,n_probes);
% parameter 05
eXX_magAboveMinRate_frxD05_01d = zeros(n_tSteps,n_probes);
eZZ_magAboveMinRate_frxD05_01d = zeros(n_tSteps,n_probes);
eXX_magAboveMinRate_frxD05_03d = zeros(n_tSteps,n_probes);
eZZ_magAboveMinRate_frxD05_03d = zeros(n_tSteps,n_probes);
eXX_magAboveMinRate_frxD05_05d = zeros(n_tSteps,n_probes);
eZZ_magAboveMinRate_frxD05_05d = zeros(n_tSteps,n_probes);
eXX_magAboveMinRate_frxD05_10d = zeros(n_tSteps,n_probes);
eZZ_magAboveMinRate_frxD05_10d = zeros(n_tSteps,n_probes);
eXX_magAboveMinRate_frxD05_50d = zeros(n_tSteps,n_probes);
eZZ_magAboveMinRate_frxD05_50d = zeros(n_tSteps,n_probes);
% parameter 06
eXX_magAboveMinRate_frxD06_01d = zeros(n_tSteps,n_probes);
eZZ_magAboveMinRate_frxD06_01d = zeros(n_tSteps,n_probes);
eXX_magAboveMinRate_frxD06_03d = zeros(n_tSteps,n_probes);
eZZ_magAboveMinRate_frxD06_03d = zeros(n_tSteps,n_probes);
eXX_magAboveMinRate_frxD06_05d = zeros(n_tSteps,n_probes);
eZZ_magAboveMinRate_frxD06_05d = zeros(n_tSteps,n_probes);
eXX_magAboveMinRate_frxD06_10d = zeros(n_tSteps,n_probes);
eZZ_magAboveMinRate_frxD06_10d = zeros(n_tSteps,n_probes);
eXX_magAboveMinRate_frxD06_50d = zeros(n_tSteps,n_probes);
eZZ_magAboveMinRate_frxD06_50d = zeros(n_tSteps,n_probes);
% parameter 07
eXX_magAboveMinRate_frxD07_01d = zeros(n_tSteps,n_probes);
eZZ_magAboveMinRate_frxD07_01d = zeros(n_tSteps,n_probes);
eXX_magAboveMinRate_frxD07_03d = zeros(n_tSteps,n_probes);
eZZ_magAboveMinRate_frxD07_03d = zeros(n_tSteps,n_probes);
eXX_magAboveMinRate_frxD07_05d = zeros(n_tSteps,n_probes);
eZZ_magAboveMinRate_frxD07_05d = zeros(n_tSteps,n_probes);
eXX_magAboveMinRate_frxD07_10d = zeros(n_tSteps,n_probes);
eZZ_magAboveMinRate_frxD07_10d = zeros(n_tSteps,n_probes);
eXX_magAboveMinRate_frxD07_50d = zeros(n_tSteps,n_probes);
eZZ_magAboveMinRate_frxD07_50d = zeros(n_tSteps,n_probes);
% parameter 08
eXX_magAboveMinRate_frxD08_01d = zeros(n_tSteps,n_probes);
eZZ_magAboveMinRate_frxD08_01d = zeros(n_tSteps,n_probes);
eXX_magAboveMinRate_frxD08_03d = zeros(n_tSteps,n_probes);
eZZ_magAboveMinRate_frxD08_03d = zeros(n_tSteps,n_probes);
eXX_magAboveMinRate_frxD08_05d = zeros(n_tSteps,n_probes);
eZZ_magAboveMinRate_frxD08_05d = zeros(n_tSteps,n_probes);
eXX_magAboveMinRate_frxD08_10d = zeros(n_tSteps,n_probes);
eZZ_magAboveMinRate_frxD08_10d = zeros(n_tSteps,n_probes);
eXX_magAboveMinRate_frxD08_50d = zeros(n_tSteps,n_probes);
eZZ_magAboveMinRate_frxD08_50d = zeros(n_tSteps,n_probes);
% parameter 09
eXX_magAboveMinRate_frxD09_01d = zeros(n_tSteps,n_probes);
eZZ_magAboveMinRate_frxD09_01d = zeros(n_tSteps,n_probes);
eXX_magAboveMinRate_frxD09_03d = zeros(n_tSteps,n_probes);
eZZ_magAboveMinRate_frxD09_03d = zeros(n_tSteps,n_probes);
eXX_magAboveMinRate_frxD09_05d = zeros(n_tSteps,n_probes);
eZZ_magAboveMinRate_frxD09_05d = zeros(n_tSteps,n_probes);
eXX_magAboveMinRate_frxD09_10d = zeros(n_tSteps,n_probes);
eZZ_magAboveMinRate_frxD09_10d = zeros(n_tSteps,n_probes);
eXX_magAboveMinRate_frxD09_50d = zeros(n_tSteps,n_probes);
eZZ_magAboveMinRate_frxD09_50d = zeros(n_tSteps,n_probes);
% parameter 10
eXX_magAboveMinRate_frxD10_01d = zeros(n_tSteps,n_probes);
eZZ_magAboveMinRate_frxD10_01d = zeros(n_tSteps,n_probes);
eXX_magAboveMinRate_frxD10_03d = zeros(n_tSteps,n_probes);
eZZ_magAboveMinRate_frxD10_03d = zeros(n_tSteps,n_probes);
eXX_magAboveMinRate_frxD10_05d = zeros(n_tSteps,n_probes);
eZZ_magAboveMinRate_frxD10_05d = zeros(n_tSteps,n_probes);
eXX_magAboveMinRate_frxD10_10d = zeros(n_tSteps,n_probes);
eZZ_magAboveMinRate_frxD10_10d = zeros(n_tSteps,n_probes);
eXX_magAboveMinRate_frxD10_50d = zeros(n_tSteps,n_probes);
eZZ_magAboveMinRate_frxD10_50d = zeros(n_tSteps,n_probes);

for i = 1:n_probes
% ==================================================================================================== %
% Depth 1%
% ==================================================================================================== %
% parameter 01
    if sum(t_aboveMinRate_eXX_frxD01_01d(:,i)) > 0
        eXX_magAboveMinRate_frxD01_01d(eXX_minRateCriteria_frxD01_01d(:,i),i) = eXX_frxD01_01d(eXX_minRateCriteria_frxD01_01d(:,i),i);
    end
    if sum(t_aboveMinRate_eZZ_frxD01_01d(:,i)) > 0
        eZZ_magAboveMinRate_frxD01_01d(eZZ_minRateCriteria_frxD01_01d(:,i),i) = eZZ_frxD01_01d(eZZ_minRateCriteria_frxD01_01d(:,i),i);
    end
% parameter 02
    if sum(t_aboveMinRate_eXX_frxD02_01d(:,i)) > 0
        eXX_magAboveMinRate_frxD02_01d(eXX_minRateCriteria_frxD02_01d(:,i),i) = eXX_frxD02_01d(eXX_minRateCriteria_frxD02_01d(:,i),i);
    end
    if sum(t_aboveMinRate_eZZ_frxD02_01d(:,i)) > 0
        eZZ_magAboveMinRate_frxD02_01d(eZZ_minRateCriteria_frxD02_01d(:,i),i) = eZZ_frxD02_01d(eZZ_minRateCriteria_frxD02_01d(:,i),i);
    end
% parameter 03
    if sum(t_aboveMinRate_eXX_frxD03_01d(:,i)) > 0
        eXX_magAboveMinRate_frxD03_01d(eXX_minRateCriteria_frxD03_01d(:,i),i) = eXX_frxD03_01d(eXX_minRateCriteria_frxD03_01d(:,i),i);
    end
    if sum(t_aboveMinRate_eZZ_frxD03_01d(:,i)) > 0
        eZZ_magAboveMinRate_frxD03_01d(eZZ_minRateCriteria_frxD03_01d(:,i),i) = eZZ_frxD03_01d(eZZ_minRateCriteria_frxD03_01d(:,i),i);
    end
% parameter 04
    if sum(t_aboveMinRate_eXX_frxD04_01d(:,i)) > 0
        eXX_magAboveMinRate_frxD04_01d(eXX_minRateCriteria_frxD04_01d(:,i),i) = eXX_frxD04_01d(eXX_minRateCriteria_frxD04_01d(:,i),i);
    end
    if sum(t_aboveMinRate_eZZ_frxD04_01d(:,i)) > 0
        eZZ_magAboveMinRate_frxD04_01d(eZZ_minRateCriteria_frxD04_01d(:,i),i) = eZZ_frxD04_01d(eZZ_minRateCriteria_frxD04_01d(:,i),i);
    end
% parameter 05
    if sum(t_aboveMinRate_eXX_frxD05_01d(:,i)) > 0
        eXX_magAboveMinRate_frxD05_01d(eXX_minRateCriteria_frxD05_01d(:,i),i) = eXX_frxD05_01d(eXX_minRateCriteria_frxD05_01d(:,i),i);
    end
    if sum(t_aboveMinRate_eZZ_frxD05_01d(:,i)) > 0
        eZZ_magAboveMinRate_frxD05_01d(eZZ_minRateCriteria_frxD05_01d(:,i),i) = eZZ_frxD05_01d(eZZ_minRateCriteria_frxD05_01d(:,i),i);
    end
% parameter 06
    if sum(t_aboveMinRate_eXX_frxD06_01d(:,i)) > 0
        eXX_magAboveMinRate_frxD06_01d(eXX_minRateCriteria_frxD06_01d(:,i),i) = eXX_frxD06_01d(eXX_minRateCriteria_frxD06_01d(:,i),i);
    end
    if sum(t_aboveMinRate_eZZ_frxD06_01d(:,i)) > 0
        eZZ_magAboveMinRate_frxD06_01d(eZZ_minRateCriteria_frxD06_01d(:,i),i) = eZZ_frxD06_01d(eZZ_minRateCriteria_frxD06_01d(:,i),i);
    end
% parameter 07
    if sum(t_aboveMinRate_eXX_frxD07_01d(:,i)) > 0
        eXX_magAboveMinRate_frxD07_01d(eXX_minRateCriteria_frxD07_01d(:,i),i) = eXX_frxD07_01d(eXX_minRateCriteria_frxD07_01d(:,i),i);
    end
    if sum(t_aboveMinRate_eZZ_frxD07_01d(:,i)) > 0
        eZZ_magAboveMinRate_frxD07_01d(eZZ_minRateCriteria_frxD07_01d(:,i),i) = eZZ_frxD07_01d(eZZ_minRateCriteria_frxD07_01d(:,i),i);
    end
% parameter 08
    if sum(t_aboveMinRate_eXX_frxD08_01d(:,i)) > 0
        eXX_magAboveMinRate_frxD08_01d(eXX_minRateCriteria_frxD08_01d(:,i),i) = eXX_frxD08_01d(eXX_minRateCriteria_frxD08_01d(:,i),i);
    end
    if sum(t_aboveMinRate_eZZ_frxD08_01d(:,i)) > 0
        eZZ_magAboveMinRate_frxD08_01d(eZZ_minRateCriteria_frxD08_01d(:,i),i) = eZZ_frxD08_01d(eZZ_minRateCriteria_frxD08_01d(:,i),i);
    end
% parameter 09
    if sum(t_aboveMinRate_eXX_frxD09_01d(:,i)) > 0
        eXX_magAboveMinRate_frxD09_01d(eXX_minRateCriteria_frxD09_01d(:,i),i) = eXX_frxD09_01d(eXX_minRateCriteria_frxD09_01d(:,i),i);
    end
    if sum(t_aboveMinRate_eZZ_frxD09_01d(:,i)) > 0
        eZZ_magAboveMinRate_frxD09_01d(eZZ_minRateCriteria_frxD09_01d(:,i),i) = eZZ_frxD09_01d(eZZ_minRateCriteria_frxD09_01d(:,i),i);
    end
% parameter 10
    if sum(t_aboveMinRate_eXX_frxD10_01d(:,i)) > 0
        eXX_magAboveMinRate_frxD10_01d(eXX_minRateCriteria_frxD10_01d(:,i),i) = eXX_frxD10_01d(eXX_minRateCriteria_frxD10_01d(:,i),i);
    end
    if sum(t_aboveMinRate_eZZ_frxD10_01d(:,i)) > 0
        eZZ_magAboveMinRate_frxD10_01d(eZZ_minRateCriteria_frxD10_01d(:,i),i) = eZZ_frxD10_01d(eZZ_minRateCriteria_frxD10_01d(:,i),i);
    end
    
% ==================================================================================================== %
% Depth 3%
% ==================================================================================================== %
% parameter 01
    if sum(t_aboveMinRate_eXX_frxD01_03d(:,i)) > 0
        eXX_magAboveMinRate_frxD01_03d(eXX_minRateCriteria_frxD01_03d(:,i),i) = eXX_frxD01_03d(eXX_minRateCriteria_frxD01_03d(:,i),i);
    end
    if sum(t_aboveMinRate_eZZ_frxD01_03d(:,i)) > 0
        eZZ_magAboveMinRate_frxD01_03d(eZZ_minRateCriteria_frxD01_03d(:,i),i) = eZZ_frxD01_03d(eZZ_minRateCriteria_frxD01_03d(:,i),i);
    end
% parameter 02
    if sum(t_aboveMinRate_eXX_frxD02_03d(:,i)) > 0
        eXX_magAboveMinRate_frxD02_03d(eXX_minRateCriteria_frxD02_03d(:,i),i) = eXX_frxD02_03d(eXX_minRateCriteria_frxD02_03d(:,i),i);
    end
    if sum(t_aboveMinRate_eZZ_frxD02_03d(:,i)) > 0
        eZZ_magAboveMinRate_frxD02_03d(eZZ_minRateCriteria_frxD02_03d(:,i),i) = eZZ_frxD02_03d(eZZ_minRateCriteria_frxD02_03d(:,i),i);
    end
% parameter 03
    if sum(t_aboveMinRate_eXX_frxD03_03d(:,i)) > 0
        eXX_magAboveMinRate_frxD03_03d(eXX_minRateCriteria_frxD03_03d(:,i),i) = eXX_frxD03_03d(eXX_minRateCriteria_frxD03_03d(:,i),i);
    end
    if sum(t_aboveMinRate_eZZ_frxD03_03d(:,i)) > 0
        eZZ_magAboveMinRate_frxD03_03d(eZZ_minRateCriteria_frxD03_03d(:,i),i) = eZZ_frxD03_03d(eZZ_minRateCriteria_frxD03_03d(:,i),i);
    end
% parameter 04
    if sum(t_aboveMinRate_eXX_frxD04_03d(:,i)) > 0
        eXX_magAboveMinRate_frxD04_03d(eXX_minRateCriteria_frxD04_03d(:,i),i) = eXX_frxD04_03d(eXX_minRateCriteria_frxD04_03d(:,i),i);
    end
    if sum(t_aboveMinRate_eZZ_frxD04_03d(:,i)) > 0
        eZZ_magAboveMinRate_frxD04_03d(eZZ_minRateCriteria_frxD04_03d(:,i),i) = eZZ_frxD04_03d(eZZ_minRateCriteria_frxD04_03d(:,i),i);
    end
% parameter 05
    if sum(t_aboveMinRate_eXX_frxD05_03d(:,i)) > 0
        eXX_magAboveMinRate_frxD05_03d(eXX_minRateCriteria_frxD05_03d(:,i),i) = eXX_frxD05_03d(eXX_minRateCriteria_frxD05_03d(:,i),i);
    end
    if sum(t_aboveMinRate_eZZ_frxD05_03d(:,i)) > 0
        eZZ_magAboveMinRate_frxD05_03d(eZZ_minRateCriteria_frxD05_03d(:,i),i) = eZZ_frxD05_03d(eZZ_minRateCriteria_frxD05_03d(:,i),i);
    end
% parameter 06
    if sum(t_aboveMinRate_eXX_frxD06_03d(:,i)) > 0
        eXX_magAboveMinRate_frxD06_03d(eXX_minRateCriteria_frxD06_03d(:,i),i) = eXX_frxD06_03d(eXX_minRateCriteria_frxD06_03d(:,i),i);
    end
    if sum(t_aboveMinRate_eZZ_frxD06_03d(:,i)) > 0
        eZZ_magAboveMinRate_frxD06_03d(eZZ_minRateCriteria_frxD06_03d(:,i),i) = eZZ_frxD06_03d(eZZ_minRateCriteria_frxD06_03d(:,i),i);
    end
% parameter 07
    if sum(t_aboveMinRate_eXX_frxD07_03d(:,i)) > 0
        eXX_magAboveMinRate_frxD07_03d(eXX_minRateCriteria_frxD07_03d(:,i),i) = eXX_frxD07_03d(eXX_minRateCriteria_frxD07_03d(:,i),i);
    end
    if sum(t_aboveMinRate_eZZ_frxD07_03d(:,i)) > 0
        eZZ_magAboveMinRate_frxD07_03d(eZZ_minRateCriteria_frxD07_03d(:,i),i) = eZZ_frxD07_03d(eZZ_minRateCriteria_frxD07_03d(:,i),i);
    end
% parameter 08
    if sum(t_aboveMinRate_eXX_frxD08_03d(:,i)) > 0
        eXX_magAboveMinRate_frxD08_03d(eXX_minRateCriteria_frxD08_03d(:,i),i) = eXX_frxD08_03d(eXX_minRateCriteria_frxD08_03d(:,i),i);
    end
    if sum(t_aboveMinRate_eZZ_frxD08_03d(:,i)) > 0
        eZZ_magAboveMinRate_frxD08_03d(eZZ_minRateCriteria_frxD08_03d(:,i),i) = eZZ_frxD08_03d(eZZ_minRateCriteria_frxD08_03d(:,i),i);
    end
% parameter 09
    if sum(t_aboveMinRate_eXX_frxD09_03d(:,i)) > 0
        eXX_magAboveMinRate_frxD09_03d(eXX_minRateCriteria_frxD09_03d(:,i),i) = eXX_frxD09_03d(eXX_minRateCriteria_frxD09_03d(:,i),i);
    end
    if sum(t_aboveMinRate_eZZ_frxD09_03d(:,i)) > 0
        eZZ_magAboveMinRate_frxD09_03d(eZZ_minRateCriteria_frxD09_03d(:,i),i) = eZZ_frxD09_03d(eZZ_minRateCriteria_frxD09_03d(:,i),i);
    end
% parameter 10
    if sum(t_aboveMinRate_eXX_frxD10_03d(:,i)) > 0
        eXX_magAboveMinRate_frxD10_03d(eXX_minRateCriteria_frxD10_03d(:,i),i) = eXX_frxD10_03d(eXX_minRateCriteria_frxD10_03d(:,i),i);
    end
    if sum(t_aboveMinRate_eZZ_frxD10_03d(:,i)) > 0
        eZZ_magAboveMinRate_frxD10_03d(eZZ_minRateCriteria_frxD10_03d(:,i),i) = eZZ_frxD10_03d(eZZ_minRateCriteria_frxD10_03d(:,i),i);
    end
    
% ==================================================================================================== %
% Depth 5%
% ==================================================================================================== %
% parameter 01
    if sum(t_aboveMinRate_eXX_frxD01_05d(:,i)) > 0
        eXX_magAboveMinRate_frxD01_05d(eXX_minRateCriteria_frxD01_05d(:,i),i) = eXX_frxD01_05d(eXX_minRateCriteria_frxD01_05d(:,i),i);
    end
    if sum(t_aboveMinRate_eZZ_frxD01_05d(:,i)) > 0
        eZZ_magAboveMinRate_frxD01_05d(eZZ_minRateCriteria_frxD01_05d(:,i),i) = eZZ_frxD01_05d(eZZ_minRateCriteria_frxD01_05d(:,i),i);
    end
% parameter 02
    if sum(t_aboveMinRate_eXX_frxD02_05d(:,i)) > 0
        eXX_magAboveMinRate_frxD02_05d(eXX_minRateCriteria_frxD02_05d(:,i),i) = eXX_frxD02_05d(eXX_minRateCriteria_frxD02_05d(:,i),i);
    end
    if sum(t_aboveMinRate_eZZ_frxD02_05d(:,i)) > 0
        eZZ_magAboveMinRate_frxD02_05d(eZZ_minRateCriteria_frxD02_05d(:,i),i) = eZZ_frxD02_05d(eZZ_minRateCriteria_frxD02_05d(:,i),i);
    end
% parameter 03
    if sum(t_aboveMinRate_eXX_frxD03_05d(:,i)) > 0
        eXX_magAboveMinRate_frxD03_05d(eXX_minRateCriteria_frxD03_05d(:,i),i) = eXX_frxD03_05d(eXX_minRateCriteria_frxD03_05d(:,i),i);
    end
    if sum(t_aboveMinRate_eZZ_frxD03_05d(:,i)) > 0
        eZZ_magAboveMinRate_frxD03_05d(eZZ_minRateCriteria_frxD03_05d(:,i),i) = eZZ_frxD03_05d(eZZ_minRateCriteria_frxD03_05d(:,i),i);
    end
% parameter 04
    if sum(t_aboveMinRate_eXX_frxD04_05d(:,i)) > 0
        eXX_magAboveMinRate_frxD04_05d(eXX_minRateCriteria_frxD04_05d(:,i),i) = eXX_frxD04_05d(eXX_minRateCriteria_frxD04_05d(:,i),i);
    end
    if sum(t_aboveMinRate_eZZ_frxD04_05d(:,i)) > 0
        eZZ_magAboveMinRate_frxD04_05d(eZZ_minRateCriteria_frxD04_05d(:,i),i) = eZZ_frxD04_05d(eZZ_minRateCriteria_frxD04_05d(:,i),i);
    end
% parameter 05
    if sum(t_aboveMinRate_eXX_frxD05_05d(:,i)) > 0
        eXX_magAboveMinRate_frxD05_05d(eXX_minRateCriteria_frxD05_05d(:,i),i) = eXX_frxD05_05d(eXX_minRateCriteria_frxD05_05d(:,i),i);
    end
    if sum(t_aboveMinRate_eZZ_frxD05_05d(:,i)) > 0
        eZZ_magAboveMinRate_frxD05_05d(eZZ_minRateCriteria_frxD05_05d(:,i),i) = eZZ_frxD05_05d(eZZ_minRateCriteria_frxD05_05d(:,i),i);
    end
% parameter 06
    if sum(t_aboveMinRate_eXX_frxD06_05d(:,i)) > 0
        eXX_magAboveMinRate_frxD06_05d(eXX_minRateCriteria_frxD06_05d(:,i),i) = eXX_frxD06_05d(eXX_minRateCriteria_frxD06_05d(:,i),i);
    end
    if sum(t_aboveMinRate_eZZ_frxD06_05d(:,i)) > 0
        eZZ_magAboveMinRate_frxD06_05d(eZZ_minRateCriteria_frxD06_05d(:,i),i) = eZZ_frxD06_05d(eZZ_minRateCriteria_frxD06_05d(:,i),i);
    end
% parameter 07
    if sum(t_aboveMinRate_eXX_frxD07_05d(:,i)) > 0
        eXX_magAboveMinRate_frxD07_05d(eXX_minRateCriteria_frxD07_05d(:,i),i) = eXX_frxD07_05d(eXX_minRateCriteria_frxD07_05d(:,i),i);
    end
    if sum(t_aboveMinRate_eZZ_frxD07_05d(:,i)) > 0
        eZZ_magAboveMinRate_frxD07_05d(eZZ_minRateCriteria_frxD07_05d(:,i),i) = eZZ_frxD07_05d(eZZ_minRateCriteria_frxD07_05d(:,i),i);
    end
% parameter 08
    if sum(t_aboveMinRate_eXX_frxD08_05d(:,i)) > 0
        eXX_magAboveMinRate_frxD08_05d(eXX_minRateCriteria_frxD08_05d(:,i),i) = eXX_frxD08_05d(eXX_minRateCriteria_frxD08_05d(:,i),i);
    end
    if sum(t_aboveMinRate_eZZ_frxD08_05d(:,i)) > 0
        eZZ_magAboveMinRate_frxD08_05d(eZZ_minRateCriteria_frxD08_05d(:,i),i) = eZZ_frxD08_05d(eZZ_minRateCriteria_frxD08_05d(:,i),i);
    end
% parameter 09
    if sum(t_aboveMinRate_eXX_frxD09_05d(:,i)) > 0
        eXX_magAboveMinRate_frxD09_05d(eXX_minRateCriteria_frxD09_05d(:,i),i) = eXX_frxD09_05d(eXX_minRateCriteria_frxD09_05d(:,i),i);
    end
    if sum(t_aboveMinRate_eZZ_frxD09_05d(:,i)) > 0
        eZZ_magAboveMinRate_frxD09_05d(eZZ_minRateCriteria_frxD09_05d(:,i),i) = eZZ_frxD09_05d(eZZ_minRateCriteria_frxD09_05d(:,i),i);
    end
% parameter 10
    if sum(t_aboveMinRate_eXX_frxD10_05d(:,i)) > 0
        eXX_magAboveMinRate_frxD10_05d(eXX_minRateCriteria_frxD10_05d(:,i),i) = eXX_frxD10_05d(eXX_minRateCriteria_frxD10_05d(:,i),i);
    end
    if sum(t_aboveMinRate_eZZ_frxD10_05d(:,i)) > 0
        eZZ_magAboveMinRate_frxD10_05d(eZZ_minRateCriteria_frxD10_05d(:,i),i) = eZZ_frxD10_05d(eZZ_minRateCriteria_frxD10_05d(:,i),i);
    end
    
% ==================================================================================================== %
% Depth 10%
% ==================================================================================================== %
% parameter 01
    if sum(t_aboveMinRate_eXX_frxD01_10d(:,i)) > 0
        eXX_magAboveMinRate_frxD01_10d(eXX_minRateCriteria_frxD01_10d(:,i),i) = eXX_frxD01_10d(eXX_minRateCriteria_frxD01_10d(:,i),i);
    end
    if sum(t_aboveMinRate_eZZ_frxD01_10d(:,i)) > 0
        eZZ_magAboveMinRate_frxD01_10d(eZZ_minRateCriteria_frxD01_10d(:,i),i) = eZZ_frxD01_10d(eZZ_minRateCriteria_frxD01_10d(:,i),i);
    end
% parameter 02
    if sum(t_aboveMinRate_eXX_frxD02_10d(:,i)) > 0
        eXX_magAboveMinRate_frxD02_10d(eXX_minRateCriteria_frxD02_10d(:,i),i) = eXX_frxD02_10d(eXX_minRateCriteria_frxD02_10d(:,i),i);
    end
    if sum(t_aboveMinRate_eZZ_frxD02_10d(:,i)) > 0
        eZZ_magAboveMinRate_frxD02_10d(eZZ_minRateCriteria_frxD02_10d(:,i),i) = eZZ_frxD02_10d(eZZ_minRateCriteria_frxD02_10d(:,i),i);
    end
% parameter 03
    if sum(t_aboveMinRate_eXX_frxD03_10d(:,i)) > 0
        eXX_magAboveMinRate_frxD03_10d(eXX_minRateCriteria_frxD03_10d(:,i),i) = eXX_frxD03_10d(eXX_minRateCriteria_frxD03_10d(:,i),i);
    end
    if sum(t_aboveMinRate_eZZ_frxD03_10d(:,i)) > 0
        eZZ_magAboveMinRate_frxD03_10d(eZZ_minRateCriteria_frxD03_10d(:,i),i) = eZZ_frxD03_10d(eZZ_minRateCriteria_frxD03_10d(:,i),i);
    end
% parameter 04
    if sum(t_aboveMinRate_eXX_frxD04_10d(:,i)) > 0
        eXX_magAboveMinRate_frxD04_10d(eXX_minRateCriteria_frxD04_10d(:,i),i) = eXX_frxD04_10d(eXX_minRateCriteria_frxD04_10d(:,i),i);
    end
    if sum(t_aboveMinRate_eZZ_frxD04_10d(:,i)) > 0
        eZZ_magAboveMinRate_frxD04_10d(eZZ_minRateCriteria_frxD04_10d(:,i),i) = eZZ_frxD04_10d(eZZ_minRateCriteria_frxD04_10d(:,i),i);
    end
% parameter 05
    if sum(t_aboveMinRate_eXX_frxD05_10d(:,i)) > 0
        eXX_magAboveMinRate_frxD05_10d(eXX_minRateCriteria_frxD05_10d(:,i),i) = eXX_frxD05_10d(eXX_minRateCriteria_frxD05_10d(:,i),i);
    end
    if sum(t_aboveMinRate_eZZ_frxD05_10d(:,i)) > 0
        eZZ_magAboveMinRate_frxD05_10d(eZZ_minRateCriteria_frxD05_10d(:,i),i) = eZZ_frxD05_10d(eZZ_minRateCriteria_frxD05_10d(:,i),i);
    end
% parameter 06
    if sum(t_aboveMinRate_eXX_frxD06_10d(:,i)) > 0
        eXX_magAboveMinRate_frxD06_10d(eXX_minRateCriteria_frxD06_10d(:,i),i) = eXX_frxD06_10d(eXX_minRateCriteria_frxD06_10d(:,i),i);
    end
    if sum(t_aboveMinRate_eZZ_frxD06_10d(:,i)) > 0
        eZZ_magAboveMinRate_frxD06_10d(eZZ_minRateCriteria_frxD06_10d(:,i),i) = eZZ_frxD06_10d(eZZ_minRateCriteria_frxD06_10d(:,i),i);
    end
% parameter 07
    if sum(t_aboveMinRate_eXX_frxD07_10d(:,i)) > 0
        eXX_magAboveMinRate_frxD07_10d(eXX_minRateCriteria_frxD07_10d(:,i),i) = eXX_frxD07_10d(eXX_minRateCriteria_frxD07_10d(:,i),i);
    end
    if sum(t_aboveMinRate_eZZ_frxD07_10d(:,i)) > 0
        eZZ_magAboveMinRate_frxD07_10d(eZZ_minRateCriteria_frxD07_10d(:,i),i) = eZZ_frxD07_10d(eZZ_minRateCriteria_frxD07_10d(:,i),i);
    end
% parameter 08
    if sum(t_aboveMinRate_eXX_frxD08_10d(:,i)) > 0
        eXX_magAboveMinRate_frxD08_10d(eXX_minRateCriteria_frxD08_10d(:,i),i) = eXX_frxD08_10d(eXX_minRateCriteria_frxD08_10d(:,i),i);
    end
    if sum(t_aboveMinRate_eZZ_frxD08_10d(:,i)) > 0
        eZZ_magAboveMinRate_frxD08_10d(eZZ_minRateCriteria_frxD08_10d(:,i),i) = eZZ_frxD08_10d(eZZ_minRateCriteria_frxD08_10d(:,i),i);
    end
% parameter 09
    if sum(t_aboveMinRate_eXX_frxD09_10d(:,i)) > 0
        eXX_magAboveMinRate_frxD09_10d(eXX_minRateCriteria_frxD09_10d(:,i),i) = eXX_frxD09_10d(eXX_minRateCriteria_frxD09_10d(:,i),i);
    end
    if sum(t_aboveMinRate_eZZ_frxD09_10d(:,i)) > 0
        eZZ_magAboveMinRate_frxD09_10d(eZZ_minRateCriteria_frxD09_10d(:,i),i) = eZZ_frxD09_10d(eZZ_minRateCriteria_frxD09_10d(:,i),i);
    end
% parameter 10
    if sum(t_aboveMinRate_eXX_frxD10_10d(:,i)) > 0
        eXX_magAboveMinRate_frxD10_10d(eXX_minRateCriteria_frxD10_10d(:,i),i) = eXX_frxD10_10d(eXX_minRateCriteria_frxD10_10d(:,i),i);
    end
    if sum(t_aboveMinRate_eZZ_frxD10_10d(:,i)) > 0
        eZZ_magAboveMinRate_frxD10_10d(eZZ_minRateCriteria_frxD10_10d(:,i),i) = eZZ_frxD10_10d(eZZ_minRateCriteria_frxD10_10d(:,i),i);
    end
    
% ==================================================================================================== %
% Depth 50%
% ==================================================================================================== %
% parameter 01
    if sum(t_aboveMinRate_eXX_frxD01_50d(:,i)) > 0
        eXX_magAboveMinRate_frxD01_50d(eXX_minRateCriteria_frxD01_50d(:,i),i) = eXX_frxD01_50d(eXX_minRateCriteria_frxD01_50d(:,i),i);
    end
    if sum(t_aboveMinRate_eZZ_frxD01_50d(:,i)) > 0
        eZZ_magAboveMinRate_frxD01_50d(eZZ_minRateCriteria_frxD01_50d(:,i),i) = eZZ_frxD01_50d(eZZ_minRateCriteria_frxD01_50d(:,i),i);
    end
% parameter 02
    if sum(t_aboveMinRate_eXX_frxD02_50d(:,i)) > 0
        eXX_magAboveMinRate_frxD02_50d(eXX_minRateCriteria_frxD02_50d(:,i),i) = eXX_frxD02_50d(eXX_minRateCriteria_frxD02_50d(:,i),i);
    end
    if sum(t_aboveMinRate_eZZ_frxD02_50d(:,i)) > 0
        eZZ_magAboveMinRate_frxD02_50d(eZZ_minRateCriteria_frxD02_50d(:,i),i) = eZZ_frxD02_50d(eZZ_minRateCriteria_frxD02_50d(:,i),i);
    end
% parameter 03
    if sum(t_aboveMinRate_eXX_frxD03_50d(:,i)) > 0
        eXX_magAboveMinRate_frxD03_50d(eXX_minRateCriteria_frxD03_50d(:,i),i) = eXX_frxD03_50d(eXX_minRateCriteria_frxD03_50d(:,i),i);
    end
    if sum(t_aboveMinRate_eZZ_frxD03_50d(:,i)) > 0
        eZZ_magAboveMinRate_frxD03_50d(eZZ_minRateCriteria_frxD03_50d(:,i),i) = eZZ_frxD03_50d(eZZ_minRateCriteria_frxD03_50d(:,i),i);
    end
% parameter 04
    if sum(t_aboveMinRate_eXX_frxD04_50d(:,i)) > 0
        eXX_magAboveMinRate_frxD04_50d(eXX_minRateCriteria_frxD04_50d(:,i),i) = eXX_frxD04_50d(eXX_minRateCriteria_frxD04_50d(:,i),i);
    end
    if sum(t_aboveMinRate_eZZ_frxD04_50d(:,i)) > 0
        eZZ_magAboveMinRate_frxD04_50d(eZZ_minRateCriteria_frxD04_50d(:,i),i) = eZZ_frxD04_50d(eZZ_minRateCriteria_frxD04_50d(:,i),i);
    end
% parameter 05
    if sum(t_aboveMinRate_eXX_frxD05_50d(:,i)) > 0
        eXX_magAboveMinRate_frxD05_50d(eXX_minRateCriteria_frxD05_50d(:,i),i) = eXX_frxD05_50d(eXX_minRateCriteria_frxD05_50d(:,i),i);
    end
    if sum(t_aboveMinRate_eZZ_frxD05_50d(:,i)) > 0
        eZZ_magAboveMinRate_frxD05_50d(eZZ_minRateCriteria_frxD05_50d(:,i),i) = eZZ_frxD05_50d(eZZ_minRateCriteria_frxD05_50d(:,i),i);
    end
% parameter 06
    if sum(t_aboveMinRate_eXX_frxD06_50d(:,i)) > 0
        eXX_magAboveMinRate_frxD06_50d(eXX_minRateCriteria_frxD06_50d(:,i),i) = eXX_frxD06_50d(eXX_minRateCriteria_frxD06_50d(:,i),i);
    end
    if sum(t_aboveMinRate_eZZ_frxD06_50d(:,i)) > 0
        eZZ_magAboveMinRate_frxD06_50d(eZZ_minRateCriteria_frxD06_50d(:,i),i) = eZZ_frxD06_50d(eZZ_minRateCriteria_frxD06_50d(:,i),i);
    end
% parameter 07
    if sum(t_aboveMinRate_eXX_frxD07_50d(:,i)) > 0
        eXX_magAboveMinRate_frxD07_50d(eXX_minRateCriteria_frxD07_50d(:,i),i) = eXX_frxD07_50d(eXX_minRateCriteria_frxD07_50d(:,i),i);
    end
    if sum(t_aboveMinRate_eZZ_frxD07_50d(:,i)) > 0
        eZZ_magAboveMinRate_frxD07_50d(eZZ_minRateCriteria_frxD07_50d(:,i),i) = eZZ_frxD07_50d(eZZ_minRateCriteria_frxD07_50d(:,i),i);
    end
% parameter 08
    if sum(t_aboveMinRate_eXX_frxD08_50d(:,i)) > 0
        eXX_magAboveMinRate_frxD08_50d(eXX_minRateCriteria_frxD08_50d(:,i),i) = eXX_frxD08_50d(eXX_minRateCriteria_frxD08_50d(:,i),i);
    end
    if sum(t_aboveMinRate_eZZ_frxD08_50d(:,i)) > 0
        eZZ_magAboveMinRate_frxD08_50d(eZZ_minRateCriteria_frxD08_50d(:,i),i) = eZZ_frxD08_50d(eZZ_minRateCriteria_frxD08_50d(:,i),i);
    end
% parameter 09
    if sum(t_aboveMinRate_eXX_frxD09_50d(:,i)) > 0
        eXX_magAboveMinRate_frxD09_50d(eXX_minRateCriteria_frxD09_50d(:,i),i) = eXX_frxD09_50d(eXX_minRateCriteria_frxD09_50d(:,i),i);
    end
    if sum(t_aboveMinRate_eZZ_frxD09_50d(:,i)) > 0
        eZZ_magAboveMinRate_frxD09_50d(eZZ_minRateCriteria_frxD09_50d(:,i),i) = eZZ_frxD09_50d(eZZ_minRateCriteria_frxD09_50d(:,i),i);
    end
% parameter 10
    if sum(t_aboveMinRate_eXX_frxD10_50d(:,i)) > 0
        eXX_magAboveMinRate_frxD10_50d(eXX_minRateCriteria_frxD10_50d(:,i),i) = eXX_frxD10_50d(eXX_minRateCriteria_frxD10_50d(:,i),i);
    end
    if sum(t_aboveMinRate_eZZ_frxD10_50d(:,i)) > 0
        eZZ_magAboveMinRate_frxD10_50d(eZZ_minRateCriteria_frxD10_50d(:,i),i) = eZZ_frxD10_50d(eZZ_minRateCriteria_frxD10_50d(:,i),i);
    end
    
end

%% Detectable Strains

% parameter 01
eXXmeasCriteria_frxD01_01d = false(n_tSteps,n_probes);
eZZmeasCriteria_frxD01_01d = false(n_tSteps,n_probes);
eXXmeasCriteria_frxD01_03d = false(n_tSteps,n_probes);
eZZmeasCriteria_frxD01_03d = false(n_tSteps,n_probes);
eXXmeasCriteria_frxD01_05d = false(n_tSteps,n_probes);
eZZmeasCriteria_frxD01_05d = false(n_tSteps,n_probes);
eXXmeasCriteria_frxD01_10d = false(n_tSteps,n_probes);
eZZmeasCriteria_frxD01_10d = false(n_tSteps,n_probes);
eXXmeasCriteria_frxD01_50d = false(n_tSteps,n_probes);
eZZmeasCriteria_frxD01_50d = false(n_tSteps,n_probes);
% parameter 02
eXXmeasCriteria_frxD02_01d = false(n_tSteps,n_probes);
eZZmeasCriteria_frxD02_01d = false(n_tSteps,n_probes);
eXXmeasCriteria_frxD02_03d = false(n_tSteps,n_probes);
eZZmeasCriteria_frxD02_03d = false(n_tSteps,n_probes);
eXXmeasCriteria_frxD02_05d = false(n_tSteps,n_probes);
eZZmeasCriteria_frxD02_05d = false(n_tSteps,n_probes);
eXXmeasCriteria_frxD02_10d = false(n_tSteps,n_probes);
eZZmeasCriteria_frxD02_10d = false(n_tSteps,n_probes);
eXXmeasCriteria_frxD02_50d = false(n_tSteps,n_probes);
eZZmeasCriteria_frxD02_50d = false(n_tSteps,n_probes);
% parameter 03
eXXmeasCriteria_frxD03_01d = false(n_tSteps,n_probes);
eZZmeasCriteria_frxD03_01d = false(n_tSteps,n_probes);
eXXmeasCriteria_frxD03_03d = false(n_tSteps,n_probes);
eZZmeasCriteria_frxD03_03d = false(n_tSteps,n_probes);
eXXmeasCriteria_frxD03_05d = false(n_tSteps,n_probes);
eZZmeasCriteria_frxD03_05d = false(n_tSteps,n_probes);
eXXmeasCriteria_frxD03_10d = false(n_tSteps,n_probes);
eZZmeasCriteria_frxD03_10d = false(n_tSteps,n_probes);
eXXmeasCriteria_frxD03_50d = false(n_tSteps,n_probes);
eZZmeasCriteria_frxD03_50d = false(n_tSteps,n_probes);
% parameter 04
eXXmeasCriteria_frxD04_01d = false(n_tSteps,n_probes);
eZZmeasCriteria_frxD04_01d = false(n_tSteps,n_probes);
eXXmeasCriteria_frxD04_03d = false(n_tSteps,n_probes);
eZZmeasCriteria_frxD04_03d = false(n_tSteps,n_probes);
eXXmeasCriteria_frxD04_05d = false(n_tSteps,n_probes);
eZZmeasCriteria_frxD04_05d = false(n_tSteps,n_probes);
eXXmeasCriteria_frxD04_10d = false(n_tSteps,n_probes);
eZZmeasCriteria_frxD04_10d = false(n_tSteps,n_probes);
eXXmeasCriteria_frxD04_50d = false(n_tSteps,n_probes);
eZZmeasCriteria_frxD04_50d = false(n_tSteps,n_probes);
% parameter 05
eXXmeasCriteria_frxD05_01d = false(n_tSteps,n_probes);
eZZmeasCriteria_frxD05_01d = false(n_tSteps,n_probes);
eXXmeasCriteria_frxD05_03d = false(n_tSteps,n_probes);
eZZmeasCriteria_frxD05_03d = false(n_tSteps,n_probes);
eXXmeasCriteria_frxD05_05d = false(n_tSteps,n_probes);
eZZmeasCriteria_frxD05_05d = false(n_tSteps,n_probes);
eXXmeasCriteria_frxD05_10d = false(n_tSteps,n_probes);
eZZmeasCriteria_frxD05_10d = false(n_tSteps,n_probes);
eXXmeasCriteria_frxD05_50d = false(n_tSteps,n_probes);
eZZmeasCriteria_frxD05_50d = false(n_tSteps,n_probes);
% parameter 06
eXXmeasCriteria_frxD06_01d = false(n_tSteps,n_probes);
eZZmeasCriteria_frxD06_01d = false(n_tSteps,n_probes);
eXXmeasCriteria_frxD06_03d = false(n_tSteps,n_probes);
eZZmeasCriteria_frxD06_03d = false(n_tSteps,n_probes);
eXXmeasCriteria_frxD06_05d = false(n_tSteps,n_probes);
eZZmeasCriteria_frxD06_05d = false(n_tSteps,n_probes);
eXXmeasCriteria_frxD06_10d = false(n_tSteps,n_probes);
eZZmeasCriteria_frxD06_10d = false(n_tSteps,n_probes);
eXXmeasCriteria_frxD06_50d = false(n_tSteps,n_probes);
eZZmeasCriteria_frxD06_50d = false(n_tSteps,n_probes);
% parameter 07
eXXmeasCriteria_frxD07_01d = false(n_tSteps,n_probes);
eZZmeasCriteria_frxD07_01d = false(n_tSteps,n_probes);
eXXmeasCriteria_frxD07_03d = false(n_tSteps,n_probes);
eZZmeasCriteria_frxD07_03d = false(n_tSteps,n_probes);
eXXmeasCriteria_frxD07_05d = false(n_tSteps,n_probes);
eZZmeasCriteria_frxD07_05d = false(n_tSteps,n_probes);
eXXmeasCriteria_frxD07_10d = false(n_tSteps,n_probes);
eZZmeasCriteria_frxD07_10d = false(n_tSteps,n_probes);
eXXmeasCriteria_frxD07_50d = false(n_tSteps,n_probes);
eZZmeasCriteria_frxD07_50d = false(n_tSteps,n_probes);
% parameter 08
eXXmeasCriteria_frxD08_01d = false(n_tSteps,n_probes);
eZZmeasCriteria_frxD08_01d = false(n_tSteps,n_probes);
eXXmeasCriteria_frxD08_03d = false(n_tSteps,n_probes);
eZZmeasCriteria_frxD08_03d = false(n_tSteps,n_probes);
eXXmeasCriteria_frxD08_05d = false(n_tSteps,n_probes);
eZZmeasCriteria_frxD08_05d = false(n_tSteps,n_probes);
eXXmeasCriteria_frxD08_10d = false(n_tSteps,n_probes);
eZZmeasCriteria_frxD08_10d = false(n_tSteps,n_probes);
eXXmeasCriteria_frxD08_50d = false(n_tSteps,n_probes);
eZZmeasCriteria_frxD08_50d = false(n_tSteps,n_probes);
% parameter 09
eXXmeasCriteria_frxD09_01d = false(n_tSteps,n_probes);
eZZmeasCriteria_frxD09_01d = false(n_tSteps,n_probes);
eXXmeasCriteria_frxD09_03d = false(n_tSteps,n_probes);
eZZmeasCriteria_frxD09_03d = false(n_tSteps,n_probes);
eXXmeasCriteria_frxD09_05d = false(n_tSteps,n_probes);
eZZmeasCriteria_frxD09_05d = false(n_tSteps,n_probes);
eXXmeasCriteria_frxD09_10d = false(n_tSteps,n_probes);
eZZmeasCriteria_frxD09_10d = false(n_tSteps,n_probes);
eXXmeasCriteria_frxD09_50d = false(n_tSteps,n_probes);
eZZmeasCriteria_frxD09_50d = false(n_tSteps,n_probes);
% parameter 10
eXXmeasCriteria_frxD10_01d = false(n_tSteps,n_probes);
eZZmeasCriteria_frxD10_01d = false(n_tSteps,n_probes);
eXXmeasCriteria_frxD10_03d = false(n_tSteps,n_probes);
eZZmeasCriteria_frxD10_03d = false(n_tSteps,n_probes);
eXXmeasCriteria_frxD10_05d = false(n_tSteps,n_probes);
eZZmeasCriteria_frxD10_05d = false(n_tSteps,n_probes);
eXXmeasCriteria_frxD10_10d = false(n_tSteps,n_probes);
eZZmeasCriteria_frxD10_10d = false(n_tSteps,n_probes);
eXXmeasCriteria_frxD10_50d = false(n_tSteps,n_probes);
eZZmeasCriteria_frxD10_50d = false(n_tSteps,n_probes);

% ==================================================================================================== %
% Define measurement criteria
% ==================================================================================================== %
for i = 1:n_probes
% ==================================================================================================== %
% Depth 1%
% ==================================================================================================== %
% parameter 01
    eXXmeasCriteria_frxD01_01d(:,i) = (abs(eXX_magAboveMinRate_frxD01_01d(:,i)) > minMag & eXXrate_frxD01_01d(:,i) > minRate);
    eZZmeasCriteria_frxD01_01d(:,i) = (abs(eZZ_magAboveMinRate_frxD01_01d(:,i)) > minMag & eZZrate_frxD01_01d(:,i) > minRate);
% parameter 02
    eXXmeasCriteria_frxD02_01d(:,i) = (abs(eXX_magAboveMinRate_frxD02_01d(:,i)) > minMag & eXXrate_frxD02_01d(:,i) > minRate);
    eZZmeasCriteria_frxD02_01d(:,i) = (abs(eZZ_magAboveMinRate_frxD02_01d(:,i)) > minMag & eZZrate_frxD02_01d(:,i) > minRate);
% parameter 03
    eXXmeasCriteria_frxD03_01d(:,i) = (abs(eXX_magAboveMinRate_frxD03_01d(:,i)) > minMag & eXXrate_frxD03_01d(:,i) > minRate);
    eZZmeasCriteria_frxD03_01d(:,i) = (abs(eZZ_magAboveMinRate_frxD03_01d(:,i)) > minMag & eZZrate_frxD03_01d(:,i) > minRate);
% parameter 04
    eXXmeasCriteria_frxD04_01d(:,i) = (abs(eXX_magAboveMinRate_frxD04_01d(:,i)) > minMag & eXXrate_frxD04_01d(:,i) > minRate);
    eZZmeasCriteria_frxD04_01d(:,i) = (abs(eZZ_magAboveMinRate_frxD04_01d(:,i)) > minMag & eZZrate_frxD04_01d(:,i) > minRate);
% parameter 05
    eXXmeasCriteria_frxD05_01d(:,i) = (abs(eXX_magAboveMinRate_frxD05_01d(:,i)) > minMag & eXXrate_frxD05_01d(:,i) > minRate);
    eZZmeasCriteria_frxD05_01d(:,i) = (abs(eZZ_magAboveMinRate_frxD05_01d(:,i)) > minMag & eZZrate_frxD05_01d(:,i) > minRate);
% parameter 06
    eXXmeasCriteria_frxD06_01d(:,i) = (abs(eXX_magAboveMinRate_frxD06_01d(:,i)) > minMag & eXXrate_frxD06_01d(:,i) > minRate);
    eZZmeasCriteria_frxD06_01d(:,i) = (abs(eZZ_magAboveMinRate_frxD06_01d(:,i)) > minMag & eZZrate_frxD06_01d(:,i) > minRate);
% parameter 07
    eXXmeasCriteria_frxD07_01d(:,i) = (abs(eXX_magAboveMinRate_frxD07_01d(:,i)) > minMag & eXXrate_frxD07_01d(:,i) > minRate);
    eZZmeasCriteria_frxD07_01d(:,i) = (abs(eZZ_magAboveMinRate_frxD07_01d(:,i)) > minMag & eZZrate_frxD07_01d(:,i) > minRate);
% parameter 08
    eXXmeasCriteria_frxD08_01d(:,i) = (abs(eXX_magAboveMinRate_frxD08_01d(:,i)) > minMag & eXXrate_frxD08_01d(:,i) > minRate);
    eZZmeasCriteria_frxD08_01d(:,i) = (abs(eZZ_magAboveMinRate_frxD08_01d(:,i)) > minMag & eZZrate_frxD08_01d(:,i) > minRate);
% parameter 09
    eXXmeasCriteria_frxD09_01d(:,i) = (abs(eXX_magAboveMinRate_frxD09_01d(:,i)) > minMag & eXXrate_frxD09_01d(:,i) > minRate);
    eZZmeasCriteria_frxD09_01d(:,i) = (abs(eZZ_magAboveMinRate_frxD09_01d(:,i)) > minMag & eZZrate_frxD09_01d(:,i) > minRate);
% parameter 10
    eXXmeasCriteria_frxD10_01d(:,i) = (abs(eXX_magAboveMinRate_frxD10_01d(:,i)) > minMag & eXXrate_frxD10_01d(:,i) > minRate);
    eZZmeasCriteria_frxD10_01d(:,i) = (abs(eZZ_magAboveMinRate_frxD10_01d(:,i)) > minMag & eZZrate_frxD10_01d(:,i) > minRate);
    
% ==================================================================================================== %
% Depth 3%
% ==================================================================================================== %
% parameter 01
    eXXmeasCriteria_frxD01_03d(:,i) = (abs(eXX_magAboveMinRate_frxD01_03d(:,i)) > minMag & eXXrate_frxD01_03d(:,i) > minRate);
    eZZmeasCriteria_frxD01_03d(:,i) = (abs(eZZ_magAboveMinRate_frxD01_03d(:,i)) > minMag & eZZrate_frxD01_03d(:,i) > minRate);
% parameter 02
    eXXmeasCriteria_frxD02_03d(:,i) = (abs(eXX_magAboveMinRate_frxD02_03d(:,i)) > minMag & eXXrate_frxD02_03d(:,i) > minRate);
    eZZmeasCriteria_frxD02_03d(:,i) = (abs(eZZ_magAboveMinRate_frxD02_03d(:,i)) > minMag & eZZrate_frxD02_03d(:,i) > minRate);
% parameter 03
    eXXmeasCriteria_frxD03_03d(:,i) = (abs(eXX_magAboveMinRate_frxD03_03d(:,i)) > minMag & eXXrate_frxD03_03d(:,i) > minRate);
    eZZmeasCriteria_frxD03_03d(:,i) = (abs(eZZ_magAboveMinRate_frxD03_03d(:,i)) > minMag & eZZrate_frxD03_03d(:,i) > minRate);
% parameter 04
    eXXmeasCriteria_frxD04_03d(:,i) = (abs(eXX_magAboveMinRate_frxD04_03d(:,i)) > minMag & eXXrate_frxD04_03d(:,i) > minRate);
    eZZmeasCriteria_frxD04_03d(:,i) = (abs(eZZ_magAboveMinRate_frxD04_03d(:,i)) > minMag & eZZrate_frxD04_03d(:,i) > minRate);
% parameter 05
    eXXmeasCriteria_frxD05_03d(:,i) = (abs(eXX_magAboveMinRate_frxD05_03d(:,i)) > minMag & eXXrate_frxD05_03d(:,i) > minRate);
    eZZmeasCriteria_frxD05_03d(:,i) = (abs(eZZ_magAboveMinRate_frxD05_03d(:,i)) > minMag & eZZrate_frxD05_03d(:,i) > minRate);
% parameter 06
    eXXmeasCriteria_frxD06_03d(:,i) = (abs(eXX_magAboveMinRate_frxD06_03d(:,i)) > minMag & eXXrate_frxD06_03d(:,i) > minRate);
    eZZmeasCriteria_frxD06_03d(:,i) = (abs(eZZ_magAboveMinRate_frxD06_03d(:,i)) > minMag & eZZrate_frxD06_03d(:,i) > minRate);
% parameter 07
    eXXmeasCriteria_frxD07_03d(:,i) = (abs(eXX_magAboveMinRate_frxD07_03d(:,i)) > minMag & eXXrate_frxD07_03d(:,i) > minRate);
    eZZmeasCriteria_frxD07_03d(:,i) = (abs(eZZ_magAboveMinRate_frxD07_03d(:,i)) > minMag & eZZrate_frxD07_03d(:,i) > minRate);
% parameter 08
    eXXmeasCriteria_frxD08_03d(:,i) = (abs(eXX_magAboveMinRate_frxD08_03d(:,i)) > minMag & eXXrate_frxD08_03d(:,i) > minRate);
    eZZmeasCriteria_frxD08_03d(:,i) = (abs(eZZ_magAboveMinRate_frxD08_03d(:,i)) > minMag & eZZrate_frxD08_03d(:,i) > minRate);
% parameter 09
    eXXmeasCriteria_frxD09_03d(:,i) = (abs(eXX_magAboveMinRate_frxD09_03d(:,i)) > minMag & eXXrate_frxD09_03d(:,i) > minRate);
    eZZmeasCriteria_frxD09_03d(:,i) = (abs(eZZ_magAboveMinRate_frxD09_03d(:,i)) > minMag & eZZrate_frxD09_03d(:,i) > minRate);
% parameter 10
    eXXmeasCriteria_frxD10_03d(:,i) = (abs(eXX_magAboveMinRate_frxD10_03d(:,i)) > minMag & eXXrate_frxD10_03d(:,i) > minRate);
    eZZmeasCriteria_frxD10_03d(:,i) = (abs(eZZ_magAboveMinRate_frxD10_03d(:,i)) > minMag & eZZrate_frxD10_03d(:,i) > minRate);
    
% ==================================================================================================== %
% Depth 5%
% ==================================================================================================== %
% parameter 01
    eXXmeasCriteria_frxD01_05d(:,i) = (abs(eXX_magAboveMinRate_frxD01_05d(:,i)) > minMag & eXXrate_frxD01_05d(:,i) > minRate);
    eZZmeasCriteria_frxD01_05d(:,i) = (abs(eZZ_magAboveMinRate_frxD01_05d(:,i)) > minMag & eZZrate_frxD01_05d(:,i) > minRate);
% parameter 02
    eXXmeasCriteria_frxD02_05d(:,i) = (abs(eXX_magAboveMinRate_frxD02_05d(:,i)) > minMag & eXXrate_frxD02_05d(:,i) > minRate);
    eZZmeasCriteria_frxD02_05d(:,i) = (abs(eZZ_magAboveMinRate_frxD02_05d(:,i)) > minMag & eZZrate_frxD02_05d(:,i) > minRate);
% parameter 03
    eXXmeasCriteria_frxD03_05d(:,i) = (abs(eXX_magAboveMinRate_frxD03_05d(:,i)) > minMag & eXXrate_frxD03_05d(:,i) > minRate);
    eZZmeasCriteria_frxD03_05d(:,i) = (abs(eZZ_magAboveMinRate_frxD03_05d(:,i)) > minMag & eZZrate_frxD03_05d(:,i) > minRate);
% parameter 04
    eXXmeasCriteria_frxD04_05d(:,i) = (abs(eXX_magAboveMinRate_frxD04_05d(:,i)) > minMag & eXXrate_frxD04_05d(:,i) > minRate);
    eZZmeasCriteria_frxD04_05d(:,i) = (abs(eZZ_magAboveMinRate_frxD04_05d(:,i)) > minMag & eZZrate_frxD04_05d(:,i) > minRate);
% parameter 05
    eXXmeasCriteria_frxD05_05d(:,i) = (abs(eXX_magAboveMinRate_frxD05_05d(:,i)) > minMag & eXXrate_frxD05_05d(:,i) > minRate);
    eZZmeasCriteria_frxD05_05d(:,i) = (abs(eZZ_magAboveMinRate_frxD05_05d(:,i)) > minMag & eZZrate_frxD05_05d(:,i) > minRate);
% parameter 06
    eXXmeasCriteria_frxD06_05d(:,i) = (abs(eXX_magAboveMinRate_frxD06_05d(:,i)) > minMag & eXXrate_frxD06_05d(:,i) > minRate);
    eZZmeasCriteria_frxD06_05d(:,i) = (abs(eZZ_magAboveMinRate_frxD06_05d(:,i)) > minMag & eZZrate_frxD06_05d(:,i) > minRate);
% parameter 07
    eXXmeasCriteria_frxD07_05d(:,i) = (abs(eXX_magAboveMinRate_frxD07_05d(:,i)) > minMag & eXXrate_frxD07_05d(:,i) > minRate);
    eZZmeasCriteria_frxD07_05d(:,i) = (abs(eZZ_magAboveMinRate_frxD07_05d(:,i)) > minMag & eZZrate_frxD07_05d(:,i) > minRate);
% parameter 08
    eXXmeasCriteria_frxD08_05d(:,i) = (abs(eXX_magAboveMinRate_frxD08_05d(:,i)) > minMag & eXXrate_frxD08_05d(:,i) > minRate);
    eZZmeasCriteria_frxD08_05d(:,i) = (abs(eZZ_magAboveMinRate_frxD08_05d(:,i)) > minMag & eZZrate_frxD08_05d(:,i) > minRate);
% parameter 09
    eXXmeasCriteria_frxD09_05d(:,i) = (abs(eXX_magAboveMinRate_frxD09_05d(:,i)) > minMag & eXXrate_frxD09_05d(:,i) > minRate);
    eZZmeasCriteria_frxD09_05d(:,i) = (abs(eZZ_magAboveMinRate_frxD09_05d(:,i)) > minMag & eZZrate_frxD09_05d(:,i) > minRate);
% parameter 10
    eXXmeasCriteria_frxD10_05d(:,i) = (abs(eXX_magAboveMinRate_frxD10_05d(:,i)) > minMag & eXXrate_frxD10_05d(:,i) > minRate);
    eZZmeasCriteria_frxD10_05d(:,i) = (abs(eZZ_magAboveMinRate_frxD10_05d(:,i)) > minMag & eZZrate_frxD10_05d(:,i) > minRate);
    
% ==================================================================================================== %
% Depth 10%
% ==================================================================================================== %
% parameter 01
    eXXmeasCriteria_frxD01_10d(:,i) = (abs(eXX_magAboveMinRate_frxD01_10d(:,i)) > minMag & eXXrate_frxD01_10d(:,i) > minRate);
    eZZmeasCriteria_frxD01_10d(:,i) = (abs(eZZ_magAboveMinRate_frxD01_10d(:,i)) > minMag & eZZrate_frxD01_10d(:,i) > minRate);
% parameter 02
    eXXmeasCriteria_frxD02_10d(:,i) = (abs(eXX_magAboveMinRate_frxD02_10d(:,i)) > minMag & eXXrate_frxD02_10d(:,i) > minRate);
    eZZmeasCriteria_frxD02_10d(:,i) = (abs(eZZ_magAboveMinRate_frxD02_10d(:,i)) > minMag & eZZrate_frxD02_10d(:,i) > minRate);
% parameter 03
    eXXmeasCriteria_frxD03_10d(:,i) = (abs(eXX_magAboveMinRate_frxD03_10d(:,i)) > minMag & eXXrate_frxD03_10d(:,i) > minRate);
    eZZmeasCriteria_frxD03_10d(:,i) = (abs(eZZ_magAboveMinRate_frxD03_10d(:,i)) > minMag & eZZrate_frxD03_10d(:,i) > minRate);
% parameter 04
    eXXmeasCriteria_frxD04_10d(:,i) = (abs(eXX_magAboveMinRate_frxD04_10d(:,i)) > minMag & eXXrate_frxD04_10d(:,i) > minRate);
    eZZmeasCriteria_frxD04_10d(:,i) = (abs(eZZ_magAboveMinRate_frxD04_10d(:,i)) > minMag & eZZrate_frxD04_10d(:,i) > minRate);
% parameter 05
    eXXmeasCriteria_frxD05_10d(:,i) = (abs(eXX_magAboveMinRate_frxD05_10d(:,i)) > minMag & eXXrate_frxD05_10d(:,i) > minRate);
    eZZmeasCriteria_frxD05_10d(:,i) = (abs(eZZ_magAboveMinRate_frxD05_10d(:,i)) > minMag & eZZrate_frxD05_10d(:,i) > minRate);
% parameter 06
    eXXmeasCriteria_frxD06_10d(:,i) = (abs(eXX_magAboveMinRate_frxD06_10d(:,i)) > minMag & eXXrate_frxD06_10d(:,i) > minRate);
    eZZmeasCriteria_frxD06_10d(:,i) = (abs(eZZ_magAboveMinRate_frxD06_10d(:,i)) > minMag & eZZrate_frxD06_10d(:,i) > minRate);
% parameter 07
    eXXmeasCriteria_frxD07_10d(:,i) = (abs(eXX_magAboveMinRate_frxD07_10d(:,i)) > minMag & eXXrate_frxD07_10d(:,i) > minRate);
    eZZmeasCriteria_frxD07_10d(:,i) = (abs(eZZ_magAboveMinRate_frxD07_10d(:,i)) > minMag & eZZrate_frxD07_10d(:,i) > minRate);
% parameter 08
    eXXmeasCriteria_frxD08_10d(:,i) = (abs(eXX_magAboveMinRate_frxD08_10d(:,i)) > minMag & eXXrate_frxD08_10d(:,i) > minRate);
    eZZmeasCriteria_frxD08_10d(:,i) = (abs(eZZ_magAboveMinRate_frxD08_10d(:,i)) > minMag & eZZrate_frxD08_10d(:,i) > minRate);
% parameter 09
    eXXmeasCriteria_frxD09_10d(:,i) = (abs(eXX_magAboveMinRate_frxD09_10d(:,i)) > minMag & eXXrate_frxD09_10d(:,i) > minRate);
    eZZmeasCriteria_frxD09_10d(:,i) = (abs(eZZ_magAboveMinRate_frxD09_10d(:,i)) > minMag & eZZrate_frxD09_10d(:,i) > minRate);
% parameter 10
    eXXmeasCriteria_frxD10_10d(:,i) = (abs(eXX_magAboveMinRate_frxD10_10d(:,i)) > minMag & eXXrate_frxD10_10d(:,i) > minRate);
    eZZmeasCriteria_frxD10_10d(:,i) = (abs(eZZ_magAboveMinRate_frxD10_10d(:,i)) > minMag & eZZrate_frxD10_10d(:,i) > minRate);
    
% ==================================================================================================== %
% Depth 50%
% ==================================================================================================== %
% parameter 01
    eXXmeasCriteria_frxD01_50d(:,i) = (abs(eXX_magAboveMinRate_frxD01_50d(:,i)) > minMag & eXXrate_frxD01_50d(:,i) > minRate);
    eZZmeasCriteria_frxD01_50d(:,i) = (abs(eZZ_magAboveMinRate_frxD01_50d(:,i)) > minMag & eZZrate_frxD01_50d(:,i) > minRate);
% parameter 02
    eXXmeasCriteria_frxD02_50d(:,i) = (abs(eXX_magAboveMinRate_frxD02_50d(:,i)) > minMag & eXXrate_frxD02_50d(:,i) > minRate);
    eZZmeasCriteria_frxD02_50d(:,i) = (abs(eZZ_magAboveMinRate_frxD02_50d(:,i)) > minMag & eZZrate_frxD02_50d(:,i) > minRate);
% parameter 03
    eXXmeasCriteria_frxD03_50d(:,i) = (abs(eXX_magAboveMinRate_frxD03_50d(:,i)) > minMag & eXXrate_frxD03_50d(:,i) > minRate);
    eZZmeasCriteria_frxD03_50d(:,i) = (abs(eZZ_magAboveMinRate_frxD03_50d(:,i)) > minMag & eZZrate_frxD03_50d(:,i) > minRate);
% parameter 04
    eXXmeasCriteria_frxD04_50d(:,i) = (abs(eXX_magAboveMinRate_frxD04_50d(:,i)) > minMag & eXXrate_frxD04_50d(:,i) > minRate);
    eZZmeasCriteria_frxD04_50d(:,i) = (abs(eZZ_magAboveMinRate_frxD04_50d(:,i)) > minMag & eZZrate_frxD04_50d(:,i) > minRate);
% parameter 05
    eXXmeasCriteria_frxD05_50d(:,i) = (abs(eXX_magAboveMinRate_frxD05_50d(:,i)) > minMag & eXXrate_frxD05_50d(:,i) > minRate);
    eZZmeasCriteria_frxD05_50d(:,i) = (abs(eZZ_magAboveMinRate_frxD05_50d(:,i)) > minMag & eZZrate_frxD05_50d(:,i) > minRate);
% parameter 06
    eXXmeasCriteria_frxD06_50d(:,i) = (abs(eXX_magAboveMinRate_frxD06_50d(:,i)) > minMag & eXXrate_frxD06_50d(:,i) > minRate);
    eZZmeasCriteria_frxD06_50d(:,i) = (abs(eZZ_magAboveMinRate_frxD06_50d(:,i)) > minMag & eZZrate_frxD06_50d(:,i) > minRate);
% parameter 07
    eXXmeasCriteria_frxD07_50d(:,i) = (abs(eXX_magAboveMinRate_frxD07_50d(:,i)) > minMag & eXXrate_frxD07_50d(:,i) > minRate);
    eZZmeasCriteria_frxD07_50d(:,i) = (abs(eZZ_magAboveMinRate_frxD07_50d(:,i)) > minMag & eZZrate_frxD07_50d(:,i) > minRate);
% parameter 08
    eXXmeasCriteria_frxD08_50d(:,i) = (abs(eXX_magAboveMinRate_frxD08_50d(:,i)) > minMag & eXXrate_frxD08_50d(:,i) > minRate);
    eZZmeasCriteria_frxD08_50d(:,i) = (abs(eZZ_magAboveMinRate_frxD08_50d(:,i)) > minMag & eZZrate_frxD08_50d(:,i) > minRate);
% parameter 09
    eXXmeasCriteria_frxD09_50d(:,i) = (abs(eXX_magAboveMinRate_frxD09_50d(:,i)) > minMag & eXXrate_frxD09_50d(:,i) > minRate);
    eZZmeasCriteria_frxD09_50d(:,i) = (abs(eZZ_magAboveMinRate_frxD09_50d(:,i)) > minMag & eZZrate_frxD09_50d(:,i) > minRate);
% parameter 10
    eXXmeasCriteria_frxD10_50d(:,i) = (abs(eXX_magAboveMinRate_frxD10_50d(:,i)) > minMag & eXXrate_frxD10_50d(:,i) > minRate);
    eZZmeasCriteria_frxD10_50d(:,i) = (abs(eZZ_magAboveMinRate_frxD10_50d(:,i)) > minMag & eZZrate_frxD10_50d(:,i) > minRate);
    
end

% ==================================================================================================== %
% Detectable Strains
% ==================================================================================================== %
% parameter 01
eXX_detectable_frxD01_01d = NaN(n_tSteps,n_probes);
eZZ_detectable_frxD01_01d = NaN(n_tSteps,n_probes);
eXX_detectable_frxD01_03d = NaN(n_tSteps,n_probes);
eZZ_detectable_frxD01_03d = NaN(n_tSteps,n_probes);
eXX_detectable_frxD01_05d = NaN(n_tSteps,n_probes);
eZZ_detectable_frxD01_05d = NaN(n_tSteps,n_probes);
eXX_detectable_frxD01_10d = NaN(n_tSteps,n_probes);
eZZ_detectable_frxD01_10d = NaN(n_tSteps,n_probes);
eXX_detectable_frxD01_50d = NaN(n_tSteps,n_probes);
eZZ_detectable_frxD01_50d = NaN(n_tSteps,n_probes);
% parameter 02
eXX_detectable_frxD02_01d = NaN(n_tSteps,n_probes);
eZZ_detectable_frxD02_01d = NaN(n_tSteps,n_probes);
eXX_detectable_frxD02_03d = NaN(n_tSteps,n_probes);
eZZ_detectable_frxD02_03d = NaN(n_tSteps,n_probes);
eXX_detectable_frxD02_05d = NaN(n_tSteps,n_probes);
eZZ_detectable_frxD02_05d = NaN(n_tSteps,n_probes);
eXX_detectable_frxD02_10d = NaN(n_tSteps,n_probes);
eZZ_detectable_frxD02_10d = NaN(n_tSteps,n_probes);
eXX_detectable_frxD02_50d = NaN(n_tSteps,n_probes);
eZZ_detectable_frxD02_50d = NaN(n_tSteps,n_probes);
% parameter 03
eXX_detectable_frxD03_01d = NaN(n_tSteps,n_probes);
eZZ_detectable_frxD03_01d = NaN(n_tSteps,n_probes);
eXX_detectable_frxD03_03d = NaN(n_tSteps,n_probes);
eZZ_detectable_frxD03_03d = NaN(n_tSteps,n_probes);
eXX_detectable_frxD03_05d = NaN(n_tSteps,n_probes);
eZZ_detectable_frxD03_05d = NaN(n_tSteps,n_probes);
eXX_detectable_frxD03_10d = NaN(n_tSteps,n_probes);
eZZ_detectable_frxD03_10d = NaN(n_tSteps,n_probes);
eXX_detectable_frxD03_50d = NaN(n_tSteps,n_probes);
eZZ_detectable_frxD03_50d = NaN(n_tSteps,n_probes);
% parameter 04
eXX_detectable_frxD04_01d = NaN(n_tSteps,n_probes);
eZZ_detectable_frxD04_01d = NaN(n_tSteps,n_probes);
eXX_detectable_frxD04_03d = NaN(n_tSteps,n_probes);
eZZ_detectable_frxD04_03d = NaN(n_tSteps,n_probes);
eXX_detectable_frxD04_05d = NaN(n_tSteps,n_probes);
eZZ_detectable_frxD04_05d = NaN(n_tSteps,n_probes);
eXX_detectable_frxD04_10d = NaN(n_tSteps,n_probes);
eZZ_detectable_frxD04_10d = NaN(n_tSteps,n_probes);
eXX_detectable_frxD04_50d = NaN(n_tSteps,n_probes);
eZZ_detectable_frxD04_50d = NaN(n_tSteps,n_probes);
% parameter 05
eXX_detectable_frxD05_01d = NaN(n_tSteps,n_probes);
eZZ_detectable_frxD05_01d = NaN(n_tSteps,n_probes);
eXX_detectable_frxD05_03d = NaN(n_tSteps,n_probes);
eZZ_detectable_frxD05_03d = NaN(n_tSteps,n_probes);
eXX_detectable_frxD05_05d = NaN(n_tSteps,n_probes);
eZZ_detectable_frxD05_05d = NaN(n_tSteps,n_probes);
eXX_detectable_frxD05_10d = NaN(n_tSteps,n_probes);
eZZ_detectable_frxD05_10d = NaN(n_tSteps,n_probes);
eXX_detectable_frxD05_50d = NaN(n_tSteps,n_probes);
eZZ_detectable_frxD05_50d = NaN(n_tSteps,n_probes);
% parameter 06
eXX_detectable_frxD06_01d = NaN(n_tSteps,n_probes);
eZZ_detectable_frxD06_01d = NaN(n_tSteps,n_probes);
eXX_detectable_frxD06_03d = NaN(n_tSteps,n_probes);
eZZ_detectable_frxD06_03d = NaN(n_tSteps,n_probes);
eXX_detectable_frxD06_05d = NaN(n_tSteps,n_probes);
eZZ_detectable_frxD06_05d = NaN(n_tSteps,n_probes);
eXX_detectable_frxD06_10d = NaN(n_tSteps,n_probes);
eZZ_detectable_frxD06_10d = NaN(n_tSteps,n_probes);
eXX_detectable_frxD06_50d = NaN(n_tSteps,n_probes);
eZZ_detectable_frxD06_50d = NaN(n_tSteps,n_probes);
% parameter 07
eXX_detectable_frxD07_01d = NaN(n_tSteps,n_probes);
eZZ_detectable_frxD07_01d = NaN(n_tSteps,n_probes);
eXX_detectable_frxD07_03d = NaN(n_tSteps,n_probes);
eZZ_detectable_frxD07_03d = NaN(n_tSteps,n_probes);
eXX_detectable_frxD07_05d = NaN(n_tSteps,n_probes);
eZZ_detectable_frxD07_05d = NaN(n_tSteps,n_probes);
eXX_detectable_frxD07_10d = NaN(n_tSteps,n_probes);
eZZ_detectable_frxD07_10d = NaN(n_tSteps,n_probes);
eXX_detectable_frxD07_50d = NaN(n_tSteps,n_probes);
eZZ_detectable_frxD07_50d = NaN(n_tSteps,n_probes);
% parameter 08
eXX_detectable_frxD08_01d = NaN(n_tSteps,n_probes);
eZZ_detectable_frxD08_01d = NaN(n_tSteps,n_probes);
eXX_detectable_frxD08_03d = NaN(n_tSteps,n_probes);
eZZ_detectable_frxD08_03d = NaN(n_tSteps,n_probes);
eXX_detectable_frxD08_05d = NaN(n_tSteps,n_probes);
eZZ_detectable_frxD08_05d = NaN(n_tSteps,n_probes);
eXX_detectable_frxD08_10d = NaN(n_tSteps,n_probes);
eZZ_detectable_frxD08_10d = NaN(n_tSteps,n_probes);
eXX_detectable_frxD08_50d = NaN(n_tSteps,n_probes);
eZZ_detectable_frxD08_50d = NaN(n_tSteps,n_probes);
% parameter 09
eXX_detectable_frxD09_01d = NaN(n_tSteps,n_probes);
eZZ_detectable_frxD09_01d = NaN(n_tSteps,n_probes);
eXX_detectable_frxD09_03d = NaN(n_tSteps,n_probes);
eZZ_detectable_frxD09_03d = NaN(n_tSteps,n_probes);
eXX_detectable_frxD09_05d = NaN(n_tSteps,n_probes);
eZZ_detectable_frxD09_05d = NaN(n_tSteps,n_probes);
eXX_detectable_frxD09_10d = NaN(n_tSteps,n_probes);
eZZ_detectable_frxD09_10d = NaN(n_tSteps,n_probes);
eXX_detectable_frxD09_50d = NaN(n_tSteps,n_probes);
eZZ_detectable_frxD09_50d = NaN(n_tSteps,n_probes);
% parameter 10
eXX_detectable_frxD10_01d = NaN(n_tSteps,n_probes);
eZZ_detectable_frxD10_01d = NaN(n_tSteps,n_probes);
eXX_detectable_frxD10_03d = NaN(n_tSteps,n_probes);
eZZ_detectable_frxD10_03d = NaN(n_tSteps,n_probes);
eXX_detectable_frxD10_05d = NaN(n_tSteps,n_probes);
eZZ_detectable_frxD10_05d = NaN(n_tSteps,n_probes);
eXX_detectable_frxD10_10d = NaN(n_tSteps,n_probes);
eZZ_detectable_frxD10_10d = NaN(n_tSteps,n_probes);
eXX_detectable_frxD10_50d = NaN(n_tSteps,n_probes);
eZZ_detectable_frxD10_50d = NaN(n_tSteps,n_probes);

for i = 1:size(eXXmeasCriteria_frxD01_01d,2)
% ==================================================================================================== %
% Depth 1%
% ==================================================================================================== %
% parameter 01
    if sum(eXXmeasCriteria_frxD01_01d(:,i)) > 0
        eXX_detectable_frxD01_01d((eXXmeasCriteria_frxD01_01d(:,i)),i) = eXX_frxD01_01d((eXXmeasCriteria_frxD01_01d(:,i)),i);
    end
    if sum(eZZmeasCriteria_frxD01_01d(:,i)) > 0
        eZZ_detectable_frxD01_01d((eZZmeasCriteria_frxD01_01d(:,i)),i) = eZZ_frxD01_01d((eZZmeasCriteria_frxD01_01d(:,i)),i);
    end
% parameter 02
    if sum(eXXmeasCriteria_frxD02_01d(:,i)) > 0
        eXX_detectable_frxD02_01d((eXXmeasCriteria_frxD02_01d(:,i)),i) = eXX_frxD02_01d((eXXmeasCriteria_frxD02_01d(:,i)),i);
    end
    if sum(eZZmeasCriteria_frxD02_01d(:,i)) > 0
        eZZ_detectable_frxD02_01d((eZZmeasCriteria_frxD02_01d(:,i)),i) = eZZ_frxD02_01d((eZZmeasCriteria_frxD02_01d(:,i)),i);
    end
% parameter 03
    if sum(eXXmeasCriteria_frxD03_01d(:,i)) > 0
        eXX_detectable_frxD03_01d((eXXmeasCriteria_frxD03_01d(:,i)),i) = eXX_frxD03_01d((eXXmeasCriteria_frxD03_01d(:,i)),i);
    end
    if sum(eZZmeasCriteria_frxD03_01d(:,i)) > 0
        eZZ_detectable_frxD03_01d((eZZmeasCriteria_frxD03_01d(:,i)),i) = eZZ_frxD03_01d((eZZmeasCriteria_frxD03_01d(:,i)),i);
    end
% parameter 04
    if sum(eXXmeasCriteria_frxD04_01d(:,i)) > 0
        eXX_detectable_frxD04_01d((eXXmeasCriteria_frxD04_01d(:,i)),i) = eXX_frxD04_01d((eXXmeasCriteria_frxD04_01d(:,i)),i);
    end
    if sum(eZZmeasCriteria_frxD04_01d(:,i)) > 0
        eZZ_detectable_frxD04_01d((eZZmeasCriteria_frxD04_01d(:,i)),i) = eZZ_frxD04_01d((eZZmeasCriteria_frxD04_01d(:,i)),i);
    end
% parameter 05
    if sum(eXXmeasCriteria_frxD05_01d(:,i)) > 0
        eXX_detectable_frxD05_01d((eXXmeasCriteria_frxD05_01d(:,i)),i) = eXX_frxD05_01d((eXXmeasCriteria_frxD05_01d(:,i)),i);
    end
    if sum(eZZmeasCriteria_frxD05_01d(:,i)) > 0
        eZZ_detectable_frxD05_01d((eZZmeasCriteria_frxD05_01d(:,i)),i) = eZZ_frxD05_01d((eZZmeasCriteria_frxD05_01d(:,i)),i);
    end
% parameter 06
    if sum(eXXmeasCriteria_frxD06_01d(:,i)) > 0
        eXX_detectable_frxD06_01d((eXXmeasCriteria_frxD06_01d(:,i)),i) = eXX_frxD06_01d((eXXmeasCriteria_frxD06_01d(:,i)),i);
    end
    if sum(eZZmeasCriteria_frxD06_01d(:,i)) > 0
        eZZ_detectable_frxD06_01d((eZZmeasCriteria_frxD06_01d(:,i)),i) = eZZ_frxD06_01d((eZZmeasCriteria_frxD06_01d(:,i)),i);
    end
% parameter 07
    if sum(eXXmeasCriteria_frxD07_01d(:,i)) > 0
        eXX_detectable_frxD07_01d((eXXmeasCriteria_frxD07_01d(:,i)),i) = eXX_frxD07_01d((eXXmeasCriteria_frxD07_01d(:,i)),i);
    end
    if sum(eZZmeasCriteria_frxD07_01d(:,i)) > 0
        eZZ_detectable_frxD07_01d((eZZmeasCriteria_frxD07_01d(:,i)),i) = eZZ_frxD07_01d((eZZmeasCriteria_frxD07_01d(:,i)),i);
    end
% parameter 08
    if sum(eXXmeasCriteria_frxD08_01d(:,i)) > 0
        eXX_detectable_frxD08_01d((eXXmeasCriteria_frxD08_01d(:,i)),i) = eXX_frxD08_01d((eXXmeasCriteria_frxD08_01d(:,i)),i);
    end
    if sum(eZZmeasCriteria_frxD08_01d(:,i)) > 0
        eZZ_detectable_frxD08_01d((eZZmeasCriteria_frxD08_01d(:,i)),i) = eZZ_frxD08_01d((eZZmeasCriteria_frxD08_01d(:,i)),i);
    end
% parameter 09
    if sum(eXXmeasCriteria_frxD09_01d(:,i)) > 0
        eXX_detectable_frxD09_01d((eXXmeasCriteria_frxD09_01d(:,i)),i) = eXX_frxD09_01d((eXXmeasCriteria_frxD09_01d(:,i)),i);
    end
    if sum(eZZmeasCriteria_frxD09_01d(:,i)) > 0
        eZZ_detectable_frxD09_01d((eZZmeasCriteria_frxD09_01d(:,i)),i) = eZZ_frxD09_01d((eZZmeasCriteria_frxD09_01d(:,i)),i);
    end
% parameter 10
    if sum(eXXmeasCriteria_frxD10_01d(:,i)) > 0
        eXX_detectable_frxD10_01d((eXXmeasCriteria_frxD10_01d(:,i)),i) = eXX_frxD10_01d((eXXmeasCriteria_frxD10_01d(:,i)),i);
    end
    if sum(eZZmeasCriteria_frxD10_01d(:,i)) > 0
        eZZ_detectable_frxD10_01d((eZZmeasCriteria_frxD10_01d(:,i)),i) = eZZ_frxD10_01d((eZZmeasCriteria_frxD10_01d(:,i)),i);
    end
    
% ==================================================================================================== %
% Depth 3%
% ==================================================================================================== %
% parameter 01
    if sum(eXXmeasCriteria_frxD01_03d(:,i)) > 0
        eXX_detectable_frxD01_03d((eXXmeasCriteria_frxD01_03d(:,i)),i) = eXX_frxD01_03d((eXXmeasCriteria_frxD01_03d(:,i)),i);
    end
    if sum(eZZmeasCriteria_frxD01_03d(:,i)) > 0
        eZZ_detectable_frxD01_03d((eZZmeasCriteria_frxD01_03d(:,i)),i) = eZZ_frxD01_03d((eZZmeasCriteria_frxD01_03d(:,i)),i);
    end
% parameter 02
    if sum(eXXmeasCriteria_frxD02_03d(:,i)) > 0
        eXX_detectable_frxD02_03d((eXXmeasCriteria_frxD02_03d(:,i)),i) = eXX_frxD02_03d((eXXmeasCriteria_frxD02_03d(:,i)),i);
    end
    if sum(eZZmeasCriteria_frxD02_03d(:,i)) > 0
        eZZ_detectable_frxD02_03d((eZZmeasCriteria_frxD02_03d(:,i)),i) = eZZ_frxD02_03d((eZZmeasCriteria_frxD02_03d(:,i)),i);
    end
% parameter 03
    if sum(eXXmeasCriteria_frxD03_03d(:,i)) > 0
        eXX_detectable_frxD03_03d((eXXmeasCriteria_frxD03_03d(:,i)),i) = eXX_frxD03_03d((eXXmeasCriteria_frxD03_03d(:,i)),i);
    end
    if sum(eZZmeasCriteria_frxD03_03d(:,i)) > 0
        eZZ_detectable_frxD03_03d((eZZmeasCriteria_frxD03_03d(:,i)),i) = eZZ_frxD03_03d((eZZmeasCriteria_frxD03_03d(:,i)),i);
    end
% parameter 04
    if sum(eXXmeasCriteria_frxD04_03d(:,i)) > 0
        eXX_detectable_frxD04_03d((eXXmeasCriteria_frxD04_03d(:,i)),i) = eXX_frxD04_03d((eXXmeasCriteria_frxD04_03d(:,i)),i);
    end
    if sum(eZZmeasCriteria_frxD04_03d(:,i)) > 0
        eZZ_detectable_frxD04_03d((eZZmeasCriteria_frxD04_03d(:,i)),i) = eZZ_frxD04_03d((eZZmeasCriteria_frxD04_03d(:,i)),i);
    end
% parameter 05
    if sum(eXXmeasCriteria_frxD05_03d(:,i)) > 0
        eXX_detectable_frxD05_03d((eXXmeasCriteria_frxD05_03d(:,i)),i) = eXX_frxD05_03d((eXXmeasCriteria_frxD05_03d(:,i)),i);
    end
    if sum(eZZmeasCriteria_frxD05_03d(:,i)) > 0
        eZZ_detectable_frxD05_03d((eZZmeasCriteria_frxD05_03d(:,i)),i) = eZZ_frxD05_03d((eZZmeasCriteria_frxD05_03d(:,i)),i);
    end
% parameter 06
    if sum(eXXmeasCriteria_frxD06_03d(:,i)) > 0
        eXX_detectable_frxD06_03d((eXXmeasCriteria_frxD06_03d(:,i)),i) = eXX_frxD06_03d((eXXmeasCriteria_frxD06_03d(:,i)),i);
    end
    if sum(eZZmeasCriteria_frxD06_03d(:,i)) > 0
        eZZ_detectable_frxD06_03d((eZZmeasCriteria_frxD06_03d(:,i)),i) = eZZ_frxD06_03d((eZZmeasCriteria_frxD06_03d(:,i)),i);
    end
% parameter 07
    if sum(eXXmeasCriteria_frxD07_03d(:,i)) > 0
        eXX_detectable_frxD07_03d((eXXmeasCriteria_frxD07_03d(:,i)),i) = eXX_frxD07_03d((eXXmeasCriteria_frxD07_03d(:,i)),i);
    end
    if sum(eZZmeasCriteria_frxD07_03d(:,i)) > 0
        eZZ_detectable_frxD07_03d((eZZmeasCriteria_frxD07_03d(:,i)),i) = eZZ_frxD07_03d((eZZmeasCriteria_frxD07_03d(:,i)),i);
    end
% parameter 08
    if sum(eXXmeasCriteria_frxD08_03d(:,i)) > 0
        eXX_detectable_frxD08_03d((eXXmeasCriteria_frxD08_03d(:,i)),i) = eXX_frxD08_03d((eXXmeasCriteria_frxD08_03d(:,i)),i);
    end
    if sum(eZZmeasCriteria_frxD08_03d(:,i)) > 0
        eZZ_detectable_frxD08_03d((eZZmeasCriteria_frxD08_03d(:,i)),i) = eZZ_frxD08_03d((eZZmeasCriteria_frxD08_03d(:,i)),i);
    end
% parameter 09
    if sum(eXXmeasCriteria_frxD09_03d(:,i)) > 0
        eXX_detectable_frxD09_03d((eXXmeasCriteria_frxD09_03d(:,i)),i) = eXX_frxD09_03d((eXXmeasCriteria_frxD09_03d(:,i)),i);
    end
    if sum(eZZmeasCriteria_frxD09_03d(:,i)) > 0
        eZZ_detectable_frxD09_03d((eZZmeasCriteria_frxD09_03d(:,i)),i) = eZZ_frxD09_03d((eZZmeasCriteria_frxD09_03d(:,i)),i);
    end
% parameter 10
    if sum(eXXmeasCriteria_frxD10_03d(:,i)) > 0
        eXX_detectable_frxD10_03d((eXXmeasCriteria_frxD10_03d(:,i)),i) = eXX_frxD10_03d((eXXmeasCriteria_frxD10_03d(:,i)),i);
    end
    if sum(eZZmeasCriteria_frxD10_03d(:,i)) > 0
        eZZ_detectable_frxD10_03d((eZZmeasCriteria_frxD10_03d(:,i)),i) = eZZ_frxD10_03d((eZZmeasCriteria_frxD10_03d(:,i)),i);
    end
    
% ==================================================================================================== %
% Depth 5%
% ==================================================================================================== %
% parameter 01
    if sum(eXXmeasCriteria_frxD01_05d(:,i)) > 0
        eXX_detectable_frxD01_05d((eXXmeasCriteria_frxD01_05d(:,i)),i) = eXX_frxD01_05d((eXXmeasCriteria_frxD01_05d(:,i)),i);
    end
    if sum(eZZmeasCriteria_frxD01_05d(:,i)) > 0
        eZZ_detectable_frxD01_05d((eZZmeasCriteria_frxD01_05d(:,i)),i) = eZZ_frxD01_05d((eZZmeasCriteria_frxD01_05d(:,i)),i);
    end
% parameter 02
    if sum(eXXmeasCriteria_frxD02_05d(:,i)) > 0
        eXX_detectable_frxD02_05d((eXXmeasCriteria_frxD02_05d(:,i)),i) = eXX_frxD02_05d((eXXmeasCriteria_frxD02_05d(:,i)),i);
    end
    if sum(eZZmeasCriteria_frxD02_05d(:,i)) > 0
        eZZ_detectable_frxD02_05d((eZZmeasCriteria_frxD02_05d(:,i)),i) = eZZ_frxD02_05d((eZZmeasCriteria_frxD02_05d(:,i)),i);
    end
% parameter 03
    if sum(eXXmeasCriteria_frxD03_05d(:,i)) > 0
        eXX_detectable_frxD03_05d((eXXmeasCriteria_frxD03_05d(:,i)),i) = eXX_frxD03_05d((eXXmeasCriteria_frxD03_05d(:,i)),i);
    end
    if sum(eZZmeasCriteria_frxD03_05d(:,i)) > 0
        eZZ_detectable_frxD03_05d((eZZmeasCriteria_frxD03_05d(:,i)),i) = eZZ_frxD03_05d((eZZmeasCriteria_frxD03_05d(:,i)),i);
    end
% parameter 04
    if sum(eXXmeasCriteria_frxD04_05d(:,i)) > 0
        eXX_detectable_frxD04_05d((eXXmeasCriteria_frxD04_05d(:,i)),i) = eXX_frxD04_05d((eXXmeasCriteria_frxD04_05d(:,i)),i);
    end
    if sum(eZZmeasCriteria_frxD04_05d(:,i)) > 0
        eZZ_detectable_frxD04_05d((eZZmeasCriteria_frxD04_05d(:,i)),i) = eZZ_frxD04_05d((eZZmeasCriteria_frxD04_05d(:,i)),i);
    end
% parameter 05
    if sum(eXXmeasCriteria_frxD05_05d(:,i)) > 0
        eXX_detectable_frxD05_05d((eXXmeasCriteria_frxD05_05d(:,i)),i) = eXX_frxD05_05d((eXXmeasCriteria_frxD05_05d(:,i)),i);
    end
    if sum(eZZmeasCriteria_frxD05_05d(:,i)) > 0
        eZZ_detectable_frxD05_05d((eZZmeasCriteria_frxD05_05d(:,i)),i) = eZZ_frxD05_05d((eZZmeasCriteria_frxD05_05d(:,i)),i);
    end
% parameter 06
    if sum(eXXmeasCriteria_frxD06_05d(:,i)) > 0
        eXX_detectable_frxD06_05d((eXXmeasCriteria_frxD06_05d(:,i)),i) = eXX_frxD06_05d((eXXmeasCriteria_frxD06_05d(:,i)),i);
    end
    if sum(eZZmeasCriteria_frxD06_05d(:,i)) > 0
        eZZ_detectable_frxD06_05d((eZZmeasCriteria_frxD06_05d(:,i)),i) = eZZ_frxD06_05d((eZZmeasCriteria_frxD06_05d(:,i)),i);
    end
% parameter 07
    if sum(eXXmeasCriteria_frxD07_05d(:,i)) > 0
        eXX_detectable_frxD07_05d((eXXmeasCriteria_frxD07_05d(:,i)),i) = eXX_frxD07_05d((eXXmeasCriteria_frxD07_05d(:,i)),i);
    end
    if sum(eZZmeasCriteria_frxD07_05d(:,i)) > 0
        eZZ_detectable_frxD07_05d((eZZmeasCriteria_frxD07_05d(:,i)),i) = eZZ_frxD07_05d((eZZmeasCriteria_frxD07_05d(:,i)),i);
    end
% parameter 08
    if sum(eXXmeasCriteria_frxD08_05d(:,i)) > 0
        eXX_detectable_frxD08_05d((eXXmeasCriteria_frxD08_05d(:,i)),i) = eXX_frxD08_05d((eXXmeasCriteria_frxD08_05d(:,i)),i);
    end
    if sum(eZZmeasCriteria_frxD08_05d(:,i)) > 0
        eZZ_detectable_frxD08_05d((eZZmeasCriteria_frxD08_05d(:,i)),i) = eZZ_frxD08_05d((eZZmeasCriteria_frxD08_05d(:,i)),i);
    end
% parameter 09
    if sum(eXXmeasCriteria_frxD09_05d(:,i)) > 0
        eXX_detectable_frxD09_05d((eXXmeasCriteria_frxD09_05d(:,i)),i) = eXX_frxD09_05d((eXXmeasCriteria_frxD09_05d(:,i)),i);
    end
    if sum(eZZmeasCriteria_frxD09_05d(:,i)) > 0
        eZZ_detectable_frxD09_05d((eZZmeasCriteria_frxD09_05d(:,i)),i) = eZZ_frxD09_05d((eZZmeasCriteria_frxD09_05d(:,i)),i);
    end
% parameter 10
    if sum(eXXmeasCriteria_frxD10_05d(:,i)) > 0
        eXX_detectable_frxD10_05d((eXXmeasCriteria_frxD10_05d(:,i)),i) = eXX_frxD10_05d((eXXmeasCriteria_frxD10_05d(:,i)),i);
    end
    if sum(eZZmeasCriteria_frxD10_05d(:,i)) > 0
        eZZ_detectable_frxD10_05d((eZZmeasCriteria_frxD10_05d(:,i)),i) = eZZ_frxD10_05d((eZZmeasCriteria_frxD10_05d(:,i)),i);
    end
    
% ==================================================================================================== %
% Depth 10%
% ==================================================================================================== %
% parameter 01
    if sum(eXXmeasCriteria_frxD01_10d(:,i)) > 0
        eXX_detectable_frxD01_10d((eXXmeasCriteria_frxD01_10d(:,i)),i) = eXX_frxD01_10d((eXXmeasCriteria_frxD01_10d(:,i)),i);
    end
    if sum(eZZmeasCriteria_frxD01_10d(:,i)) > 0
        eZZ_detectable_frxD01_10d((eZZmeasCriteria_frxD01_10d(:,i)),i) = eZZ_frxD01_10d((eZZmeasCriteria_frxD01_10d(:,i)),i);
    end
% parameter 02
    if sum(eXXmeasCriteria_frxD02_10d(:,i)) > 0
        eXX_detectable_frxD02_10d((eXXmeasCriteria_frxD02_10d(:,i)),i) = eXX_frxD02_10d((eXXmeasCriteria_frxD02_10d(:,i)),i);
    end
    if sum(eZZmeasCriteria_frxD02_10d(:,i)) > 0
        eZZ_detectable_frxD02_10d((eZZmeasCriteria_frxD02_10d(:,i)),i) = eZZ_frxD02_10d((eZZmeasCriteria_frxD02_10d(:,i)),i);
    end
% parameter 03
    if sum(eXXmeasCriteria_frxD03_10d(:,i)) > 0
        eXX_detectable_frxD03_10d((eXXmeasCriteria_frxD03_10d(:,i)),i) = eXX_frxD03_10d((eXXmeasCriteria_frxD03_10d(:,i)),i);
    end
    if sum(eZZmeasCriteria_frxD03_10d(:,i)) > 0
        eZZ_detectable_frxD03_10d((eZZmeasCriteria_frxD03_10d(:,i)),i) = eZZ_frxD03_10d((eZZmeasCriteria_frxD03_10d(:,i)),i);
    end
% parameter 04
    if sum(eXXmeasCriteria_frxD04_10d(:,i)) > 0
        eXX_detectable_frxD04_10d((eXXmeasCriteria_frxD04_10d(:,i)),i) = eXX_frxD04_10d((eXXmeasCriteria_frxD04_10d(:,i)),i);
    end
    if sum(eZZmeasCriteria_frxD04_10d(:,i)) > 0
        eZZ_detectable_frxD04_10d((eZZmeasCriteria_frxD04_10d(:,i)),i) = eZZ_frxD04_10d((eZZmeasCriteria_frxD04_10d(:,i)),i);
    end
% parameter 05
    if sum(eXXmeasCriteria_frxD05_10d(:,i)) > 0
        eXX_detectable_frxD05_10d((eXXmeasCriteria_frxD05_10d(:,i)),i) = eXX_frxD05_10d((eXXmeasCriteria_frxD05_10d(:,i)),i);
    end
    if sum(eZZmeasCriteria_frxD05_10d(:,i)) > 0
        eZZ_detectable_frxD05_10d((eZZmeasCriteria_frxD05_10d(:,i)),i) = eZZ_frxD05_10d((eZZmeasCriteria_frxD05_10d(:,i)),i);
    end
% parameter 06
    if sum(eXXmeasCriteria_frxD06_10d(:,i)) > 0
        eXX_detectable_frxD06_10d((eXXmeasCriteria_frxD06_10d(:,i)),i) = eXX_frxD06_10d((eXXmeasCriteria_frxD06_10d(:,i)),i);
    end
    if sum(eZZmeasCriteria_frxD06_10d(:,i)) > 0
        eZZ_detectable_frxD06_10d((eZZmeasCriteria_frxD06_10d(:,i)),i) = eZZ_frxD06_10d((eZZmeasCriteria_frxD06_10d(:,i)),i);
    end
% parameter 07
    if sum(eXXmeasCriteria_frxD07_10d(:,i)) > 0
        eXX_detectable_frxD07_10d((eXXmeasCriteria_frxD07_10d(:,i)),i) = eXX_frxD07_10d((eXXmeasCriteria_frxD07_10d(:,i)),i);
    end
    if sum(eZZmeasCriteria_frxD07_10d(:,i)) > 0
        eZZ_detectable_frxD07_10d((eZZmeasCriteria_frxD07_10d(:,i)),i) = eZZ_frxD07_10d((eZZmeasCriteria_frxD07_10d(:,i)),i);
    end
% parameter 08
    if sum(eXXmeasCriteria_frxD08_10d(:,i)) > 0
        eXX_detectable_frxD08_10d((eXXmeasCriteria_frxD08_10d(:,i)),i) = eXX_frxD08_10d((eXXmeasCriteria_frxD08_10d(:,i)),i);
    end
    if sum(eZZmeasCriteria_frxD08_10d(:,i)) > 0
        eZZ_detectable_frxD08_10d((eZZmeasCriteria_frxD08_10d(:,i)),i) = eZZ_frxD08_10d((eZZmeasCriteria_frxD08_10d(:,i)),i);
    end
% parameter 09
    if sum(eXXmeasCriteria_frxD09_10d(:,i)) > 0
        eXX_detectable_frxD09_10d((eXXmeasCriteria_frxD09_10d(:,i)),i) = eXX_frxD09_10d((eXXmeasCriteria_frxD09_10d(:,i)),i);
    end
    if sum(eZZmeasCriteria_frxD09_10d(:,i)) > 0
        eZZ_detectable_frxD09_10d((eZZmeasCriteria_frxD09_10d(:,i)),i) = eZZ_frxD09_10d((eZZmeasCriteria_frxD09_10d(:,i)),i);
    end
% parameter 10
    if sum(eXXmeasCriteria_frxD10_10d(:,i)) > 0
        eXX_detectable_frxD10_10d((eXXmeasCriteria_frxD10_10d(:,i)),i) = eXX_frxD10_10d((eXXmeasCriteria_frxD10_10d(:,i)),i);
    end
    if sum(eZZmeasCriteria_frxD10_10d(:,i)) > 0
        eZZ_detectable_frxD10_10d((eZZmeasCriteria_frxD10_10d(:,i)),i) = eZZ_frxD10_10d((eZZmeasCriteria_frxD10_10d(:,i)),i);
    end
    
% ==================================================================================================== %
% Depth 50%
% ==================================================================================================== %
% parameter 01
    if sum(eXXmeasCriteria_frxD01_50d(:,i)) > 0
        eXX_detectable_frxD01_50d((eXXmeasCriteria_frxD01_50d(:,i)),i) = eXX_frxD01_50d((eXXmeasCriteria_frxD01_50d(:,i)),i);
    end
    if sum(eZZmeasCriteria_frxD01_50d(:,i)) > 0
        eZZ_detectable_frxD01_50d((eZZmeasCriteria_frxD01_50d(:,i)),i) = eZZ_frxD01_50d((eZZmeasCriteria_frxD01_50d(:,i)),i);
    end
% parameter 02
    if sum(eXXmeasCriteria_frxD02_50d(:,i)) > 0
        eXX_detectable_frxD02_50d((eXXmeasCriteria_frxD02_50d(:,i)),i) = eXX_frxD02_50d((eXXmeasCriteria_frxD02_50d(:,i)),i);
    end
    if sum(eZZmeasCriteria_frxD02_50d(:,i)) > 0
        eZZ_detectable_frxD02_50d((eZZmeasCriteria_frxD02_50d(:,i)),i) = eZZ_frxD02_50d((eZZmeasCriteria_frxD02_50d(:,i)),i);
    end
% parameter 03
    if sum(eXXmeasCriteria_frxD03_50d(:,i)) > 0
        eXX_detectable_frxD03_50d((eXXmeasCriteria_frxD03_50d(:,i)),i) = eXX_frxD03_50d((eXXmeasCriteria_frxD03_50d(:,i)),i);
    end
    if sum(eZZmeasCriteria_frxD03_50d(:,i)) > 0
        eZZ_detectable_frxD03_50d((eZZmeasCriteria_frxD03_50d(:,i)),i) = eZZ_frxD03_50d((eZZmeasCriteria_frxD03_50d(:,i)),i);
    end
% parameter 04
    if sum(eXXmeasCriteria_frxD04_50d(:,i)) > 0
        eXX_detectable_frxD04_50d((eXXmeasCriteria_frxD04_50d(:,i)),i) = eXX_frxD04_50d((eXXmeasCriteria_frxD04_50d(:,i)),i);
    end
    if sum(eZZmeasCriteria_frxD04_50d(:,i)) > 0
        eZZ_detectable_frxD04_50d((eZZmeasCriteria_frxD04_50d(:,i)),i) = eZZ_frxD04_50d((eZZmeasCriteria_frxD04_50d(:,i)),i);
    end
% parameter 05
    if sum(eXXmeasCriteria_frxD05_50d(:,i)) > 0
        eXX_detectable_frxD05_50d((eXXmeasCriteria_frxD05_50d(:,i)),i) = eXX_frxD05_50d((eXXmeasCriteria_frxD05_50d(:,i)),i);
    end
    if sum(eZZmeasCriteria_frxD05_50d(:,i)) > 0
        eZZ_detectable_frxD05_50d((eZZmeasCriteria_frxD05_50d(:,i)),i) = eZZ_frxD05_50d((eZZmeasCriteria_frxD05_50d(:,i)),i);
    end
% parameter 06
    if sum(eXXmeasCriteria_frxD06_50d(:,i)) > 0
        eXX_detectable_frxD06_50d((eXXmeasCriteria_frxD06_50d(:,i)),i) = eXX_frxD06_50d((eXXmeasCriteria_frxD06_50d(:,i)),i);
    end
    if sum(eZZmeasCriteria_frxD06_50d(:,i)) > 0
        eZZ_detectable_frxD06_50d((eZZmeasCriteria_frxD06_50d(:,i)),i) = eZZ_frxD06_50d((eZZmeasCriteria_frxD06_50d(:,i)),i);
    end
% parameter 07
    if sum(eXXmeasCriteria_frxD07_50d(:,i)) > 0
        eXX_detectable_frxD07_50d((eXXmeasCriteria_frxD07_50d(:,i)),i) = eXX_frxD07_50d((eXXmeasCriteria_frxD07_50d(:,i)),i);
    end
    if sum(eZZmeasCriteria_frxD07_50d(:,i)) > 0
        eZZ_detectable_frxD07_50d((eZZmeasCriteria_frxD07_50d(:,i)),i) = eZZ_frxD07_50d((eZZmeasCriteria_frxD07_50d(:,i)),i);
    end
% parameter 08
    if sum(eXXmeasCriteria_frxD08_50d(:,i)) > 0
        eXX_detectable_frxD08_50d((eXXmeasCriteria_frxD08_50d(:,i)),i) = eXX_frxD08_50d((eXXmeasCriteria_frxD08_50d(:,i)),i);
    end
    if sum(eZZmeasCriteria_frxD08_50d(:,i)) > 0
        eZZ_detectable_frxD08_50d((eZZmeasCriteria_frxD08_50d(:,i)),i) = eZZ_frxD08_50d((eZZmeasCriteria_frxD08_50d(:,i)),i);
    end
% parameter 09
    if sum(eXXmeasCriteria_frxD09_50d(:,i)) > 0
        eXX_detectable_frxD09_50d((eXXmeasCriteria_frxD09_50d(:,i)),i) = eXX_frxD09_50d((eXXmeasCriteria_frxD09_50d(:,i)),i);
    end
    if sum(eZZmeasCriteria_frxD09_50d(:,i)) > 0
        eZZ_detectable_frxD09_50d((eZZmeasCriteria_frxD09_50d(:,i)),i) = eZZ_frxD09_50d((eZZmeasCriteria_frxD09_50d(:,i)),i);
    end
% parameter 10
    if sum(eXXmeasCriteria_frxD10_50d(:,i)) > 0
        eXX_detectable_frxD10_50d((eXXmeasCriteria_frxD10_50d(:,i)),i) = eXX_frxD10_50d((eXXmeasCriteria_frxD10_50d(:,i)),i);
    end
    if sum(eZZmeasCriteria_frxD10_50d(:,i)) > 0
        eZZ_detectable_frxD10_50d((eZZmeasCriteria_frxD10_50d(:,i)),i) = eZZ_frxD10_50d((eZZmeasCriteria_frxD10_50d(:,i)),i);
    end
    
end

%% Times of Dectectable Strain (mag>minMag & rate>minRate)

% parameter 01
t_eXX_detectable_frxD01_01d = zeros(n_tSteps,n_probes);
t_eZZ_detectable_frxD01_01d = zeros(n_tSteps,n_probes);
t_eXX_detectable_frxD01_03d = zeros(n_tSteps,n_probes);
t_eZZ_detectable_frxD01_03d = zeros(n_tSteps,n_probes);
t_eXX_detectable_frxD01_05d = zeros(n_tSteps,n_probes);
t_eZZ_detectable_frxD01_05d = zeros(n_tSteps,n_probes);
t_eXX_detectable_frxD01_10d = zeros(n_tSteps,n_probes);
t_eZZ_detectable_frxD01_10d = zeros(n_tSteps,n_probes);
t_eXX_detectable_frxD01_50d = zeros(n_tSteps,n_probes);
t_eZZ_detectable_frxD01_50d = zeros(n_tSteps,n_probes);
% parameter 02
t_eXX_detectable_frxD02_01d = zeros(n_tSteps,n_probes);
t_eZZ_detectable_frxD02_01d = zeros(n_tSteps,n_probes);
t_eXX_detectable_frxD02_03d = zeros(n_tSteps,n_probes);
t_eZZ_detectable_frxD02_03d = zeros(n_tSteps,n_probes);
t_eXX_detectable_frxD02_05d = zeros(n_tSteps,n_probes);
t_eZZ_detectable_frxD02_05d = zeros(n_tSteps,n_probes);
t_eXX_detectable_frxD02_10d = zeros(n_tSteps,n_probes);
t_eZZ_detectable_frxD02_10d = zeros(n_tSteps,n_probes);
t_eXX_detectable_frxD02_50d = zeros(n_tSteps,n_probes);
t_eZZ_detectable_frxD02_50d = zeros(n_tSteps,n_probes);
% parameter 03
t_eXX_detectable_frxD03_01d = zeros(n_tSteps,n_probes);
t_eZZ_detectable_frxD03_01d = zeros(n_tSteps,n_probes);
t_eXX_detectable_frxD03_03d = zeros(n_tSteps,n_probes);
t_eZZ_detectable_frxD03_03d = zeros(n_tSteps,n_probes);
t_eXX_detectable_frxD03_05d = zeros(n_tSteps,n_probes);
t_eZZ_detectable_frxD03_05d = zeros(n_tSteps,n_probes);
t_eXX_detectable_frxD03_10d = zeros(n_tSteps,n_probes);
t_eZZ_detectable_frxD03_10d = zeros(n_tSteps,n_probes);
t_eXX_detectable_frxD03_50d = zeros(n_tSteps,n_probes);
t_eZZ_detectable_frxD03_50d = zeros(n_tSteps,n_probes);
% parameter 04
t_eXX_detectable_frxD04_01d = zeros(n_tSteps,n_probes);
t_eZZ_detectable_frxD04_01d = zeros(n_tSteps,n_probes);
t_eXX_detectable_frxD04_03d = zeros(n_tSteps,n_probes);
t_eZZ_detectable_frxD04_03d = zeros(n_tSteps,n_probes);
t_eXX_detectable_frxD04_05d = zeros(n_tSteps,n_probes);
t_eZZ_detectable_frxD04_05d = zeros(n_tSteps,n_probes);
t_eXX_detectable_frxD04_10d = zeros(n_tSteps,n_probes);
t_eZZ_detectable_frxD04_10d = zeros(n_tSteps,n_probes);
t_eXX_detectable_frxD04_50d = zeros(n_tSteps,n_probes);
t_eZZ_detectable_frxD04_50d = zeros(n_tSteps,n_probes);
% parameter 05
t_eXX_detectable_frxD05_01d = zeros(n_tSteps,n_probes);
t_eZZ_detectable_frxD05_01d = zeros(n_tSteps,n_probes);
t_eXX_detectable_frxD05_03d = zeros(n_tSteps,n_probes);
t_eZZ_detectable_frxD05_03d = zeros(n_tSteps,n_probes);
t_eXX_detectable_frxD05_05d = zeros(n_tSteps,n_probes);
t_eZZ_detectable_frxD05_05d = zeros(n_tSteps,n_probes);
t_eXX_detectable_frxD05_10d = zeros(n_tSteps,n_probes);
t_eZZ_detectable_frxD05_10d = zeros(n_tSteps,n_probes);
t_eXX_detectable_frxD05_50d = zeros(n_tSteps,n_probes);
t_eZZ_detectable_frxD05_50d = zeros(n_tSteps,n_probes);
% parameter 06
t_eXX_detectable_frxD06_01d = zeros(n_tSteps,n_probes);
t_eZZ_detectable_frxD06_01d = zeros(n_tSteps,n_probes);
t_eXX_detectable_frxD06_03d = zeros(n_tSteps,n_probes);
t_eZZ_detectable_frxD06_03d = zeros(n_tSteps,n_probes);
t_eXX_detectable_frxD06_05d = zeros(n_tSteps,n_probes);
t_eZZ_detectable_frxD06_05d = zeros(n_tSteps,n_probes);
t_eXX_detectable_frxD06_10d = zeros(n_tSteps,n_probes);
t_eZZ_detectable_frxD06_10d = zeros(n_tSteps,n_probes);
t_eXX_detectable_frxD06_50d = zeros(n_tSteps,n_probes);
t_eZZ_detectable_frxD06_50d = zeros(n_tSteps,n_probes);
% parameter 07
t_eXX_detectable_frxD07_01d = zeros(n_tSteps,n_probes);
t_eZZ_detectable_frxD07_01d = zeros(n_tSteps,n_probes);
t_eXX_detectable_frxD07_03d = zeros(n_tSteps,n_probes);
t_eZZ_detectable_frxD07_03d = zeros(n_tSteps,n_probes);
t_eXX_detectable_frxD07_05d = zeros(n_tSteps,n_probes);
t_eZZ_detectable_frxD07_05d = zeros(n_tSteps,n_probes);
t_eXX_detectable_frxD07_10d = zeros(n_tSteps,n_probes);
t_eZZ_detectable_frxD07_10d = zeros(n_tSteps,n_probes);
t_eXX_detectable_frxD07_50d = zeros(n_tSteps,n_probes);
t_eZZ_detectable_frxD07_50d = zeros(n_tSteps,n_probes);
% parameter 08
t_eXX_detectable_frxD08_01d = zeros(n_tSteps,n_probes);
t_eZZ_detectable_frxD08_01d = zeros(n_tSteps,n_probes);
t_eXX_detectable_frxD08_03d = zeros(n_tSteps,n_probes);
t_eZZ_detectable_frxD08_03d = zeros(n_tSteps,n_probes);
t_eXX_detectable_frxD08_05d = zeros(n_tSteps,n_probes);
t_eZZ_detectable_frxD08_05d = zeros(n_tSteps,n_probes);
t_eXX_detectable_frxD08_10d = zeros(n_tSteps,n_probes);
t_eZZ_detectable_frxD08_10d = zeros(n_tSteps,n_probes);
t_eXX_detectable_frxD08_50d = zeros(n_tSteps,n_probes);
t_eZZ_detectable_frxD08_50d = zeros(n_tSteps,n_probes);
% parameter 09
t_eXX_detectable_frxD09_01d = zeros(n_tSteps,n_probes);
t_eZZ_detectable_frxD09_01d = zeros(n_tSteps,n_probes);
t_eXX_detectable_frxD09_03d = zeros(n_tSteps,n_probes);
t_eZZ_detectable_frxD09_03d = zeros(n_tSteps,n_probes);
t_eXX_detectable_frxD09_05d = zeros(n_tSteps,n_probes);
t_eZZ_detectable_frxD09_05d = zeros(n_tSteps,n_probes);
t_eXX_detectable_frxD09_10d = zeros(n_tSteps,n_probes);
t_eZZ_detectable_frxD09_10d = zeros(n_tSteps,n_probes);
t_eXX_detectable_frxD09_50d = zeros(n_tSteps,n_probes);
t_eZZ_detectable_frxD09_50d = zeros(n_tSteps,n_probes);
% parameter 10
t_eXX_detectable_frxD10_01d = zeros(n_tSteps,n_probes);
t_eZZ_detectable_frxD10_01d = zeros(n_tSteps,n_probes);
t_eXX_detectable_frxD10_03d = zeros(n_tSteps,n_probes);
t_eZZ_detectable_frxD10_03d = zeros(n_tSteps,n_probes);
t_eXX_detectable_frxD10_05d = zeros(n_tSteps,n_probes);
t_eZZ_detectable_frxD10_05d = zeros(n_tSteps,n_probes);
t_eXX_detectable_frxD10_10d = zeros(n_tSteps,n_probes);
t_eZZ_detectable_frxD10_10d = zeros(n_tSteps,n_probes);
t_eXX_detectable_frxD10_50d = zeros(n_tSteps,n_probes);
t_eZZ_detectable_frxD10_50d = zeros(n_tSteps,n_probes);

for i = 1:size(eXXmeasCriteria_frxD01_03d,2)
% ==================================================================================================== %
% Depth 1%
% ==================================================================================================== %
% parameter 01
    if sum(eXXmeasCriteria_frxD01_01d(:,i)) > 0
        t_eXX_detectable_frxD01_01d((eXXmeasCriteria_frxD01_01d(:,i)),i) = t_swpDfrx(eXXmeasCriteria_frxD01_01d(:,i));
    end
    if sum(eZZmeasCriteria_frxD01_01d(:,i)) > 0
        t_eZZ_detectable_frxD01_01d((eZZmeasCriteria_frxD01_01d(:,i)),i) = t_swpDfrx(eZZmeasCriteria_frxD01_01d(:,i));
    end
% parameter 02
    if sum(eXXmeasCriteria_frxD02_01d(:,i)) > 0
        t_eXX_detectable_frxD02_01d((eXXmeasCriteria_frxD02_01d(:,i)),i) = t_swpDfrx(eXXmeasCriteria_frxD02_01d(:,i));
    end
    if sum(eZZmeasCriteria_frxD02_01d(:,i)) > 0
        t_eZZ_detectable_frxD02_01d((eZZmeasCriteria_frxD02_01d(:,i)),i) = t_swpDfrx(eZZmeasCriteria_frxD02_01d(:,i));
    end
% parameter 03
    if sum(eXXmeasCriteria_frxD03_01d(:,i)) > 0
        t_eXX_detectable_frxD03_01d((eXXmeasCriteria_frxD03_01d(:,i)),i) = t_swpDfrx(eXXmeasCriteria_frxD03_01d(:,i));
    end
    if sum(eZZmeasCriteria_frxD03_01d(:,i)) > 0
        t_eZZ_detectable_frxD03_01d((eZZmeasCriteria_frxD03_01d(:,i)),i) = t_swpDfrx(eZZmeasCriteria_frxD03_01d(:,i));
    end
% parameter 04
    if sum(eXXmeasCriteria_frxD04_01d(:,i)) > 0
        t_eXX_detectable_frxD04_01d((eXXmeasCriteria_frxD04_01d(:,i)),i) = t_swpDfrx(eXXmeasCriteria_frxD04_01d(:,i));
    end
    if sum(eZZmeasCriteria_frxD04_01d(:,i)) > 0
        t_eZZ_detectable_frxD04_01d((eZZmeasCriteria_frxD04_01d(:,i)),i) = t_swpDfrx(eZZmeasCriteria_frxD04_01d(:,i));
    end
% parameter 05
    if sum(eXXmeasCriteria_frxD05_01d(:,i)) > 0
        t_eXX_detectable_frxD05_01d((eXXmeasCriteria_frxD05_01d(:,i)),i) = t_swpDfrx(eXXmeasCriteria_frxD05_01d(:,i));
    end
    if sum(eZZmeasCriteria_frxD05_01d(:,i)) > 0
        t_eZZ_detectable_frxD05_01d((eZZmeasCriteria_frxD05_01d(:,i)),i) = t_swpDfrx(eZZmeasCriteria_frxD05_01d(:,i));
    end
% parameter 06
    if sum(eXXmeasCriteria_frxD06_01d(:,i)) > 0
        t_eXX_detectable_frxD06_01d((eXXmeasCriteria_frxD06_01d(:,i)),i) = t_swpDfrx(eXXmeasCriteria_frxD06_01d(:,i));
    end
    if sum(eZZmeasCriteria_frxD06_01d(:,i)) > 0
        t_eZZ_detectable_frxD06_01d((eZZmeasCriteria_frxD06_01d(:,i)),i) = t_swpDfrx(eZZmeasCriteria_frxD06_01d(:,i));
    end
% parameter 07
    if sum(eXXmeasCriteria_frxD07_01d(:,i)) > 0
        t_eXX_detectable_frxD07_01d((eXXmeasCriteria_frxD07_01d(:,i)),i) = t_swpDfrx(eXXmeasCriteria_frxD07_01d(:,i));
    end
    if sum(eZZmeasCriteria_frxD07_01d(:,i)) > 0
        t_eZZ_detectable_frxD07_01d((eZZmeasCriteria_frxD07_01d(:,i)),i) = t_swpDfrx(eZZmeasCriteria_frxD07_01d(:,i));
    end
% parameter 08
    if sum(eXXmeasCriteria_frxD08_01d(:,i)) > 0
        t_eXX_detectable_frxD08_01d((eXXmeasCriteria_frxD08_01d(:,i)),i) = t_swpDfrx(eXXmeasCriteria_frxD08_01d(:,i));
    end
    if sum(eZZmeasCriteria_frxD08_01d(:,i)) > 0
        t_eZZ_detectable_frxD08_01d((eZZmeasCriteria_frxD08_01d(:,i)),i) = t_swpDfrx(eZZmeasCriteria_frxD08_01d(:,i));
    end
% parameter 09
    if sum(eXXmeasCriteria_frxD09_01d(:,i)) > 0
        t_eXX_detectable_frxD09_01d((eXXmeasCriteria_frxD09_01d(:,i)),i) = t_swpDfrx(eXXmeasCriteria_frxD09_01d(:,i));
    end
    if sum(eZZmeasCriteria_frxD09_01d(:,i)) > 0
        t_eZZ_detectable_frxD09_01d((eZZmeasCriteria_frxD09_01d(:,i)),i) = t_swpDfrx(eZZmeasCriteria_frxD09_01d(:,i));
    end
% parameter 10
    if sum(eXXmeasCriteria_frxD10_01d(:,i)) > 0
        t_eXX_detectable_frxD10_01d((eXXmeasCriteria_frxD10_01d(:,i)),i) = t_swpDfrx(eXXmeasCriteria_frxD10_01d(:,i));
    end
    if sum(eZZmeasCriteria_frxD10_01d(:,i)) > 0
        t_eZZ_detectable_frxD10_01d((eZZmeasCriteria_frxD10_01d(:,i)),i) = t_swpDfrx(eZZmeasCriteria_frxD10_01d(:,i));
    end
    
% ==================================================================================================== %
% Depth 3%
% ==================================================================================================== %
% parameter 01
    if sum(eXXmeasCriteria_frxD01_03d(:,i)) > 0
        t_eXX_detectable_frxD01_03d((eXXmeasCriteria_frxD01_03d(:,i)),i) = t_swpDfrx(eXXmeasCriteria_frxD01_03d(:,i));
    end
    if sum(eZZmeasCriteria_frxD01_03d(:,i)) > 0
        t_eZZ_detectable_frxD01_03d((eZZmeasCriteria_frxD01_03d(:,i)),i) = t_swpDfrx(eZZmeasCriteria_frxD01_03d(:,i));
    end
% parameter 02
    if sum(eXXmeasCriteria_frxD02_03d(:,i)) > 0
        t_eXX_detectable_frxD02_03d((eXXmeasCriteria_frxD02_03d(:,i)),i) = t_swpDfrx(eXXmeasCriteria_frxD02_03d(:,i));
    end
    if sum(eZZmeasCriteria_frxD02_03d(:,i)) > 0
        t_eZZ_detectable_frxD02_03d((eZZmeasCriteria_frxD02_03d(:,i)),i) = t_swpDfrx(eZZmeasCriteria_frxD02_03d(:,i));
    end
% parameter 03
    if sum(eXXmeasCriteria_frxD03_03d(:,i)) > 0
        t_eXX_detectable_frxD03_03d((eXXmeasCriteria_frxD03_03d(:,i)),i) = t_swpDfrx(eXXmeasCriteria_frxD03_03d(:,i));
    end
    if sum(eZZmeasCriteria_frxD03_03d(:,i)) > 0
        t_eZZ_detectable_frxD03_03d((eZZmeasCriteria_frxD03_03d(:,i)),i) = t_swpDfrx(eZZmeasCriteria_frxD03_03d(:,i));
    end
% parameter 04
    if sum(eXXmeasCriteria_frxD04_03d(:,i)) > 0
        t_eXX_detectable_frxD04_03d((eXXmeasCriteria_frxD04_03d(:,i)),i) = t_swpDfrx(eXXmeasCriteria_frxD04_03d(:,i));
    end
    if sum(eZZmeasCriteria_frxD04_03d(:,i)) > 0
        t_eZZ_detectable_frxD04_03d((eZZmeasCriteria_frxD04_03d(:,i)),i) = t_swpDfrx(eZZmeasCriteria_frxD04_03d(:,i));
    end
% parameter 05
    if sum(eXXmeasCriteria_frxD05_03d(:,i)) > 0
        t_eXX_detectable_frxD05_03d((eXXmeasCriteria_frxD05_03d(:,i)),i) = t_swpDfrx(eXXmeasCriteria_frxD05_03d(:,i));
    end
    if sum(eZZmeasCriteria_frxD05_03d(:,i)) > 0
        t_eZZ_detectable_frxD05_03d((eZZmeasCriteria_frxD05_03d(:,i)),i) = t_swpDfrx(eZZmeasCriteria_frxD05_03d(:,i));
    end
% parameter 06
    if sum(eXXmeasCriteria_frxD06_03d(:,i)) > 0
        t_eXX_detectable_frxD06_03d((eXXmeasCriteria_frxD06_03d(:,i)),i) = t_swpDfrx(eXXmeasCriteria_frxD06_03d(:,i));
    end
    if sum(eZZmeasCriteria_frxD06_03d(:,i)) > 0
        t_eZZ_detectable_frxD06_03d((eZZmeasCriteria_frxD06_03d(:,i)),i) = t_swpDfrx(eZZmeasCriteria_frxD06_03d(:,i));
    end
% parameter 07
    if sum(eXXmeasCriteria_frxD07_03d(:,i)) > 0
        t_eXX_detectable_frxD07_03d((eXXmeasCriteria_frxD07_03d(:,i)),i) = t_swpDfrx(eXXmeasCriteria_frxD07_03d(:,i));
    end
    if sum(eZZmeasCriteria_frxD07_03d(:,i)) > 0
        t_eZZ_detectable_frxD07_03d((eZZmeasCriteria_frxD07_03d(:,i)),i) = t_swpDfrx(eZZmeasCriteria_frxD07_03d(:,i));
    end
% parameter 08
    if sum(eXXmeasCriteria_frxD08_03d(:,i)) > 0
        t_eXX_detectable_frxD08_03d((eXXmeasCriteria_frxD08_03d(:,i)),i) = t_swpDfrx(eXXmeasCriteria_frxD08_03d(:,i));
    end
    if sum(eZZmeasCriteria_frxD08_03d(:,i)) > 0
        t_eZZ_detectable_frxD08_03d((eZZmeasCriteria_frxD08_03d(:,i)),i) = t_swpDfrx(eZZmeasCriteria_frxD08_03d(:,i));
    end
% parameter 09
    if sum(eXXmeasCriteria_frxD09_03d(:,i)) > 0
        t_eXX_detectable_frxD09_03d((eXXmeasCriteria_frxD09_03d(:,i)),i) = t_swpDfrx(eXXmeasCriteria_frxD09_03d(:,i));
    end
    if sum(eZZmeasCriteria_frxD09_03d(:,i)) > 0
        t_eZZ_detectable_frxD09_03d((eZZmeasCriteria_frxD09_03d(:,i)),i) = t_swpDfrx(eZZmeasCriteria_frxD09_03d(:,i));
    end
% parameter 10
    if sum(eXXmeasCriteria_frxD10_03d(:,i)) > 0
        t_eXX_detectable_frxD10_03d((eXXmeasCriteria_frxD10_03d(:,i)),i) = t_swpDfrx(eXXmeasCriteria_frxD10_03d(:,i));
    end
    if sum(eZZmeasCriteria_frxD10_03d(:,i)) > 0
        t_eZZ_detectable_frxD10_03d((eZZmeasCriteria_frxD10_03d(:,i)),i) = t_swpDfrx(eZZmeasCriteria_frxD10_03d(:,i));
    end
    
% ==================================================================================================== %
% Depth 5%
% ==================================================================================================== %
% parameter 01
    if sum(eXXmeasCriteria_frxD01_05d(:,i)) > 0
        t_eXX_detectable_frxD01_05d((eXXmeasCriteria_frxD01_05d(:,i)),i) = t_swpDfrx(eXXmeasCriteria_frxD01_05d(:,i));
    end
    if sum(eZZmeasCriteria_frxD01_05d(:,i)) > 0
        t_eZZ_detectable_frxD01_05d((eZZmeasCriteria_frxD01_05d(:,i)),i) = t_swpDfrx(eZZmeasCriteria_frxD01_05d(:,i));
    end
% parameter 02
    if sum(eXXmeasCriteria_frxD02_05d(:,i)) > 0
        t_eXX_detectable_frxD02_05d((eXXmeasCriteria_frxD02_05d(:,i)),i) = t_swpDfrx(eXXmeasCriteria_frxD02_05d(:,i));
    end
    if sum(eZZmeasCriteria_frxD02_05d(:,i)) > 0
        t_eZZ_detectable_frxD02_05d((eZZmeasCriteria_frxD02_05d(:,i)),i) = t_swpDfrx(eZZmeasCriteria_frxD02_05d(:,i));
    end
% parameter 03
    if sum(eXXmeasCriteria_frxD03_05d(:,i)) > 0
        t_eXX_detectable_frxD03_05d((eXXmeasCriteria_frxD03_05d(:,i)),i) = t_swpDfrx(eXXmeasCriteria_frxD03_05d(:,i));
    end
    if sum(eZZmeasCriteria_frxD03_05d(:,i)) > 0
        t_eZZ_detectable_frxD03_05d((eZZmeasCriteria_frxD03_05d(:,i)),i) = t_swpDfrx(eZZmeasCriteria_frxD03_05d(:,i));
    end
% parameter 04
    if sum(eXXmeasCriteria_frxD04_05d(:,i)) > 0
        t_eXX_detectable_frxD04_05d((eXXmeasCriteria_frxD04_05d(:,i)),i) = t_swpDfrx(eXXmeasCriteria_frxD04_05d(:,i));
    end
    if sum(eZZmeasCriteria_frxD04_05d(:,i)) > 0
        t_eZZ_detectable_frxD04_05d((eZZmeasCriteria_frxD04_05d(:,i)),i) = t_swpDfrx(eZZmeasCriteria_frxD04_05d(:,i));
    end
% parameter 05
    if sum(eXXmeasCriteria_frxD05_05d(:,i)) > 0
        t_eXX_detectable_frxD05_05d((eXXmeasCriteria_frxD05_05d(:,i)),i) = t_swpDfrx(eXXmeasCriteria_frxD05_05d(:,i));
    end
    if sum(eZZmeasCriteria_frxD05_05d(:,i)) > 0
        t_eZZ_detectable_frxD05_05d((eZZmeasCriteria_frxD05_05d(:,i)),i) = t_swpDfrx(eZZmeasCriteria_frxD05_05d(:,i));
    end
% parameter 06
    if sum(eXXmeasCriteria_frxD06_05d(:,i)) > 0
        t_eXX_detectable_frxD06_05d((eXXmeasCriteria_frxD06_05d(:,i)),i) = t_swpDfrx(eXXmeasCriteria_frxD06_05d(:,i));
    end
    if sum(eZZmeasCriteria_frxD06_05d(:,i)) > 0
        t_eZZ_detectable_frxD06_05d((eZZmeasCriteria_frxD06_05d(:,i)),i) = t_swpDfrx(eZZmeasCriteria_frxD06_05d(:,i));
    end
% parameter 07
    if sum(eXXmeasCriteria_frxD07_05d(:,i)) > 0
        t_eXX_detectable_frxD07_05d((eXXmeasCriteria_frxD07_05d(:,i)),i) = t_swpDfrx(eXXmeasCriteria_frxD07_05d(:,i));
    end
    if sum(eZZmeasCriteria_frxD07_05d(:,i)) > 0
        t_eZZ_detectable_frxD07_05d((eZZmeasCriteria_frxD07_05d(:,i)),i) = t_swpDfrx(eZZmeasCriteria_frxD07_05d(:,i));
    end
% parameter 08
    if sum(eXXmeasCriteria_frxD08_05d(:,i)) > 0
        t_eXX_detectable_frxD08_05d((eXXmeasCriteria_frxD08_05d(:,i)),i) = t_swpDfrx(eXXmeasCriteria_frxD08_05d(:,i));
    end
    if sum(eZZmeasCriteria_frxD08_05d(:,i)) > 0
        t_eZZ_detectable_frxD08_05d((eZZmeasCriteria_frxD08_05d(:,i)),i) = t_swpDfrx(eZZmeasCriteria_frxD08_05d(:,i));
    end
% parameter 09
    if sum(eXXmeasCriteria_frxD09_05d(:,i)) > 0
        t_eXX_detectable_frxD09_05d((eXXmeasCriteria_frxD09_05d(:,i)),i) = t_swpDfrx(eXXmeasCriteria_frxD09_05d(:,i));
    end
    if sum(eZZmeasCriteria_frxD09_05d(:,i)) > 0
        t_eZZ_detectable_frxD09_05d((eZZmeasCriteria_frxD09_05d(:,i)),i) = t_swpDfrx(eZZmeasCriteria_frxD09_05d(:,i));
    end
% parameter 10
    if sum(eXXmeasCriteria_frxD10_05d(:,i)) > 0
        t_eXX_detectable_frxD10_05d((eXXmeasCriteria_frxD10_05d(:,i)),i) = t_swpDfrx(eXXmeasCriteria_frxD10_05d(:,i));
    end
    if sum(eZZmeasCriteria_frxD10_05d(:,i)) > 0
        t_eZZ_detectable_frxD10_05d((eZZmeasCriteria_frxD10_05d(:,i)),i) = t_swpDfrx(eZZmeasCriteria_frxD10_05d(:,i));
    end
    
% ==================================================================================================== %
% Depth 10%
% ==================================================================================================== %
% parameter 01
    if sum(eXXmeasCriteria_frxD01_10d(:,i)) > 0
        t_eXX_detectable_frxD01_10d((eXXmeasCriteria_frxD01_10d(:,i)),i) = t_swpDfrx(eXXmeasCriteria_frxD01_10d(:,i));
    end
    if sum(eZZmeasCriteria_frxD01_10d(:,i)) > 0
        t_eZZ_detectable_frxD01_10d((eZZmeasCriteria_frxD01_10d(:,i)),i) = t_swpDfrx(eZZmeasCriteria_frxD01_10d(:,i));
    end
% parameter 02
    if sum(eXXmeasCriteria_frxD02_10d(:,i)) > 0
        t_eXX_detectable_frxD02_10d((eXXmeasCriteria_frxD02_10d(:,i)),i) = t_swpDfrx(eXXmeasCriteria_frxD02_10d(:,i));
    end
    if sum(eZZmeasCriteria_frxD02_10d(:,i)) > 0
        t_eZZ_detectable_frxD02_10d((eZZmeasCriteria_frxD02_10d(:,i)),i) = t_swpDfrx(eZZmeasCriteria_frxD02_10d(:,i));
    end
% parameter 03
    if sum(eXXmeasCriteria_frxD03_10d(:,i)) > 0
        t_eXX_detectable_frxD03_10d((eXXmeasCriteria_frxD03_10d(:,i)),i) = t_swpDfrx(eXXmeasCriteria_frxD03_10d(:,i));
    end
    if sum(eZZmeasCriteria_frxD03_10d(:,i)) > 0
        t_eZZ_detectable_frxD03_10d((eZZmeasCriteria_frxD03_10d(:,i)),i) = t_swpDfrx(eZZmeasCriteria_frxD03_10d(:,i));
    end
% parameter 04
    if sum(eXXmeasCriteria_frxD04_10d(:,i)) > 0
        t_eXX_detectable_frxD04_10d((eXXmeasCriteria_frxD04_10d(:,i)),i) = t_swpDfrx(eXXmeasCriteria_frxD04_10d(:,i));
    end
    if sum(eZZmeasCriteria_frxD04_10d(:,i)) > 0
        t_eZZ_detectable_frxD04_10d((eZZmeasCriteria_frxD04_10d(:,i)),i) = t_swpDfrx(eZZmeasCriteria_frxD04_10d(:,i));
    end
% parameter 05
    if sum(eXXmeasCriteria_frxD05_10d(:,i)) > 0
        t_eXX_detectable_frxD05_10d((eXXmeasCriteria_frxD05_10d(:,i)),i) = t_swpDfrx(eXXmeasCriteria_frxD05_10d(:,i));
    end
    if sum(eZZmeasCriteria_frxD05_10d(:,i)) > 0
        t_eZZ_detectable_frxD05_10d((eZZmeasCriteria_frxD05_10d(:,i)),i) = t_swpDfrx(eZZmeasCriteria_frxD05_10d(:,i));
    end
% parameter 06
    if sum(eXXmeasCriteria_frxD06_10d(:,i)) > 0
        t_eXX_detectable_frxD06_10d((eXXmeasCriteria_frxD06_10d(:,i)),i) = t_swpDfrx(eXXmeasCriteria_frxD06_10d(:,i));
    end
    if sum(eZZmeasCriteria_frxD06_10d(:,i)) > 0
        t_eZZ_detectable_frxD06_10d((eZZmeasCriteria_frxD06_10d(:,i)),i) = t_swpDfrx(eZZmeasCriteria_frxD06_10d(:,i));
    end
% parameter 07
    if sum(eXXmeasCriteria_frxD07_10d(:,i)) > 0
        t_eXX_detectable_frxD07_10d((eXXmeasCriteria_frxD07_10d(:,i)),i) = t_swpDfrx(eXXmeasCriteria_frxD07_10d(:,i));
    end
    if sum(eZZmeasCriteria_frxD07_10d(:,i)) > 0
        t_eZZ_detectable_frxD07_10d((eZZmeasCriteria_frxD07_10d(:,i)),i) = t_swpDfrx(eZZmeasCriteria_frxD07_10d(:,i));
    end
% parameter 08
    if sum(eXXmeasCriteria_frxD08_10d(:,i)) > 0
        t_eXX_detectable_frxD08_10d((eXXmeasCriteria_frxD08_10d(:,i)),i) = t_swpDfrx(eXXmeasCriteria_frxD08_10d(:,i));
    end
    if sum(eZZmeasCriteria_frxD08_10d(:,i)) > 0
        t_eZZ_detectable_frxD08_10d((eZZmeasCriteria_frxD08_10d(:,i)),i) = t_swpDfrx(eZZmeasCriteria_frxD08_10d(:,i));
    end
% parameter 09
    if sum(eXXmeasCriteria_frxD09_10d(:,i)) > 0
        t_eXX_detectable_frxD09_10d((eXXmeasCriteria_frxD09_10d(:,i)),i) = t_swpDfrx(eXXmeasCriteria_frxD09_10d(:,i));
    end
    if sum(eZZmeasCriteria_frxD09_10d(:,i)) > 0
        t_eZZ_detectable_frxD09_10d((eZZmeasCriteria_frxD09_10d(:,i)),i) = t_swpDfrx(eZZmeasCriteria_frxD09_10d(:,i));
    end
% parameter 10
    if sum(eXXmeasCriteria_frxD10_10d(:,i)) > 0
        t_eXX_detectable_frxD10_10d((eXXmeasCriteria_frxD10_10d(:,i)),i) = t_swpDfrx(eXXmeasCriteria_frxD10_10d(:,i));
    end
    if sum(eZZmeasCriteria_frxD10_10d(:,i)) > 0
        t_eZZ_detectable_frxD10_10d((eZZmeasCriteria_frxD10_10d(:,i)),i) = t_swpDfrx(eZZmeasCriteria_frxD10_10d(:,i));
    end
    
% ==================================================================================================== %
% Depth 50%
% ==================================================================================================== %
% parameter 01
    if sum(eXXmeasCriteria_frxD01_50d(:,i)) > 0
        t_eXX_detectable_frxD01_50d((eXXmeasCriteria_frxD01_50d(:,i)),i) = t_swpDfrx(eXXmeasCriteria_frxD01_50d(:,i));
    end
    if sum(eZZmeasCriteria_frxD01_50d(:,i)) > 0
        t_eZZ_detectable_frxD01_50d((eZZmeasCriteria_frxD01_50d(:,i)),i) = t_swpDfrx(eZZmeasCriteria_frxD01_50d(:,i));
    end
% parameter 02
    if sum(eXXmeasCriteria_frxD02_50d(:,i)) > 0
        t_eXX_detectable_frxD02_50d((eXXmeasCriteria_frxD02_50d(:,i)),i) = t_swpDfrx(eXXmeasCriteria_frxD02_50d(:,i));
    end
    if sum(eZZmeasCriteria_frxD02_50d(:,i)) > 0
        t_eZZ_detectable_frxD02_50d((eZZmeasCriteria_frxD02_50d(:,i)),i) = t_swpDfrx(eZZmeasCriteria_frxD02_50d(:,i));
    end
% parameter 03
    if sum(eXXmeasCriteria_frxD03_50d(:,i)) > 0
        t_eXX_detectable_frxD03_50d((eXXmeasCriteria_frxD03_50d(:,i)),i) = t_swpDfrx(eXXmeasCriteria_frxD03_50d(:,i));
    end
    if sum(eZZmeasCriteria_frxD03_50d(:,i)) > 0
        t_eZZ_detectable_frxD03_50d((eZZmeasCriteria_frxD03_50d(:,i)),i) = t_swpDfrx(eZZmeasCriteria_frxD03_50d(:,i));
    end
% parameter 04
    if sum(eXXmeasCriteria_frxD04_50d(:,i)) > 0
        t_eXX_detectable_frxD04_50d((eXXmeasCriteria_frxD04_50d(:,i)),i) = t_swpDfrx(eXXmeasCriteria_frxD04_50d(:,i));
    end
    if sum(eZZmeasCriteria_frxD04_50d(:,i)) > 0
        t_eZZ_detectable_frxD04_50d((eZZmeasCriteria_frxD04_50d(:,i)),i) = t_swpDfrx(eZZmeasCriteria_frxD04_50d(:,i));
    end
% parameter 05
    if sum(eXXmeasCriteria_frxD05_50d(:,i)) > 0
        t_eXX_detectable_frxD05_50d((eXXmeasCriteria_frxD05_50d(:,i)),i) = t_swpDfrx(eXXmeasCriteria_frxD05_50d(:,i));
    end
    if sum(eZZmeasCriteria_frxD05_50d(:,i)) > 0
        t_eZZ_detectable_frxD05_50d((eZZmeasCriteria_frxD05_50d(:,i)),i) = t_swpDfrx(eZZmeasCriteria_frxD05_50d(:,i));
    end
% parameter 06
    if sum(eXXmeasCriteria_frxD06_50d(:,i)) > 0
        t_eXX_detectable_frxD06_50d((eXXmeasCriteria_frxD06_50d(:,i)),i) = t_swpDfrx(eXXmeasCriteria_frxD06_50d(:,i));
    end
    if sum(eZZmeasCriteria_frxD06_50d(:,i)) > 0
        t_eZZ_detectable_frxD06_50d((eZZmeasCriteria_frxD06_50d(:,i)),i) = t_swpDfrx(eZZmeasCriteria_frxD06_50d(:,i));
    end
% parameter 07
    if sum(eXXmeasCriteria_frxD07_50d(:,i)) > 0
        t_eXX_detectable_frxD07_50d((eXXmeasCriteria_frxD07_50d(:,i)),i) = t_swpDfrx(eXXmeasCriteria_frxD07_50d(:,i));
    end
    if sum(eZZmeasCriteria_frxD07_50d(:,i)) > 0
        t_eZZ_detectable_frxD07_50d((eZZmeasCriteria_frxD07_50d(:,i)),i) = t_swpDfrx(eZZmeasCriteria_frxD07_50d(:,i));
    end
% parameter 08
    if sum(eXXmeasCriteria_frxD08_50d(:,i)) > 0
        t_eXX_detectable_frxD08_50d((eXXmeasCriteria_frxD08_50d(:,i)),i) = t_swpDfrx(eXXmeasCriteria_frxD08_50d(:,i));
    end
    if sum(eZZmeasCriteria_frxD08_50d(:,i)) > 0
        t_eZZ_detectable_frxD08_50d((eZZmeasCriteria_frxD08_50d(:,i)),i) = t_swpDfrx(eZZmeasCriteria_frxD08_50d(:,i));
    end
% parameter 09
    if sum(eXXmeasCriteria_frxD09_50d(:,i)) > 0
        t_eXX_detectable_frxD09_50d((eXXmeasCriteria_frxD09_50d(:,i)),i) = t_swpDfrx(eXXmeasCriteria_frxD09_50d(:,i));
    end
    if sum(eZZmeasCriteria_frxD09_50d(:,i)) > 0
        t_eZZ_detectable_frxD09_50d((eZZmeasCriteria_frxD09_50d(:,i)),i) = t_swpDfrx(eZZmeasCriteria_frxD09_50d(:,i));
    end
% parameter 10
    if sum(eXXmeasCriteria_frxD10_50d(:,i)) > 0
        t_eXX_detectable_frxD10_50d((eXXmeasCriteria_frxD10_50d(:,i)),i) = t_swpDfrx(eXXmeasCriteria_frxD10_50d(:,i));
    end
    if sum(eZZmeasCriteria_frxD10_50d(:,i)) > 0
        t_eZZ_detectable_frxD10_50d((eZZmeasCriteria_frxD10_50d(:,i)),i) = t_swpDfrx(eZZmeasCriteria_frxD10_50d(:,i));
    end
    
end

%% Duration Strain is Detectable

% ==================================================================================================== %
% First and last time strain is detectable
% ==================================================================================================== %
% parameter 01
tFirst_eXX_detectable_frxD01_01d  = zeros(1,n_probes);
tLast_eXX_detectable_frxD01_01d   = zeros(1,n_probes);
tFirst_eZZ_detectable_frxD01_01d  = zeros(1,n_probes);
tLast_eZZ_detectable_frxD01_01d   = zeros(1,n_probes);
tFirst_eXX_detectable_frxD01_03d  = zeros(1,n_probes);
tLast_eXX_detectable_frxD01_03d   = zeros(1,n_probes);
tFirst_eZZ_detectable_frxD01_03d  = zeros(1,n_probes);
tLast_eZZ_detectable_frxD01_03d   = zeros(1,n_probes);
tFirst_eXX_detectable_frxD01_05d  = zeros(1,n_probes);
tLast_eXX_detectable_frxD01_05d   = zeros(1,n_probes);
tFirst_eZZ_detectable_frxD01_05d  = zeros(1,n_probes);
tLast_eZZ_detectable_frxD01_05d   = zeros(1,n_probes);
tFirst_eXX_detectable_frxD01_10d  = zeros(1,n_probes);
tLast_eXX_detectable_frxD01_10d   = zeros(1,n_probes);
tFirst_eZZ_detectable_frxD01_10d  = zeros(1,n_probes);
tLast_eZZ_detectable_frxD01_10d   = zeros(1,n_probes);
tFirst_eXX_detectable_frxD01_50d  = zeros(1,n_probes);
tLast_eXX_detectable_frxD01_50d   = zeros(1,n_probes);
tFirst_eZZ_detectable_frxD01_50d  = zeros(1,n_probes);
tLast_eZZ_detectable_frxD01_50d   = zeros(1,n_probes);
% parameter 02
tFirst_eXX_detectable_frxD02_01d  = zeros(1,n_probes);
tLast_eXX_detectable_frxD02_01d   = zeros(1,n_probes);
tFirst_eZZ_detectable_frxD02_01d  = zeros(1,n_probes);
tLast_eZZ_detectable_frxD02_01d   = zeros(1,n_probes);
tFirst_eXX_detectable_frxD02_03d  = zeros(1,n_probes);
tLast_eXX_detectable_frxD02_03d   = zeros(1,n_probes);
tFirst_eZZ_detectable_frxD02_03d  = zeros(1,n_probes);
tLast_eZZ_detectable_frxD02_03d   = zeros(1,n_probes);
tFirst_eXX_detectable_frxD02_05d  = zeros(1,n_probes);
tLast_eXX_detectable_frxD02_05d   = zeros(1,n_probes);
tFirst_eZZ_detectable_frxD02_05d  = zeros(1,n_probes);
tLast_eZZ_detectable_frxD02_05d   = zeros(1,n_probes);
tFirst_eXX_detectable_frxD02_10d  = zeros(1,n_probes);
tLast_eXX_detectable_frxD02_10d   = zeros(1,n_probes);
tFirst_eZZ_detectable_frxD02_10d  = zeros(1,n_probes);
tLast_eZZ_detectable_frxD02_10d   = zeros(1,n_probes);
tFirst_eXX_detectable_frxD02_50d  = zeros(1,n_probes);
tLast_eXX_detectable_frxD02_50d   = zeros(1,n_probes);
tFirst_eZZ_detectable_frxD02_50d  = zeros(1,n_probes);
tLast_eZZ_detectable_frxD02_50d   = zeros(1,n_probes);
% parameter 03
tFirst_eXX_detectable_frxD03_01d  = zeros(1,n_probes);
tLast_eXX_detectable_frxD03_01d   = zeros(1,n_probes);
tFirst_eZZ_detectable_frxD03_01d  = zeros(1,n_probes);
tLast_eZZ_detectable_frxD03_01d   = zeros(1,n_probes);
tFirst_eXX_detectable_frxD03_03d  = zeros(1,n_probes);
tLast_eXX_detectable_frxD03_03d   = zeros(1,n_probes);
tFirst_eZZ_detectable_frxD03_03d  = zeros(1,n_probes);
tLast_eZZ_detectable_frxD03_03d   = zeros(1,n_probes);
tFirst_eXX_detectable_frxD03_05d  = zeros(1,n_probes);
tLast_eXX_detectable_frxD03_05d   = zeros(1,n_probes);
tFirst_eZZ_detectable_frxD03_05d  = zeros(1,n_probes);
tLast_eZZ_detectable_frxD03_05d   = zeros(1,n_probes);
tFirst_eXX_detectable_frxD03_10d  = zeros(1,n_probes);
tLast_eXX_detectable_frxD03_10d   = zeros(1,n_probes);
tFirst_eZZ_detectable_frxD03_10d  = zeros(1,n_probes);
tLast_eZZ_detectable_frxD03_10d   = zeros(1,n_probes);
tFirst_eXX_detectable_frxD03_50d  = zeros(1,n_probes);
tLast_eXX_detectable_frxD03_50d   = zeros(1,n_probes);
tFirst_eZZ_detectable_frxD03_50d  = zeros(1,n_probes);
tLast_eZZ_detectable_frxD03_50d   = zeros(1,n_probes);
% parameter 04
tFirst_eXX_detectable_frxD04_01d  = zeros(1,n_probes);
tLast_eXX_detectable_frxD04_01d   = zeros(1,n_probes);
tFirst_eZZ_detectable_frxD04_01d  = zeros(1,n_probes);
tLast_eZZ_detectable_frxD04_01d   = zeros(1,n_probes);
tFirst_eXX_detectable_frxD04_03d  = zeros(1,n_probes);
tLast_eXX_detectable_frxD04_03d   = zeros(1,n_probes);
tFirst_eZZ_detectable_frxD04_03d  = zeros(1,n_probes);
tLast_eZZ_detectable_frxD04_03d   = zeros(1,n_probes);
tFirst_eXX_detectable_frxD04_05d  = zeros(1,n_probes);
tLast_eXX_detectable_frxD04_05d   = zeros(1,n_probes);
tFirst_eZZ_detectable_frxD04_05d  = zeros(1,n_probes);
tLast_eZZ_detectable_frxD04_05d   = zeros(1,n_probes);
tFirst_eXX_detectable_frxD04_10d  = zeros(1,n_probes);
tLast_eXX_detectable_frxD04_10d   = zeros(1,n_probes);
tFirst_eZZ_detectable_frxD04_10d  = zeros(1,n_probes);
tLast_eZZ_detectable_frxD04_10d   = zeros(1,n_probes);
tFirst_eXX_detectable_frxD04_50d  = zeros(1,n_probes);
tLast_eXX_detectable_frxD04_50d   = zeros(1,n_probes);
tFirst_eZZ_detectable_frxD04_50d  = zeros(1,n_probes);
tLast_eZZ_detectable_frxD04_50d   = zeros(1,n_probes);
% parameter 05
tFirst_eXX_detectable_frxD05_01d  = zeros(1,n_probes);
tLast_eXX_detectable_frxD05_01d   = zeros(1,n_probes);
tFirst_eZZ_detectable_frxD05_01d  = zeros(1,n_probes);
tLast_eZZ_detectable_frxD05_01d   = zeros(1,n_probes);
tFirst_eXX_detectable_frxD05_03d  = zeros(1,n_probes);
tLast_eXX_detectable_frxD05_03d   = zeros(1,n_probes);
tFirst_eZZ_detectable_frxD05_03d  = zeros(1,n_probes);
tLast_eZZ_detectable_frxD05_03d   = zeros(1,n_probes);
tFirst_eXX_detectable_frxD05_05d  = zeros(1,n_probes);
tLast_eXX_detectable_frxD05_05d   = zeros(1,n_probes);
tFirst_eZZ_detectable_frxD05_05d  = zeros(1,n_probes);
tLast_eZZ_detectable_frxD05_05d   = zeros(1,n_probes);
tFirst_eXX_detectable_frxD05_10d  = zeros(1,n_probes);
tLast_eXX_detectable_frxD05_10d   = zeros(1,n_probes);
tFirst_eZZ_detectable_frxD05_10d  = zeros(1,n_probes);
tLast_eZZ_detectable_frxD05_10d   = zeros(1,n_probes);
tFirst_eXX_detectable_frxD05_50d  = zeros(1,n_probes);
tLast_eXX_detectable_frxD05_50d   = zeros(1,n_probes);
tFirst_eZZ_detectable_frxD05_50d  = zeros(1,n_probes);
tLast_eZZ_detectable_frxD05_50d   = zeros(1,n_probes);
% parameter 06
tFirst_eXX_detectable_frxD06_01d  = zeros(1,n_probes);
tLast_eXX_detectable_frxD06_01d   = zeros(1,n_probes);
tFirst_eZZ_detectable_frxD06_01d  = zeros(1,n_probes);
tLast_eZZ_detectable_frxD06_01d   = zeros(1,n_probes);
tFirst_eXX_detectable_frxD06_03d  = zeros(1,n_probes);
tLast_eXX_detectable_frxD06_03d   = zeros(1,n_probes);
tFirst_eZZ_detectable_frxD06_03d  = zeros(1,n_probes);
tLast_eZZ_detectable_frxD06_03d   = zeros(1,n_probes);
tFirst_eXX_detectable_frxD06_05d  = zeros(1,n_probes);
tLast_eXX_detectable_frxD06_05d   = zeros(1,n_probes);
tFirst_eZZ_detectable_frxD06_05d  = zeros(1,n_probes);
tLast_eZZ_detectable_frxD06_05d   = zeros(1,n_probes);
tFirst_eXX_detectable_frxD06_10d  = zeros(1,n_probes);
tLast_eXX_detectable_frxD06_10d   = zeros(1,n_probes);
tFirst_eZZ_detectable_frxD06_10d  = zeros(1,n_probes);
tLast_eZZ_detectable_frxD06_10d   = zeros(1,n_probes);
tFirst_eXX_detectable_frxD06_50d  = zeros(1,n_probes);
tLast_eXX_detectable_frxD06_50d   = zeros(1,n_probes);
tFirst_eZZ_detectable_frxD06_50d  = zeros(1,n_probes);
tLast_eZZ_detectable_frxD06_50d   = zeros(1,n_probes);
% parameter 07
tFirst_eXX_detectable_frxD07_01d  = zeros(1,n_probes);
tLast_eXX_detectable_frxD07_01d   = zeros(1,n_probes);
tFirst_eZZ_detectable_frxD07_01d  = zeros(1,n_probes);
tLast_eZZ_detectable_frxD07_01d   = zeros(1,n_probes);
tFirst_eXX_detectable_frxD07_03d  = zeros(1,n_probes);
tLast_eXX_detectable_frxD07_03d   = zeros(1,n_probes);
tFirst_eZZ_detectable_frxD07_03d  = zeros(1,n_probes);
tLast_eZZ_detectable_frxD07_03d   = zeros(1,n_probes);
tFirst_eXX_detectable_frxD07_05d  = zeros(1,n_probes);
tLast_eXX_detectable_frxD07_05d   = zeros(1,n_probes);
tFirst_eZZ_detectable_frxD07_05d  = zeros(1,n_probes);
tLast_eZZ_detectable_frxD07_05d   = zeros(1,n_probes);
tFirst_eXX_detectable_frxD07_10d  = zeros(1,n_probes);
tLast_eXX_detectable_frxD07_10d   = zeros(1,n_probes);
tFirst_eZZ_detectable_frxD07_10d  = zeros(1,n_probes);
tLast_eZZ_detectable_frxD07_10d   = zeros(1,n_probes);
tFirst_eXX_detectable_frxD07_50d  = zeros(1,n_probes);
tLast_eXX_detectable_frxD07_50d   = zeros(1,n_probes);
tFirst_eZZ_detectable_frxD07_50d  = zeros(1,n_probes);
tLast_eZZ_detectable_frxD07_50d   = zeros(1,n_probes);
% parameter 08
tFirst_eXX_detectable_frxD08_01d  = zeros(1,n_probes);
tLast_eXX_detectable_frxD08_01d   = zeros(1,n_probes);
tFirst_eZZ_detectable_frxD08_01d  = zeros(1,n_probes);
tLast_eZZ_detectable_frxD08_01d   = zeros(1,n_probes);
tFirst_eXX_detectable_frxD08_03d  = zeros(1,n_probes);
tLast_eXX_detectable_frxD08_03d   = zeros(1,n_probes);
tFirst_eZZ_detectable_frxD08_03d  = zeros(1,n_probes);
tLast_eZZ_detectable_frxD08_03d   = zeros(1,n_probes);
tFirst_eXX_detectable_frxD08_05d  = zeros(1,n_probes);
tLast_eXX_detectable_frxD08_05d   = zeros(1,n_probes);
tFirst_eZZ_detectable_frxD08_05d  = zeros(1,n_probes);
tLast_eZZ_detectable_frxD08_05d   = zeros(1,n_probes);
tFirst_eXX_detectable_frxD08_10d  = zeros(1,n_probes);
tLast_eXX_detectable_frxD08_10d   = zeros(1,n_probes);
tFirst_eZZ_detectable_frxD08_10d  = zeros(1,n_probes);
tLast_eZZ_detectable_frxD08_10d   = zeros(1,n_probes);
tFirst_eXX_detectable_frxD08_50d  = zeros(1,n_probes);
tLast_eXX_detectable_frxD08_50d   = zeros(1,n_probes);
tFirst_eZZ_detectable_frxD08_50d  = zeros(1,n_probes);
tLast_eZZ_detectable_frxD08_50d   = zeros(1,n_probes);
% parameter 09
tFirst_eXX_detectable_frxD09_01d  = zeros(1,n_probes);
tLast_eXX_detectable_frxD09_01d   = zeros(1,n_probes);
tFirst_eZZ_detectable_frxD09_01d  = zeros(1,n_probes);
tLast_eZZ_detectable_frxD09_01d   = zeros(1,n_probes);
tFirst_eXX_detectable_frxD09_03d  = zeros(1,n_probes);
tLast_eXX_detectable_frxD09_03d   = zeros(1,n_probes);
tFirst_eZZ_detectable_frxD09_03d  = zeros(1,n_probes);
tLast_eZZ_detectable_frxD09_03d   = zeros(1,n_probes);
tFirst_eXX_detectable_frxD09_05d  = zeros(1,n_probes);
tLast_eXX_detectable_frxD09_05d   = zeros(1,n_probes);
tFirst_eZZ_detectable_frxD09_05d  = zeros(1,n_probes);
tLast_eZZ_detectable_frxD09_05d   = zeros(1,n_probes);
tFirst_eXX_detectable_frxD09_10d  = zeros(1,n_probes);
tLast_eXX_detectable_frxD09_10d   = zeros(1,n_probes);
tFirst_eZZ_detectable_frxD09_10d  = zeros(1,n_probes);
tLast_eZZ_detectable_frxD09_10d   = zeros(1,n_probes);
tFirst_eXX_detectable_frxD09_50d  = zeros(1,n_probes);
tLast_eXX_detectable_frxD09_50d   = zeros(1,n_probes);
tFirst_eZZ_detectable_frxD09_50d  = zeros(1,n_probes);
tLast_eZZ_detectable_frxD09_50d   = zeros(1,n_probes);
% parameter 10
tFirst_eXX_detectable_frxD10_01d  = zeros(1,n_probes);
tLast_eXX_detectable_frxD10_01d   = zeros(1,n_probes);
tFirst_eZZ_detectable_frxD10_01d  = zeros(1,n_probes);
tLast_eZZ_detectable_frxD10_01d   = zeros(1,n_probes);
tFirst_eXX_detectable_frxD10_03d  = zeros(1,n_probes);
tLast_eXX_detectable_frxD10_03d   = zeros(1,n_probes);
tFirst_eZZ_detectable_frxD10_03d  = zeros(1,n_probes);
tLast_eZZ_detectable_frxD10_03d   = zeros(1,n_probes);
tFirst_eXX_detectable_frxD10_05d  = zeros(1,n_probes);
tLast_eXX_detectable_frxD10_05d   = zeros(1,n_probes);
tFirst_eZZ_detectable_frxD10_05d  = zeros(1,n_probes);
tLast_eZZ_detectable_frxD10_05d   = zeros(1,n_probes);
tFirst_eXX_detectable_frxD10_10d  = zeros(1,n_probes);
tLast_eXX_detectable_frxD10_10d   = zeros(1,n_probes);
tFirst_eZZ_detectable_frxD10_10d  = zeros(1,n_probes);
tLast_eZZ_detectable_frxD10_10d   = zeros(1,n_probes);
tFirst_eXX_detectable_frxD10_50d  = zeros(1,n_probes);
tLast_eXX_detectable_frxD10_50d   = zeros(1,n_probes);
tFirst_eZZ_detectable_frxD10_50d  = zeros(1,n_probes);
tLast_eZZ_detectable_frxD10_50d   = zeros(1,n_probes);

for i = 1:n_probes
% ==================================================================================================== %
% Depth 1%
% ==================================================================================================== %
% parameter 01
    if sum(t_eXX_detectable_frxD01_01d(:,i)) > 0
        tFirst_eXX_detectable_frxD01_01d(i) = t_eXX_detectable_frxD01_01d(find(t_eXX_detectable_frxD01_01d(:,i),1,'first'));
        tLast_eXX_detectable_frxD01_01d(i) = t_eXX_detectable_frxD01_01d(find(t_eXX_detectable_frxD01_01d(:,i),1,'last'));
    end
    if sum(t_eZZ_detectable_frxD01_01d(:,i)) > 0
        tFirst_eZZ_detectable_frxD01_01d(i) = t_eZZ_detectable_frxD01_01d(find(t_eZZ_detectable_frxD01_01d(:,i),1,'first'));
        tLast_eZZ_detectable_frxD01_01d(i) = t_eZZ_detectable_frxD01_01d(find(t_eZZ_detectable_frxD01_01d(:,i),1,'last'));
    end
% parameter 02
    if sum(t_eXX_detectable_frxD02_01d(:,i)) > 0
        tFirst_eXX_detectable_frxD02_01d(i) = t_eXX_detectable_frxD02_01d(find(t_eXX_detectable_frxD02_01d(:,i),1,'first'));
        tLast_eXX_detectable_frxD02_01d(i) = t_eXX_detectable_frxD02_01d(find(t_eXX_detectable_frxD02_01d(:,i),1,'last'));
    end
    if sum(t_eZZ_detectable_frxD02_01d(:,i)) > 0
        tFirst_eZZ_detectable_frxD02_01d(i) = t_eZZ_detectable_frxD02_01d(find(t_eZZ_detectable_frxD02_01d(:,i),1,'first'));
        tLast_eZZ_detectable_frxD02_01d(i) = t_eZZ_detectable_frxD02_01d(find(t_eZZ_detectable_frxD02_01d(:,i),1,'last'));
    end
% parameter 03
    if sum(t_eXX_detectable_frxD03_01d(:,i)) > 0
        tFirst_eXX_detectable_frxD03_01d(i) = t_eXX_detectable_frxD03_01d(find(t_eXX_detectable_frxD03_01d(:,i),1,'first'));
        tLast_eXX_detectable_frxD03_01d(i) = t_eXX_detectable_frxD03_01d(find(t_eXX_detectable_frxD03_01d(:,i),1,'last'));
    end
    if sum(t_eZZ_detectable_frxD03_01d(:,i)) > 0
        tFirst_eZZ_detectable_frxD03_01d(i) = t_eZZ_detectable_frxD03_01d(find(t_eZZ_detectable_frxD03_01d(:,i),1,'first'));
        tLast_eZZ_detectable_frxD03_01d(i) = t_eZZ_detectable_frxD03_01d(find(t_eZZ_detectable_frxD03_01d(:,i),1,'last'));
    end
% parameter 04
    if sum(t_eXX_detectable_frxD04_01d(:,i)) > 0
        tFirst_eXX_detectable_frxD04_01d(i) = t_eXX_detectable_frxD04_01d(find(t_eXX_detectable_frxD04_01d(:,i),1,'first'));
        tLast_eXX_detectable_frxD04_01d(i) = t_eXX_detectable_frxD04_01d(find(t_eXX_detectable_frxD04_01d(:,i),1,'last'));
    end
    if sum(t_eZZ_detectable_frxD04_01d(:,i)) > 0
        tFirst_eZZ_detectable_frxD04_01d(i) = t_eZZ_detectable_frxD04_01d(find(t_eZZ_detectable_frxD04_01d(:,i),1,'first'));
        tLast_eZZ_detectable_frxD04_01d(i) = t_eZZ_detectable_frxD04_01d(find(t_eZZ_detectable_frxD04_01d(:,i),1,'last'));
    end
% parameter 05
    if sum(t_eXX_detectable_frxD05_01d(:,i)) > 0
        tFirst_eXX_detectable_frxD05_01d(i) = t_eXX_detectable_frxD05_01d(find(t_eXX_detectable_frxD05_01d(:,i),1,'first'));
        tLast_eXX_detectable_frxD05_01d(i) = t_eXX_detectable_frxD05_01d(find(t_eXX_detectable_frxD05_01d(:,i),1,'last'));
    end
    if sum(t_eZZ_detectable_frxD05_01d(:,i)) > 0
        tFirst_eZZ_detectable_frxD05_01d(i) = t_eZZ_detectable_frxD05_01d(find(t_eZZ_detectable_frxD05_01d(:,i),1,'first'));
        tLast_eZZ_detectable_frxD05_01d(i) = t_eZZ_detectable_frxD05_01d(find(t_eZZ_detectable_frxD05_01d(:,i),1,'last'));
    end
% parameter 06
    if sum(t_eXX_detectable_frxD06_01d(:,i)) > 0
        tFirst_eXX_detectable_frxD06_01d(i) = t_eXX_detectable_frxD06_01d(find(t_eXX_detectable_frxD06_01d(:,i),1,'first'));
        tLast_eXX_detectable_frxD06_01d(i) = t_eXX_detectable_frxD06_01d(find(t_eXX_detectable_frxD06_01d(:,i),1,'last'));
    end
    if sum(t_eZZ_detectable_frxD06_01d(:,i)) > 0
        tFirst_eZZ_detectable_frxD06_01d(i) = t_eZZ_detectable_frxD06_01d(find(t_eZZ_detectable_frxD06_01d(:,i),1,'first'));
        tLast_eZZ_detectable_frxD06_01d(i) = t_eZZ_detectable_frxD06_01d(find(t_eZZ_detectable_frxD06_01d(:,i),1,'last'));
    end
% parameter 07
    if sum(t_eXX_detectable_frxD07_01d(:,i)) > 0
        tFirst_eXX_detectable_frxD07_01d(i) = t_eXX_detectable_frxD07_01d(find(t_eXX_detectable_frxD07_01d(:,i),1,'first'));
        tLast_eXX_detectable_frxD07_01d(i) = t_eXX_detectable_frxD07_01d(find(t_eXX_detectable_frxD07_01d(:,i),1,'last'));
    end
    if sum(t_eZZ_detectable_frxD07_01d(:,i)) > 0
        tFirst_eZZ_detectable_frxD07_01d(i) = t_eZZ_detectable_frxD07_01d(find(t_eZZ_detectable_frxD07_01d(:,i),1,'first'));
        tLast_eZZ_detectable_frxD07_01d(i) = t_eZZ_detectable_frxD07_01d(find(t_eZZ_detectable_frxD07_01d(:,i),1,'last'));
    end
% parameter 08
    if sum(t_eXX_detectable_frxD08_01d(:,i)) > 0
        tFirst_eXX_detectable_frxD08_01d(i) = t_eXX_detectable_frxD08_01d(find(t_eXX_detectable_frxD08_01d(:,i),1,'first'));
        tLast_eXX_detectable_frxD08_01d(i) = t_eXX_detectable_frxD08_01d(find(t_eXX_detectable_frxD08_01d(:,i),1,'last'));
    end
    if sum(t_eZZ_detectable_frxD08_01d(:,i)) > 0
        tFirst_eZZ_detectable_frxD08_01d(i) = t_eZZ_detectable_frxD08_01d(find(t_eZZ_detectable_frxD08_01d(:,i),1,'first'));
        tLast_eZZ_detectable_frxD08_01d(i) = t_eZZ_detectable_frxD08_01d(find(t_eZZ_detectable_frxD08_01d(:,i),1,'last'));
    end
% parameter 09
    if sum(t_eXX_detectable_frxD09_01d(:,i)) > 0
        tFirst_eXX_detectable_frxD09_01d(i) = t_eXX_detectable_frxD09_01d(find(t_eXX_detectable_frxD09_01d(:,i),1,'first'));
        tLast_eXX_detectable_frxD09_01d(i) = t_eXX_detectable_frxD09_01d(find(t_eXX_detectable_frxD09_01d(:,i),1,'last'));
    end
    if sum(t_eZZ_detectable_frxD09_01d(:,i)) > 0
        tFirst_eZZ_detectable_frxD09_01d(i) = t_eZZ_detectable_frxD09_01d(find(t_eZZ_detectable_frxD09_01d(:,i),1,'first'));
        tLast_eZZ_detectable_frxD09_01d(i) = t_eZZ_detectable_frxD09_01d(find(t_eZZ_detectable_frxD09_01d(:,i),1,'last'));
    end
% parameter 10
    if sum(t_eXX_detectable_frxD10_01d(:,i)) > 0
        tFirst_eXX_detectable_frxD10_01d(i) = t_eXX_detectable_frxD10_01d(find(t_eXX_detectable_frxD10_01d(:,i),1,'first'));
        tLast_eXX_detectable_frxD10_01d(i) = t_eXX_detectable_frxD10_01d(find(t_eXX_detectable_frxD10_01d(:,i),1,'last'));
    end
    if sum(t_eZZ_detectable_frxD10_01d(:,i)) > 0
        tFirst_eZZ_detectable_frxD10_01d(i) = t_eZZ_detectable_frxD10_01d(find(t_eZZ_detectable_frxD10_01d(:,i),1,'first'));
        tLast_eZZ_detectable_frxD10_01d(i) = t_eZZ_detectable_frxD10_01d(find(t_eZZ_detectable_frxD10_01d(:,i),1,'last'));
    end
    
% ==================================================================================================== %
% Depth 3%
% ==================================================================================================== %
% parameter 01
    if sum(t_eXX_detectable_frxD01_03d(:,i)) > 0
        tFirst_eXX_detectable_frxD01_03d(i) = t_eXX_detectable_frxD01_03d(find(t_eXX_detectable_frxD01_03d(:,i),1,'first'));
        tLast_eXX_detectable_frxD01_03d(i) = t_eXX_detectable_frxD01_03d(find(t_eXX_detectable_frxD01_03d(:,i),1,'last'));
    end
    if sum(t_eZZ_detectable_frxD01_03d(:,i)) > 0
        tFirst_eZZ_detectable_frxD01_03d(i) = t_eZZ_detectable_frxD01_03d(find(t_eZZ_detectable_frxD01_03d(:,i),1,'first'));
        tLast_eZZ_detectable_frxD01_03d(i) = t_eZZ_detectable_frxD01_03d(find(t_eZZ_detectable_frxD01_03d(:,i),1,'last'));
    end
% parameter 02
    if sum(t_eXX_detectable_frxD02_03d(:,i)) > 0
        tFirst_eXX_detectable_frxD02_03d(i) = t_eXX_detectable_frxD02_03d(find(t_eXX_detectable_frxD02_03d(:,i),1,'first'));
        tLast_eXX_detectable_frxD02_03d(i) = t_eXX_detectable_frxD02_03d(find(t_eXX_detectable_frxD02_03d(:,i),1,'last'));
    end
    if sum(t_eZZ_detectable_frxD02_03d(:,i)) > 0
        tFirst_eZZ_detectable_frxD02_03d(i) = t_eZZ_detectable_frxD02_03d(find(t_eZZ_detectable_frxD02_03d(:,i),1,'first'));
        tLast_eZZ_detectable_frxD02_03d(i) = t_eZZ_detectable_frxD02_03d(find(t_eZZ_detectable_frxD02_03d(:,i),1,'last'));
    end
% parameter 03
    if sum(t_eXX_detectable_frxD03_03d(:,i)) > 0
        tFirst_eXX_detectable_frxD03_03d(i) = t_eXX_detectable_frxD03_03d(find(t_eXX_detectable_frxD03_03d(:,i),1,'first'));
        tLast_eXX_detectable_frxD03_03d(i) = t_eXX_detectable_frxD03_03d(find(t_eXX_detectable_frxD03_03d(:,i),1,'last'));
    end
    if sum(t_eZZ_detectable_frxD03_03d(:,i)) > 0
        tFirst_eZZ_detectable_frxD03_03d(i) = t_eZZ_detectable_frxD03_03d(find(t_eZZ_detectable_frxD03_03d(:,i),1,'first'));
        tLast_eZZ_detectable_frxD03_03d(i) = t_eZZ_detectable_frxD03_03d(find(t_eZZ_detectable_frxD03_03d(:,i),1,'last'));
    end
% parameter 04
    if sum(t_eXX_detectable_frxD04_03d(:,i)) > 0
        tFirst_eXX_detectable_frxD04_03d(i) = t_eXX_detectable_frxD04_03d(find(t_eXX_detectable_frxD04_03d(:,i),1,'first'));
        tLast_eXX_detectable_frxD04_03d(i) = t_eXX_detectable_frxD04_03d(find(t_eXX_detectable_frxD04_03d(:,i),1,'last'));
    end
    if sum(t_eZZ_detectable_frxD04_03d(:,i)) > 0
        tFirst_eZZ_detectable_frxD04_03d(i) = t_eZZ_detectable_frxD04_03d(find(t_eZZ_detectable_frxD04_03d(:,i),1,'first'));
        tLast_eZZ_detectable_frxD04_03d(i) = t_eZZ_detectable_frxD04_03d(find(t_eZZ_detectable_frxD04_03d(:,i),1,'last'));
    end
% parameter 05
    if sum(t_eXX_detectable_frxD05_03d(:,i)) > 0
        tFirst_eXX_detectable_frxD05_03d(i) = t_eXX_detectable_frxD05_03d(find(t_eXX_detectable_frxD05_03d(:,i),1,'first'));
        tLast_eXX_detectable_frxD05_03d(i) = t_eXX_detectable_frxD05_03d(find(t_eXX_detectable_frxD05_03d(:,i),1,'last'));
    end
    if sum(t_eZZ_detectable_frxD05_03d(:,i)) > 0
        tFirst_eZZ_detectable_frxD05_03d(i) = t_eZZ_detectable_frxD05_03d(find(t_eZZ_detectable_frxD05_03d(:,i),1,'first'));
        tLast_eZZ_detectable_frxD05_03d(i) = t_eZZ_detectable_frxD05_03d(find(t_eZZ_detectable_frxD05_03d(:,i),1,'last'));
    end
% parameter 06
    if sum(t_eXX_detectable_frxD06_03d(:,i)) > 0
        tFirst_eXX_detectable_frxD06_03d(i) = t_eXX_detectable_frxD06_03d(find(t_eXX_detectable_frxD06_03d(:,i),1,'first'));
        tLast_eXX_detectable_frxD06_03d(i) = t_eXX_detectable_frxD06_03d(find(t_eXX_detectable_frxD06_03d(:,i),1,'last'));
    end
    if sum(t_eZZ_detectable_frxD06_03d(:,i)) > 0
        tFirst_eZZ_detectable_frxD06_03d(i) = t_eZZ_detectable_frxD06_03d(find(t_eZZ_detectable_frxD06_03d(:,i),1,'first'));
        tLast_eZZ_detectable_frxD06_03d(i) = t_eZZ_detectable_frxD06_03d(find(t_eZZ_detectable_frxD06_03d(:,i),1,'last'));
    end
% parameter 07
    if sum(t_eXX_detectable_frxD07_03d(:,i)) > 0
        tFirst_eXX_detectable_frxD07_03d(i) = t_eXX_detectable_frxD07_03d(find(t_eXX_detectable_frxD07_03d(:,i),1,'first'));
        tLast_eXX_detectable_frxD07_03d(i) = t_eXX_detectable_frxD07_03d(find(t_eXX_detectable_frxD07_03d(:,i),1,'last'));
    end
    if sum(t_eZZ_detectable_frxD07_03d(:,i)) > 0
        tFirst_eZZ_detectable_frxD07_03d(i) = t_eZZ_detectable_frxD07_03d(find(t_eZZ_detectable_frxD07_03d(:,i),1,'first'));
        tLast_eZZ_detectable_frxD07_03d(i) = t_eZZ_detectable_frxD07_03d(find(t_eZZ_detectable_frxD07_03d(:,i),1,'last'));
    end
% parameter 08
    if sum(t_eXX_detectable_frxD08_03d(:,i)) > 0
        tFirst_eXX_detectable_frxD08_03d(i) = t_eXX_detectable_frxD08_03d(find(t_eXX_detectable_frxD08_03d(:,i),1,'first'));
        tLast_eXX_detectable_frxD08_03d(i) = t_eXX_detectable_frxD08_03d(find(t_eXX_detectable_frxD08_03d(:,i),1,'last'));
    end
    if sum(t_eZZ_detectable_frxD08_03d(:,i)) > 0
        tFirst_eZZ_detectable_frxD08_03d(i) = t_eZZ_detectable_frxD08_03d(find(t_eZZ_detectable_frxD08_03d(:,i),1,'first'));
        tLast_eZZ_detectable_frxD08_03d(i) = t_eZZ_detectable_frxD08_03d(find(t_eZZ_detectable_frxD08_03d(:,i),1,'last'));
    end
% parameter 09
    if sum(t_eXX_detectable_frxD09_03d(:,i)) > 0
        tFirst_eXX_detectable_frxD09_03d(i) = t_eXX_detectable_frxD09_03d(find(t_eXX_detectable_frxD09_03d(:,i),1,'first'));
        tLast_eXX_detectable_frxD09_03d(i) = t_eXX_detectable_frxD09_03d(find(t_eXX_detectable_frxD09_03d(:,i),1,'last'));
    end
    if sum(t_eZZ_detectable_frxD09_03d(:,i)) > 0
        tFirst_eZZ_detectable_frxD09_03d(i) = t_eZZ_detectable_frxD09_03d(find(t_eZZ_detectable_frxD09_03d(:,i),1,'first'));
        tLast_eZZ_detectable_frxD09_03d(i) = t_eZZ_detectable_frxD09_03d(find(t_eZZ_detectable_frxD09_03d(:,i),1,'last'));
    end
% parameter 10
    if sum(t_eXX_detectable_frxD10_03d(:,i)) > 0
        tFirst_eXX_detectable_frxD10_03d(i) = t_eXX_detectable_frxD10_03d(find(t_eXX_detectable_frxD10_03d(:,i),1,'first'));
        tLast_eXX_detectable_frxD10_03d(i) = t_eXX_detectable_frxD10_03d(find(t_eXX_detectable_frxD10_03d(:,i),1,'last'));
    end
    if sum(t_eZZ_detectable_frxD10_03d(:,i)) > 0
        tFirst_eZZ_detectable_frxD10_03d(i) = t_eZZ_detectable_frxD10_03d(find(t_eZZ_detectable_frxD10_03d(:,i),1,'first'));
        tLast_eZZ_detectable_frxD10_03d(i) = t_eZZ_detectable_frxD10_03d(find(t_eZZ_detectable_frxD10_03d(:,i),1,'last'));
    end
    
% ==================================================================================================== %
% Depth 5%
% ==================================================================================================== %
% parameter 01
    if sum(t_eXX_detectable_frxD01_05d(:,i)) > 0
        tFirst_eXX_detectable_frxD01_05d(i) = t_eXX_detectable_frxD01_05d(find(t_eXX_detectable_frxD01_05d(:,i),1,'first'));
        tLast_eXX_detectable_frxD01_05d(i) = t_eXX_detectable_frxD01_05d(find(t_eXX_detectable_frxD01_05d(:,i),1,'last'));
    end
    if sum(t_eZZ_detectable_frxD01_05d(:,i)) > 0
        tFirst_eZZ_detectable_frxD01_05d(i) = t_eZZ_detectable_frxD01_05d(find(t_eZZ_detectable_frxD01_05d(:,i),1,'first'));
        tLast_eZZ_detectable_frxD01_05d(i) = t_eZZ_detectable_frxD01_05d(find(t_eZZ_detectable_frxD01_05d(:,i),1,'last'));
    end
% parameter 02
    if sum(t_eXX_detectable_frxD02_05d(:,i)) > 0
        tFirst_eXX_detectable_frxD02_05d(i) = t_eXX_detectable_frxD02_05d(find(t_eXX_detectable_frxD02_05d(:,i),1,'first'));
        tLast_eXX_detectable_frxD02_05d(i) = t_eXX_detectable_frxD02_05d(find(t_eXX_detectable_frxD02_05d(:,i),1,'last'));
    end
    if sum(t_eZZ_detectable_frxD02_05d(:,i)) > 0
        tFirst_eZZ_detectable_frxD02_05d(i) = t_eZZ_detectable_frxD02_05d(find(t_eZZ_detectable_frxD02_05d(:,i),1,'first'));
        tLast_eZZ_detectable_frxD02_05d(i) = t_eZZ_detectable_frxD02_05d(find(t_eZZ_detectable_frxD02_05d(:,i),1,'last'));
    end
% parameter 03
    if sum(t_eXX_detectable_frxD03_05d(:,i)) > 0
        tFirst_eXX_detectable_frxD03_05d(i) = t_eXX_detectable_frxD03_05d(find(t_eXX_detectable_frxD03_05d(:,i),1,'first'));
        tLast_eXX_detectable_frxD03_05d(i) = t_eXX_detectable_frxD03_05d(find(t_eXX_detectable_frxD03_05d(:,i),1,'last'));
    end
    if sum(t_eZZ_detectable_frxD03_05d(:,i)) > 0
        tFirst_eZZ_detectable_frxD03_05d(i) = t_eZZ_detectable_frxD03_05d(find(t_eZZ_detectable_frxD03_05d(:,i),1,'first'));
        tLast_eZZ_detectable_frxD03_05d(i) = t_eZZ_detectable_frxD03_05d(find(t_eZZ_detectable_frxD03_05d(:,i),1,'last'));
    end
% parameter 04
    if sum(t_eXX_detectable_frxD04_05d(:,i)) > 0
        tFirst_eXX_detectable_frxD04_05d(i) = t_eXX_detectable_frxD04_05d(find(t_eXX_detectable_frxD04_05d(:,i),1,'first'));
        tLast_eXX_detectable_frxD04_05d(i) = t_eXX_detectable_frxD04_05d(find(t_eXX_detectable_frxD04_05d(:,i),1,'last'));
    end
    if sum(t_eZZ_detectable_frxD04_05d(:,i)) > 0
        tFirst_eZZ_detectable_frxD04_05d(i) = t_eZZ_detectable_frxD04_05d(find(t_eZZ_detectable_frxD04_05d(:,i),1,'first'));
        tLast_eZZ_detectable_frxD04_05d(i) = t_eZZ_detectable_frxD04_05d(find(t_eZZ_detectable_frxD04_05d(:,i),1,'last'));
    end
% parameter 05
    if sum(t_eXX_detectable_frxD05_05d(:,i)) > 0
        tFirst_eXX_detectable_frxD05_05d(i) = t_eXX_detectable_frxD05_05d(find(t_eXX_detectable_frxD05_05d(:,i),1,'first'));
        tLast_eXX_detectable_frxD05_05d(i) = t_eXX_detectable_frxD05_05d(find(t_eXX_detectable_frxD05_05d(:,i),1,'last'));
    end
    if sum(t_eZZ_detectable_frxD05_05d(:,i)) > 0
        tFirst_eZZ_detectable_frxD05_05d(i) = t_eZZ_detectable_frxD05_05d(find(t_eZZ_detectable_frxD05_05d(:,i),1,'first'));
        tLast_eZZ_detectable_frxD05_05d(i) = t_eZZ_detectable_frxD05_05d(find(t_eZZ_detectable_frxD05_05d(:,i),1,'last'));
    end
% parameter 06
    if sum(t_eXX_detectable_frxD06_05d(:,i)) > 0
        tFirst_eXX_detectable_frxD06_05d(i) = t_eXX_detectable_frxD06_05d(find(t_eXX_detectable_frxD06_05d(:,i),1,'first'));
        tLast_eXX_detectable_frxD06_05d(i) = t_eXX_detectable_frxD06_05d(find(t_eXX_detectable_frxD06_05d(:,i),1,'last'));
    end
    if sum(t_eZZ_detectable_frxD06_05d(:,i)) > 0
        tFirst_eZZ_detectable_frxD06_05d(i) = t_eZZ_detectable_frxD06_05d(find(t_eZZ_detectable_frxD06_05d(:,i),1,'first'));
        tLast_eZZ_detectable_frxD06_05d(i) = t_eZZ_detectable_frxD06_05d(find(t_eZZ_detectable_frxD06_05d(:,i),1,'last'));
    end
% parameter 07
    if sum(t_eXX_detectable_frxD07_05d(:,i)) > 0
        tFirst_eXX_detectable_frxD07_05d(i) = t_eXX_detectable_frxD07_05d(find(t_eXX_detectable_frxD07_05d(:,i),1,'first'));
        tLast_eXX_detectable_frxD07_05d(i) = t_eXX_detectable_frxD07_05d(find(t_eXX_detectable_frxD07_05d(:,i),1,'last'));
    end
    if sum(t_eZZ_detectable_frxD07_05d(:,i)) > 0
        tFirst_eZZ_detectable_frxD07_05d(i) = t_eZZ_detectable_frxD07_05d(find(t_eZZ_detectable_frxD07_05d(:,i),1,'first'));
        tLast_eZZ_detectable_frxD07_05d(i) = t_eZZ_detectable_frxD07_05d(find(t_eZZ_detectable_frxD07_05d(:,i),1,'last'));
    end
% parameter 08
    if sum(t_eXX_detectable_frxD08_05d(:,i)) > 0
        tFirst_eXX_detectable_frxD08_05d(i) = t_eXX_detectable_frxD08_05d(find(t_eXX_detectable_frxD08_05d(:,i),1,'first'));
        tLast_eXX_detectable_frxD08_05d(i) = t_eXX_detectable_frxD08_05d(find(t_eXX_detectable_frxD08_05d(:,i),1,'last'));
    end
    if sum(t_eZZ_detectable_frxD08_05d(:,i)) > 0
        tFirst_eZZ_detectable_frxD08_05d(i) = t_eZZ_detectable_frxD08_05d(find(t_eZZ_detectable_frxD08_05d(:,i),1,'first'));
        tLast_eZZ_detectable_frxD08_05d(i) = t_eZZ_detectable_frxD08_05d(find(t_eZZ_detectable_frxD08_05d(:,i),1,'last'));
    end
% parameter 09
    if sum(t_eXX_detectable_frxD09_05d(:,i)) > 0
        tFirst_eXX_detectable_frxD09_05d(i) = t_eXX_detectable_frxD09_05d(find(t_eXX_detectable_frxD09_05d(:,i),1,'first'));
        tLast_eXX_detectable_frxD09_05d(i) = t_eXX_detectable_frxD09_05d(find(t_eXX_detectable_frxD09_05d(:,i),1,'last'));
    end
    if sum(t_eZZ_detectable_frxD09_05d(:,i)) > 0
        tFirst_eZZ_detectable_frxD09_05d(i) = t_eZZ_detectable_frxD09_05d(find(t_eZZ_detectable_frxD09_05d(:,i),1,'first'));
        tLast_eZZ_detectable_frxD09_05d(i) = t_eZZ_detectable_frxD09_05d(find(t_eZZ_detectable_frxD09_05d(:,i),1,'last'));
    end
% parameter 10
    if sum(t_eXX_detectable_frxD10_05d(:,i)) > 0
        tFirst_eXX_detectable_frxD10_05d(i) = t_eXX_detectable_frxD10_05d(find(t_eXX_detectable_frxD10_05d(:,i),1,'first'));
        tLast_eXX_detectable_frxD10_05d(i) = t_eXX_detectable_frxD10_05d(find(t_eXX_detectable_frxD10_05d(:,i),1,'last'));
    end
    if sum(t_eZZ_detectable_frxD10_05d(:,i)) > 0
        tFirst_eZZ_detectable_frxD10_05d(i) = t_eZZ_detectable_frxD10_05d(find(t_eZZ_detectable_frxD10_05d(:,i),1,'first'));
        tLast_eZZ_detectable_frxD10_05d(i) = t_eZZ_detectable_frxD10_05d(find(t_eZZ_detectable_frxD10_05d(:,i),1,'last'));
    end
    
% ==================================================================================================== %
% Depth 10%
% ==================================================================================================== %
% parameter 01
    if sum(t_eXX_detectable_frxD01_10d(:,i)) > 0
        tFirst_eXX_detectable_frxD01_10d(i) = t_eXX_detectable_frxD01_10d(find(t_eXX_detectable_frxD01_10d(:,i),1,'first'));
        tLast_eXX_detectable_frxD01_10d(i) = t_eXX_detectable_frxD01_10d(find(t_eXX_detectable_frxD01_10d(:,i),1,'last'));
    end
    if sum(t_eZZ_detectable_frxD01_10d(:,i)) > 0
        tFirst_eZZ_detectable_frxD01_10d(i) = t_eZZ_detectable_frxD01_10d(find(t_eZZ_detectable_frxD01_10d(:,i),1,'first'));
        tLast_eZZ_detectable_frxD01_10d(i) = t_eZZ_detectable_frxD01_10d(find(t_eZZ_detectable_frxD01_10d(:,i),1,'last'));
    end
% parameter 02
    if sum(t_eXX_detectable_frxD02_10d(:,i)) > 0
        tFirst_eXX_detectable_frxD02_10d(i) = t_eXX_detectable_frxD02_10d(find(t_eXX_detectable_frxD02_10d(:,i),1,'first'));
        tLast_eXX_detectable_frxD02_10d(i) = t_eXX_detectable_frxD02_10d(find(t_eXX_detectable_frxD02_10d(:,i),1,'last'));
    end
    if sum(t_eZZ_detectable_frxD02_10d(:,i)) > 0
        tFirst_eZZ_detectable_frxD02_10d(i) = t_eZZ_detectable_frxD02_10d(find(t_eZZ_detectable_frxD02_10d(:,i),1,'first'));
        tLast_eZZ_detectable_frxD02_10d(i) = t_eZZ_detectable_frxD02_10d(find(t_eZZ_detectable_frxD02_10d(:,i),1,'last'));
    end
% parameter 03
    if sum(t_eXX_detectable_frxD03_10d(:,i)) > 0
        tFirst_eXX_detectable_frxD03_10d(i) = t_eXX_detectable_frxD03_10d(find(t_eXX_detectable_frxD03_10d(:,i),1,'first'));
        tLast_eXX_detectable_frxD03_10d(i) = t_eXX_detectable_frxD03_10d(find(t_eXX_detectable_frxD03_10d(:,i),1,'last'));
    end
    if sum(t_eZZ_detectable_frxD03_10d(:,i)) > 0
        tFirst_eZZ_detectable_frxD03_10d(i) = t_eZZ_detectable_frxD03_10d(find(t_eZZ_detectable_frxD03_10d(:,i),1,'first'));
        tLast_eZZ_detectable_frxD03_10d(i) = t_eZZ_detectable_frxD03_10d(find(t_eZZ_detectable_frxD03_10d(:,i),1,'last'));
    end
% parameter 04
    if sum(t_eXX_detectable_frxD04_10d(:,i)) > 0
        tFirst_eXX_detectable_frxD04_10d(i) = t_eXX_detectable_frxD04_10d(find(t_eXX_detectable_frxD04_10d(:,i),1,'first'));
        tLast_eXX_detectable_frxD04_10d(i) = t_eXX_detectable_frxD04_10d(find(t_eXX_detectable_frxD04_10d(:,i),1,'last'));
    end
    if sum(t_eZZ_detectable_frxD04_10d(:,i)) > 0
        tFirst_eZZ_detectable_frxD04_10d(i) = t_eZZ_detectable_frxD04_10d(find(t_eZZ_detectable_frxD04_10d(:,i),1,'first'));
        tLast_eZZ_detectable_frxD04_10d(i) = t_eZZ_detectable_frxD04_10d(find(t_eZZ_detectable_frxD04_10d(:,i),1,'last'));
    end
% parameter 05
    if sum(t_eXX_detectable_frxD05_10d(:,i)) > 0
        tFirst_eXX_detectable_frxD05_10d(i) = t_eXX_detectable_frxD05_10d(find(t_eXX_detectable_frxD05_10d(:,i),1,'first'));
        tLast_eXX_detectable_frxD05_10d(i) = t_eXX_detectable_frxD05_10d(find(t_eXX_detectable_frxD05_10d(:,i),1,'last'));
    end
    if sum(t_eZZ_detectable_frxD05_10d(:,i)) > 0
        tFirst_eZZ_detectable_frxD05_10d(i) = t_eZZ_detectable_frxD05_10d(find(t_eZZ_detectable_frxD05_10d(:,i),1,'first'));
        tLast_eZZ_detectable_frxD05_10d(i) = t_eZZ_detectable_frxD05_10d(find(t_eZZ_detectable_frxD05_10d(:,i),1,'last'));
    end
% parameter 06
    if sum(t_eXX_detectable_frxD06_10d(:,i)) > 0
        tFirst_eXX_detectable_frxD06_10d(i) = t_eXX_detectable_frxD06_10d(find(t_eXX_detectable_frxD06_10d(:,i),1,'first'));
        tLast_eXX_detectable_frxD06_10d(i) = t_eXX_detectable_frxD06_10d(find(t_eXX_detectable_frxD06_10d(:,i),1,'last'));
    end
    if sum(t_eZZ_detectable_frxD06_10d(:,i)) > 0
        tFirst_eZZ_detectable_frxD06_10d(i) = t_eZZ_detectable_frxD06_10d(find(t_eZZ_detectable_frxD06_10d(:,i),1,'first'));
        tLast_eZZ_detectable_frxD06_10d(i) = t_eZZ_detectable_frxD06_10d(find(t_eZZ_detectable_frxD06_10d(:,i),1,'last'));
    end
% parameter 07
    if sum(t_eXX_detectable_frxD07_10d(:,i)) > 0
        tFirst_eXX_detectable_frxD07_10d(i) = t_eXX_detectable_frxD07_10d(find(t_eXX_detectable_frxD07_10d(:,i),1,'first'));
        tLast_eXX_detectable_frxD07_10d(i) = t_eXX_detectable_frxD07_10d(find(t_eXX_detectable_frxD07_10d(:,i),1,'last'));
    end
    if sum(t_eZZ_detectable_frxD07_10d(:,i)) > 0
        tFirst_eZZ_detectable_frxD07_10d(i) = t_eZZ_detectable_frxD07_10d(find(t_eZZ_detectable_frxD07_10d(:,i),1,'first'));
        tLast_eZZ_detectable_frxD07_10d(i) = t_eZZ_detectable_frxD07_10d(find(t_eZZ_detectable_frxD07_10d(:,i),1,'last'));
    end
% parameter 08
    if sum(t_eXX_detectable_frxD08_10d(:,i)) > 0
        tFirst_eXX_detectable_frxD08_10d(i) = t_eXX_detectable_frxD08_10d(find(t_eXX_detectable_frxD08_10d(:,i),1,'first'));
        tLast_eXX_detectable_frxD08_10d(i) = t_eXX_detectable_frxD08_10d(find(t_eXX_detectable_frxD08_10d(:,i),1,'last'));
    end
    if sum(t_eZZ_detectable_frxD08_10d(:,i)) > 0
        tFirst_eZZ_detectable_frxD08_10d(i) = t_eZZ_detectable_frxD08_10d(find(t_eZZ_detectable_frxD08_10d(:,i),1,'first'));
        tLast_eZZ_detectable_frxD08_10d(i) = t_eZZ_detectable_frxD08_10d(find(t_eZZ_detectable_frxD08_10d(:,i),1,'last'));
    end
% parameter 09
    if sum(t_eXX_detectable_frxD09_10d(:,i)) > 0
        tFirst_eXX_detectable_frxD09_10d(i) = t_eXX_detectable_frxD09_10d(find(t_eXX_detectable_frxD09_10d(:,i),1,'first'));
        tLast_eXX_detectable_frxD09_10d(i) = t_eXX_detectable_frxD09_10d(find(t_eXX_detectable_frxD09_10d(:,i),1,'last'));
    end
    if sum(t_eZZ_detectable_frxD09_10d(:,i)) > 0
        tFirst_eZZ_detectable_frxD09_10d(i) = t_eZZ_detectable_frxD09_10d(find(t_eZZ_detectable_frxD09_10d(:,i),1,'first'));
        tLast_eZZ_detectable_frxD09_10d(i) = t_eZZ_detectable_frxD09_10d(find(t_eZZ_detectable_frxD09_10d(:,i),1,'last'));
    end
% parameter 10
    if sum(t_eXX_detectable_frxD10_10d(:,i)) > 0
        tFirst_eXX_detectable_frxD10_10d(i) = t_eXX_detectable_frxD10_10d(find(t_eXX_detectable_frxD10_10d(:,i),1,'first'));
        tLast_eXX_detectable_frxD10_10d(i) = t_eXX_detectable_frxD10_10d(find(t_eXX_detectable_frxD10_10d(:,i),1,'last'));
    end
    if sum(t_eZZ_detectable_frxD10_10d(:,i)) > 0
        tFirst_eZZ_detectable_frxD10_10d(i) = t_eZZ_detectable_frxD10_10d(find(t_eZZ_detectable_frxD10_10d(:,i),1,'first'));
        tLast_eZZ_detectable_frxD10_10d(i) = t_eZZ_detectable_frxD10_10d(find(t_eZZ_detectable_frxD10_10d(:,i),1,'last'));
    end
    
% ==================================================================================================== %
% Depth 50%
% ==================================================================================================== %
% parameter 01
    if sum(t_eXX_detectable_frxD01_50d(:,i)) > 0
        tFirst_eXX_detectable_frxD01_50d(i) = t_eXX_detectable_frxD01_50d(find(t_eXX_detectable_frxD01_50d(:,i),1,'first'));
        tLast_eXX_detectable_frxD01_50d(i) = t_eXX_detectable_frxD01_50d(find(t_eXX_detectable_frxD01_50d(:,i),1,'last'));
    end
    if sum(t_eZZ_detectable_frxD01_50d(:,i)) > 0
        tFirst_eZZ_detectable_frxD01_50d(i) = t_eZZ_detectable_frxD01_50d(find(t_eZZ_detectable_frxD01_50d(:,i),1,'first'));
        tLast_eZZ_detectable_frxD01_50d(i) = t_eZZ_detectable_frxD01_50d(find(t_eZZ_detectable_frxD01_50d(:,i),1,'last'));
    end
% parameter 02
    if sum(t_eXX_detectable_frxD02_50d(:,i)) > 0
        tFirst_eXX_detectable_frxD02_50d(i) = t_eXX_detectable_frxD02_50d(find(t_eXX_detectable_frxD02_50d(:,i),1,'first'));
        tLast_eXX_detectable_frxD02_50d(i) = t_eXX_detectable_frxD02_50d(find(t_eXX_detectable_frxD02_50d(:,i),1,'last'));
    end
    if sum(t_eZZ_detectable_frxD02_50d(:,i)) > 0
        tFirst_eZZ_detectable_frxD02_50d(i) = t_eZZ_detectable_frxD02_50d(find(t_eZZ_detectable_frxD02_50d(:,i),1,'first'));
        tLast_eZZ_detectable_frxD02_50d(i) = t_eZZ_detectable_frxD02_50d(find(t_eZZ_detectable_frxD02_50d(:,i),1,'last'));
    end
% parameter 03
    if sum(t_eXX_detectable_frxD03_50d(:,i)) > 0
        tFirst_eXX_detectable_frxD03_50d(i) = t_eXX_detectable_frxD03_50d(find(t_eXX_detectable_frxD03_50d(:,i),1,'first'));
        tLast_eXX_detectable_frxD03_50d(i) = t_eXX_detectable_frxD03_50d(find(t_eXX_detectable_frxD03_50d(:,i),1,'last'));
    end
    if sum(t_eZZ_detectable_frxD03_50d(:,i)) > 0
        tFirst_eZZ_detectable_frxD03_50d(i) = t_eZZ_detectable_frxD03_50d(find(t_eZZ_detectable_frxD03_50d(:,i),1,'first'));
        tLast_eZZ_detectable_frxD03_50d(i) = t_eZZ_detectable_frxD03_50d(find(t_eZZ_detectable_frxD03_50d(:,i),1,'last'));
    end
% parameter 04
    if sum(t_eXX_detectable_frxD04_50d(:,i)) > 0
        tFirst_eXX_detectable_frxD04_50d(i) = t_eXX_detectable_frxD04_50d(find(t_eXX_detectable_frxD04_50d(:,i),1,'first'));
        tLast_eXX_detectable_frxD04_50d(i) = t_eXX_detectable_frxD04_50d(find(t_eXX_detectable_frxD04_50d(:,i),1,'last'));
    end
    if sum(t_eZZ_detectable_frxD04_50d(:,i)) > 0
        tFirst_eZZ_detectable_frxD04_50d(i) = t_eZZ_detectable_frxD04_50d(find(t_eZZ_detectable_frxD04_50d(:,i),1,'first'));
        tLast_eZZ_detectable_frxD04_50d(i) = t_eZZ_detectable_frxD04_50d(find(t_eZZ_detectable_frxD04_50d(:,i),1,'last'));
    end
% parameter 05
    if sum(t_eXX_detectable_frxD05_50d(:,i)) > 0
        tFirst_eXX_detectable_frxD05_50d(i) = t_eXX_detectable_frxD05_50d(find(t_eXX_detectable_frxD05_50d(:,i),1,'first'));
        tLast_eXX_detectable_frxD05_50d(i) = t_eXX_detectable_frxD05_50d(find(t_eXX_detectable_frxD05_50d(:,i),1,'last'));
    end
    if sum(t_eZZ_detectable_frxD05_50d(:,i)) > 0
        tFirst_eZZ_detectable_frxD05_50d(i) = t_eZZ_detectable_frxD05_50d(find(t_eZZ_detectable_frxD05_50d(:,i),1,'first'));
        tLast_eZZ_detectable_frxD05_50d(i) = t_eZZ_detectable_frxD05_50d(find(t_eZZ_detectable_frxD05_50d(:,i),1,'last'));
    end
% parameter 06
    if sum(t_eXX_detectable_frxD06_50d(:,i)) > 0
        tFirst_eXX_detectable_frxD06_50d(i) = t_eXX_detectable_frxD06_50d(find(t_eXX_detectable_frxD06_50d(:,i),1,'first'));
        tLast_eXX_detectable_frxD06_50d(i) = t_eXX_detectable_frxD06_50d(find(t_eXX_detectable_frxD06_50d(:,i),1,'last'));
    end
    if sum(t_eZZ_detectable_frxD06_50d(:,i)) > 0
        tFirst_eZZ_detectable_frxD06_50d(i) = t_eZZ_detectable_frxD06_50d(find(t_eZZ_detectable_frxD06_50d(:,i),1,'first'));
        tLast_eZZ_detectable_frxD06_50d(i) = t_eZZ_detectable_frxD06_50d(find(t_eZZ_detectable_frxD06_50d(:,i),1,'last'));
    end
% parameter 07
    if sum(t_eXX_detectable_frxD07_50d(:,i)) > 0
        tFirst_eXX_detectable_frxD07_50d(i) = t_eXX_detectable_frxD07_50d(find(t_eXX_detectable_frxD07_50d(:,i),1,'first'));
        tLast_eXX_detectable_frxD07_50d(i) = t_eXX_detectable_frxD07_50d(find(t_eXX_detectable_frxD07_50d(:,i),1,'last'));
    end
    if sum(t_eZZ_detectable_frxD07_50d(:,i)) > 0
        tFirst_eZZ_detectable_frxD07_50d(i) = t_eZZ_detectable_frxD07_50d(find(t_eZZ_detectable_frxD07_50d(:,i),1,'first'));
        tLast_eZZ_detectable_frxD07_50d(i) = t_eZZ_detectable_frxD07_50d(find(t_eZZ_detectable_frxD07_50d(:,i),1,'last'));
    end
% parameter 08
    if sum(t_eXX_detectable_frxD08_50d(:,i)) > 0
        tFirst_eXX_detectable_frxD08_50d(i) = t_eXX_detectable_frxD08_50d(find(t_eXX_detectable_frxD08_50d(:,i),1,'first'));
        tLast_eXX_detectable_frxD08_50d(i) = t_eXX_detectable_frxD08_50d(find(t_eXX_detectable_frxD08_50d(:,i),1,'last'));
    end
    if sum(t_eZZ_detectable_frxD08_50d(:,i)) > 0
        tFirst_eZZ_detectable_frxD08_50d(i) = t_eZZ_detectable_frxD08_50d(find(t_eZZ_detectable_frxD08_50d(:,i),1,'first'));
        tLast_eZZ_detectable_frxD08_50d(i) = t_eZZ_detectable_frxD08_50d(find(t_eZZ_detectable_frxD08_50d(:,i),1,'last'));
    end
% parameter 09
    if sum(t_eXX_detectable_frxD09_50d(:,i)) > 0
        tFirst_eXX_detectable_frxD09_50d(i) = t_eXX_detectable_frxD09_50d(find(t_eXX_detectable_frxD09_50d(:,i),1,'first'));
        tLast_eXX_detectable_frxD09_50d(i) = t_eXX_detectable_frxD09_50d(find(t_eXX_detectable_frxD09_50d(:,i),1,'last'));
    end
    if sum(t_eZZ_detectable_frxD09_50d(:,i)) > 0
        tFirst_eZZ_detectable_frxD09_50d(i) = t_eZZ_detectable_frxD09_50d(find(t_eZZ_detectable_frxD09_50d(:,i),1,'first'));
        tLast_eZZ_detectable_frxD09_50d(i) = t_eZZ_detectable_frxD09_50d(find(t_eZZ_detectable_frxD09_50d(:,i),1,'last'));
    end
% parameter 10
    if sum(t_eXX_detectable_frxD10_50d(:,i)) > 0
        tFirst_eXX_detectable_frxD10_50d(i) = t_eXX_detectable_frxD10_50d(find(t_eXX_detectable_frxD10_50d(:,i),1,'first'));
        tLast_eXX_detectable_frxD10_50d(i) = t_eXX_detectable_frxD10_50d(find(t_eXX_detectable_frxD10_50d(:,i),1,'last'));
    end
    if sum(t_eZZ_detectable_frxD10_50d(:,i)) > 0
        tFirst_eZZ_detectable_frxD10_50d(i) = t_eZZ_detectable_frxD10_50d(find(t_eZZ_detectable_frxD10_50d(:,i),1,'first'));
        tLast_eZZ_detectable_frxD10_50d(i) = t_eZZ_detectable_frxD10_50d(find(t_eZZ_detectable_frxD10_50d(:,i),1,'last'));
    end
    
end


% ==================================================================================================== %
% Duration strain is detectable
% ==================================================================================================== %
% parameter 01
eXX_detectableDuration_frxD01_01d = zeros(1,n_probes);
eZZ_detectableDuration_frxD01_01d = zeros(1,n_probes);
eXX_detectableDuration_frxD01_03d = zeros(1,n_probes);
eZZ_detectableDuration_frxD01_03d = zeros(1,n_probes);
eXX_detectableDuration_frxD01_05d = zeros(1,n_probes);
eZZ_detectableDuration_frxD01_05d = zeros(1,n_probes);
eXX_detectableDuration_frxD01_10d = zeros(1,n_probes);
eZZ_detectableDuration_frxD01_10d = zeros(1,n_probes);
eXX_detectableDuration_frxD01_50d = zeros(1,n_probes);
eZZ_detectableDuration_frxD01_50d = zeros(1,n_probes);
% parameter 02
eXX_detectableDuration_frxD02_01d = zeros(1,n_probes);
eZZ_detectableDuration_frxD02_01d = zeros(1,n_probes);
eXX_detectableDuration_frxD02_03d = zeros(1,n_probes);
eZZ_detectableDuration_frxD02_03d = zeros(1,n_probes);
eXX_detectableDuration_frxD02_05d = zeros(1,n_probes);
eZZ_detectableDuration_frxD02_05d = zeros(1,n_probes);
eXX_detectableDuration_frxD02_10d = zeros(1,n_probes);
eZZ_detectableDuration_frxD02_10d = zeros(1,n_probes);
eXX_detectableDuration_frxD02_50d = zeros(1,n_probes);
eZZ_detectableDuration_frxD02_50d = zeros(1,n_probes);
% parameter 03
eXX_detectableDuration_frxD03_01d = zeros(1,n_probes);
eZZ_detectableDuration_frxD03_01d = zeros(1,n_probes);
eXX_detectableDuration_frxD03_03d = zeros(1,n_probes);
eZZ_detectableDuration_frxD03_03d = zeros(1,n_probes);
eXX_detectableDuration_frxD03_05d = zeros(1,n_probes);
eZZ_detectableDuration_frxD03_05d = zeros(1,n_probes);
eXX_detectableDuration_frxD03_10d = zeros(1,n_probes);
eZZ_detectableDuration_frxD03_10d = zeros(1,n_probes);
eXX_detectableDuration_frxD03_50d = zeros(1,n_probes);
eZZ_detectableDuration_frxD03_50d = zeros(1,n_probes);
% parameter 04
eXX_detectableDuration_frxD04_01d = zeros(1,n_probes);
eZZ_detectableDuration_frxD04_01d = zeros(1,n_probes);
eXX_detectableDuration_frxD04_03d = zeros(1,n_probes);
eZZ_detectableDuration_frxD04_03d = zeros(1,n_probes);
eXX_detectableDuration_frxD04_05d = zeros(1,n_probes);
eZZ_detectableDuration_frxD04_05d = zeros(1,n_probes);
eXX_detectableDuration_frxD04_10d = zeros(1,n_probes);
eZZ_detectableDuration_frxD04_10d = zeros(1,n_probes);
eXX_detectableDuration_frxD04_50d = zeros(1,n_probes);
eZZ_detectableDuration_frxD04_50d = zeros(1,n_probes);
% parameter 05
eXX_detectableDuration_frxD05_01d = zeros(1,n_probes);
eZZ_detectableDuration_frxD05_01d = zeros(1,n_probes);
eXX_detectableDuration_frxD05_03d = zeros(1,n_probes);
eZZ_detectableDuration_frxD05_03d = zeros(1,n_probes);
eXX_detectableDuration_frxD05_05d = zeros(1,n_probes);
eZZ_detectableDuration_frxD05_05d = zeros(1,n_probes);
eXX_detectableDuration_frxD05_10d = zeros(1,n_probes);
eZZ_detectableDuration_frxD05_10d = zeros(1,n_probes);
eXX_detectableDuration_frxD05_50d = zeros(1,n_probes);
eZZ_detectableDuration_frxD05_50d = zeros(1,n_probes);
% parameter 06
eXX_detectableDuration_frxD06_01d = zeros(1,n_probes);
eZZ_detectableDuration_frxD06_01d = zeros(1,n_probes);
eXX_detectableDuration_frxD06_03d = zeros(1,n_probes);
eZZ_detectableDuration_frxD06_03d = zeros(1,n_probes);
eXX_detectableDuration_frxD06_05d = zeros(1,n_probes);
eZZ_detectableDuration_frxD06_05d = zeros(1,n_probes);
eXX_detectableDuration_frxD06_10d = zeros(1,n_probes);
eZZ_detectableDuration_frxD06_10d = zeros(1,n_probes);
eXX_detectableDuration_frxD06_50d = zeros(1,n_probes);
eZZ_detectableDuration_frxD06_50d = zeros(1,n_probes);
% parameter 07
eXX_detectableDuration_frxD07_01d = zeros(1,n_probes);
eZZ_detectableDuration_frxD07_01d = zeros(1,n_probes);
eXX_detectableDuration_frxD07_03d = zeros(1,n_probes);
eZZ_detectableDuration_frxD07_03d = zeros(1,n_probes);
eXX_detectableDuration_frxD07_05d = zeros(1,n_probes);
eZZ_detectableDuration_frxD07_05d = zeros(1,n_probes);
eXX_detectableDuration_frxD07_10d = zeros(1,n_probes);
eZZ_detectableDuration_frxD07_10d = zeros(1,n_probes);
eXX_detectableDuration_frxD07_50d = zeros(1,n_probes);
eZZ_detectableDuration_frxD07_50d = zeros(1,n_probes);
% parameter 08
eXX_detectableDuration_frxD08_01d = zeros(1,n_probes);
eZZ_detectableDuration_frxD08_01d = zeros(1,n_probes);
eXX_detectableDuration_frxD08_03d = zeros(1,n_probes);
eZZ_detectableDuration_frxD08_03d = zeros(1,n_probes);
eXX_detectableDuration_frxD08_05d = zeros(1,n_probes);
eZZ_detectableDuration_frxD08_05d = zeros(1,n_probes);
eXX_detectableDuration_frxD08_10d = zeros(1,n_probes);
eZZ_detectableDuration_frxD08_10d = zeros(1,n_probes);
eXX_detectableDuration_frxD08_50d = zeros(1,n_probes);
eZZ_detectableDuration_frxD08_50d = zeros(1,n_probes);
% parameter 09
eXX_detectableDuration_frxD09_01d = zeros(1,n_probes);
eZZ_detectableDuration_frxD09_01d = zeros(1,n_probes);
eXX_detectableDuration_frxD09_03d = zeros(1,n_probes);
eZZ_detectableDuration_frxD09_03d = zeros(1,n_probes);
eXX_detectableDuration_frxD09_05d = zeros(1,n_probes);
eZZ_detectableDuration_frxD09_05d = zeros(1,n_probes);
eXX_detectableDuration_frxD09_10d = zeros(1,n_probes);
eZZ_detectableDuration_frxD09_10d = zeros(1,n_probes);
eXX_detectableDuration_frxD09_50d = zeros(1,n_probes);
eZZ_detectableDuration_frxD09_50d = zeros(1,n_probes);
% parameter 10
eXX_detectableDuration_frxD10_01d = zeros(1,n_probes);
eZZ_detectableDuration_frxD10_01d = zeros(1,n_probes);
eXX_detectableDuration_frxD10_03d = zeros(1,n_probes);
eZZ_detectableDuration_frxD10_03d = zeros(1,n_probes);
eXX_detectableDuration_frxD10_05d = zeros(1,n_probes);
eZZ_detectableDuration_frxD10_05d = zeros(1,n_probes);
eXX_detectableDuration_frxD10_10d = zeros(1,n_probes);
eZZ_detectableDuration_frxD10_10d = zeros(1,n_probes);
eXX_detectableDuration_frxD10_50d = zeros(1,n_probes);
eZZ_detectableDuration_frxD10_50d = zeros(1,n_probes);

for i = 1:n_probes
% ==================================================================================================== %
% Depth 1%
% ==================================================================================================== %
% parameter 01
    eXX_detectableDuration_frxD01_01d(i) = tLast_eXX_detectable_frxD01_01d(i) - tFirst_eXX_detectable_frxD01_01d(i);
    eZZ_detectableDuration_frxD01_01d(i) = tLast_eZZ_detectable_frxD01_01d(i) - tFirst_eZZ_detectable_frxD01_01d(i);
% parameter 02
    eXX_detectableDuration_frxD02_01d(i) = tLast_eXX_detectable_frxD02_01d(i) - tFirst_eXX_detectable_frxD02_01d(i);
    eZZ_detectableDuration_frxD02_01d(i) = tLast_eZZ_detectable_frxD02_01d(i) - tFirst_eZZ_detectable_frxD02_01d(i);
% parameter 03
    eXX_detectableDuration_frxD03_01d(i) = tLast_eXX_detectable_frxD03_01d(i) - tFirst_eXX_detectable_frxD03_01d(i);
    eZZ_detectableDuration_frxD03_01d(i) = tLast_eZZ_detectable_frxD03_01d(i) - tFirst_eZZ_detectable_frxD03_01d(i);
% parameter 04
    eXX_detectableDuration_frxD04_01d(i) = tLast_eXX_detectable_frxD04_01d(i) - tFirst_eXX_detectable_frxD04_01d(i);
    eZZ_detectableDuration_frxD04_01d(i) = tLast_eZZ_detectable_frxD04_01d(i) - tFirst_eZZ_detectable_frxD04_01d(i);
% parameter 05
    eXX_detectableDuration_frxD05_01d(i) = tLast_eXX_detectable_frxD05_01d(i) - tFirst_eXX_detectable_frxD05_01d(i);
    eZZ_detectableDuration_frxD05_01d(i) = tLast_eZZ_detectable_frxD05_01d(i) - tFirst_eZZ_detectable_frxD05_01d(i);
% parameter 06
    eXX_detectableDuration_frxD06_01d(i) = tLast_eXX_detectable_frxD06_01d(i) - tFirst_eXX_detectable_frxD06_01d(i);
    eZZ_detectableDuration_frxD06_01d(i) = tLast_eZZ_detectable_frxD06_01d(i) - tFirst_eZZ_detectable_frxD06_01d(i);
% parameter 07
    eXX_detectableDuration_frxD07_01d(i) = tLast_eXX_detectable_frxD07_01d(i) - tFirst_eXX_detectable_frxD07_01d(i);
    eZZ_detectableDuration_frxD07_01d(i) = tLast_eZZ_detectable_frxD07_01d(i) - tFirst_eZZ_detectable_frxD07_01d(i);
% parameter 08
    eXX_detectableDuration_frxD08_01d(i) = tLast_eXX_detectable_frxD08_01d(i) - tFirst_eXX_detectable_frxD08_01d(i);
    eZZ_detectableDuration_frxD08_01d(i) = tLast_eZZ_detectable_frxD08_01d(i) - tFirst_eZZ_detectable_frxD08_01d(i);
% parameter 09
    eXX_detectableDuration_frxD09_01d(i) = tLast_eXX_detectable_frxD09_01d(i) - tFirst_eXX_detectable_frxD09_01d(i);
    eZZ_detectableDuration_frxD09_01d(i) = tLast_eZZ_detectable_frxD09_01d(i) - tFirst_eZZ_detectable_frxD09_01d(i);
% parameter 10
    eXX_detectableDuration_frxD10_01d(i) = tLast_eXX_detectable_frxD10_01d(i) - tFirst_eXX_detectable_frxD10_01d(i);
    eZZ_detectableDuration_frxD10_01d(i) = tLast_eZZ_detectable_frxD10_01d(i) - tFirst_eZZ_detectable_frxD10_01d(i);
    
% ==================================================================================================== %
% Depth 3%
% ==================================================================================================== %
% parameter 01
    eXX_detectableDuration_frxD01_03d(i) = tLast_eXX_detectable_frxD01_03d(i) - tFirst_eXX_detectable_frxD01_03d(i);
    eZZ_detectableDuration_frxD01_03d(i) = tLast_eZZ_detectable_frxD01_03d(i) - tFirst_eZZ_detectable_frxD01_03d(i);
% parameter 02
    eXX_detectableDuration_frxD02_03d(i) = tLast_eXX_detectable_frxD02_03d(i) - tFirst_eXX_detectable_frxD02_03d(i);
    eZZ_detectableDuration_frxD02_03d(i) = tLast_eZZ_detectable_frxD02_03d(i) - tFirst_eZZ_detectable_frxD02_03d(i);
% parameter 03
    eXX_detectableDuration_frxD03_03d(i) = tLast_eXX_detectable_frxD03_03d(i) - tFirst_eXX_detectable_frxD03_03d(i);
    eZZ_detectableDuration_frxD03_03d(i) = tLast_eZZ_detectable_frxD03_03d(i) - tFirst_eZZ_detectable_frxD03_03d(i);
% parameter 04
    eXX_detectableDuration_frxD04_03d(i) = tLast_eXX_detectable_frxD04_03d(i) - tFirst_eXX_detectable_frxD04_03d(i);
    eZZ_detectableDuration_frxD04_03d(i) = tLast_eZZ_detectable_frxD04_03d(i) - tFirst_eZZ_detectable_frxD04_03d(i);
% parameter 05
    eXX_detectableDuration_frxD05_03d(i) = tLast_eXX_detectable_frxD05_03d(i) - tFirst_eXX_detectable_frxD05_03d(i);
    eZZ_detectableDuration_frxD05_03d(i) = tLast_eZZ_detectable_frxD05_03d(i) - tFirst_eZZ_detectable_frxD05_03d(i);
% parameter 06
    eXX_detectableDuration_frxD06_03d(i) = tLast_eXX_detectable_frxD06_03d(i) - tFirst_eXX_detectable_frxD06_03d(i);
    eZZ_detectableDuration_frxD06_03d(i) = tLast_eZZ_detectable_frxD06_03d(i) - tFirst_eZZ_detectable_frxD06_03d(i);
% parameter 07
    eXX_detectableDuration_frxD07_03d(i) = tLast_eXX_detectable_frxD07_03d(i) - tFirst_eXX_detectable_frxD07_03d(i);
    eZZ_detectableDuration_frxD07_03d(i) = tLast_eZZ_detectable_frxD07_03d(i) - tFirst_eZZ_detectable_frxD07_03d(i);
% parameter 08
    eXX_detectableDuration_frxD08_03d(i) = tLast_eXX_detectable_frxD08_03d(i) - tFirst_eXX_detectable_frxD08_03d(i);
    eZZ_detectableDuration_frxD08_03d(i) = tLast_eZZ_detectable_frxD08_03d(i) - tFirst_eZZ_detectable_frxD08_03d(i);
% parameter 09
    eXX_detectableDuration_frxD09_03d(i) = tLast_eXX_detectable_frxD09_03d(i) - tFirst_eXX_detectable_frxD09_03d(i);
    eZZ_detectableDuration_frxD09_03d(i) = tLast_eZZ_detectable_frxD09_03d(i) - tFirst_eZZ_detectable_frxD09_03d(i);
% parameter 10
    eXX_detectableDuration_frxD10_03d(i) = tLast_eXX_detectable_frxD10_03d(i) - tFirst_eXX_detectable_frxD10_03d(i);
    eZZ_detectableDuration_frxD10_03d(i) = tLast_eZZ_detectable_frxD10_03d(i) - tFirst_eZZ_detectable_frxD10_03d(i);
    
% ==================================================================================================== %
% Depth 5%
% ==================================================================================================== %
% parameter 01
    eXX_detectableDuration_frxD01_05d(i) = tLast_eXX_detectable_frxD01_05d(i) - tFirst_eXX_detectable_frxD01_05d(i);
    eZZ_detectableDuration_frxD01_05d(i) = tLast_eZZ_detectable_frxD01_05d(i) - tFirst_eZZ_detectable_frxD01_05d(i);
% parameter 02
    eXX_detectableDuration_frxD02_05d(i) = tLast_eXX_detectable_frxD02_05d(i) - tFirst_eXX_detectable_frxD02_05d(i);
    eZZ_detectableDuration_frxD02_05d(i) = tLast_eZZ_detectable_frxD02_05d(i) - tFirst_eZZ_detectable_frxD02_05d(i);
% parameter 03
    eXX_detectableDuration_frxD03_05d(i) = tLast_eXX_detectable_frxD03_05d(i) - tFirst_eXX_detectable_frxD03_05d(i);
    eZZ_detectableDuration_frxD03_05d(i) = tLast_eZZ_detectable_frxD03_05d(i) - tFirst_eZZ_detectable_frxD03_05d(i);
% parameter 04
    eXX_detectableDuration_frxD04_05d(i) = tLast_eXX_detectable_frxD04_05d(i) - tFirst_eXX_detectable_frxD04_05d(i);
    eZZ_detectableDuration_frxD04_05d(i) = tLast_eZZ_detectable_frxD04_05d(i) - tFirst_eZZ_detectable_frxD04_05d(i);
% parameter 05
    eXX_detectableDuration_frxD05_05d(i) = tLast_eXX_detectable_frxD05_05d(i) - tFirst_eXX_detectable_frxD05_05d(i);
    eZZ_detectableDuration_frxD05_05d(i) = tLast_eZZ_detectable_frxD05_05d(i) - tFirst_eZZ_detectable_frxD05_05d(i);
% parameter 06
    eXX_detectableDuration_frxD06_05d(i) = tLast_eXX_detectable_frxD06_05d(i) - tFirst_eXX_detectable_frxD06_05d(i);
    eZZ_detectableDuration_frxD06_05d(i) = tLast_eZZ_detectable_frxD06_05d(i) - tFirst_eZZ_detectable_frxD06_05d(i);
% parameter 07
    eXX_detectableDuration_frxD07_05d(i) = tLast_eXX_detectable_frxD07_05d(i) - tFirst_eXX_detectable_frxD07_05d(i);
    eZZ_detectableDuration_frxD07_05d(i) = tLast_eZZ_detectable_frxD07_05d(i) - tFirst_eZZ_detectable_frxD07_05d(i);
% parameter 08
    eXX_detectableDuration_frxD08_05d(i) = tLast_eXX_detectable_frxD08_05d(i) - tFirst_eXX_detectable_frxD08_05d(i);
    eZZ_detectableDuration_frxD08_05d(i) = tLast_eZZ_detectable_frxD08_05d(i) - tFirst_eZZ_detectable_frxD08_05d(i);
% parameter 09
    eXX_detectableDuration_frxD09_05d(i) = tLast_eXX_detectable_frxD09_05d(i) - tFirst_eXX_detectable_frxD09_05d(i);
    eZZ_detectableDuration_frxD09_05d(i) = tLast_eZZ_detectable_frxD09_05d(i) - tFirst_eZZ_detectable_frxD09_05d(i);
% parameter 10
    eXX_detectableDuration_frxD10_05d(i) = tLast_eXX_detectable_frxD10_05d(i) - tFirst_eXX_detectable_frxD10_05d(i);
    eZZ_detectableDuration_frxD10_05d(i) = tLast_eZZ_detectable_frxD10_05d(i) - tFirst_eZZ_detectable_frxD10_05d(i);
    
% ==================================================================================================== %
% Depth 10%
% ==================================================================================================== %
% parameter 01
    eXX_detectableDuration_frxD01_10d(i) = tLast_eXX_detectable_frxD01_10d(i) - tFirst_eXX_detectable_frxD01_10d(i);
    eZZ_detectableDuration_frxD01_10d(i) = tLast_eZZ_detectable_frxD01_10d(i) - tFirst_eZZ_detectable_frxD01_10d(i);
% parameter 02
    eXX_detectableDuration_frxD02_10d(i) = tLast_eXX_detectable_frxD02_10d(i) - tFirst_eXX_detectable_frxD02_10d(i);
    eZZ_detectableDuration_frxD02_10d(i) = tLast_eZZ_detectable_frxD02_10d(i) - tFirst_eZZ_detectable_frxD02_10d(i);
% parameter 03
    eXX_detectableDuration_frxD03_10d(i) = tLast_eXX_detectable_frxD03_10d(i) - tFirst_eXX_detectable_frxD03_10d(i);
    eZZ_detectableDuration_frxD03_10d(i) = tLast_eZZ_detectable_frxD03_10d(i) - tFirst_eZZ_detectable_frxD03_10d(i);
% parameter 04
    eXX_detectableDuration_frxD04_10d(i) = tLast_eXX_detectable_frxD04_10d(i) - tFirst_eXX_detectable_frxD04_10d(i);
    eZZ_detectableDuration_frxD04_10d(i) = tLast_eZZ_detectable_frxD04_10d(i) - tFirst_eZZ_detectable_frxD04_10d(i);
% parameter 05
    eXX_detectableDuration_frxD05_10d(i) = tLast_eXX_detectable_frxD05_10d(i) - tFirst_eXX_detectable_frxD05_10d(i);
    eZZ_detectableDuration_frxD05_10d(i) = tLast_eZZ_detectable_frxD05_10d(i) - tFirst_eZZ_detectable_frxD05_10d(i);
% parameter 06
    eXX_detectableDuration_frxD06_10d(i) = tLast_eXX_detectable_frxD06_10d(i) - tFirst_eXX_detectable_frxD06_10d(i);
    eZZ_detectableDuration_frxD06_10d(i) = tLast_eZZ_detectable_frxD06_10d(i) - tFirst_eZZ_detectable_frxD06_10d(i);
% parameter 07
    eXX_detectableDuration_frxD07_10d(i) = tLast_eXX_detectable_frxD07_10d(i) - tFirst_eXX_detectable_frxD07_10d(i);
    eZZ_detectableDuration_frxD07_10d(i) = tLast_eZZ_detectable_frxD07_10d(i) - tFirst_eZZ_detectable_frxD07_10d(i);
% parameter 08
    eXX_detectableDuration_frxD08_10d(i) = tLast_eXX_detectable_frxD08_10d(i) - tFirst_eXX_detectable_frxD08_10d(i);
    eZZ_detectableDuration_frxD08_10d(i) = tLast_eZZ_detectable_frxD08_10d(i) - tFirst_eZZ_detectable_frxD08_10d(i);
% parameter 09
    eXX_detectableDuration_frxD09_10d(i) = tLast_eXX_detectable_frxD09_10d(i) - tFirst_eXX_detectable_frxD09_10d(i);
    eZZ_detectableDuration_frxD09_10d(i) = tLast_eZZ_detectable_frxD09_10d(i) - tFirst_eZZ_detectable_frxD09_10d(i);
% parameter 10
    eXX_detectableDuration_frxD10_10d(i) = tLast_eXX_detectable_frxD10_10d(i) - tFirst_eXX_detectable_frxD10_10d(i);
    eZZ_detectableDuration_frxD10_10d(i) = tLast_eZZ_detectable_frxD10_10d(i) - tFirst_eZZ_detectable_frxD10_10d(i);
    
% ==================================================================================================== %
% Depth 50%
% ==================================================================================================== %
% parameter 01
    eXX_detectableDuration_frxD01_50d(i) = tLast_eXX_detectable_frxD01_50d(i) - tFirst_eXX_detectable_frxD01_50d(i);
    eZZ_detectableDuration_frxD01_50d(i) = tLast_eZZ_detectable_frxD01_50d(i) - tFirst_eZZ_detectable_frxD01_50d(i);
% parameter 02
    eXX_detectableDuration_frxD02_50d(i) = tLast_eXX_detectable_frxD02_50d(i) - tFirst_eXX_detectable_frxD02_50d(i);
    eZZ_detectableDuration_frxD02_50d(i) = tLast_eZZ_detectable_frxD02_50d(i) - tFirst_eZZ_detectable_frxD02_50d(i);
% parameter 03
    eXX_detectableDuration_frxD03_50d(i) = tLast_eXX_detectable_frxD03_50d(i) - tFirst_eXX_detectable_frxD03_50d(i);
    eZZ_detectableDuration_frxD03_50d(i) = tLast_eZZ_detectable_frxD03_50d(i) - tFirst_eZZ_detectable_frxD03_50d(i);
% parameter 04
    eXX_detectableDuration_frxD04_50d(i) = tLast_eXX_detectable_frxD04_50d(i) - tFirst_eXX_detectable_frxD04_50d(i);
    eZZ_detectableDuration_frxD04_50d(i) = tLast_eZZ_detectable_frxD04_50d(i) - tFirst_eZZ_detectable_frxD04_50d(i);
% parameter 05
    eXX_detectableDuration_frxD05_50d(i) = tLast_eXX_detectable_frxD05_50d(i) - tFirst_eXX_detectable_frxD05_50d(i);
    eZZ_detectableDuration_frxD05_50d(i) = tLast_eZZ_detectable_frxD05_50d(i) - tFirst_eZZ_detectable_frxD05_50d(i);
% parameter 06
    eXX_detectableDuration_frxD06_50d(i) = tLast_eXX_detectable_frxD06_50d(i) - tFirst_eXX_detectable_frxD06_50d(i);
    eZZ_detectableDuration_frxD06_50d(i) = tLast_eZZ_detectable_frxD06_50d(i) - tFirst_eZZ_detectable_frxD06_50d(i);
% parameter 07
    eXX_detectableDuration_frxD07_50d(i) = tLast_eXX_detectable_frxD07_50d(i) - tFirst_eXX_detectable_frxD07_50d(i);
    eZZ_detectableDuration_frxD07_50d(i) = tLast_eZZ_detectable_frxD07_50d(i) - tFirst_eZZ_detectable_frxD07_50d(i);
% parameter 08
    eXX_detectableDuration_frxD08_50d(i) = tLast_eXX_detectable_frxD08_50d(i) - tFirst_eXX_detectable_frxD08_50d(i);
    eZZ_detectableDuration_frxD08_50d(i) = tLast_eZZ_detectable_frxD08_50d(i) - tFirst_eZZ_detectable_frxD08_50d(i);
% parameter 09
    eXX_detectableDuration_frxD09_50d(i) = tLast_eXX_detectable_frxD09_50d(i) - tFirst_eXX_detectable_frxD09_50d(i);
    eZZ_detectableDuration_frxD09_50d(i) = tLast_eZZ_detectable_frxD09_50d(i) - tFirst_eZZ_detectable_frxD09_50d(i);
% parameter 10
    eXX_detectableDuration_frxD10_50d(i) = tLast_eXX_detectable_frxD10_50d(i) - tFirst_eXX_detectable_frxD10_50d(i);
    eZZ_detectableDuration_frxD10_50d(i) = tLast_eZZ_detectable_frxD10_50d(i) - tFirst_eZZ_detectable_frxD10_50d(i);
    
end

% parameter 01
clear tFirst_eXX_detectable_frxD01_01d    tLast_eXX_detectable_frxD01_01d
clear tFirst_eZZ_detectable_frxD01_01d    tLast_eZZ_detectable_frxD01_01d
clear tFirst_eXX_detectable_frxD01_03d    tLast_eXX_detectable_frxD01_03d
clear tFirst_eZZ_detectable_frxD01_03d    tLast_eZZ_detectable_frxD01_03d
clear tFirst_eXX_detectable_frxD01_05d    tLast_eXX_detectable_frxD01_05d
clear tFirst_eZZ_detectable_frxD01_05d    tLast_eZZ_detectable_frxD01_05d
clear tFirst_eXX_detectable_frxD01_10d    tLast_eXX_detectable_frxD01_10d
clear tFirst_eZZ_detectable_frxD01_10d    tLast_eZZ_detectable_frxD01_10d
clear tFirst_eXX_detectable_frxD01_50d    tLast_eXX_detectable_frxD01_50d
clear tFirst_eZZ_detectable_frxD01_50d    tLast_eZZ_detectable_frxD01_50d
% parameter 02
clear tFirst_eXX_detectable_frxD02_01d    tLast_eXX_detectable_frxD02_01d
clear tFirst_eZZ_detectable_frxD02_01d    tLast_eZZ_detectable_frxD02_01d
clear tFirst_eXX_detectable_frxD02_03d    tLast_eXX_detectable_frxD02_03d
clear tFirst_eZZ_detectable_frxD02_03d    tLast_eZZ_detectable_frxD02_03d
clear tFirst_eXX_detectable_frxD02_05d    tLast_eXX_detectable_frxD02_05d
clear tFirst_eZZ_detectable_frxD02_05d    tLast_eZZ_detectable_frxD02_05d
clear tFirst_eXX_detectable_frxD02_10d    tLast_eXX_detectable_frxD02_10d
clear tFirst_eZZ_detectable_frxD02_10d    tLast_eZZ_detectable_frxD02_10d
clear tFirst_eXX_detectable_frxD02_50d    tLast_eXX_detectable_frxD02_50d
clear tFirst_eZZ_detectable_frxD02_50d    tLast_eZZ_detectable_frxD02_50d
% parameter 03
clear tFirst_eXX_detectable_frxD03_01d    tLast_eXX_detectable_frxD03_01d
clear tFirst_eZZ_detectable_frxD03_01d    tLast_eZZ_detectable_frxD03_01d
clear tFirst_eXX_detectable_frxD03_03d    tLast_eXX_detectable_frxD03_03d
clear tFirst_eZZ_detectable_frxD03_03d    tLast_eZZ_detectable_frxD03_03d
clear tFirst_eXX_detectable_frxD03_05d    tLast_eXX_detectable_frxD03_05d
clear tFirst_eZZ_detectable_frxD03_05d    tLast_eZZ_detectable_frxD03_05d
clear tFirst_eXX_detectable_frxD03_10d    tLast_eXX_detectable_frxD03_10d
clear tFirst_eZZ_detectable_frxD03_10d    tLast_eZZ_detectable_frxD03_10d
clear tFirst_eXX_detectable_frxD03_50d    tLast_eXX_detectable_frxD03_50d
clear tFirst_eZZ_detectable_frxD03_50d    tLast_eZZ_detectable_frxD03_50d
% parameter 04
clear tFirst_eXX_detectable_frxD04_01d    tLast_eXX_detectable_frxD04_01d
clear tFirst_eZZ_detectable_frxD04_01d    tLast_eZZ_detectable_frxD04_01d
clear tFirst_eXX_detectable_frxD04_03d    tLast_eXX_detectable_frxD04_03d
clear tFirst_eZZ_detectable_frxD04_03d    tLast_eZZ_detectable_frxD04_03d
clear tFirst_eXX_detectable_frxD04_05d    tLast_eXX_detectable_frxD04_05d
clear tFirst_eZZ_detectable_frxD04_05d    tLast_eZZ_detectable_frxD04_05d
clear tFirst_eXX_detectable_frxD04_10d    tLast_eXX_detectable_frxD04_10d
clear tFirst_eZZ_detectable_frxD04_10d    tLast_eZZ_detectable_frxD04_10d
clear tFirst_eXX_detectable_frxD04_50d    tLast_eXX_detectable_frxD04_50d
clear tFirst_eZZ_detectable_frxD04_50d    tLast_eZZ_detectable_frxD04_50d
% parameter 05
clear tFirst_eXX_detectable_frxD05_01d    tLast_eXX_detectable_frxD05_01d
clear tFirst_eZZ_detectable_frxD05_01d    tLast_eZZ_detectable_frxD05_01d
clear tFirst_eXX_detectable_frxD05_03d    tLast_eXX_detectable_frxD05_03d
clear tFirst_eZZ_detectable_frxD05_03d    tLast_eZZ_detectable_frxD05_03d
clear tFirst_eXX_detectable_frxD05_05d    tLast_eXX_detectable_frxD05_05d
clear tFirst_eZZ_detectable_frxD05_05d    tLast_eZZ_detectable_frxD05_05d
clear tFirst_eXX_detectable_frxD05_10d    tLast_eXX_detectable_frxD05_10d
clear tFirst_eZZ_detectable_frxD05_10d    tLast_eZZ_detectable_frxD05_10d
clear tFirst_eXX_detectable_frxD05_50d    tLast_eXX_detectable_frxD05_50d
clear tFirst_eZZ_detectable_frxD05_50d    tLast_eZZ_detectable_frxD05_50d
% parameter 06
clear tFirst_eXX_detectable_frxD06_01d    tLast_eXX_detectable_frxD06_01d
clear tFirst_eZZ_detectable_frxD06_01d    tLast_eZZ_detectable_frxD06_01d
clear tFirst_eXX_detectable_frxD06_03d    tLast_eXX_detectable_frxD06_03d
clear tFirst_eZZ_detectable_frxD06_03d    tLast_eZZ_detectable_frxD06_03d
clear tFirst_eXX_detectable_frxD06_05d    tLast_eXX_detectable_frxD06_05d
clear tFirst_eZZ_detectable_frxD06_05d    tLast_eZZ_detectable_frxD06_05d
clear tFirst_eXX_detectable_frxD06_10d    tLast_eXX_detectable_frxD06_10d
clear tFirst_eZZ_detectable_frxD06_10d    tLast_eZZ_detectable_frxD06_10d
clear tFirst_eXX_detectable_frxD06_50d    tLast_eXX_detectable_frxD06_50d
clear tFirst_eZZ_detectable_frxD06_50d    tLast_eZZ_detectable_frxD06_50d
% parameter 07
clear tFirst_eXX_detectable_frxD07_01d    tLast_eXX_detectable_frxD07_01d
clear tFirst_eZZ_detectable_frxD07_01d    tLast_eZZ_detectable_frxD07_01d
clear tFirst_eXX_detectable_frxD07_03d    tLast_eXX_detectable_frxD07_03d
clear tFirst_eZZ_detectable_frxD07_03d    tLast_eZZ_detectable_frxD07_03d
clear tFirst_eXX_detectable_frxD07_05d    tLast_eXX_detectable_frxD07_05d
clear tFirst_eZZ_detectable_frxD07_05d    tLast_eZZ_detectable_frxD07_05d
clear tFirst_eXX_detectable_frxD07_10d    tLast_eXX_detectable_frxD07_10d
clear tFirst_eZZ_detectable_frxD07_10d    tLast_eZZ_detectable_frxD07_10d
clear tFirst_eXX_detectable_frxD07_50d    tLast_eXX_detectable_frxD07_50d
clear tFirst_eZZ_detectable_frxD07_50d    tLast_eZZ_detectable_frxD07_50d
% parameter 08
clear tFirst_eXX_detectable_frxD08_01d    tLast_eXX_detectable_frxD08_01d
clear tFirst_eZZ_detectable_frxD08_01d    tLast_eZZ_detectable_frxD08_01d
clear tFirst_eXX_detectable_frxD08_03d    tLast_eXX_detectable_frxD08_03d
clear tFirst_eZZ_detectable_frxD08_03d    tLast_eZZ_detectable_frxD08_03d
clear tFirst_eXX_detectable_frxD08_05d    tLast_eXX_detectable_frxD08_05d
clear tFirst_eZZ_detectable_frxD08_05d    tLast_eZZ_detectable_frxD08_05d
clear tFirst_eXX_detectable_frxD08_10d    tLast_eXX_detectable_frxD08_10d
clear tFirst_eZZ_detectable_frxD08_10d    tLast_eZZ_detectable_frxD08_10d
clear tFirst_eXX_detectable_frxD08_50d    tLast_eXX_detectable_frxD08_50d
clear tFirst_eZZ_detectable_frxD08_50d    tLast_eZZ_detectable_frxD08_50d
% parameter 09
clear tFirst_eXX_detectable_frxD09_01d    tLast_eXX_detectable_frxD09_01d
clear tFirst_eZZ_detectable_frxD09_01d    tLast_eZZ_detectable_frxD09_01d
clear tFirst_eXX_detectable_frxD09_03d    tLast_eXX_detectable_frxD09_03d
clear tFirst_eZZ_detectable_frxD09_03d    tLast_eZZ_detectable_frxD09_03d
clear tFirst_eXX_detectable_frxD09_05d    tLast_eXX_detectable_frxD09_05d
clear tFirst_eZZ_detectable_frxD09_05d    tLast_eZZ_detectable_frxD09_05d
clear tFirst_eXX_detectable_frxD09_10d    tLast_eXX_detectable_frxD09_10d
clear tFirst_eZZ_detectable_frxD09_10d    tLast_eZZ_detectable_frxD09_10d
clear tFirst_eXX_detectable_frxD09_50d    tLast_eXX_detectable_frxD09_50d
clear tFirst_eZZ_detectable_frxD09_50d    tLast_eZZ_detectable_frxD09_50d
% parameter 10
clear tFirst_eXX_detectable_frxD10_01d    tLast_eXX_detectable_frxD10_01d
clear tFirst_eZZ_detectable_frxD10_01d    tLast_eZZ_detectable_frxD10_01d
clear tFirst_eXX_detectable_frxD10_03d    tLast_eXX_detectable_frxD10_03d
clear tFirst_eZZ_detectable_frxD10_03d    tLast_eZZ_detectable_frxD10_03d
clear tFirst_eXX_detectable_frxD10_05d    tLast_eXX_detectable_frxD10_05d
clear tFirst_eZZ_detectable_frxD10_05d    tLast_eZZ_detectable_frxD10_05d
clear tFirst_eXX_detectable_frxD10_10d    tLast_eXX_detectable_frxD10_10d
clear tFirst_eZZ_detectable_frxD10_10d    tLast_eZZ_detectable_frxD10_10d
clear tFirst_eXX_detectable_frxD10_50d    tLast_eXX_detectable_frxD10_50d
clear tFirst_eZZ_detectable_frxD10_50d    tLast_eZZ_detectable_frxD10_50d


clear eXX_minRateCriteria_frxD01_01d      eZZ_minRateCriteria_frxD01_01d
clear eXX_minRateCriteria_frxD02_01d      eZZ_minRateCriteria_frxD02_01d
clear eXX_minRateCriteria_frxD03_01d      eZZ_minRateCriteria_frxD03_01d
clear eXX_minRateCriteria_frxD04_01d      eZZ_minRateCriteria_frxD04_01d
clear eXX_minRateCriteria_frxD05_01d      eZZ_minRateCriteria_frxD05_01d
clear eXX_minRateCriteria_frxD06_01d      eZZ_minRateCriteria_frxD06_01d
clear eXX_minRateCriteria_frxD07_01d      eZZ_minRateCriteria_frxD07_01d
clear eXX_minRateCriteria_frxD08_01d      eZZ_minRateCriteria_frxD08_01d
clear eXX_minRateCriteria_frxD09_01d      eZZ_minRateCriteria_frxD09_01d
clear eXX_minRateCriteria_frxD10_01d      eZZ_minRateCriteria_frxD10_01d

clear eXX_minRateCriteria_frxD01_03d      eZZ_minRateCriteria_frxD01_03d
clear eXX_minRateCriteria_frxD02_03d      eZZ_minRateCriteria_frxD02_03d
clear eXX_minRateCriteria_frxD03_03d      eZZ_minRateCriteria_frxD03_03d
clear eXX_minRateCriteria_frxD04_03d      eZZ_minRateCriteria_frxD04_03d
clear eXX_minRateCriteria_frxD05_03d      eZZ_minRateCriteria_frxD05_03d
clear eXX_minRateCriteria_frxD06_03d      eZZ_minRateCriteria_frxD06_03d
clear eXX_minRateCriteria_frxD07_03d      eZZ_minRateCriteria_frxD07_03d
clear eXX_minRateCriteria_frxD08_03d      eZZ_minRateCriteria_frxD08_03d
clear eXX_minRateCriteria_frxD09_03d      eZZ_minRateCriteria_frxD09_03d
clear eXX_minRateCriteria_frxD10_03d      eZZ_minRateCriteria_frxD10_03d

clear eXX_minRateCriteria_frxD01_05d      eZZ_minRateCriteria_frxD01_05d
clear eXX_minRateCriteria_frxD02_05d      eZZ_minRateCriteria_frxD02_05d
clear eXX_minRateCriteria_frxD03_05d      eZZ_minRateCriteria_frxD03_05d
clear eXX_minRateCriteria_frxD04_05d      eZZ_minRateCriteria_frxD04_05d
clear eXX_minRateCriteria_frxD05_05d      eZZ_minRateCriteria_frxD05_05d
clear eXX_minRateCriteria_frxD06_05d      eZZ_minRateCriteria_frxD06_05d
clear eXX_minRateCriteria_frxD07_05d      eZZ_minRateCriteria_frxD07_05d
clear eXX_minRateCriteria_frxD08_05d      eZZ_minRateCriteria_frxD08_05d
clear eXX_minRateCriteria_frxD09_05d      eZZ_minRateCriteria_frxD09_05d
clear eXX_minRateCriteria_frxD10_05d      eZZ_minRateCriteria_frxD10_05d

clear eXX_minRateCriteria_frxD01_10d      eZZ_minRateCriteria_frxD01_10d
clear eXX_minRateCriteria_frxD02_10d      eZZ_minRateCriteria_frxD02_10d
clear eXX_minRateCriteria_frxD03_10d      eZZ_minRateCriteria_frxD03_10d
clear eXX_minRateCriteria_frxD04_10d      eZZ_minRateCriteria_frxD04_10d
clear eXX_minRateCriteria_frxD05_10d      eZZ_minRateCriteria_frxD05_10d
clear eXX_minRateCriteria_frxD06_10d      eZZ_minRateCriteria_frxD06_10d
clear eXX_minRateCriteria_frxD07_10d      eZZ_minRateCriteria_frxD07_10d
clear eXX_minRateCriteria_frxD08_10d      eZZ_minRateCriteria_frxD08_10d
clear eXX_minRateCriteria_frxD09_10d      eZZ_minRateCriteria_frxD09_10d
clear eXX_minRateCriteria_frxD10_10d      eZZ_minRateCriteria_frxD10_10d

clear eXX_minRateCriteria_frxD01_50d      eZZ_minRateCriteria_frxD01_50d
clear eXX_minRateCriteria_frxD02_50d      eZZ_minRateCriteria_frxD02_50d
clear eXX_minRateCriteria_frxD03_50d      eZZ_minRateCriteria_frxD03_50d
clear eXX_minRateCriteria_frxD04_50d      eZZ_minRateCriteria_frxD04_50d
clear eXX_minRateCriteria_frxD05_50d      eZZ_minRateCriteria_frxD05_50d
clear eXX_minRateCriteria_frxD06_50d      eZZ_minRateCriteria_frxD06_50d
clear eXX_minRateCriteria_frxD07_50d      eZZ_minRateCriteria_frxD07_50d
clear eXX_minRateCriteria_frxD08_50d      eZZ_minRateCriteria_frxD08_50d
clear eXX_minRateCriteria_frxD09_50d      eZZ_minRateCriteria_frxD09_50d
clear eXX_minRateCriteria_frxD10_50d      eZZ_minRateCriteria_frxD10_50d

%% Corelation Coef and polyfit to eXXrate_minRateDuration
% eXXrate_minRateDuration_03d_coef = (eXXrate_minRateDuration_03d(end)-eXXrate_minRateDuration_03d(1))/(r(end)-r(1)); %s/m
% eXXrate_minRateDuration_03d_polyFit = polyfit_swpDfrx(r,eXXrate_minRateDuration_03d,2);
% eXXrate_minRateDuration_03d_polyVal = polyval(eXXrate_minRateDuration_03d_polyFit,r);eZZrate_minRateDuration_03d_coef = (eZZrate_minRateDuration_03d(end)-eZZrate_minRateDuration_03d(1))/(r(end)-r(1)); %s/m
% eZZrate_minRateDuration_03d_polyFit = polyfit_swpDfrx(r,eZZrate_minRateDuration_03d,2);
% eZZrate_minRateDuration_03d_polyVal = polyval(eZZrate_minRateDuration_03d_polyFit,r);
