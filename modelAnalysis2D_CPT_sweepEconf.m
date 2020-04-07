%% modelAnalysis2D_frxSurf_sweepEconf
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
sweepEconf_paramVals = [ModelParams_sweepEconf(1).Ec01_conf; 
                        ModelParams_sweepEconf(1).Ec02_conf;
                        ModelParams_sweepEconf(1).Ec03_conf;
                        ModelParams_sweepEconf(1).Ec04_conf;
                        ModelParams_sweepEconf(1).Ec05_conf;];
                   
n_paramVals = length(sweepEconf_paramVals);

%% Calculate Characteristic Parameters
% ==================================================================================================== %
% Characteristic Length
% ==================================================================================================== %
x_c = ModelParams_sweepEconf(1).x_c; % [m]

% ==================================================================================================== %
% Characteristic Time
% ==================================================================================================== %
tc_sweepEconf = (x_c^2)/(4*ModelParams_sweepEconf(1).D_frx); % [s]


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
injStart = t(find(p_frxBot_sweepEconf(:,1)>0,1));

%% Obtain absolute values of strain rates

% ==================================================================================================== %
% Depth 1%
% ==================================================================================================== %
% parameter 01
eXXrate_Ec01_01d = abs(eXXrate_Ec01_01d);
eZZrate_Ec01_01d = abs(eZZrate_Ec01_01d);
eTXrate_Ec01_01d = abs(eTXrate_Ec01_01d);
% parameter 02
eXXrate_Ec02_01d = abs(eXXrate_Ec02_01d);
eZZrate_Ec02_01d = abs(eZZrate_Ec02_01d);
eTXrate_Ec02_01d = abs(eTXrate_Ec02_01d);
% parameter 03
eXXrate_Ec03_01d = abs(eXXrate_Ec03_01d);
eZZrate_Ec03_01d = abs(eZZrate_Ec03_01d);
eTXrate_Ec03_01d = abs(eTXrate_Ec03_01d);
% parameter 04
eXXrate_Ec04_01d = abs(eXXrate_Ec04_01d);
eZZrate_Ec04_01d = abs(eZZrate_Ec04_01d);
eTXrate_Ec04_01d = abs(eTXrate_Ec04_01d);
% parameter 05
eXXrate_Ec05_01d = abs(eXXrate_Ec05_01d);
eZZrate_Ec05_01d = abs(eZZrate_Ec05_01d);
eTXrate_Ec05_01d = abs(eTXrate_Ec05_01d);

% ==================================================================================================== %
% Depth 3%
% ==================================================================================================== %
% parameter 01
eXXrate_Ec01_03d = abs(eXXrate_Ec01_03d);
eZZrate_Ec01_03d = abs(eZZrate_Ec01_03d);
eTXrate_Ec01_03d = abs(eTXrate_Ec01_03d);
% parameter 02
eXXrate_Ec02_03d = abs(eXXrate_Ec02_03d);
eZZrate_Ec02_03d = abs(eZZrate_Ec02_03d);
eTXrate_Ec02_03d = abs(eTXrate_Ec02_03d);
% parameter 03
eXXrate_Ec03_03d = abs(eXXrate_Ec03_03d);
eZZrate_Ec03_03d = abs(eZZrate_Ec03_03d);
eTXrate_Ec03_03d = abs(eTXrate_Ec03_03d);
% parameter 04
eXXrate_Ec04_03d = abs(eXXrate_Ec04_03d);
eZZrate_Ec04_03d = abs(eZZrate_Ec04_03d);
eTXrate_Ec04_03d = abs(eTXrate_Ec04_03d);
% parameter 05
eXXrate_Ec05_03d = abs(eXXrate_Ec05_03d);
eZZrate_Ec05_03d = abs(eZZrate_Ec05_03d);
eTXrate_Ec05_03d = abs(eTXrate_Ec05_03d);

% ==================================================================================================== %
% Depth 5%
% ==================================================================================================== %
% parameter 01
eXXrate_Ec01_05d = abs(eXXrate_Ec01_05d);
eZZrate_Ec01_05d = abs(eZZrate_Ec01_05d);
eTXrate_Ec01_05d = abs(eTXrate_Ec01_05d);
% parameter 02
eXXrate_Ec02_05d = abs(eXXrate_Ec02_05d);
eZZrate_Ec02_05d = abs(eZZrate_Ec02_05d);
eTXrate_Ec02_05d = abs(eTXrate_Ec02_05d);
% parameter 03
eXXrate_Ec03_05d = abs(eXXrate_Ec03_05d);
eZZrate_Ec03_05d = abs(eZZrate_Ec03_05d);
eTXrate_Ec03_05d = abs(eTXrate_Ec03_05d);
% parameter 04
eXXrate_Ec04_05d = abs(eXXrate_Ec04_05d);
eZZrate_Ec04_05d = abs(eZZrate_Ec04_05d);
eTXrate_Ec04_05d = abs(eTXrate_Ec04_05d);
% parameter 05
eXXrate_Ec05_05d = abs(eXXrate_Ec05_05d);
eZZrate_Ec05_05d = abs(eZZrate_Ec05_05d);
eTXrate_Ec05_05d = abs(eTXrate_Ec05_05d);

% ==================================================================================================== %
% Depth 10%
% ==================================================================================================== %
% parameter 01
eXXrate_Ec01_10d = abs(eXXrate_Ec01_10d);
eZZrate_Ec01_10d = abs(eZZrate_Ec01_10d);
eTXrate_Ec01_10d = abs(eTXrate_Ec01_10d);
% parameter 02
eXXrate_Ec02_10d = abs(eXXrate_Ec02_10d);
eZZrate_Ec02_10d = abs(eZZrate_Ec02_10d);
eTXrate_Ec02_10d = abs(eTXrate_Ec02_10d);
% parameter 03
eXXrate_Ec03_10d = abs(eXXrate_Ec03_10d);
eZZrate_Ec03_10d = abs(eZZrate_Ec03_10d);
eTXrate_Ec03_10d = abs(eTXrate_Ec03_10d);
% parameter 04
eXXrate_Ec04_10d = abs(eXXrate_Ec04_10d);
eZZrate_Ec04_10d = abs(eZZrate_Ec04_10d);
eTXrate_Ec04_10d = abs(eTXrate_Ec04_10d);
% parameter 05
eXXrate_Ec05_10d = abs(eXXrate_Ec05_10d);
eZZrate_Ec05_10d = abs(eZZrate_Ec05_10d);
eTXrate_Ec05_10d = abs(eTXrate_Ec05_10d);

% ==================================================================================================== %
% Depth 50%
% ==================================================================================================== %
% parameter 01
eXXrate_Ec01_50d = abs(eXXrate_Ec01_50d);
eZZrate_Ec01_50d = abs(eZZrate_Ec01_50d);
eTXrate_Ec01_50d = abs(eTXrate_Ec01_50d);
% parameter 02
eXXrate_Ec02_50d = abs(eXXrate_Ec02_50d);
eZZrate_Ec02_50d = abs(eZZrate_Ec02_50d);
eTXrate_Ec02_50d = abs(eTXrate_Ec02_50d);
% parameter 03
eXXrate_Ec03_50d = abs(eXXrate_Ec03_50d);
eZZrate_Ec03_50d = abs(eZZrate_Ec03_50d);
eTXrate_Ec03_50d = abs(eTXrate_Ec03_50d);
% parameter 04
eXXrate_Ec04_50d = abs(eXXrate_Ec04_50d);
eZZrate_Ec04_50d = abs(eZZrate_Ec04_50d);
eTXrate_Ec04_50d = abs(eTXrate_Ec04_50d);
% parameter 05
eXXrate_Ec05_50d = abs(eXXrate_Ec05_50d);
eZZrate_Ec05_50d = abs(eZZrate_Ec05_50d);
eTXrate_Ec05_50d = abs(eTXrate_Ec05_50d);

%% Maximum Strain Rate

% parameter 01
eXXrateMax_Ec01_01d = zeros(n_tSteps,n_probes);
eZZrateMax_Ec01_01d = zeros(n_tSteps,n_probes);
eTXrateMax_Ec01_01d = zeros(n_tSteps,n_probes);
eXXrateMax_Ec01_03d = zeros(n_tSteps,n_probes);
eZZrateMax_Ec01_03d = zeros(n_tSteps,n_probes);
eTXrateMax_Ec01_03d = zeros(n_tSteps,n_probes);
eXXrateMax_Ec01_05d = zeros(n_tSteps,n_probes);
eZZrateMax_Ec01_05d = zeros(n_tSteps,n_probes);
eTXrateMax_Ec01_05d = zeros(n_tSteps,n_probes);
eXXrateMax_Ec01_10d = zeros(n_tSteps,n_probes);
eZZrateMax_Ec01_10d = zeros(n_tSteps,n_probes);
eTXrateMax_Ec01_10d = zeros(n_tSteps,n_probes);
eXXrateMax_Ec01_50d = zeros(n_tSteps,n_probes);
eZZrateMax_Ec01_50d = zeros(n_tSteps,n_probes);
eTXrateMax_Ec01_50d = zeros(n_tSteps,n_probes);
% parameter 02
eXXrateMax_Ec02_01d = zeros(n_tSteps,n_probes);
eZZrateMax_Ec02_01d = zeros(n_tSteps,n_probes);
eTXrateMax_Ec02_01d = zeros(n_tSteps,n_probes);
eXXrateMax_Ec02_03d = zeros(n_tSteps,n_probes);
eZZrateMax_Ec02_03d = zeros(n_tSteps,n_probes);
eTXrateMax_Ec02_03d = zeros(n_tSteps,n_probes);
eXXrateMax_Ec02_05d = zeros(n_tSteps,n_probes);
eZZrateMax_Ec02_05d = zeros(n_tSteps,n_probes);
eTXrateMax_Ec02_05d = zeros(n_tSteps,n_probes);
eXXrateMax_Ec02_10d = zeros(n_tSteps,n_probes);
eZZrateMax_Ec02_10d = zeros(n_tSteps,n_probes);
eTXrateMax_Ec02_10d = zeros(n_tSteps,n_probes);
eXXrateMax_Ec02_50d = zeros(n_tSteps,n_probes);
eZZrateMax_Ec02_50d = zeros(n_tSteps,n_probes);
eTXrateMax_Ec02_50d = zeros(n_tSteps,n_probes);
% parameter 03
eXXrateMax_Ec03_01d = zeros(n_tSteps,n_probes);
eZZrateMax_Ec03_01d = zeros(n_tSteps,n_probes);
eTXrateMax_Ec03_01d = zeros(n_tSteps,n_probes);
eXXrateMax_Ec03_03d = zeros(n_tSteps,n_probes);
eZZrateMax_Ec03_03d = zeros(n_tSteps,n_probes);
eTXrateMax_Ec03_03d = zeros(n_tSteps,n_probes);
eXXrateMax_Ec03_05d = zeros(n_tSteps,n_probes);
eZZrateMax_Ec03_05d = zeros(n_tSteps,n_probes);
eTXrateMax_Ec03_05d = zeros(n_tSteps,n_probes);
eXXrateMax_Ec03_10d = zeros(n_tSteps,n_probes);
eZZrateMax_Ec03_10d = zeros(n_tSteps,n_probes);
eTXrateMax_Ec03_10d = zeros(n_tSteps,n_probes);
eXXrateMax_Ec03_50d = zeros(n_tSteps,n_probes);
eZZrateMax_Ec03_50d = zeros(n_tSteps,n_probes);
eTXrateMax_Ec03_50d = zeros(n_tSteps,n_probes);
% parameter 04
eXXrateMax_Ec04_01d = zeros(n_tSteps,n_probes);
eZZrateMax_Ec04_01d = zeros(n_tSteps,n_probes);
eTXrateMax_Ec04_01d = zeros(n_tSteps,n_probes);
eXXrateMax_Ec04_03d = zeros(n_tSteps,n_probes);
eZZrateMax_Ec04_03d = zeros(n_tSteps,n_probes);
eTXrateMax_Ec04_03d = zeros(n_tSteps,n_probes);
eXXrateMax_Ec04_05d = zeros(n_tSteps,n_probes);
eZZrateMax_Ec04_05d = zeros(n_tSteps,n_probes);
eTXrateMax_Ec04_05d = zeros(n_tSteps,n_probes);
eXXrateMax_Ec04_10d = zeros(n_tSteps,n_probes);
eZZrateMax_Ec04_10d = zeros(n_tSteps,n_probes);
eTXrateMax_Ec04_10d = zeros(n_tSteps,n_probes);
eXXrateMax_Ec04_50d = zeros(n_tSteps,n_probes);
eZZrateMax_Ec04_50d = zeros(n_tSteps,n_probes);
eTXrateMax_Ec04_50d = zeros(n_tSteps,n_probes);
% parameter 05
eXXrateMax_Ec05_01d = zeros(n_tSteps,n_probes);
eZZrateMax_Ec05_01d = zeros(n_tSteps,n_probes);
eTXrateMax_Ec05_01d = zeros(n_tSteps,n_probes);
eXXrateMax_Ec05_03d = zeros(n_tSteps,n_probes);
eZZrateMax_Ec05_03d = zeros(n_tSteps,n_probes);
eTXrateMax_Ec05_03d = zeros(n_tSteps,n_probes);
eXXrateMax_Ec05_05d = zeros(n_tSteps,n_probes);
eZZrateMax_Ec05_05d = zeros(n_tSteps,n_probes);
eTXrateMax_Ec05_05d = zeros(n_tSteps,n_probes);
eXXrateMax_Ec05_10d = zeros(n_tSteps,n_probes);
eZZrateMax_Ec05_10d = zeros(n_tSteps,n_probes);
eTXrateMax_Ec05_10d = zeros(n_tSteps,n_probes);
eXXrateMax_Ec05_50d = zeros(n_tSteps,n_probes);
eZZrateMax_Ec05_50d = zeros(n_tSteps,n_probes);
eTXrateMax_Ec05_50d = zeros(n_tSteps,n_probes);

for i = 1:n_probes
% ==================================================================================================== %
% Depth 1%
% ==================================================================================================== %
% parameter 01
    eXXrateMax_Ec01_01d(i) = max(eXXrate_Ec01_01d(:,i));
    eZZrateMax_Ec01_01d(i) = max(eZZrate_Ec01_01d(:,i));
    eTXrateMax_Ec01_01d(i) = max(eTXrate_Ec01_01d(:,i));
% parameter 02
    eXXrateMax_Ec02_01d(i) = max(eXXrate_Ec02_01d(:,i));
    eZZrateMax_Ec02_01d(i) = max(eZZrate_Ec02_01d(:,i));
    eTXrateMax_Ec02_01d(i) = max(eTXrate_Ec02_01d(:,i));
% parameter 03
    eXXrateMax_Ec03_01d(i) = max(eXXrate_Ec03_01d(:,i));
    eZZrateMax_Ec03_01d(i) = max(eZZrate_Ec03_01d(:,i));
    eTXrateMax_Ec03_01d(i) = max(eTXrate_Ec03_01d(:,i));
% parameter 04
    eXXrateMax_Ec04_01d(i) = max(eXXrate_Ec04_01d(:,i));
    eZZrateMax_Ec04_01d(i) = max(eZZrate_Ec04_01d(:,i));
    eTXrateMax_Ec04_01d(i) = max(eTXrate_Ec04_01d(:,i));
% parameter 05
    eXXrateMax_Ec05_01d(i) = max(eXXrate_Ec05_01d(:,i));
    eZZrateMax_Ec05_01d(i) = max(eZZrate_Ec05_01d(:,i));
    eTXrateMax_Ec05_01d(i) = max(eTXrate_Ec05_01d(:,i));

% ==================================================================================================== %
% Depth 3%
% ==================================================================================================== %
% parameter 01
    eXXrateMax_Ec01_03d(i) = max(eXXrate_Ec01_03d(:,i));
    eZZrateMax_Ec01_03d(i) = max(eZZrate_Ec01_03d(:,i));
    eTXrateMax_Ec01_03d(i) = max(eTXrate_Ec01_03d(:,i));
% parameter 02
    eXXrateMax_Ec02_03d(i) = max(eXXrate_Ec02_03d(:,i));
    eZZrateMax_Ec02_03d(i) = max(eZZrate_Ec02_03d(:,i));
    eTXrateMax_Ec02_03d(i) = max(eTXrate_Ec02_03d(:,i));
% parameter 03
    eXXrateMax_Ec03_03d(i) = max(eXXrate_Ec03_03d(:,i));
    eZZrateMax_Ec03_03d(i) = max(eZZrate_Ec03_03d(:,i));
    eTXrateMax_Ec03_03d(i) = max(eTXrate_Ec03_03d(:,i));
% parameter 04
    eXXrateMax_Ec04_03d(i) = max(eXXrate_Ec04_03d(:,i));
    eZZrateMax_Ec04_03d(i) = max(eZZrate_Ec04_03d(:,i));
    eTXrateMax_Ec04_03d(i) = max(eTXrate_Ec04_03d(:,i));
% parameter 05
    eXXrateMax_Ec05_03d(i) = max(eXXrate_Ec05_03d(:,i));
    eZZrateMax_Ec05_03d(i) = max(eZZrate_Ec05_03d(:,i));
    eTXrateMax_Ec05_03d(i) = max(eTXrate_Ec05_03d(:,i));
    
% ==================================================================================================== %
% Depth 5%
% ==================================================================================================== %
% parameter 01
    eXXrateMax_Ec01_05d(i) = max(eXXrate_Ec01_05d(:,i));
    eZZrateMax_Ec01_05d(i) = max(eZZrate_Ec01_05d(:,i));
    eTXrateMax_Ec01_05d(i) = max(eTXrate_Ec01_05d(:,i));
% parameter 02
    eXXrateMax_Ec02_05d(i) = max(eXXrate_Ec02_05d(:,i));
    eZZrateMax_Ec02_05d(i) = max(eZZrate_Ec02_05d(:,i));
    eTXrateMax_Ec02_05d(i) = max(eTXrate_Ec02_05d(:,i));
% parameter 03
    eXXrateMax_Ec03_05d(i) = max(eXXrate_Ec03_05d(:,i));
    eZZrateMax_Ec03_05d(i) = max(eZZrate_Ec03_05d(:,i));
    eTXrateMax_Ec03_05d(i) = max(eTXrate_Ec03_05d(:,i));
% parameter 04
    eXXrateMax_Ec04_05d(i) = max(eXXrate_Ec04_05d(:,i));
    eZZrateMax_Ec04_05d(i) = max(eZZrate_Ec04_05d(:,i));
    eTXrateMax_Ec04_05d(i) = max(eTXrate_Ec04_05d(:,i));
% parameter 05
    eXXrateMax_Ec05_05d(i) = max(eXXrate_Ec05_05d(:,i));
    eZZrateMax_Ec05_05d(i) = max(eZZrate_Ec05_05d(:,i));
    eTXrateMax_Ec05_05d(i) = max(eTXrate_Ec05_05d(:,i));
    
% ==================================================================================================== %
% Depth 10%
% ==================================================================================================== %
% parameter 01
    eXXrateMax_Ec01_10d(i) = max(eXXrate_Ec01_10d(:,i));
    eZZrateMax_Ec01_10d(i) = max(eZZrate_Ec01_10d(:,i));
    eTXrateMax_Ec01_10d(i) = max(eTXrate_Ec01_10d(:,i));
% parameter 02
    eXXrateMax_Ec02_10d(i) = max(eXXrate_Ec02_10d(:,i));
    eZZrateMax_Ec02_10d(i) = max(eZZrate_Ec02_10d(:,i));
    eTXrateMax_Ec02_10d(i) = max(eTXrate_Ec02_10d(:,i));
% parameter 03
    eXXrateMax_Ec03_10d(i) = max(eXXrate_Ec03_10d(:,i));
    eZZrateMax_Ec03_10d(i) = max(eZZrate_Ec03_10d(:,i));
    eTXrateMax_Ec03_10d(i) = max(eTXrate_Ec03_10d(:,i));
% parameter 04
    eXXrateMax_Ec04_10d(i) = max(eXXrate_Ec04_10d(:,i));
    eZZrateMax_Ec04_10d(i) = max(eZZrate_Ec04_10d(:,i));
    eTXrateMax_Ec04_10d(i) = max(eTXrate_Ec04_10d(:,i));
% parameter 05
    eXXrateMax_Ec05_10d(i) = max(eXXrate_Ec05_10d(:,i));
    eZZrateMax_Ec05_10d(i) = max(eZZrate_Ec05_10d(:,i));
    eTXrateMax_Ec05_10d(i) = max(eTXrate_Ec05_10d(:,i));
    
% ==================================================================================================== %
% Depth 50%
% ==================================================================================================== %
% parameter 01
    eXXrateMax_Ec01_50d(i) = max(eXXrate_Ec01_50d(:,i));
    eZZrateMax_Ec01_50d(i) = max(eZZrate_Ec01_50d(:,i));
    eTXrateMax_Ec01_50d(i) = max(eTXrate_Ec01_50d(:,i));
% parameter 02
    eXXrateMax_Ec02_50d(i) = max(eXXrate_Ec02_50d(:,i));
    eZZrateMax_Ec02_50d(i) = max(eZZrate_Ec02_50d(:,i));
    eTXrateMax_Ec02_50d(i) = max(eTXrate_Ec02_50d(:,i));
% parameter 03
    eXXrateMax_Ec03_50d(i) = max(eXXrate_Ec03_50d(:,i));
    eZZrateMax_Ec03_50d(i) = max(eZZrate_Ec03_50d(:,i));
    eTXrateMax_Ec03_50d(i) = max(eTXrate_Ec03_50d(:,i));
% parameter 04
    eXXrateMax_Ec04_50d(i) = max(eXXrate_Ec04_50d(:,i));
    eZZrateMax_Ec04_50d(i) = max(eZZrate_Ec04_50d(:,i));
    eTXrateMax_Ec04_50d(i) = max(eTXrate_Ec04_50d(:,i));
% parameter 05
    eXXrateMax_Ec05_50d(i) = max(eXXrate_Ec05_50d(:,i));
    eZZrateMax_Ec05_50d(i) = max(eZZrate_Ec05_50d(:,i));
    eTXrateMax_Ec05_50d(i) = max(eTXrate_Ec05_50d(:,i));
end

%% Time after injection at which maximum strain rate occurs

t_eXXrateMax_Ec01_01d = zeros(1,n_probes);
t_eZZrateMax_Ec01_01d = zeros(1,n_probes);
t_eTXrateMax_Ec01_01d = zeros(1,n_probes);
t_eXXrateMax_Ec01_03d = zeros(1,n_probes);
t_eZZrateMax_Ec01_03d = zeros(1,n_probes);
t_eTXrateMax_Ec01_03d = zeros(1,n_probes);
t_eXXrateMax_Ec01_05d = zeros(1,n_probes);
t_eZZrateMax_Ec01_05d = zeros(1,n_probes);
t_eTXrateMax_Ec01_05d = zeros(1,n_probes);
t_eXXrateMax_Ec01_10d = zeros(1,n_probes);
t_eZZrateMax_Ec01_10d = zeros(1,n_probes);
t_eTXrateMax_Ec01_10d = zeros(1,n_probes);
t_eXXrateMax_Ec01_50d = zeros(1,n_probes);
t_eZZrateMax_Ec01_50d = zeros(1,n_probes);
t_eTXrateMax_Ec01_50d = zeros(1,n_probes);
% parameter 02
t_eXXrateMax_Ec02_01d = zeros(1,n_probes);
t_eZZrateMax_Ec02_01d = zeros(1,n_probes);
t_eTXrateMax_Ec02_01d = zeros(1,n_probes);
t_eXXrateMax_Ec02_03d = zeros(1,n_probes);
t_eZZrateMax_Ec02_03d = zeros(1,n_probes);
t_eTXrateMax_Ec02_03d = zeros(1,n_probes);
t_eXXrateMax_Ec02_05d = zeros(1,n_probes);
t_eZZrateMax_Ec02_05d = zeros(1,n_probes);
t_eTXrateMax_Ec02_05d = zeros(1,n_probes);
t_eXXrateMax_Ec02_10d = zeros(1,n_probes);
t_eZZrateMax_Ec02_10d = zeros(1,n_probes);
t_eTXrateMax_Ec02_10d = zeros(1,n_probes);
t_eXXrateMax_Ec02_50d = zeros(1,n_probes);
t_eZZrateMax_Ec02_50d = zeros(1,n_probes);
t_eTXrateMax_Ec02_50d = zeros(1,n_probes);
% parameter 03
t_eXXrateMax_Ec03_01d = zeros(1,n_probes);
t_eZZrateMax_Ec03_01d = zeros(1,n_probes);
t_eTXrateMax_Ec03_01d = zeros(1,n_probes);
t_eXXrateMax_Ec03_03d = zeros(1,n_probes);
t_eZZrateMax_Ec03_03d = zeros(1,n_probes);
t_eTXrateMax_Ec03_03d = zeros(1,n_probes);
t_eXXrateMax_Ec03_05d = zeros(1,n_probes);
t_eZZrateMax_Ec03_05d = zeros(1,n_probes);
t_eTXrateMax_Ec03_05d = zeros(1,n_probes);
t_eXXrateMax_Ec03_10d = zeros(1,n_probes);
t_eZZrateMax_Ec03_10d = zeros(1,n_probes);
t_eTXrateMax_Ec03_10d = zeros(1,n_probes);
t_eXXrateMax_Ec03_50d = zeros(1,n_probes);
t_eZZrateMax_Ec03_50d = zeros(1,n_probes);
t_eTXrateMax_Ec03_50d = zeros(1,n_probes);
% parameter 04
t_eXXrateMax_Ec04_01d = zeros(1,n_probes);
t_eZZrateMax_Ec04_01d = zeros(1,n_probes);
t_eTXrateMax_Ec04_01d = zeros(1,n_probes);
t_eXXrateMax_Ec04_03d = zeros(1,n_probes);
t_eZZrateMax_Ec04_03d = zeros(1,n_probes);
t_eTXrateMax_Ec04_03d = zeros(1,n_probes);
t_eXXrateMax_Ec04_05d = zeros(1,n_probes);
t_eZZrateMax_Ec04_05d = zeros(1,n_probes);
t_eTXrateMax_Ec04_05d = zeros(1,n_probes);
t_eXXrateMax_Ec04_10d = zeros(1,n_probes);
t_eZZrateMax_Ec04_10d = zeros(1,n_probes);
t_eTXrateMax_Ec04_10d = zeros(1,n_probes);
t_eXXrateMax_Ec04_50d = zeros(1,n_probes);
t_eZZrateMax_Ec04_50d = zeros(1,n_probes);
t_eTXrateMax_Ec04_50d = zeros(1,n_probes);
% parameter 05
t_eXXrateMax_Ec05_01d = zeros(1,n_probes);
t_eZZrateMax_Ec05_01d = zeros(1,n_probes);
t_eTXrateMax_Ec05_01d = zeros(1,n_probes);
t_eXXrateMax_Ec05_03d = zeros(1,n_probes);
t_eZZrateMax_Ec05_03d = zeros(1,n_probes);
t_eTXrateMax_Ec05_03d = zeros(1,n_probes);
t_eXXrateMax_Ec05_05d = zeros(1,n_probes);
t_eZZrateMax_Ec05_05d = zeros(1,n_probes);
t_eTXrateMax_Ec05_05d = zeros(1,n_probes);
t_eXXrateMax_Ec05_10d = zeros(1,n_probes);
t_eZZrateMax_Ec05_10d = zeros(1,n_probes);
t_eTXrateMax_Ec05_10d = zeros(1,n_probes);
t_eXXrateMax_Ec05_50d = zeros(1,n_probes);
t_eZZrateMax_Ec05_50d = zeros(1,n_probes);
t_eTXrateMax_Ec05_50d = zeros(1,n_probes);
    
for i = 1:n_probes
% ==================================================================================================== %
% Depth 1%
% ==================================================================================================== %
% parameter 01
    t_eXXrateMax_Ec01_01d(i) = t(find(eXXrate_Ec01_01d(:,i)==eXXrateMax_Ec01_01d(i),1))-injStart;
    t_eZZrateMax_Ec01_01d(i) = t(find(eZZrate_Ec01_01d(:,i)==eZZrateMax_Ec01_01d(i),1))-injStart;
    t_eTXrateMax_Ec01_01d(i) = t(find(eTXrate_Ec01_01d(:,i)==eTXrateMax_Ec01_01d(i),1))-injStart;
% parameter 02
    t_eXXrateMax_Ec02_01d(i) = t(find(eXXrate_Ec02_01d(:,i)==eXXrateMax_Ec02_01d(i),1))-injStart;
    t_eZZrateMax_Ec02_01d(i) = t(find(eZZrate_Ec02_01d(:,i)==eZZrateMax_Ec02_01d(i),1))-injStart;
    t_eTXrateMax_Ec02_01d(i) = t(find(eTXrate_Ec02_01d(:,i)==eTXrateMax_Ec02_01d(i),1))-injStart;
% parameter 03
    t_eXXrateMax_Ec03_01d(i) = t(find(eXXrate_Ec03_01d(:,i)==eXXrateMax_Ec03_01d(i),1))-injStart;
    t_eZZrateMax_Ec03_01d(i) = t(find(eZZrate_Ec03_01d(:,i)==eZZrateMax_Ec03_01d(i),1))-injStart;
    t_eTXrateMax_Ec03_01d(i) = t(find(eTXrate_Ec03_01d(:,i)==eTXrateMax_Ec03_01d(i),1))-injStart;
% parameter 04
    t_eXXrateMax_Ec04_01d(i) = t(find(eXXrate_Ec04_01d(:,i)==eXXrateMax_Ec04_01d(i),1))-injStart;
    t_eZZrateMax_Ec04_01d(i) = t(find(eZZrate_Ec04_01d(:,i)==eZZrateMax_Ec04_01d(i),1))-injStart;
    t_eTXrateMax_Ec04_01d(i) = t(find(eTXrate_Ec04_01d(:,i)==eTXrateMax_Ec04_01d(i),1))-injStart;
% parameter 05
    t_eXXrateMax_Ec05_01d(i) = t(find(eXXrate_Ec05_01d(:,i)==eXXrateMax_Ec05_01d(i),1))-injStart;
    t_eZZrateMax_Ec05_01d(i) = t(find(eZZrate_Ec05_01d(:,i)==eZZrateMax_Ec05_01d(i),1))-injStart;
    t_eTXrateMax_Ec05_01d(i) = t(find(eTXrate_Ec05_01d(:,i)==eTXrateMax_Ec05_01d(i),1))-injStart;

% ==================================================================================================== %
% Depth 3%
% ==================================================================================================== %
% parameter 01
    t_eXXrateMax_Ec01_03d(i) = t(find(eXXrate_Ec01_03d(:,i)==eXXrateMax_Ec01_03d(i),1))-injStart;
    t_eZZrateMax_Ec01_03d(i) = t(find(eZZrate_Ec01_03d(:,i)==eZZrateMax_Ec01_03d(i),1))-injStart;
    t_eTXrateMax_Ec01_03d(i) = t(find(eTXrate_Ec01_03d(:,i)==eTXrateMax_Ec01_03d(i),1))-injStart;
% parameter 02
    t_eXXrateMax_Ec02_03d(i) = t(find(eXXrate_Ec02_03d(:,i)==eXXrateMax_Ec02_03d(i),1))-injStart;
    t_eZZrateMax_Ec02_03d(i) = t(find(eZZrate_Ec02_03d(:,i)==eZZrateMax_Ec02_03d(i),1))-injStart;
    t_eTXrateMax_Ec02_03d(i) = t(find(eTXrate_Ec02_03d(:,i)==eTXrateMax_Ec02_03d(i),1))-injStart;
% parameter 03
    t_eXXrateMax_Ec03_03d(i) = t(find(eXXrate_Ec03_03d(:,i)==eXXrateMax_Ec03_03d(i),1))-injStart;
    t_eZZrateMax_Ec03_03d(i) = t(find(eZZrate_Ec03_03d(:,i)==eZZrateMax_Ec03_03d(i),1))-injStart;
    t_eTXrateMax_Ec03_03d(i) = t(find(eTXrate_Ec03_03d(:,i)==eTXrateMax_Ec03_03d(i),1))-injStart;
% parameter 04
    t_eXXrateMax_Ec04_03d(i) = t(find(eXXrate_Ec04_03d(:,i)==eXXrateMax_Ec04_03d(i),1))-injStart;
    t_eZZrateMax_Ec04_03d(i) = t(find(eZZrate_Ec04_03d(:,i)==eZZrateMax_Ec04_03d(i),1))-injStart;
    t_eTXrateMax_Ec04_03d(i) = t(find(eTXrate_Ec04_03d(:,i)==eTXrateMax_Ec04_03d(i),1))-injStart;
% parameter 05
    t_eXXrateMax_Ec05_03d(i) = t(find(eXXrate_Ec05_03d(:,i)==eXXrateMax_Ec05_03d(i),1))-injStart;
    t_eZZrateMax_Ec05_03d(i) = t(find(eZZrate_Ec05_03d(:,i)==eZZrateMax_Ec05_03d(i),1))-injStart;
    t_eTXrateMax_Ec05_03d(i) = t(find(eTXrate_Ec05_03d(:,i)==eTXrateMax_Ec05_03d(i),1))-injStart;

% ==================================================================================================== %
% Depth 5%
% ==================================================================================================== %
% parameter 01
    t_eXXrateMax_Ec01_05d(i) = t(find(eXXrate_Ec01_05d(:,i)==eXXrateMax_Ec01_05d(i),1))-injStart;
    t_eZZrateMax_Ec01_05d(i) = t(find(eZZrate_Ec01_05d(:,i)==eZZrateMax_Ec01_05d(i),1))-injStart;
    t_eTXrateMax_Ec01_05d(i) = t(find(eTXrate_Ec01_05d(:,i)==eTXrateMax_Ec01_05d(i),1))-injStart;
% parameter 02
    t_eXXrateMax_Ec02_05d(i) = t(find(eXXrate_Ec02_05d(:,i)==eXXrateMax_Ec02_05d(i),1))-injStart;
    t_eZZrateMax_Ec02_05d(i) = t(find(eZZrate_Ec02_05d(:,i)==eZZrateMax_Ec02_05d(i),1))-injStart;
    t_eTXrateMax_Ec02_05d(i) = t(find(eTXrate_Ec02_05d(:,i)==eTXrateMax_Ec02_05d(i),1))-injStart;
% parameter 03
    t_eXXrateMax_Ec03_05d(i) = t(find(eXXrate_Ec03_05d(:,i)==eXXrateMax_Ec03_05d(i),1))-injStart;
    t_eZZrateMax_Ec03_05d(i) = t(find(eZZrate_Ec03_05d(:,i)==eZZrateMax_Ec03_05d(i),1))-injStart;
    t_eTXrateMax_Ec03_05d(i) = t(find(eTXrate_Ec03_05d(:,i)==eTXrateMax_Ec03_05d(i),1))-injStart;
% parameter 04
    t_eXXrateMax_Ec04_05d(i) = t(find(eXXrate_Ec04_05d(:,i)==eXXrateMax_Ec04_05d(i),1))-injStart;
    t_eZZrateMax_Ec04_05d(i) = t(find(eZZrate_Ec04_05d(:,i)==eZZrateMax_Ec04_05d(i),1))-injStart;
    t_eTXrateMax_Ec04_05d(i) = t(find(eTXrate_Ec04_05d(:,i)==eTXrateMax_Ec04_05d(i),1))-injStart;
% parameter 05
    t_eXXrateMax_Ec05_05d(i) = t(find(eXXrate_Ec05_05d(:,i)==eXXrateMax_Ec05_05d(i),1))-injStart;
    t_eZZrateMax_Ec05_05d(i) = t(find(eZZrate_Ec05_05d(:,i)==eZZrateMax_Ec05_05d(i),1))-injStart;
    t_eTXrateMax_Ec05_05d(i) = t(find(eTXrate_Ec05_05d(:,i)==eTXrateMax_Ec05_05d(i),1))-injStart;

% ==================================================================================================== %
% Depth 10%
% ==================================================================================================== %
% parameter 01
    t_eXXrateMax_Ec01_10d(i) = t(find(eXXrate_Ec01_10d(:,i)==eXXrateMax_Ec01_10d(i),1))-injStart;
    t_eZZrateMax_Ec01_10d(i) = t(find(eZZrate_Ec01_10d(:,i)==eZZrateMax_Ec01_10d(i),1))-injStart;
    t_eTXrateMax_Ec01_10d(i) = t(find(eTXrate_Ec01_10d(:,i)==eTXrateMax_Ec01_10d(i),1))-injStart;
% parameter 02
    t_eXXrateMax_Ec02_10d(i) = t(find(eXXrate_Ec02_10d(:,i)==eXXrateMax_Ec02_10d(i),1))-injStart;
    t_eZZrateMax_Ec02_10d(i) = t(find(eZZrate_Ec02_10d(:,i)==eZZrateMax_Ec02_10d(i),1))-injStart;
    t_eTXrateMax_Ec02_10d(i) = t(find(eTXrate_Ec02_10d(:,i)==eTXrateMax_Ec02_10d(i),1))-injStart;
% parameter 03
    t_eXXrateMax_Ec03_10d(i) = t(find(eXXrate_Ec03_10d(:,i)==eXXrateMax_Ec03_10d(i),1))-injStart;
    t_eZZrateMax_Ec03_10d(i) = t(find(eZZrate_Ec03_10d(:,i)==eZZrateMax_Ec03_10d(i),1))-injStart;
    t_eTXrateMax_Ec03_10d(i) = t(find(eTXrate_Ec03_10d(:,i)==eTXrateMax_Ec03_10d(i),1))-injStart;
% parameter 04
    t_eXXrateMax_Ec04_10d(i) = t(find(eXXrate_Ec04_10d(:,i)==eXXrateMax_Ec04_10d(i),1))-injStart;
    t_eZZrateMax_Ec04_10d(i) = t(find(eZZrate_Ec04_10d(:,i)==eZZrateMax_Ec04_10d(i),1))-injStart;
    t_eTXrateMax_Ec04_10d(i) = t(find(eTXrate_Ec04_10d(:,i)==eTXrateMax_Ec04_10d(i),1))-injStart;
% parameter 05
    t_eXXrateMax_Ec05_10d(i) = t(find(eXXrate_Ec05_10d(:,i)==eXXrateMax_Ec05_10d(i),1))-injStart;
    t_eZZrateMax_Ec05_10d(i) = t(find(eZZrate_Ec05_10d(:,i)==eZZrateMax_Ec05_10d(i),1))-injStart;
    t_eTXrateMax_Ec05_10d(i) = t(find(eTXrate_Ec05_10d(:,i)==eTXrateMax_Ec05_10d(i),1))-injStart;

% ==================================================================================================== %
% Depth 50%
% ==================================================================================================== %
% parameter 01
    t_eXXrateMax_Ec01_50d(i) = t(find(eXXrate_Ec01_50d(:,i)==eXXrateMax_Ec01_50d(i),1))-injStart;
    t_eZZrateMax_Ec01_50d(i) = t(find(eZZrate_Ec01_50d(:,i)==eZZrateMax_Ec01_50d(i),1))-injStart;
    t_eTXrateMax_Ec01_50d(i) = t(find(eTXrate_Ec01_50d(:,i)==eTXrateMax_Ec01_50d(i),1))-injStart;
% parameter 02
    t_eXXrateMax_Ec02_50d(i) = t(find(eXXrate_Ec02_50d(:,i)==eXXrateMax_Ec02_50d(i),1))-injStart;
    t_eZZrateMax_Ec02_50d(i) = t(find(eZZrate_Ec02_50d(:,i)==eZZrateMax_Ec02_50d(i),1))-injStart;
    t_eTXrateMax_Ec02_50d(i) = t(find(eTXrate_Ec02_50d(:,i)==eTXrateMax_Ec02_50d(i),1))-injStart;
% parameter 03
    t_eXXrateMax_Ec03_50d(i) = t(find(eXXrate_Ec03_50d(:,i)==eXXrateMax_Ec03_50d(i),1))-injStart;
    t_eZZrateMax_Ec03_50d(i) = t(find(eZZrate_Ec03_50d(:,i)==eZZrateMax_Ec03_50d(i),1))-injStart;
    t_eTXrateMax_Ec03_50d(i) = t(find(eTXrate_Ec03_50d(:,i)==eTXrateMax_Ec03_50d(i),1))-injStart;
% parameter 04
    t_eXXrateMax_Ec04_50d(i) = t(find(eXXrate_Ec04_50d(:,i)==eXXrateMax_Ec04_50d(i),1))-injStart;
    t_eZZrateMax_Ec04_50d(i) = t(find(eZZrate_Ec04_50d(:,i)==eZZrateMax_Ec04_50d(i),1))-injStart;
    t_eTXrateMax_Ec04_50d(i) = t(find(eTXrate_Ec04_50d(:,i)==eTXrateMax_Ec04_50d(i),1))-injStart;
% parameter 05
    t_eXXrateMax_Ec05_50d(i) = t(find(eXXrate_Ec05_50d(:,i)==eXXrateMax_Ec05_50d(i),1))-injStart;
    t_eZZrateMax_Ec05_50d(i) = t(find(eZZrate_Ec05_50d(:,i)==eZZrateMax_Ec05_50d(i),1))-injStart;
    t_eTXrateMax_Ec05_50d(i) = t(find(eTXrate_Ec05_50d(:,i)==eTXrateMax_Ec05_50d(i),1))-injStart;
end

%% Times during which Strain Rate > minRate

% ==================================================================================================== %
% Logical array of samples meeting criteria
% ==================================================================================================== %

% parameter 01
eXX_minRateCriteria_Ec01_01d = false(n_tSteps,n_probes);
eZZ_minRateCriteria_Ec01_01d = false(n_tSteps,n_probes);
eXX_minRateCriteria_Ec01_03d = false(n_tSteps,n_probes);
eZZ_minRateCriteria_Ec01_03d = false(n_tSteps,n_probes);
eXX_minRateCriteria_Ec01_05d = false(n_tSteps,n_probes);
eZZ_minRateCriteria_Ec01_05d = false(n_tSteps,n_probes);
eXX_minRateCriteria_Ec01_10d = false(n_tSteps,n_probes);
eZZ_minRateCriteria_Ec01_10d = false(n_tSteps,n_probes);
eXX_minRateCriteria_Ec01_50d = false(n_tSteps,n_probes);
eZZ_minRateCriteria_Ec01_50d = false(n_tSteps,n_probes);
% parameter 02
eXX_minRateCriteria_Ec02_01d = false(n_tSteps,n_probes);
eZZ_minRateCriteria_Ec02_01d = false(n_tSteps,n_probes);
eXX_minRateCriteria_Ec02_03d = false(n_tSteps,n_probes);
eZZ_minRateCriteria_Ec02_03d = false(n_tSteps,n_probes);
eXX_minRateCriteria_Ec02_05d = false(n_tSteps,n_probes);
eZZ_minRateCriteria_Ec02_05d = false(n_tSteps,n_probes);
eXX_minRateCriteria_Ec02_10d = false(n_tSteps,n_probes);
eZZ_minRateCriteria_Ec02_10d = false(n_tSteps,n_probes);
eXX_minRateCriteria_Ec02_50d = false(n_tSteps,n_probes);
eZZ_minRateCriteria_Ec02_50d = false(n_tSteps,n_probes);
% parameter 03
eXX_minRateCriteria_Ec03_01d = false(n_tSteps,n_probes);
eZZ_minRateCriteria_Ec03_01d = false(n_tSteps,n_probes);
eXX_minRateCriteria_Ec03_03d = false(n_tSteps,n_probes);
eZZ_minRateCriteria_Ec03_03d = false(n_tSteps,n_probes);
eXX_minRateCriteria_Ec03_05d = false(n_tSteps,n_probes);
eZZ_minRateCriteria_Ec03_05d = false(n_tSteps,n_probes);
eXX_minRateCriteria_Ec03_10d = false(n_tSteps,n_probes);
eZZ_minRateCriteria_Ec03_10d = false(n_tSteps,n_probes);
eXX_minRateCriteria_Ec03_50d = false(n_tSteps,n_probes);
eZZ_minRateCriteria_Ec03_50d = false(n_tSteps,n_probes);
% parameter 04
eXX_minRateCriteria_Ec04_01d = false(n_tSteps,n_probes);
eZZ_minRateCriteria_Ec04_01d = false(n_tSteps,n_probes);
eXX_minRateCriteria_Ec04_03d = false(n_tSteps,n_probes);
eZZ_minRateCriteria_Ec04_03d = false(n_tSteps,n_probes);
eXX_minRateCriteria_Ec04_05d = false(n_tSteps,n_probes);
eZZ_minRateCriteria_Ec04_05d = false(n_tSteps,n_probes);
eXX_minRateCriteria_Ec04_10d = false(n_tSteps,n_probes);
eZZ_minRateCriteria_Ec04_10d = false(n_tSteps,n_probes);
eXX_minRateCriteria_Ec04_50d = false(n_tSteps,n_probes);
eZZ_minRateCriteria_Ec04_50d = false(n_tSteps,n_probes);
% parameter 05
eXX_minRateCriteria_Ec05_01d = false(n_tSteps,n_probes);
eZZ_minRateCriteria_Ec05_01d = false(n_tSteps,n_probes);
eXX_minRateCriteria_Ec05_03d = false(n_tSteps,n_probes);
eZZ_minRateCriteria_Ec05_03d = false(n_tSteps,n_probes);
eXX_minRateCriteria_Ec05_05d = false(n_tSteps,n_probes);
eZZ_minRateCriteria_Ec05_05d = false(n_tSteps,n_probes);
eXX_minRateCriteria_Ec05_10d = false(n_tSteps,n_probes);
eZZ_minRateCriteria_Ec05_10d = false(n_tSteps,n_probes);
eXX_minRateCriteria_Ec05_50d = false(n_tSteps,n_probes);
eZZ_minRateCriteria_Ec05_50d = false(n_tSteps,n_probes);

for i = 1:n_probes
% ==================================================================================================== %
% Depth 1%
% ==================================================================================================== %
% parameter 01
    eXX_minRateCriteria_Ec01_01d(:,i) = eXXrate_Ec01_01d(:,i)>minRate;
    eZZ_minRateCriteria_Ec01_01d(:,i) = eXXrate_Ec01_01d(:,i)>minRate;
% parameter 02
    eXX_minRateCriteria_Ec02_01d(:,i) = eXXrate_Ec02_01d(:,i)>minRate;
    eZZ_minRateCriteria_Ec02_01d(:,i) = eXXrate_Ec02_01d(:,i)>minRate;
% parameter 03
    eXX_minRateCriteria_Ec03_01d(:,i) = eXXrate_Ec03_01d(:,i)>minRate;
    eZZ_minRateCriteria_Ec03_01d(:,i) = eXXrate_Ec03_01d(:,i)>minRate;
% parameter 04
    eXX_minRateCriteria_Ec04_01d(:,i) = eXXrate_Ec04_01d(:,i)>minRate;
    eZZ_minRateCriteria_Ec04_01d(:,i) = eXXrate_Ec04_01d(:,i)>minRate;
% parameter 05
    eXX_minRateCriteria_Ec05_01d(:,i) = eXXrate_Ec05_01d(:,i)>minRate;
    eZZ_minRateCriteria_Ec05_01d(:,i) = eXXrate_Ec05_01d(:,i)>minRate;
    
% ==================================================================================================== %
% Depth 3%
% ==================================================================================================== %
% parameter 01
    eXX_minRateCriteria_Ec01_03d(:,i) = eXXrate_Ec01_03d(:,i)>minRate;
    eZZ_minRateCriteria_Ec01_03d(:,i) = eXXrate_Ec01_03d(:,i)>minRate;
% parameter 02
    eXX_minRateCriteria_Ec02_03d(:,i) = eXXrate_Ec02_03d(:,i)>minRate;
    eZZ_minRateCriteria_Ec02_03d(:,i) = eXXrate_Ec02_03d(:,i)>minRate;
% parameter 03
    eXX_minRateCriteria_Ec03_03d(:,i) = eXXrate_Ec03_03d(:,i)>minRate;
    eZZ_minRateCriteria_Ec03_03d(:,i) = eXXrate_Ec03_03d(:,i)>minRate;
% parameter 04
    eXX_minRateCriteria_Ec04_03d(:,i) = eXXrate_Ec04_03d(:,i)>minRate;
    eZZ_minRateCriteria_Ec04_03d(:,i) = eXXrate_Ec04_03d(:,i)>minRate;
% parameter 05
    eXX_minRateCriteria_Ec05_03d(:,i) = eXXrate_Ec05_03d(:,i)>minRate;
    eZZ_minRateCriteria_Ec05_03d(:,i) = eXXrate_Ec05_03d(:,i)>minRate;
    
% ==================================================================================================== %
% Depth 5%
% ==================================================================================================== %
% parameter 01
    eXX_minRateCriteria_Ec01_05d(:,i) = eXXrate_Ec01_05d(:,i)>minRate;
    eZZ_minRateCriteria_Ec01_05d(:,i) = eXXrate_Ec01_05d(:,i)>minRate;
% parameter 02
    eXX_minRateCriteria_Ec02_05d(:,i) = eXXrate_Ec02_05d(:,i)>minRate;
    eZZ_minRateCriteria_Ec02_05d(:,i) = eXXrate_Ec02_05d(:,i)>minRate;
% parameter 03
    eXX_minRateCriteria_Ec03_05d(:,i) = eXXrate_Ec03_05d(:,i)>minRate;
    eZZ_minRateCriteria_Ec03_05d(:,i) = eXXrate_Ec03_05d(:,i)>minRate;
% parameter 04
    eXX_minRateCriteria_Ec04_05d(:,i) = eXXrate_Ec04_05d(:,i)>minRate;
    eZZ_minRateCriteria_Ec04_05d(:,i) = eXXrate_Ec04_05d(:,i)>minRate;
% parameter 05
    eXX_minRateCriteria_Ec05_05d(:,i) = eXXrate_Ec05_05d(:,i)>minRate;
    eZZ_minRateCriteria_Ec05_05d(:,i) = eXXrate_Ec05_05d(:,i)>minRate;
    
% ==================================================================================================== %
% Depth 10%
% ==================================================================================================== %
% parameter 01
    eXX_minRateCriteria_Ec01_10d(:,i) = eXXrate_Ec01_10d(:,i)>minRate;
    eZZ_minRateCriteria_Ec01_10d(:,i) = eXXrate_Ec01_10d(:,i)>minRate;
% parameter 02
    eXX_minRateCriteria_Ec02_10d(:,i) = eXXrate_Ec02_10d(:,i)>minRate;
    eZZ_minRateCriteria_Ec02_10d(:,i) = eXXrate_Ec02_10d(:,i)>minRate;
% parameter 03
    eXX_minRateCriteria_Ec03_10d(:,i) = eXXrate_Ec03_10d(:,i)>minRate;
    eZZ_minRateCriteria_Ec03_10d(:,i) = eXXrate_Ec03_10d(:,i)>minRate;
% parameter 04
    eXX_minRateCriteria_Ec04_10d(:,i) = eXXrate_Ec04_10d(:,i)>minRate;
    eZZ_minRateCriteria_Ec04_10d(:,i) = eXXrate_Ec04_10d(:,i)>minRate;
% parameter 05
    eXX_minRateCriteria_Ec05_10d(:,i) = eXXrate_Ec05_10d(:,i)>minRate;
    eZZ_minRateCriteria_Ec05_10d(:,i) = eXXrate_Ec05_10d(:,i)>minRate;
    
% ==================================================================================================== %
% Depth 50%
% ==================================================================================================== %
% parameter 01
    eXX_minRateCriteria_Ec01_50d(:,i) = eXXrate_Ec01_50d(:,i)>minRate;
    eZZ_minRateCriteria_Ec01_50d(:,i) = eXXrate_Ec01_50d(:,i)>minRate;
% parameter 02
    eXX_minRateCriteria_Ec02_50d(:,i) = eXXrate_Ec02_50d(:,i)>minRate;
    eZZ_minRateCriteria_Ec02_50d(:,i) = eXXrate_Ec02_50d(:,i)>minRate;
% parameter 03
    eXX_minRateCriteria_Ec03_50d(:,i) = eXXrate_Ec03_50d(:,i)>minRate;
    eZZ_minRateCriteria_Ec03_50d(:,i) = eXXrate_Ec03_50d(:,i)>minRate;
% parameter 04
    eXX_minRateCriteria_Ec04_50d(:,i) = eXXrate_Ec04_50d(:,i)>minRate;
    eZZ_minRateCriteria_Ec04_50d(:,i) = eXXrate_Ec04_50d(:,i)>minRate;
% parameter 05
    eXX_minRateCriteria_Ec05_50d(:,i) = eXXrate_Ec05_50d(:,i)>minRate;
    eZZ_minRateCriteria_Ec05_50d(:,i) = eXXrate_Ec05_50d(:,i)>minRate;
end

% ==================================================================================================== %
% Times meeting criteria
% ==================================================================================================== %
% parameter 01
t_aboveMinRate_eXX_Ec01_01d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eZZ_Ec01_01d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eXX_Ec01_03d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eZZ_Ec01_03d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eXX_Ec01_05d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eZZ_Ec01_05d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eXX_Ec01_10d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eZZ_Ec01_10d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eXX_Ec01_50d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eZZ_Ec01_50d = zeros(n_tSteps,n_probes);
% parameter 02
t_aboveMinRate_eXX_Ec02_01d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eZZ_Ec02_01d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eXX_Ec02_03d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eZZ_Ec02_03d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eXX_Ec02_05d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eZZ_Ec02_05d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eXX_Ec02_10d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eZZ_Ec02_10d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eXX_Ec02_50d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eZZ_Ec02_50d = zeros(n_tSteps,n_probes);
% parameter 03
t_aboveMinRate_eXX_Ec03_01d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eZZ_Ec03_01d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eXX_Ec03_03d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eZZ_Ec03_03d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eXX_Ec03_05d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eZZ_Ec03_05d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eXX_Ec03_10d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eZZ_Ec03_10d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eXX_Ec03_50d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eZZ_Ec03_50d = zeros(n_tSteps,n_probes);
% parameter 04
t_aboveMinRate_eXX_Ec04_01d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eZZ_Ec04_01d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eXX_Ec04_03d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eZZ_Ec04_03d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eXX_Ec04_05d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eZZ_Ec04_05d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eXX_Ec04_10d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eZZ_Ec04_10d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eXX_Ec04_50d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eZZ_Ec04_50d = zeros(n_tSteps,n_probes);
% parameter 05
t_aboveMinRate_eXX_Ec05_01d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eZZ_Ec05_01d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eXX_Ec05_03d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eZZ_Ec05_03d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eXX_Ec05_05d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eZZ_Ec05_05d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eXX_Ec05_10d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eZZ_Ec05_10d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eXX_Ec05_50d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eZZ_Ec05_50d = zeros(n_tSteps,n_probes);

for i = 1:n_probes
% ==================================================================================================== %
% Depth 1%
% ==================================================================================================== %
% parameter 01
    if sum(eXX_minRateCriteria_Ec01_01d(:,i)) > 0
        t_aboveMinRate_eXX_Ec01_01d(eXX_minRateCriteria_Ec01_01d(:,i),i) = t(eXX_minRateCriteria_Ec01_01d(:,i));
    end
    if sum(eZZ_minRateCriteria_Ec01_01d(:,i)) > 0
        t_aboveMinRate_eZZ_Ec01_01d(eZZ_minRateCriteria_Ec01_01d(:,i),i) = t(eZZ_minRateCriteria_Ec01_01d(:,i));
    end
% parameter 02
    if sum(eXX_minRateCriteria_Ec02_01d(:,i)) > 0
        t_aboveMinRate_eXX_Ec02_01d(eXX_minRateCriteria_Ec02_01d(:,i),i) = t(eXX_minRateCriteria_Ec02_01d(:,i));
    end
    if sum(eZZ_minRateCriteria_Ec02_01d(:,i)) > 0
        t_aboveMinRate_eZZ_Ec02_01d(eZZ_minRateCriteria_Ec02_01d(:,i),i) = t(eZZ_minRateCriteria_Ec02_01d(:,i));
    end
% parameter 03
    if sum(eXX_minRateCriteria_Ec03_01d(:,i)) > 0
        t_aboveMinRate_eXX_Ec03_01d(eXX_minRateCriteria_Ec03_01d(:,i),i) = t(eXX_minRateCriteria_Ec03_01d(:,i));
    end
    if sum(eZZ_minRateCriteria_Ec03_01d(:,i)) > 0
        t_aboveMinRate_eZZ_Ec03_01d(eZZ_minRateCriteria_Ec03_01d(:,i),i) = t(eZZ_minRateCriteria_Ec03_01d(:,i));
    end
% parameter 04
    if sum(eXX_minRateCriteria_Ec04_01d(:,i)) > 0
        t_aboveMinRate_eXX_Ec04_01d(eXX_minRateCriteria_Ec04_01d(:,i),i) = t(eXX_minRateCriteria_Ec04_01d(:,i));
    end
    if sum(eZZ_minRateCriteria_Ec04_01d(:,i)) > 0
        t_aboveMinRate_eZZ_Ec04_01d(eZZ_minRateCriteria_Ec04_01d(:,i),i) = t(eZZ_minRateCriteria_Ec04_01d(:,i));
    end
% parameter 05
    if sum(eXX_minRateCriteria_Ec05_01d(:,i)) > 0
        t_aboveMinRate_eXX_Ec05_01d(eXX_minRateCriteria_Ec05_01d(:,i),i) = t(eXX_minRateCriteria_Ec05_01d(:,i));
    end
    if sum(eZZ_minRateCriteria_Ec05_01d(:,i)) > 0
        t_aboveMinRate_eZZ_Ec05_01d(eZZ_minRateCriteria_Ec05_01d(:,i),i) = t(eZZ_minRateCriteria_Ec05_01d(:,i));
    end

% ==================================================================================================== %
% Depth 3%
% ==================================================================================================== %
% parameter 01
    if sum(eXX_minRateCriteria_Ec01_03d(:,i)) > 0
        t_aboveMinRate_eXX_Ec01_03d(eXX_minRateCriteria_Ec01_03d(:,i),i) = t(eXX_minRateCriteria_Ec01_03d(:,i));
    end
    if sum(eZZ_minRateCriteria_Ec01_03d(:,i)) > 0
        t_aboveMinRate_eZZ_Ec01_03d(eZZ_minRateCriteria_Ec01_03d(:,i),i) = t(eZZ_minRateCriteria_Ec01_03d(:,i));
    end
% parameter 02
    if sum(eXX_minRateCriteria_Ec02_03d(:,i)) > 0
        t_aboveMinRate_eXX_Ec02_03d(eXX_minRateCriteria_Ec02_03d(:,i),i) = t(eXX_minRateCriteria_Ec02_03d(:,i));
    end
    if sum(eZZ_minRateCriteria_Ec02_03d(:,i)) > 0
        t_aboveMinRate_eZZ_Ec02_03d(eZZ_minRateCriteria_Ec02_03d(:,i),i) = t(eZZ_minRateCriteria_Ec02_03d(:,i));
    end
% parameter 03
    if sum(eXX_minRateCriteria_Ec03_03d(:,i)) > 0
        t_aboveMinRate_eXX_Ec03_03d(eXX_minRateCriteria_Ec03_03d(:,i),i) = t(eXX_minRateCriteria_Ec03_03d(:,i));
    end
    if sum(eZZ_minRateCriteria_Ec03_03d(:,i)) > 0
        t_aboveMinRate_eZZ_Ec03_03d(eZZ_minRateCriteria_Ec03_03d(:,i),i) = t(eZZ_minRateCriteria_Ec03_03d(:,i));
    end
% parameter 04
    if sum(eXX_minRateCriteria_Ec04_03d(:,i)) > 0
        t_aboveMinRate_eXX_Ec04_03d(eXX_minRateCriteria_Ec04_03d(:,i),i) = t(eXX_minRateCriteria_Ec04_03d(:,i));
    end
    if sum(eZZ_minRateCriteria_Ec04_03d(:,i)) > 0
        t_aboveMinRate_eZZ_Ec04_03d(eZZ_minRateCriteria_Ec04_03d(:,i),i) = t(eZZ_minRateCriteria_Ec04_03d(:,i));
    end
% parameter 05
    if sum(eXX_minRateCriteria_Ec05_03d(:,i)) > 0
        t_aboveMinRate_eXX_Ec05_03d(eXX_minRateCriteria_Ec05_03d(:,i),i) = t(eXX_minRateCriteria_Ec05_03d(:,i));
    end
    if sum(eZZ_minRateCriteria_Ec05_03d(:,i)) > 0
        t_aboveMinRate_eZZ_Ec05_03d(eZZ_minRateCriteria_Ec05_03d(:,i),i) = t(eZZ_minRateCriteria_Ec05_03d(:,i));
    end
    
% ==================================================================================================== %
% Depth 5%
% ==================================================================================================== %
% parameter 01
    if sum(eXX_minRateCriteria_Ec01_05d(:,i)) > 0
        t_aboveMinRate_eXX_Ec01_05d(eXX_minRateCriteria_Ec01_05d(:,i),i) = t(eXX_minRateCriteria_Ec01_05d(:,i));
    end
    if sum(eZZ_minRateCriteria_Ec01_05d(:,i)) > 0
        t_aboveMinRate_eZZ_Ec01_05d(eZZ_minRateCriteria_Ec01_05d(:,i),i) = t(eZZ_minRateCriteria_Ec01_05d(:,i));
    end
% parameter 02
    if sum(eXX_minRateCriteria_Ec02_05d(:,i)) > 0
        t_aboveMinRate_eXX_Ec02_05d(eXX_minRateCriteria_Ec02_05d(:,i),i) = t(eXX_minRateCriteria_Ec02_05d(:,i));
    end
    if sum(eZZ_minRateCriteria_Ec02_05d(:,i)) > 0
        t_aboveMinRate_eZZ_Ec02_05d(eZZ_minRateCriteria_Ec02_05d(:,i),i) = t(eZZ_minRateCriteria_Ec02_05d(:,i));
    end
% parameter 03
    if sum(eXX_minRateCriteria_Ec03_05d(:,i)) > 0
        t_aboveMinRate_eXX_Ec03_05d(eXX_minRateCriteria_Ec03_05d(:,i),i) = t(eXX_minRateCriteria_Ec03_05d(:,i));
    end
    if sum(eZZ_minRateCriteria_Ec03_05d(:,i)) > 0
        t_aboveMinRate_eZZ_Ec03_05d(eZZ_minRateCriteria_Ec03_05d(:,i),i) = t(eZZ_minRateCriteria_Ec03_05d(:,i));
    end
% parameter 04
    if sum(eXX_minRateCriteria_Ec04_05d(:,i)) > 0
        t_aboveMinRate_eXX_Ec04_05d(eXX_minRateCriteria_Ec04_05d(:,i),i) = t(eXX_minRateCriteria_Ec04_05d(:,i));
    end
    if sum(eZZ_minRateCriteria_Ec04_05d(:,i)) > 0
        t_aboveMinRate_eZZ_Ec04_05d(eZZ_minRateCriteria_Ec04_05d(:,i),i) = t(eZZ_minRateCriteria_Ec04_05d(:,i));
    end
% parameter 05
    if sum(eXX_minRateCriteria_Ec05_05d(:,i)) > 0
        t_aboveMinRate_eXX_Ec05_05d(eXX_minRateCriteria_Ec05_05d(:,i),i) = t(eXX_minRateCriteria_Ec05_05d(:,i));
    end
    if sum(eZZ_minRateCriteria_Ec05_05d(:,i)) > 0
        t_aboveMinRate_eZZ_Ec05_05d(eZZ_minRateCriteria_Ec05_05d(:,i),i) = t(eZZ_minRateCriteria_Ec05_05d(:,i));
    end

% ==================================================================================================== %
% Depth 10%
% ==================================================================================================== %
% parameter 01
    if sum(eXX_minRateCriteria_Ec01_10d(:,i)) > 0
        t_aboveMinRate_eXX_Ec01_10d(eXX_minRateCriteria_Ec01_10d(:,i),i) = t(eXX_minRateCriteria_Ec01_10d(:,i));
    end
    if sum(eZZ_minRateCriteria_Ec01_10d(:,i)) > 0
        t_aboveMinRate_eZZ_Ec01_10d(eZZ_minRateCriteria_Ec01_10d(:,i),i) = t(eZZ_minRateCriteria_Ec01_10d(:,i));
    end
% parameter 02
    if sum(eXX_minRateCriteria_Ec02_10d(:,i)) > 0
        t_aboveMinRate_eXX_Ec02_10d(eXX_minRateCriteria_Ec02_10d(:,i),i) = t(eXX_minRateCriteria_Ec02_10d(:,i));
    end
    if sum(eZZ_minRateCriteria_Ec02_10d(:,i)) > 0
        t_aboveMinRate_eZZ_Ec02_10d(eZZ_minRateCriteria_Ec02_10d(:,i),i) = t(eZZ_minRateCriteria_Ec02_10d(:,i));
    end
% parameter 03
    if sum(eXX_minRateCriteria_Ec03_10d(:,i)) > 0
        t_aboveMinRate_eXX_Ec03_10d(eXX_minRateCriteria_Ec03_10d(:,i),i) = t(eXX_minRateCriteria_Ec03_10d(:,i));
    end
    if sum(eZZ_minRateCriteria_Ec03_10d(:,i)) > 0
        t_aboveMinRate_eZZ_Ec03_10d(eZZ_minRateCriteria_Ec03_10d(:,i),i) = t(eZZ_minRateCriteria_Ec03_10d(:,i));
    end
% parameter 04
    if sum(eXX_minRateCriteria_Ec04_10d(:,i)) > 0
        t_aboveMinRate_eXX_Ec04_10d(eXX_minRateCriteria_Ec04_10d(:,i),i) = t(eXX_minRateCriteria_Ec04_10d(:,i));
    end
    if sum(eZZ_minRateCriteria_Ec04_10d(:,i)) > 0
        t_aboveMinRate_eZZ_Ec04_10d(eZZ_minRateCriteria_Ec04_10d(:,i),i) = t(eZZ_minRateCriteria_Ec04_10d(:,i));
    end
% parameter 05
    if sum(eXX_minRateCriteria_Ec05_10d(:,i)) > 0
        t_aboveMinRate_eXX_Ec05_10d(eXX_minRateCriteria_Ec05_10d(:,i),i) = t(eXX_minRateCriteria_Ec05_10d(:,i));
    end
    if sum(eZZ_minRateCriteria_Ec05_10d(:,i)) > 0
        t_aboveMinRate_eZZ_Ec05_10d(eZZ_minRateCriteria_Ec05_10d(:,i),i) = t(eZZ_minRateCriteria_Ec05_10d(:,i));
    end

% ==================================================================================================== %
% Depth 50%
% ==================================================================================================== %
% parameter 01
    if sum(eXX_minRateCriteria_Ec01_50d(:,i)) > 0
        t_aboveMinRate_eXX_Ec01_50d(eXX_minRateCriteria_Ec01_50d(:,i),i) = t(eXX_minRateCriteria_Ec01_50d(:,i));
    end
    if sum(eZZ_minRateCriteria_Ec01_50d(:,i)) > 0
        t_aboveMinRate_eZZ_Ec01_50d(eZZ_minRateCriteria_Ec01_50d(:,i),i) = t(eZZ_minRateCriteria_Ec01_50d(:,i));
    end
% parameter 02
    if sum(eXX_minRateCriteria_Ec02_50d(:,i)) > 0
        t_aboveMinRate_eXX_Ec02_50d(eXX_minRateCriteria_Ec02_50d(:,i),i) = t(eXX_minRateCriteria_Ec02_50d(:,i));
    end
    if sum(eZZ_minRateCriteria_Ec02_50d(:,i)) > 0
        t_aboveMinRate_eZZ_Ec02_50d(eZZ_minRateCriteria_Ec02_50d(:,i),i) = t(eZZ_minRateCriteria_Ec02_50d(:,i));
    end
% parameter 03
    if sum(eXX_minRateCriteria_Ec03_50d(:,i)) > 0
        t_aboveMinRate_eXX_Ec03_50d(eXX_minRateCriteria_Ec03_50d(:,i),i) = t(eXX_minRateCriteria_Ec03_50d(:,i));
    end
    if sum(eZZ_minRateCriteria_Ec03_50d(:,i)) > 0
        t_aboveMinRate_eZZ_Ec03_50d(eZZ_minRateCriteria_Ec03_50d(:,i),i) = t(eZZ_minRateCriteria_Ec03_50d(:,i));
    end
% parameter 04
    if sum(eXX_minRateCriteria_Ec04_50d(:,i)) > 0
        t_aboveMinRate_eXX_Ec04_50d(eXX_minRateCriteria_Ec04_50d(:,i),i) = t(eXX_minRateCriteria_Ec04_50d(:,i));
    end
    if sum(eZZ_minRateCriteria_Ec04_50d(:,i)) > 0
        t_aboveMinRate_eZZ_Ec04_50d(eZZ_minRateCriteria_Ec04_50d(:,i),i) = t(eZZ_minRateCriteria_Ec04_50d(:,i));
    end
% parameter 05
    if sum(eXX_minRateCriteria_Ec05_50d(:,i)) > 0
        t_aboveMinRate_eXX_Ec05_50d(eXX_minRateCriteria_Ec05_50d(:,i),i) = t(eXX_minRateCriteria_Ec05_50d(:,i));
    end
    if sum(eZZ_minRateCriteria_Ec05_50d(:,i)) > 0
        t_aboveMinRate_eZZ_Ec05_50d(eZZ_minRateCriteria_Ec05_50d(:,i),i) = t(eZZ_minRateCriteria_Ec05_50d(:,i));
    end
end

%% Duration during which strain rate > minRate

% parameter 01
tFirst_aboveMinRate_eXX_Ec01_01d = zeros(1,n_probes);
tLast_aboveMinRate_eXX_Ec01_01d  = zeros(1,n_probes);
tFirst_aboveMinRate_eZZ_Ec01_01d = zeros(1,n_probes);
tLast_aboveMinRate_eZZ_Ec01_01d  = zeros(1,n_probes);
tFirst_aboveMinRate_eXX_Ec01_03d = zeros(1,n_probes);
tLast_aboveMinRate_eXX_Ec01_03d  = zeros(1,n_probes);
tFirst_aboveMinRate_eZZ_Ec01_03d = zeros(1,n_probes);
tLast_aboveMinRate_eZZ_Ec01_03d  = zeros(1,n_probes);
tFirst_aboveMinRate_eXX_Ec01_05d = zeros(1,n_probes);
tLast_aboveMinRate_eXX_Ec01_05d  = zeros(1,n_probes);
tFirst_aboveMinRate_eZZ_Ec01_05d = zeros(1,n_probes);
tLast_aboveMinRate_eZZ_Ec01_05d  = zeros(1,n_probes);
tFirst_aboveMinRate_eXX_Ec01_10d = zeros(1,n_probes);
tLast_aboveMinRate_eXX_Ec01_10d  = zeros(1,n_probes);
tFirst_aboveMinRate_eZZ_Ec01_10d = zeros(1,n_probes);
tLast_aboveMinRate_eZZ_Ec01_10d  = zeros(1,n_probes);
tFirst_aboveMinRate_eXX_Ec01_50d = zeros(1,n_probes);
tLast_aboveMinRate_eXX_Ec01_50d  = zeros(1,n_probes);
tFirst_aboveMinRate_eZZ_Ec01_50d = zeros(1,n_probes);
tLast_aboveMinRate_eZZ_Ec01_50d  = zeros(1,n_probes);
% parameter 02
tFirst_aboveMinRate_eXX_Ec02_01d = zeros(1,n_probes);
tLast_aboveMinRate_eXX_Ec02_01d  = zeros(1,n_probes);
tFirst_aboveMinRate_eZZ_Ec02_01d = zeros(1,n_probes);
tLast_aboveMinRate_eZZ_Ec02_01d  = zeros(1,n_probes);
tFirst_aboveMinRate_eXX_Ec02_03d = zeros(1,n_probes);
tLast_aboveMinRate_eXX_Ec02_03d  = zeros(1,n_probes);
tFirst_aboveMinRate_eZZ_Ec02_03d = zeros(1,n_probes);
tLast_aboveMinRate_eZZ_Ec02_03d  = zeros(1,n_probes);
tFirst_aboveMinRate_eXX_Ec02_05d = zeros(1,n_probes);
tLast_aboveMinRate_eXX_Ec02_05d  = zeros(1,n_probes);
tFirst_aboveMinRate_eZZ_Ec02_05d = zeros(1,n_probes);
tLast_aboveMinRate_eZZ_Ec02_05d  = zeros(1,n_probes);
tFirst_aboveMinRate_eXX_Ec02_10d = zeros(1,n_probes);
tLast_aboveMinRate_eXX_Ec02_10d  = zeros(1,n_probes);
tFirst_aboveMinRate_eZZ_Ec02_10d = zeros(1,n_probes);
tLast_aboveMinRate_eZZ_Ec02_10d  = zeros(1,n_probes);
tFirst_aboveMinRate_eXX_Ec02_50d = zeros(1,n_probes);
tLast_aboveMinRate_eXX_Ec02_50d  = zeros(1,n_probes);
tFirst_aboveMinRate_eZZ_Ec02_50d = zeros(1,n_probes);
tLast_aboveMinRate_eZZ_Ec02_50d  = zeros(1,n_probes);
% parameter 03
tFirst_aboveMinRate_eXX_Ec03_01d = zeros(1,n_probes);
tLast_aboveMinRate_eXX_Ec03_01d  = zeros(1,n_probes);
tFirst_aboveMinRate_eZZ_Ec03_01d = zeros(1,n_probes);
tLast_aboveMinRate_eZZ_Ec03_01d  = zeros(1,n_probes);
tFirst_aboveMinRate_eXX_Ec03_03d = zeros(1,n_probes);
tLast_aboveMinRate_eXX_Ec03_03d  = zeros(1,n_probes);
tFirst_aboveMinRate_eZZ_Ec03_03d = zeros(1,n_probes);
tLast_aboveMinRate_eZZ_Ec03_03d  = zeros(1,n_probes);
tFirst_aboveMinRate_eXX_Ec03_05d = zeros(1,n_probes);
tLast_aboveMinRate_eXX_Ec03_05d  = zeros(1,n_probes);
tFirst_aboveMinRate_eZZ_Ec03_05d = zeros(1,n_probes);
tLast_aboveMinRate_eZZ_Ec03_05d  = zeros(1,n_probes);
tFirst_aboveMinRate_eXX_Ec03_10d = zeros(1,n_probes);
tLast_aboveMinRate_eXX_Ec03_10d  = zeros(1,n_probes);
tFirst_aboveMinRate_eZZ_Ec03_10d = zeros(1,n_probes);
tLast_aboveMinRate_eZZ_Ec03_10d  = zeros(1,n_probes);
tFirst_aboveMinRate_eXX_Ec03_50d = zeros(1,n_probes);
tLast_aboveMinRate_eXX_Ec03_50d  = zeros(1,n_probes);
tFirst_aboveMinRate_eZZ_Ec03_50d = zeros(1,n_probes);
tLast_aboveMinRate_eZZ_Ec03_50d  = zeros(1,n_probes);
% parameter 04
tFirst_aboveMinRate_eXX_Ec04_01d = zeros(1,n_probes);
tLast_aboveMinRate_eXX_Ec04_01d  = zeros(1,n_probes);
tFirst_aboveMinRate_eZZ_Ec04_01d = zeros(1,n_probes);
tLast_aboveMinRate_eZZ_Ec04_01d  = zeros(1,n_probes);
tFirst_aboveMinRate_eXX_Ec04_03d = zeros(1,n_probes);
tLast_aboveMinRate_eXX_Ec04_03d  = zeros(1,n_probes);
tFirst_aboveMinRate_eZZ_Ec04_03d = zeros(1,n_probes);
tLast_aboveMinRate_eZZ_Ec04_03d  = zeros(1,n_probes);
tFirst_aboveMinRate_eXX_Ec04_05d = zeros(1,n_probes);
tLast_aboveMinRate_eXX_Ec04_05d  = zeros(1,n_probes);
tFirst_aboveMinRate_eZZ_Ec04_05d = zeros(1,n_probes);
tLast_aboveMinRate_eZZ_Ec04_05d  = zeros(1,n_probes);
tFirst_aboveMinRate_eXX_Ec04_10d = zeros(1,n_probes);
tLast_aboveMinRate_eXX_Ec04_10d  = zeros(1,n_probes);
tFirst_aboveMinRate_eZZ_Ec04_10d = zeros(1,n_probes);
tLast_aboveMinRate_eZZ_Ec04_10d  = zeros(1,n_probes);
tFirst_aboveMinRate_eXX_Ec04_50d = zeros(1,n_probes);
tLast_aboveMinRate_eXX_Ec04_50d  = zeros(1,n_probes);
tFirst_aboveMinRate_eZZ_Ec04_50d = zeros(1,n_probes);
tLast_aboveMinRate_eZZ_Ec04_50d  = zeros(1,n_probes);
% parameter 05
tFirst_aboveMinRate_eXX_Ec05_01d = zeros(1,n_probes);
tLast_aboveMinRate_eXX_Ec05_01d  = zeros(1,n_probes);
tFirst_aboveMinRate_eZZ_Ec05_01d = zeros(1,n_probes);
tLast_aboveMinRate_eZZ_Ec05_01d  = zeros(1,n_probes);
tFirst_aboveMinRate_eXX_Ec05_03d = zeros(1,n_probes);
tLast_aboveMinRate_eXX_Ec05_03d  = zeros(1,n_probes);
tFirst_aboveMinRate_eZZ_Ec05_03d = zeros(1,n_probes);
tLast_aboveMinRate_eZZ_Ec05_03d  = zeros(1,n_probes);
tFirst_aboveMinRate_eXX_Ec05_05d = zeros(1,n_probes);
tLast_aboveMinRate_eXX_Ec05_05d  = zeros(1,n_probes);
tFirst_aboveMinRate_eZZ_Ec05_05d = zeros(1,n_probes);
tLast_aboveMinRate_eZZ_Ec05_05d  = zeros(1,n_probes);
tFirst_aboveMinRate_eXX_Ec05_10d = zeros(1,n_probes);
tLast_aboveMinRate_eXX_Ec05_10d  = zeros(1,n_probes);
tFirst_aboveMinRate_eZZ_Ec05_10d = zeros(1,n_probes);
tLast_aboveMinRate_eZZ_Ec05_10d  = zeros(1,n_probes);
tFirst_aboveMinRate_eXX_Ec05_50d = zeros(1,n_probes);
tLast_aboveMinRate_eXX_Ec05_50d  = zeros(1,n_probes);
tFirst_aboveMinRate_eZZ_Ec05_50d = zeros(1,n_probes);
tLast_aboveMinRate_eZZ_Ec05_50d  = zeros(1,n_probes);

% ==================================================================================================== %
% First time at which eXXrate > minRate (last non-zero value)
% ==================================================================================================== %
for i = 1:n_probes
% ==================================================================================================== %
% Depth 1%
% ==================================================================================================== %
% parameter 01
    if sum(t_aboveMinRate_eXX_Ec01_01d(:,i)) > 0
        tFirst_aboveMinRate_eXX_Ec01_01d(i) = t_aboveMinRate_eXX_Ec01_01d(find(t_aboveMinRate_eXX_Ec01_01d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_Ec01_01d(i)  = t_aboveMinRate_eXX_Ec01_01d(find(t_aboveMinRate_eXX_Ec01_01d(:,i),1,'last'));
    end
    if sum(t_aboveMinRate_eZZ_Ec01_01d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_Ec01_01d(i) = t_aboveMinRate_eZZ_Ec01_01d(find(t_aboveMinRate_eZZ_Ec01_01d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_Ec01_01d(i)  = t_aboveMinRate_eZZ_Ec01_01d(find(t_aboveMinRate_eZZ_Ec01_01d(:,i),1,'last'));
    end
% parameter 02
    if sum(t_aboveMinRate_eXX_Ec02_01d(:,i)) > 0
        tFirst_aboveMinRate_eXX_Ec02_01d(i) = t_aboveMinRate_eXX_Ec02_01d(find(t_aboveMinRate_eXX_Ec02_01d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_Ec02_01d(i)  = t_aboveMinRate_eXX_Ec02_01d(find(t_aboveMinRate_eXX_Ec02_01d(:,i),1,'last'));
    end
    if sum(t_aboveMinRate_eZZ_Ec02_01d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_Ec02_01d(i) = t_aboveMinRate_eZZ_Ec02_01d(find(t_aboveMinRate_eZZ_Ec02_01d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_Ec02_01d(i)  = t_aboveMinRate_eZZ_Ec02_01d(find(t_aboveMinRate_eZZ_Ec02_01d(:,i),1,'last'));
    end
% parameter 03
    if sum(t_aboveMinRate_eXX_Ec03_01d(:,i)) > 0
        tFirst_aboveMinRate_eXX_Ec03_01d(i) = t_aboveMinRate_eXX_Ec03_01d(find(t_aboveMinRate_eXX_Ec03_01d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_Ec03_01d(i)  = t_aboveMinRate_eXX_Ec03_01d(find(t_aboveMinRate_eXX_Ec03_01d(:,i),1,'last'));
    end
    if sum(t_aboveMinRate_eZZ_Ec03_01d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_Ec03_01d(i) = t_aboveMinRate_eZZ_Ec03_01d(find(t_aboveMinRate_eZZ_Ec03_01d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_Ec03_01d(i)  = t_aboveMinRate_eZZ_Ec03_01d(find(t_aboveMinRate_eZZ_Ec03_01d(:,i),1,'last'));
    end
% parameter 04
    if sum(t_aboveMinRate_eXX_Ec04_01d(:,i)) > 0
        tFirst_aboveMinRate_eXX_Ec04_01d(i) = t_aboveMinRate_eXX_Ec04_01d(find(t_aboveMinRate_eXX_Ec04_01d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_Ec04_01d(i)  = t_aboveMinRate_eXX_Ec04_01d(find(t_aboveMinRate_eXX_Ec04_01d(:,i),1,'last'));
    end
    if sum(t_aboveMinRate_eZZ_Ec04_01d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_Ec04_01d(i) = t_aboveMinRate_eZZ_Ec04_01d(find(t_aboveMinRate_eZZ_Ec04_01d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_Ec04_01d(i)  = t_aboveMinRate_eZZ_Ec04_01d(find(t_aboveMinRate_eZZ_Ec04_01d(:,i),1,'last'));
    end
% parameter 05
    if sum(t_aboveMinRate_eXX_Ec05_01d(:,i)) > 0
        tFirst_aboveMinRate_eXX_Ec05_01d(i) = t_aboveMinRate_eXX_Ec05_01d(find(t_aboveMinRate_eXX_Ec05_01d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_Ec05_01d(i)  = t_aboveMinRate_eXX_Ec05_01d(find(t_aboveMinRate_eXX_Ec05_01d(:,i),1,'last'));
    end
    if sum(t_aboveMinRate_eZZ_Ec05_01d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_Ec05_01d(i) = t_aboveMinRate_eZZ_Ec05_01d(find(t_aboveMinRate_eZZ_Ec05_01d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_Ec05_01d(i)  = t_aboveMinRate_eZZ_Ec05_01d(find(t_aboveMinRate_eZZ_Ec05_01d(:,i),1,'last'));
    end
    
% ==================================================================================================== %
% Depth 3%
% ==================================================================================================== %
% parameter 01
    if sum(t_aboveMinRate_eXX_Ec01_03d(:,i)) > 0
        tFirst_aboveMinRate_eXX_Ec01_03d(i) = t_aboveMinRate_eXX_Ec01_03d(find(t_aboveMinRate_eXX_Ec01_03d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_Ec01_03d(i)  = t_aboveMinRate_eXX_Ec01_03d(find(t_aboveMinRate_eXX_Ec01_03d(:,i),1,'last'));
    end
    if sum(t_aboveMinRate_eZZ_Ec01_03d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_Ec01_03d(i) = t_aboveMinRate_eZZ_Ec01_03d(find(t_aboveMinRate_eZZ_Ec01_03d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_Ec01_03d(i)  = t_aboveMinRate_eZZ_Ec01_03d(find(t_aboveMinRate_eZZ_Ec01_03d(:,i),1,'last'));
    end
% parameter 02
    if sum(t_aboveMinRate_eXX_Ec02_03d(:,i)) > 0
        tFirst_aboveMinRate_eXX_Ec02_03d(i) = t_aboveMinRate_eXX_Ec02_03d(find(t_aboveMinRate_eXX_Ec02_03d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_Ec02_03d(i)  = t_aboveMinRate_eXX_Ec02_03d(find(t_aboveMinRate_eXX_Ec02_03d(:,i),1,'last'));
    end
    if sum(t_aboveMinRate_eZZ_Ec02_03d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_Ec02_03d(i) = t_aboveMinRate_eZZ_Ec02_03d(find(t_aboveMinRate_eZZ_Ec02_03d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_Ec02_03d(i)  = t_aboveMinRate_eZZ_Ec02_03d(find(t_aboveMinRate_eZZ_Ec02_03d(:,i),1,'last'));
    end
% parameter 03
    if sum(t_aboveMinRate_eXX_Ec03_03d(:,i)) > 0
        tFirst_aboveMinRate_eXX_Ec03_03d(i) = t_aboveMinRate_eXX_Ec03_03d(find(t_aboveMinRate_eXX_Ec03_03d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_Ec03_03d(i)  = t_aboveMinRate_eXX_Ec03_03d(find(t_aboveMinRate_eXX_Ec03_03d(:,i),1,'last'));
    end
    if sum(t_aboveMinRate_eZZ_Ec03_03d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_Ec03_03d(i) = t_aboveMinRate_eZZ_Ec03_03d(find(t_aboveMinRate_eZZ_Ec03_03d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_Ec03_03d(i)  = t_aboveMinRate_eZZ_Ec03_03d(find(t_aboveMinRate_eZZ_Ec03_03d(:,i),1,'last'));
    end
% parameter 04
    if sum(t_aboveMinRate_eXX_Ec04_03d(:,i)) > 0
        tFirst_aboveMinRate_eXX_Ec04_03d(i) = t_aboveMinRate_eXX_Ec04_03d(find(t_aboveMinRate_eXX_Ec04_03d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_Ec04_03d(i)  = t_aboveMinRate_eXX_Ec04_03d(find(t_aboveMinRate_eXX_Ec04_03d(:,i),1,'last'));
    end
    if sum(t_aboveMinRate_eZZ_Ec04_03d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_Ec04_03d(i) = t_aboveMinRate_eZZ_Ec04_03d(find(t_aboveMinRate_eZZ_Ec04_03d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_Ec04_03d(i)  = t_aboveMinRate_eZZ_Ec04_03d(find(t_aboveMinRate_eZZ_Ec04_03d(:,i),1,'last'));
    end
% parameter 05
    if sum(t_aboveMinRate_eXX_Ec05_03d(:,i)) > 0
        tFirst_aboveMinRate_eXX_Ec05_03d(i) = t_aboveMinRate_eXX_Ec05_03d(find(t_aboveMinRate_eXX_Ec05_03d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_Ec05_03d(i)  = t_aboveMinRate_eXX_Ec05_03d(find(t_aboveMinRate_eXX_Ec05_03d(:,i),1,'last'));
    end
    if sum(t_aboveMinRate_eZZ_Ec05_03d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_Ec05_03d(i) = t_aboveMinRate_eZZ_Ec05_03d(find(t_aboveMinRate_eZZ_Ec05_03d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_Ec05_03d(i)  = t_aboveMinRate_eZZ_Ec05_03d(find(t_aboveMinRate_eZZ_Ec05_03d(:,i),1,'last'));
    end
    
% ==================================================================================================== %
% Depth 5%
% ==================================================================================================== %
% parameter 01
    if sum(t_aboveMinRate_eXX_Ec01_05d(:,i)) > 0
        tFirst_aboveMinRate_eXX_Ec01_05d(i) = t_aboveMinRate_eXX_Ec01_05d(find(t_aboveMinRate_eXX_Ec01_05d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_Ec01_05d(i)  = t_aboveMinRate_eXX_Ec01_05d(find(t_aboveMinRate_eXX_Ec01_05d(:,i),1,'last'));
    end
    if sum(t_aboveMinRate_eZZ_Ec01_05d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_Ec01_05d(i) = t_aboveMinRate_eZZ_Ec01_05d(find(t_aboveMinRate_eZZ_Ec01_05d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_Ec01_05d(i)  = t_aboveMinRate_eZZ_Ec01_05d(find(t_aboveMinRate_eZZ_Ec01_05d(:,i),1,'last'));
    end
% parameter 02
    if sum(t_aboveMinRate_eXX_Ec02_05d(:,i)) > 0
        tFirst_aboveMinRate_eXX_Ec02_05d(i) = t_aboveMinRate_eXX_Ec02_05d(find(t_aboveMinRate_eXX_Ec02_05d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_Ec02_05d(i)  = t_aboveMinRate_eXX_Ec02_05d(find(t_aboveMinRate_eXX_Ec02_05d(:,i),1,'last'));
    end
    if sum(t_aboveMinRate_eZZ_Ec02_05d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_Ec02_05d(i) = t_aboveMinRate_eZZ_Ec02_05d(find(t_aboveMinRate_eZZ_Ec02_05d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_Ec02_05d(i)  = t_aboveMinRate_eZZ_Ec02_05d(find(t_aboveMinRate_eZZ_Ec02_05d(:,i),1,'last'));
    end
% parameter 03
    if sum(t_aboveMinRate_eXX_Ec03_05d(:,i)) > 0
        tFirst_aboveMinRate_eXX_Ec03_05d(i) = t_aboveMinRate_eXX_Ec03_05d(find(t_aboveMinRate_eXX_Ec03_05d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_Ec03_05d(i)  = t_aboveMinRate_eXX_Ec03_05d(find(t_aboveMinRate_eXX_Ec03_05d(:,i),1,'last'));
    end
    if sum(t_aboveMinRate_eZZ_Ec03_05d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_Ec03_05d(i) = t_aboveMinRate_eZZ_Ec03_05d(find(t_aboveMinRate_eZZ_Ec03_05d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_Ec03_05d(i)  = t_aboveMinRate_eZZ_Ec03_05d(find(t_aboveMinRate_eZZ_Ec03_05d(:,i),1,'last'));
    end
% parameter 04
    if sum(t_aboveMinRate_eXX_Ec04_05d(:,i)) > 0
        tFirst_aboveMinRate_eXX_Ec04_05d(i) = t_aboveMinRate_eXX_Ec04_05d(find(t_aboveMinRate_eXX_Ec04_05d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_Ec04_05d(i)  = t_aboveMinRate_eXX_Ec04_05d(find(t_aboveMinRate_eXX_Ec04_05d(:,i),1,'last'));
    end
    if sum(t_aboveMinRate_eZZ_Ec04_05d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_Ec04_05d(i) = t_aboveMinRate_eZZ_Ec04_05d(find(t_aboveMinRate_eZZ_Ec04_05d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_Ec04_05d(i)  = t_aboveMinRate_eZZ_Ec04_05d(find(t_aboveMinRate_eZZ_Ec04_05d(:,i),1,'last'));
    end
% parameter 05
    if sum(t_aboveMinRate_eXX_Ec05_05d(:,i)) > 0
        tFirst_aboveMinRate_eXX_Ec05_05d(i) = t_aboveMinRate_eXX_Ec05_05d(find(t_aboveMinRate_eXX_Ec05_05d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_Ec05_05d(i)  = t_aboveMinRate_eXX_Ec05_05d(find(t_aboveMinRate_eXX_Ec05_05d(:,i),1,'last'));
    end
    if sum(t_aboveMinRate_eZZ_Ec05_05d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_Ec05_05d(i) = t_aboveMinRate_eZZ_Ec05_05d(find(t_aboveMinRate_eZZ_Ec05_05d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_Ec05_05d(i)  = t_aboveMinRate_eZZ_Ec05_05d(find(t_aboveMinRate_eZZ_Ec05_05d(:,i),1,'last'));
    end
    
% ==================================================================================================== %
% Depth 10%
% ==================================================================================================== %
% parameter 01
    if sum(t_aboveMinRate_eXX_Ec01_10d(:,i)) > 0
        tFirst_aboveMinRate_eXX_Ec01_10d(i) = t_aboveMinRate_eXX_Ec01_10d(find(t_aboveMinRate_eXX_Ec01_10d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_Ec01_10d(i)  = t_aboveMinRate_eXX_Ec01_10d(find(t_aboveMinRate_eXX_Ec01_10d(:,i),1,'last'));
    end
    if sum(t_aboveMinRate_eZZ_Ec01_10d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_Ec01_10d(i) = t_aboveMinRate_eZZ_Ec01_10d(find(t_aboveMinRate_eZZ_Ec01_10d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_Ec01_10d(i)  = t_aboveMinRate_eZZ_Ec01_10d(find(t_aboveMinRate_eZZ_Ec01_10d(:,i),1,'last'));
    end
% parameter 02
    if sum(t_aboveMinRate_eXX_Ec02_10d(:,i)) > 0
        tFirst_aboveMinRate_eXX_Ec02_10d(i) = t_aboveMinRate_eXX_Ec02_10d(find(t_aboveMinRate_eXX_Ec02_10d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_Ec02_10d(i)  = t_aboveMinRate_eXX_Ec02_10d(find(t_aboveMinRate_eXX_Ec02_10d(:,i),1,'last'));
    end
    if sum(t_aboveMinRate_eZZ_Ec02_10d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_Ec02_10d(i) = t_aboveMinRate_eZZ_Ec02_10d(find(t_aboveMinRate_eZZ_Ec02_10d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_Ec02_10d(i)  = t_aboveMinRate_eZZ_Ec02_10d(find(t_aboveMinRate_eZZ_Ec02_10d(:,i),1,'last'));
    end
% parameter 03
    if sum(t_aboveMinRate_eXX_Ec03_10d(:,i)) > 0
        tFirst_aboveMinRate_eXX_Ec03_10d(i) = t_aboveMinRate_eXX_Ec03_10d(find(t_aboveMinRate_eXX_Ec03_10d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_Ec03_10d(i)  = t_aboveMinRate_eXX_Ec03_10d(find(t_aboveMinRate_eXX_Ec03_10d(:,i),1,'last'));
    end
    if sum(t_aboveMinRate_eZZ_Ec03_10d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_Ec03_10d(i) = t_aboveMinRate_eZZ_Ec03_10d(find(t_aboveMinRate_eZZ_Ec03_10d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_Ec03_10d(i)  = t_aboveMinRate_eZZ_Ec03_10d(find(t_aboveMinRate_eZZ_Ec03_10d(:,i),1,'last'));
    end
% parameter 04
    if sum(t_aboveMinRate_eXX_Ec04_10d(:,i)) > 0
        tFirst_aboveMinRate_eXX_Ec04_10d(i) = t_aboveMinRate_eXX_Ec04_10d(find(t_aboveMinRate_eXX_Ec04_10d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_Ec04_10d(i)  = t_aboveMinRate_eXX_Ec04_10d(find(t_aboveMinRate_eXX_Ec04_10d(:,i),1,'last'));
    end
    if sum(t_aboveMinRate_eZZ_Ec04_10d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_Ec04_10d(i) = t_aboveMinRate_eZZ_Ec04_10d(find(t_aboveMinRate_eZZ_Ec04_10d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_Ec04_10d(i)  = t_aboveMinRate_eZZ_Ec04_10d(find(t_aboveMinRate_eZZ_Ec04_10d(:,i),1,'last'));
    end
% parameter 05
    if sum(t_aboveMinRate_eXX_Ec05_10d(:,i)) > 0
        tFirst_aboveMinRate_eXX_Ec05_10d(i) = t_aboveMinRate_eXX_Ec05_10d(find(t_aboveMinRate_eXX_Ec05_10d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_Ec05_10d(i)  = t_aboveMinRate_eXX_Ec05_10d(find(t_aboveMinRate_eXX_Ec05_10d(:,i),1,'last'));
    end
    if sum(t_aboveMinRate_eZZ_Ec05_10d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_Ec05_10d(i) = t_aboveMinRate_eZZ_Ec05_10d(find(t_aboveMinRate_eZZ_Ec05_10d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_Ec05_10d(i)  = t_aboveMinRate_eZZ_Ec05_10d(find(t_aboveMinRate_eZZ_Ec05_10d(:,i),1,'last'));
    end

% ==================================================================================================== %
% Depth 50%
% ==================================================================================================== %
% parameter 01
    if sum(t_aboveMinRate_eXX_Ec01_50d(:,i)) > 0
        tFirst_aboveMinRate_eXX_Ec01_50d(i) = t_aboveMinRate_eXX_Ec01_50d(find(t_aboveMinRate_eXX_Ec01_50d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_Ec01_50d(i)  = t_aboveMinRate_eXX_Ec01_50d(find(t_aboveMinRate_eXX_Ec01_50d(:,i),1,'last'));
    end
    if sum(t_aboveMinRate_eZZ_Ec01_50d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_Ec01_50d(i) = t_aboveMinRate_eZZ_Ec01_50d(find(t_aboveMinRate_eZZ_Ec01_50d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_Ec01_50d(i)  = t_aboveMinRate_eZZ_Ec01_50d(find(t_aboveMinRate_eZZ_Ec01_50d(:,i),1,'last'));
    end
% parameter 02
    if sum(t_aboveMinRate_eXX_Ec02_50d(:,i)) > 0
        tFirst_aboveMinRate_eXX_Ec02_50d(i) = t_aboveMinRate_eXX_Ec02_50d(find(t_aboveMinRate_eXX_Ec02_50d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_Ec02_50d(i)  = t_aboveMinRate_eXX_Ec02_50d(find(t_aboveMinRate_eXX_Ec02_50d(:,i),1,'last'));
    end
    if sum(t_aboveMinRate_eZZ_Ec02_50d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_Ec02_50d(i) = t_aboveMinRate_eZZ_Ec02_50d(find(t_aboveMinRate_eZZ_Ec02_50d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_Ec02_50d(i)  = t_aboveMinRate_eZZ_Ec02_50d(find(t_aboveMinRate_eZZ_Ec02_50d(:,i),1,'last'));
    end
% parameter 03
    if sum(t_aboveMinRate_eXX_Ec03_50d(:,i)) > 0
        tFirst_aboveMinRate_eXX_Ec03_50d(i) = t_aboveMinRate_eXX_Ec03_50d(find(t_aboveMinRate_eXX_Ec03_50d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_Ec03_50d(i)  = t_aboveMinRate_eXX_Ec03_50d(find(t_aboveMinRate_eXX_Ec03_50d(:,i),1,'last'));
    end
    if sum(t_aboveMinRate_eZZ_Ec03_50d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_Ec03_50d(i) = t_aboveMinRate_eZZ_Ec03_50d(find(t_aboveMinRate_eZZ_Ec03_50d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_Ec03_50d(i)  = t_aboveMinRate_eZZ_Ec03_50d(find(t_aboveMinRate_eZZ_Ec03_50d(:,i),1,'last'));
    end
% parameter 04
    if sum(t_aboveMinRate_eXX_Ec04_50d(:,i)) > 0
        tFirst_aboveMinRate_eXX_Ec04_50d(i) = t_aboveMinRate_eXX_Ec04_50d(find(t_aboveMinRate_eXX_Ec04_50d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_Ec04_50d(i)  = t_aboveMinRate_eXX_Ec04_50d(find(t_aboveMinRate_eXX_Ec04_50d(:,i),1,'last'));
    end
    if sum(t_aboveMinRate_eZZ_Ec04_50d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_Ec04_50d(i) = t_aboveMinRate_eZZ_Ec04_50d(find(t_aboveMinRate_eZZ_Ec04_50d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_Ec04_50d(i)  = t_aboveMinRate_eZZ_Ec04_50d(find(t_aboveMinRate_eZZ_Ec04_50d(:,i),1,'last'));
    end
% parameter 05
    if sum(t_aboveMinRate_eXX_Ec05_50d(:,i)) > 0
        tFirst_aboveMinRate_eXX_Ec05_50d(i) = t_aboveMinRate_eXX_Ec05_50d(find(t_aboveMinRate_eXX_Ec05_50d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_Ec05_50d(i)  = t_aboveMinRate_eXX_Ec05_50d(find(t_aboveMinRate_eXX_Ec05_50d(:,i),1,'last'));
    end
    if sum(t_aboveMinRate_eZZ_Ec05_50d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_Ec05_50d(i) = t_aboveMinRate_eZZ_Ec05_50d(find(t_aboveMinRate_eZZ_Ec05_50d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_Ec05_50d(i)  = t_aboveMinRate_eZZ_Ec05_50d(find(t_aboveMinRate_eZZ_Ec05_50d(:,i),1,'last'));
    end
end

% ==================================================================================================== %
% Durations for which strain rate > minRate
% ==================================================================================================== %
% parameter 01
t_aboveMinRateDuration_eXX_Ec01_01d = zeros(1,n_probes);
t_aboveMinRateDuration_eZZ_Ec01_01d = zeros(1,n_probes);
t_aboveMinRateDuration_eXX_Ec01_03d = zeros(1,n_probes);
t_aboveMinRateDuration_eZZ_Ec01_03d = zeros(1,n_probes);
t_aboveMinRateDuration_eXX_Ec01_05d = zeros(1,n_probes);
t_aboveMinRateDuration_eZZ_Ec01_05d = zeros(1,n_probes);
t_aboveMinRateDuration_eXX_Ec01_10d = zeros(1,n_probes);
t_aboveMinRateDuration_eZZ_Ec01_10d = zeros(1,n_probes);
t_aboveMinRateDuration_eXX_Ec01_50d = zeros(1,n_probes);
t_aboveMinRateDuration_eZZ_Ec01_50d = zeros(1,n_probes);
% parameter 02
t_aboveMinRateDuration_eXX_Ec02_01d = zeros(1,n_probes);
t_aboveMinRateDuration_eZZ_Ec02_01d = zeros(1,n_probes);
t_aboveMinRateDuration_eXX_Ec02_03d = zeros(1,n_probes);
t_aboveMinRateDuration_eZZ_Ec02_03d = zeros(1,n_probes);
t_aboveMinRateDuration_eXX_Ec02_05d = zeros(1,n_probes);
t_aboveMinRateDuration_eZZ_Ec02_05d = zeros(1,n_probes);
t_aboveMinRateDuration_eXX_Ec02_10d = zeros(1,n_probes);
t_aboveMinRateDuration_eZZ_Ec02_10d = zeros(1,n_probes);
t_aboveMinRateDuration_eXX_Ec02_50d = zeros(1,n_probes);
t_aboveMinRateDuration_eZZ_Ec02_50d = zeros(1,n_probes);
% parameter 03
t_aboveMinRateDuration_eXX_Ec03_01d = zeros(1,n_probes);
t_aboveMinRateDuration_eZZ_Ec03_01d = zeros(1,n_probes);
t_aboveMinRateDuration_eXX_Ec03_03d = zeros(1,n_probes);
t_aboveMinRateDuration_eZZ_Ec03_03d = zeros(1,n_probes);
t_aboveMinRateDuration_eXX_Ec03_05d = zeros(1,n_probes);
t_aboveMinRateDuration_eZZ_Ec03_05d = zeros(1,n_probes);
t_aboveMinRateDuration_eXX_Ec03_10d = zeros(1,n_probes);
t_aboveMinRateDuration_eZZ_Ec03_10d = zeros(1,n_probes);
t_aboveMinRateDuration_eXX_Ec03_50d = zeros(1,n_probes);
t_aboveMinRateDuration_eZZ_Ec03_50d = zeros(1,n_probes);
% parameter 04
t_aboveMinRateDuration_eXX_Ec04_01d = zeros(1,n_probes);
t_aboveMinRateDuration_eZZ_Ec04_01d = zeros(1,n_probes);
t_aboveMinRateDuration_eXX_Ec04_03d = zeros(1,n_probes);
t_aboveMinRateDuration_eZZ_Ec04_03d = zeros(1,n_probes);
t_aboveMinRateDuration_eXX_Ec04_05d = zeros(1,n_probes);
t_aboveMinRateDuration_eZZ_Ec04_05d = zeros(1,n_probes);
t_aboveMinRateDuration_eXX_Ec04_10d = zeros(1,n_probes);
t_aboveMinRateDuration_eZZ_Ec04_10d = zeros(1,n_probes);
t_aboveMinRateDuration_eXX_Ec04_50d = zeros(1,n_probes);
t_aboveMinRateDuration_eZZ_Ec04_50d = zeros(1,n_probes);
% parameter 05
t_aboveMinRateDuration_eXX_Ec05_01d = zeros(1,n_probes);
t_aboveMinRateDuration_eZZ_Ec05_01d = zeros(1,n_probes);
t_aboveMinRateDuration_eXX_Ec05_03d = zeros(1,n_probes);
t_aboveMinRateDuration_eZZ_Ec05_03d = zeros(1,n_probes);
t_aboveMinRateDuration_eXX_Ec05_05d = zeros(1,n_probes);
t_aboveMinRateDuration_eZZ_Ec05_05d = zeros(1,n_probes);
t_aboveMinRateDuration_eXX_Ec05_10d = zeros(1,n_probes);
t_aboveMinRateDuration_eZZ_Ec05_10d = zeros(1,n_probes);
t_aboveMinRateDuration_eXX_Ec05_50d = zeros(1,n_probes);
t_aboveMinRateDuration_eZZ_Ec05_50d = zeros(1,n_probes);

for i = 1:n_probes
% ==================================================================================================== %
% Depth 1%
% ==================================================================================================== %
% parameter 01
    t_aboveMinRateDuration_eXX_Ec01_01d(1,i) = tLast_aboveMinRate_eXX_Ec01_01d(1,i)-tFirst_aboveMinRate_eXX_Ec01_01d(1,i);
    t_aboveMinRateDuration_eZZ_Ec01_01d(1,i) = tLast_aboveMinRate_eZZ_Ec01_01d(1,i)-tFirst_aboveMinRate_eZZ_Ec01_01d(1,i);
% parameter 02
    t_aboveMinRateDuration_eXX_Ec02_01d(1,i) = tLast_aboveMinRate_eXX_Ec02_01d(1,i)-tFirst_aboveMinRate_eXX_Ec02_01d(1,i);
    t_aboveMinRateDuration_eZZ_Ec02_01d(1,i) = tLast_aboveMinRate_eZZ_Ec02_01d(1,i)-tFirst_aboveMinRate_eZZ_Ec02_01d(1,i);
% parameter 03
    t_aboveMinRateDuration_eXX_Ec03_01d(1,i) = tLast_aboveMinRate_eXX_Ec03_01d(1,i)-tFirst_aboveMinRate_eXX_Ec03_01d(1,i);
    t_aboveMinRateDuration_eZZ_Ec03_01d(1,i) = tLast_aboveMinRate_eZZ_Ec03_01d(1,i)-tFirst_aboveMinRate_eZZ_Ec03_01d(1,i);
% parameter 04
    t_aboveMinRateDuration_eXX_Ec04_01d(1,i) = tLast_aboveMinRate_eXX_Ec04_01d(1,i)-tFirst_aboveMinRate_eXX_Ec04_01d(1,i);
    t_aboveMinRateDuration_eZZ_Ec04_01d(1,i) = tLast_aboveMinRate_eZZ_Ec04_01d(1,i)-tFirst_aboveMinRate_eZZ_Ec04_01d(1,i);
% parameter 05
    t_aboveMinRateDuration_eXX_Ec05_01d(1,i) = tLast_aboveMinRate_eXX_Ec05_01d(1,i)-tFirst_aboveMinRate_eXX_Ec05_01d(1,i);
    t_aboveMinRateDuration_eZZ_Ec05_01d(1,i) = tLast_aboveMinRate_eZZ_Ec05_01d(1,i)-tFirst_aboveMinRate_eZZ_Ec05_01d(1,i);
    
% ==================================================================================================== %
% Depth 3%
% ==================================================================================================== %
% parameter 01
    t_aboveMinRateDuration_eXX_Ec01_03d(1,i) = tLast_aboveMinRate_eXX_Ec01_03d(1,i)-tFirst_aboveMinRate_eXX_Ec01_03d(1,i);
    t_aboveMinRateDuration_eZZ_Ec01_03d(1,i) = tLast_aboveMinRate_eZZ_Ec01_03d(1,i)-tFirst_aboveMinRate_eZZ_Ec01_03d(1,i);
% parameter 02
    t_aboveMinRateDuration_eXX_Ec02_03d(1,i) = tLast_aboveMinRate_eXX_Ec02_03d(1,i)-tFirst_aboveMinRate_eXX_Ec02_03d(1,i);
    t_aboveMinRateDuration_eZZ_Ec02_03d(1,i) = tLast_aboveMinRate_eZZ_Ec02_03d(1,i)-tFirst_aboveMinRate_eZZ_Ec02_03d(1,i);
% parameter 03
    t_aboveMinRateDuration_eXX_Ec03_03d(1,i) = tLast_aboveMinRate_eXX_Ec03_03d(1,i)-tFirst_aboveMinRate_eXX_Ec03_03d(1,i);
    t_aboveMinRateDuration_eZZ_Ec03_03d(1,i) = tLast_aboveMinRate_eZZ_Ec03_03d(1,i)-tFirst_aboveMinRate_eZZ_Ec03_03d(1,i);
% parameter 04
    t_aboveMinRateDuration_eXX_Ec04_03d(1,i) = tLast_aboveMinRate_eXX_Ec04_03d(1,i)-tFirst_aboveMinRate_eXX_Ec04_03d(1,i);
    t_aboveMinRateDuration_eZZ_Ec04_03d(1,i) = tLast_aboveMinRate_eZZ_Ec04_03d(1,i)-tFirst_aboveMinRate_eZZ_Ec04_03d(1,i);
% parameter 05
    t_aboveMinRateDuration_eXX_Ec05_03d(1,i) = tLast_aboveMinRate_eXX_Ec05_03d(1,i)-tFirst_aboveMinRate_eXX_Ec05_03d(1,i);
    t_aboveMinRateDuration_eZZ_Ec05_03d(1,i) = tLast_aboveMinRate_eZZ_Ec05_03d(1,i)-tFirst_aboveMinRate_eZZ_Ec05_03d(1,i);

% ==================================================================================================== %
% Depth 5%
% ==================================================================================================== %
% parameter 01
    t_aboveMinRateDuration_eXX_Ec01_05d(1,i) = tLast_aboveMinRate_eXX_Ec01_05d(1,i)-tFirst_aboveMinRate_eXX_Ec01_05d(1,i);
    t_aboveMinRateDuration_eZZ_Ec01_05d(1,i) = tLast_aboveMinRate_eZZ_Ec01_05d(1,i)-tFirst_aboveMinRate_eZZ_Ec01_05d(1,i);
% parameter 02
    t_aboveMinRateDuration_eXX_Ec02_05d(1,i) = tLast_aboveMinRate_eXX_Ec02_05d(1,i)-tFirst_aboveMinRate_eXX_Ec02_05d(1,i);
    t_aboveMinRateDuration_eZZ_Ec02_05d(1,i) = tLast_aboveMinRate_eZZ_Ec02_05d(1,i)-tFirst_aboveMinRate_eZZ_Ec02_05d(1,i);
% parameter 03
    t_aboveMinRateDuration_eXX_Ec03_05d(1,i) = tLast_aboveMinRate_eXX_Ec03_05d(1,i)-tFirst_aboveMinRate_eXX_Ec03_05d(1,i);
    t_aboveMinRateDuration_eZZ_Ec03_05d(1,i) = tLast_aboveMinRate_eZZ_Ec03_05d(1,i)-tFirst_aboveMinRate_eZZ_Ec03_05d(1,i);
% parameter 04
    t_aboveMinRateDuration_eXX_Ec04_05d(1,i) = tLast_aboveMinRate_eXX_Ec04_05d(1,i)-tFirst_aboveMinRate_eXX_Ec04_05d(1,i);
    t_aboveMinRateDuration_eZZ_Ec04_05d(1,i) = tLast_aboveMinRate_eZZ_Ec04_05d(1,i)-tFirst_aboveMinRate_eZZ_Ec04_05d(1,i);
% parameter 05
    t_aboveMinRateDuration_eXX_Ec05_05d(1,i) = tLast_aboveMinRate_eXX_Ec05_05d(1,i)-tFirst_aboveMinRate_eXX_Ec05_05d(1,i);
    t_aboveMinRateDuration_eZZ_Ec05_05d(1,i) = tLast_aboveMinRate_eZZ_Ec05_05d(1,i)-tFirst_aboveMinRate_eZZ_Ec05_05d(1,i);

    
% ==================================================================================================== %
% Depth 10%
% ==================================================================================================== %
% parameter 01
    t_aboveMinRateDuration_eXX_Ec01_10d(1,i) = tLast_aboveMinRate_eXX_Ec01_10d(1,i)-tFirst_aboveMinRate_eXX_Ec01_10d(1,i);
    t_aboveMinRateDuration_eZZ_Ec01_10d(1,i) = tLast_aboveMinRate_eZZ_Ec01_10d(1,i)-tFirst_aboveMinRate_eZZ_Ec01_10d(1,i);
% parameter 02
    t_aboveMinRateDuration_eXX_Ec02_10d(1,i) = tLast_aboveMinRate_eXX_Ec02_10d(1,i)-tFirst_aboveMinRate_eXX_Ec02_10d(1,i);
    t_aboveMinRateDuration_eZZ_Ec02_10d(1,i) = tLast_aboveMinRate_eZZ_Ec02_10d(1,i)-tFirst_aboveMinRate_eZZ_Ec02_10d(1,i);
% parameter 03
    t_aboveMinRateDuration_eXX_Ec03_10d(1,i) = tLast_aboveMinRate_eXX_Ec03_10d(1,i)-tFirst_aboveMinRate_eXX_Ec03_10d(1,i);
    t_aboveMinRateDuration_eZZ_Ec03_10d(1,i) = tLast_aboveMinRate_eZZ_Ec03_10d(1,i)-tFirst_aboveMinRate_eZZ_Ec03_10d(1,i);
% parameter 04
    t_aboveMinRateDuration_eXX_Ec04_10d(1,i) = tLast_aboveMinRate_eXX_Ec04_10d(1,i)-tFirst_aboveMinRate_eXX_Ec04_10d(1,i);
    t_aboveMinRateDuration_eZZ_Ec04_10d(1,i) = tLast_aboveMinRate_eZZ_Ec04_10d(1,i)-tFirst_aboveMinRate_eZZ_Ec04_10d(1,i);
% parameter 05
    t_aboveMinRateDuration_eXX_Ec05_10d(1,i) = tLast_aboveMinRate_eXX_Ec05_10d(1,i)-tFirst_aboveMinRate_eXX_Ec05_10d(1,i);
    t_aboveMinRateDuration_eZZ_Ec05_10d(1,i) = tLast_aboveMinRate_eZZ_Ec05_10d(1,i)-tFirst_aboveMinRate_eZZ_Ec05_10d(1,i);
    
% ==================================================================================================== %
% Depth 50%
% ==================================================================================================== %
% parameter 01
    t_aboveMinRateDuration_eXX_Ec01_50d(1,i) = tLast_aboveMinRate_eXX_Ec01_50d(1,i)-tFirst_aboveMinRate_eXX_Ec01_50d(1,i);
    t_aboveMinRateDuration_eZZ_Ec01_50d(1,i) = tLast_aboveMinRate_eZZ_Ec01_50d(1,i)-tFirst_aboveMinRate_eZZ_Ec01_50d(1,i);
% parameter 02
    t_aboveMinRateDuration_eXX_Ec02_50d(1,i) = tLast_aboveMinRate_eXX_Ec02_50d(1,i)-tFirst_aboveMinRate_eXX_Ec02_50d(1,i);
    t_aboveMinRateDuration_eZZ_Ec02_50d(1,i) = tLast_aboveMinRate_eZZ_Ec02_50d(1,i)-tFirst_aboveMinRate_eZZ_Ec02_50d(1,i);
% parameter 03
    t_aboveMinRateDuration_eXX_Ec03_50d(1,i) = tLast_aboveMinRate_eXX_Ec03_50d(1,i)-tFirst_aboveMinRate_eXX_Ec03_50d(1,i);
    t_aboveMinRateDuration_eZZ_Ec03_50d(1,i) = tLast_aboveMinRate_eZZ_Ec03_50d(1,i)-tFirst_aboveMinRate_eZZ_Ec03_50d(1,i);
% parameter 04
    t_aboveMinRateDuration_eXX_Ec04_50d(1,i) = tLast_aboveMinRate_eXX_Ec04_50d(1,i)-tFirst_aboveMinRate_eXX_Ec04_50d(1,i);
    t_aboveMinRateDuration_eZZ_Ec04_50d(1,i) = tLast_aboveMinRate_eZZ_Ec04_50d(1,i)-tFirst_aboveMinRate_eZZ_Ec04_50d(1,i);
% parameter 05
    t_aboveMinRateDuration_eXX_Ec05_50d(1,i) = tLast_aboveMinRate_eXX_Ec05_50d(1,i)-tFirst_aboveMinRate_eXX_Ec05_50d(1,i);
    t_aboveMinRateDuration_eZZ_Ec05_50d(1,i) = tLast_aboveMinRate_eZZ_Ec05_50d(1,i)-tFirst_aboveMinRate_eZZ_Ec05_50d(1,i);
end

% parameter 01
clear tFirst_aboveMinRate_eXX_Ec01_01d    tLast_aboveMinRate_eXX_Ec01_01d
clear tFirst_aboveMinRate_eZZ_Ec01_01d    tLast_aboveMinRate_eZZ_Ec01_01d
clear tFirst_aboveMinRate_eXX_Ec01_03d    tLast_aboveMinRate_eXX_Ec01_03d
clear tFirst_aboveMinRate_eZZ_Ec01_03d    tLast_aboveMinRate_eZZ_Ec01_03d
clear tFirst_aboveMinRate_eXX_Ec01_05d    tLast_aboveMinRate_eXX_Ec01_05d
clear tFirst_aboveMinRate_eZZ_Ec01_05d    tLast_aboveMinRate_eZZ_Ec01_05d
clear tFirst_aboveMinRate_eXX_Ec01_10d    tLast_aboveMinRate_eXX_Ec01_10d
clear tFirst_aboveMinRate_eZZ_Ec01_10d    tLast_aboveMinRate_eZZ_Ec01_10d
clear tFirst_aboveMinRate_eXX_Ec01_50d    tLast_aboveMinRate_eXX_Ec01_50d
clear tFirst_aboveMinRate_eZZ_Ec01_50d    tLast_aboveMinRate_eZZ_Ec01_50d
% parameter 02
clear tFirst_aboveMinRate_eXX_Ec02_01d    tLast_aboveMinRate_eXX_Ec02_01d
clear tFirst_aboveMinRate_eZZ_Ec02_01d    tLast_aboveMinRate_eZZ_Ec02_01d
clear tFirst_aboveMinRate_eXX_Ec02_03d    tLast_aboveMinRate_eXX_Ec02_03d
clear tFirst_aboveMinRate_eZZ_Ec02_03d    tLast_aboveMinRate_eZZ_Ec02_03d
clear tFirst_aboveMinRate_eXX_Ec02_05d    tLast_aboveMinRate_eXX_Ec02_05d
clear tFirst_aboveMinRate_eZZ_Ec02_05d    tLast_aboveMinRate_eZZ_Ec02_05d
clear tFirst_aboveMinRate_eXX_Ec02_10d    tLast_aboveMinRate_eXX_Ec02_10d
clear tFirst_aboveMinRate_eZZ_Ec02_10d    tLast_aboveMinRate_eZZ_Ec02_10d
clear tFirst_aboveMinRate_eXX_Ec02_50d    tLast_aboveMinRate_eXX_Ec02_50d
clear tFirst_aboveMinRate_eZZ_Ec02_50d    tLast_aboveMinRate_eZZ_Ec02_50d
% parameter 03
clear tFirst_aboveMinRate_eXX_Ec03_01d    tLast_aboveMinRate_eXX_Ec03_01d
clear tFirst_aboveMinRate_eZZ_Ec03_01d    tLast_aboveMinRate_eZZ_Ec03_01d
clear tFirst_aboveMinRate_eXX_Ec03_03d    tLast_aboveMinRate_eXX_Ec03_03d
clear tFirst_aboveMinRate_eZZ_Ec03_03d    tLast_aboveMinRate_eZZ_Ec03_03d
clear tFirst_aboveMinRate_eXX_Ec03_05d    tLast_aboveMinRate_eXX_Ec03_05d
clear tFirst_aboveMinRate_eZZ_Ec03_05d    tLast_aboveMinRate_eZZ_Ec03_05d
clear tFirst_aboveMinRate_eXX_Ec03_10d    tLast_aboveMinRate_eXX_Ec03_10d
clear tFirst_aboveMinRate_eZZ_Ec03_10d    tLast_aboveMinRate_eZZ_Ec03_10d
clear tFirst_aboveMinRate_eXX_Ec03_50d    tLast_aboveMinRate_eXX_Ec03_50d
clear tFirst_aboveMinRate_eZZ_Ec03_50d    tLast_aboveMinRate_eZZ_Ec03_50d
% parameter 04
clear tFirst_aboveMinRate_eXX_Ec04_01d    tLast_aboveMinRate_eXX_Ec04_01d
clear tFirst_aboveMinRate_eZZ_Ec04_01d    tLast_aboveMinRate_eZZ_Ec04_01d
clear tFirst_aboveMinRate_eXX_Ec04_03d    tLast_aboveMinRate_eXX_Ec04_03d
clear tFirst_aboveMinRate_eZZ_Ec04_03d    tLast_aboveMinRate_eZZ_Ec04_03d
clear tFirst_aboveMinRate_eXX_Ec04_05d    tLast_aboveMinRate_eXX_Ec04_05d
clear tFirst_aboveMinRate_eZZ_Ec04_05d    tLast_aboveMinRate_eZZ_Ec04_05d
clear tFirst_aboveMinRate_eXX_Ec04_10d    tLast_aboveMinRate_eXX_Ec04_10d
clear tFirst_aboveMinRate_eZZ_Ec04_10d    tLast_aboveMinRate_eZZ_Ec04_10d
clear tFirst_aboveMinRate_eXX_Ec04_50d    tLast_aboveMinRate_eXX_Ec04_50d
clear tFirst_aboveMinRate_eZZ_Ec04_50d    tLast_aboveMinRate_eZZ_Ec04_50d
% parameter 05
clear tFirst_aboveMinRate_eXX_Ec05_01d    tLast_aboveMinRate_eXX_Ec05_01d
clear tFirst_aboveMinRate_eZZ_Ec05_01d    tLast_aboveMinRate_eZZ_Ec05_01d
clear tFirst_aboveMinRate_eXX_Ec05_03d    tLast_aboveMinRate_eXX_Ec05_03d
clear tFirst_aboveMinRate_eZZ_Ec05_03d    tLast_aboveMinRate_eZZ_Ec05_03d
clear tFirst_aboveMinRate_eXX_Ec05_05d    tLast_aboveMinRate_eXX_Ec05_05d
clear tFirst_aboveMinRate_eZZ_Ec05_05d    tLast_aboveMinRate_eZZ_Ec05_05d
clear tFirst_aboveMinRate_eXX_Ec05_10d    tLast_aboveMinRate_eXX_Ec05_10d
clear tFirst_aboveMinRate_eZZ_Ec05_10d    tLast_aboveMinRate_eZZ_Ec05_10d
clear tFirst_aboveMinRate_eXX_Ec05_50d    tLast_aboveMinRate_eXX_Ec05_50d
clear tFirst_aboveMinRate_eZZ_Ec05_50d    tLast_aboveMinRate_eZZ_Ec05_50d

%% Magnitude while strain rate > minRate

% parameter 01
eXX_magAboveMinRate_Ec01_01d = zeros(n_tSteps,n_probes);
eZZ_magAboveMinRate_Ec01_01d = zeros(n_tSteps,n_probes);
eXX_magAboveMinRate_Ec01_03d = zeros(n_tSteps,n_probes);
eZZ_magAboveMinRate_Ec01_03d = zeros(n_tSteps,n_probes);
eXX_magAboveMinRate_Ec01_05d = zeros(n_tSteps,n_probes);
eZZ_magAboveMinRate_Ec01_05d = zeros(n_tSteps,n_probes);
eXX_magAboveMinRate_Ec01_10d = zeros(n_tSteps,n_probes);
eZZ_magAboveMinRate_Ec01_10d = zeros(n_tSteps,n_probes);
eXX_magAboveMinRate_Ec01_50d = zeros(n_tSteps,n_probes);
eZZ_magAboveMinRate_Ec01_50d = zeros(n_tSteps,n_probes);
% parameter 02
eXX_magAboveMinRate_Ec02_01d = zeros(n_tSteps,n_probes);
eZZ_magAboveMinRate_Ec02_01d = zeros(n_tSteps,n_probes);
eXX_magAboveMinRate_Ec02_03d = zeros(n_tSteps,n_probes);
eZZ_magAboveMinRate_Ec02_03d = zeros(n_tSteps,n_probes);
eXX_magAboveMinRate_Ec02_05d = zeros(n_tSteps,n_probes);
eZZ_magAboveMinRate_Ec02_05d = zeros(n_tSteps,n_probes);
eXX_magAboveMinRate_Ec02_10d = zeros(n_tSteps,n_probes);
eZZ_magAboveMinRate_Ec02_10d = zeros(n_tSteps,n_probes);
eXX_magAboveMinRate_Ec02_50d = zeros(n_tSteps,n_probes);
eZZ_magAboveMinRate_Ec02_50d = zeros(n_tSteps,n_probes);
% parameter 03
eXX_magAboveMinRate_Ec03_01d = zeros(n_tSteps,n_probes);
eZZ_magAboveMinRate_Ec03_01d = zeros(n_tSteps,n_probes);
eXX_magAboveMinRate_Ec03_03d = zeros(n_tSteps,n_probes);
eZZ_magAboveMinRate_Ec03_03d = zeros(n_tSteps,n_probes);
eXX_magAboveMinRate_Ec03_05d = zeros(n_tSteps,n_probes);
eZZ_magAboveMinRate_Ec03_05d = zeros(n_tSteps,n_probes);
eXX_magAboveMinRate_Ec03_10d = zeros(n_tSteps,n_probes);
eZZ_magAboveMinRate_Ec03_10d = zeros(n_tSteps,n_probes);
eXX_magAboveMinRate_Ec03_50d = zeros(n_tSteps,n_probes);
eZZ_magAboveMinRate_Ec03_50d = zeros(n_tSteps,n_probes);
% parameter 04
eXX_magAboveMinRate_Ec04_01d = zeros(n_tSteps,n_probes);
eZZ_magAboveMinRate_Ec04_01d = zeros(n_tSteps,n_probes);
eXX_magAboveMinRate_Ec04_03d = zeros(n_tSteps,n_probes);
eZZ_magAboveMinRate_Ec04_03d = zeros(n_tSteps,n_probes);
eXX_magAboveMinRate_Ec04_05d = zeros(n_tSteps,n_probes);
eZZ_magAboveMinRate_Ec04_05d = zeros(n_tSteps,n_probes);
eXX_magAboveMinRate_Ec04_10d = zeros(n_tSteps,n_probes);
eZZ_magAboveMinRate_Ec04_10d = zeros(n_tSteps,n_probes);
eXX_magAboveMinRate_Ec04_50d = zeros(n_tSteps,n_probes);
eZZ_magAboveMinRate_Ec04_50d = zeros(n_tSteps,n_probes);
% parameter 05
eXX_magAboveMinRate_Ec05_01d = zeros(n_tSteps,n_probes);
eZZ_magAboveMinRate_Ec05_01d = zeros(n_tSteps,n_probes);
eXX_magAboveMinRate_Ec05_03d = zeros(n_tSteps,n_probes);
eZZ_magAboveMinRate_Ec05_03d = zeros(n_tSteps,n_probes);
eXX_magAboveMinRate_Ec05_05d = zeros(n_tSteps,n_probes);
eZZ_magAboveMinRate_Ec05_05d = zeros(n_tSteps,n_probes);
eXX_magAboveMinRate_Ec05_10d = zeros(n_tSteps,n_probes);
eZZ_magAboveMinRate_Ec05_10d = zeros(n_tSteps,n_probes);
eXX_magAboveMinRate_Ec05_50d = zeros(n_tSteps,n_probes);
eZZ_magAboveMinRate_Ec05_50d = zeros(n_tSteps,n_probes);

for i = 1:n_probes
% ==================================================================================================== %
% Depth 1%
% ==================================================================================================== %
% parameter 01
    if sum(t_aboveMinRate_eXX_Ec01_01d(:,i)) > 0
        eXX_magAboveMinRate_Ec01_01d(eXX_minRateCriteria_Ec01_01d(:,i),i) = eXX_Ec01_01d(eXX_minRateCriteria_Ec01_01d(:,i),i);
    end
    if sum(t_aboveMinRate_eZZ_Ec01_01d(:,i)) > 0
        eZZ_magAboveMinRate_Ec01_01d(eZZ_minRateCriteria_Ec01_01d(:,i),i) = eZZ_Ec01_01d(eZZ_minRateCriteria_Ec01_01d(:,i),i);
    end
% parameter 02
    if sum(t_aboveMinRate_eXX_Ec02_01d(:,i)) > 0
        eXX_magAboveMinRate_Ec02_01d(eXX_minRateCriteria_Ec02_01d(:,i),i) = eXX_Ec02_01d(eXX_minRateCriteria_Ec02_01d(:,i),i);
    end
    if sum(t_aboveMinRate_eZZ_Ec02_01d(:,i)) > 0
        eZZ_magAboveMinRate_Ec02_01d(eZZ_minRateCriteria_Ec02_01d(:,i),i) = eZZ_Ec02_01d(eZZ_minRateCriteria_Ec02_01d(:,i),i);
    end
% parameter 03
    if sum(t_aboveMinRate_eXX_Ec03_01d(:,i)) > 0
        eXX_magAboveMinRate_Ec03_01d(eXX_minRateCriteria_Ec03_01d(:,i),i) = eXX_Ec03_01d(eXX_minRateCriteria_Ec03_01d(:,i),i);
    end
    if sum(t_aboveMinRate_eZZ_Ec03_01d(:,i)) > 0
        eZZ_magAboveMinRate_Ec03_01d(eZZ_minRateCriteria_Ec03_01d(:,i),i) = eZZ_Ec03_01d(eZZ_minRateCriteria_Ec03_01d(:,i),i);
    end
% parameter 04
    if sum(t_aboveMinRate_eXX_Ec04_01d(:,i)) > 0
        eXX_magAboveMinRate_Ec04_01d(eXX_minRateCriteria_Ec04_01d(:,i),i) = eXX_Ec04_01d(eXX_minRateCriteria_Ec04_01d(:,i),i);
    end
    if sum(t_aboveMinRate_eZZ_Ec04_01d(:,i)) > 0
        eZZ_magAboveMinRate_Ec04_01d(eZZ_minRateCriteria_Ec04_01d(:,i),i) = eZZ_Ec04_01d(eZZ_minRateCriteria_Ec04_01d(:,i),i);
    end
% parameter 05
    if sum(t_aboveMinRate_eXX_Ec05_01d(:,i)) > 0
        eXX_magAboveMinRate_Ec05_01d(eXX_minRateCriteria_Ec05_01d(:,i),i) = eXX_Ec05_01d(eXX_minRateCriteria_Ec05_01d(:,i),i);
    end
    if sum(t_aboveMinRate_eZZ_Ec05_01d(:,i)) > 0
        eZZ_magAboveMinRate_Ec05_01d(eZZ_minRateCriteria_Ec05_01d(:,i),i) = eZZ_Ec05_01d(eZZ_minRateCriteria_Ec05_01d(:,i),i);
    end

% ==================================================================================================== %
% Depth 3%
% ==================================================================================================== %
% parameter 01
    if sum(t_aboveMinRate_eXX_Ec01_03d(:,i)) > 0
        eXX_magAboveMinRate_Ec01_03d(eXX_minRateCriteria_Ec01_03d(:,i),i) = eXX_Ec01_03d(eXX_minRateCriteria_Ec01_03d(:,i),i);
    end
    if sum(t_aboveMinRate_eZZ_Ec01_03d(:,i)) > 0
        eZZ_magAboveMinRate_Ec01_03d(eZZ_minRateCriteria_Ec01_03d(:,i),i) = eZZ_Ec01_03d(eZZ_minRateCriteria_Ec01_03d(:,i),i);
    end
% parameter 02
    if sum(t_aboveMinRate_eXX_Ec02_03d(:,i)) > 0
        eXX_magAboveMinRate_Ec02_03d(eXX_minRateCriteria_Ec02_03d(:,i),i) = eXX_Ec02_03d(eXX_minRateCriteria_Ec02_03d(:,i),i);
    end
    if sum(t_aboveMinRate_eZZ_Ec02_03d(:,i)) > 0
        eZZ_magAboveMinRate_Ec02_03d(eZZ_minRateCriteria_Ec02_03d(:,i),i) = eZZ_Ec02_03d(eZZ_minRateCriteria_Ec02_03d(:,i),i);
    end
% parameter 03
    if sum(t_aboveMinRate_eXX_Ec03_03d(:,i)) > 0
        eXX_magAboveMinRate_Ec03_03d(eXX_minRateCriteria_Ec03_03d(:,i),i) = eXX_Ec03_03d(eXX_minRateCriteria_Ec03_03d(:,i),i);
    end
    if sum(t_aboveMinRate_eZZ_Ec03_03d(:,i)) > 0
        eZZ_magAboveMinRate_Ec03_03d(eZZ_minRateCriteria_Ec03_03d(:,i),i) = eZZ_Ec03_03d(eZZ_minRateCriteria_Ec03_03d(:,i),i);
    end
% parameter 04
    if sum(t_aboveMinRate_eXX_Ec04_03d(:,i)) > 0
        eXX_magAboveMinRate_Ec04_03d(eXX_minRateCriteria_Ec04_03d(:,i),i) = eXX_Ec04_03d(eXX_minRateCriteria_Ec04_03d(:,i),i);
    end
    if sum(t_aboveMinRate_eZZ_Ec04_03d(:,i)) > 0
        eZZ_magAboveMinRate_Ec04_03d(eZZ_minRateCriteria_Ec04_03d(:,i),i) = eZZ_Ec04_03d(eZZ_minRateCriteria_Ec04_03d(:,i),i);
    end
% parameter 05
    if sum(t_aboveMinRate_eXX_Ec05_03d(:,i)) > 0
        eXX_magAboveMinRate_Ec05_03d(eXX_minRateCriteria_Ec05_03d(:,i),i) = eXX_Ec05_03d(eXX_minRateCriteria_Ec05_03d(:,i),i);
    end
    if sum(t_aboveMinRate_eZZ_Ec05_03d(:,i)) > 0
        eZZ_magAboveMinRate_Ec05_03d(eZZ_minRateCriteria_Ec05_03d(:,i),i) = eZZ_Ec05_03d(eZZ_minRateCriteria_Ec05_03d(:,i),i);
    end

% ==================================================================================================== %
% Depth 5%
% ==================================================================================================== %
% parameter 01
    if sum(t_aboveMinRate_eXX_Ec01_05d(:,i)) > 0
        eXX_magAboveMinRate_Ec01_05d(eXX_minRateCriteria_Ec01_05d(:,i),i) = eXX_Ec01_05d(eXX_minRateCriteria_Ec01_05d(:,i),i);
    end
    if sum(t_aboveMinRate_eZZ_Ec01_05d(:,i)) > 0
        eZZ_magAboveMinRate_Ec01_05d(eZZ_minRateCriteria_Ec01_05d(:,i),i) = eZZ_Ec01_05d(eZZ_minRateCriteria_Ec01_05d(:,i),i);
    end
% parameter 02
    if sum(t_aboveMinRate_eXX_Ec02_05d(:,i)) > 0
        eXX_magAboveMinRate_Ec02_05d(eXX_minRateCriteria_Ec02_05d(:,i),i) = eXX_Ec02_05d(eXX_minRateCriteria_Ec02_05d(:,i),i);
    end
    if sum(t_aboveMinRate_eZZ_Ec02_05d(:,i)) > 0
        eZZ_magAboveMinRate_Ec02_05d(eZZ_minRateCriteria_Ec02_05d(:,i),i) = eZZ_Ec02_05d(eZZ_minRateCriteria_Ec02_05d(:,i),i);
    end
% parameter 03
    if sum(t_aboveMinRate_eXX_Ec03_05d(:,i)) > 0
        eXX_magAboveMinRate_Ec03_05d(eXX_minRateCriteria_Ec03_05d(:,i),i) = eXX_Ec03_05d(eXX_minRateCriteria_Ec03_05d(:,i),i);
    end
    if sum(t_aboveMinRate_eZZ_Ec03_05d(:,i)) > 0
        eZZ_magAboveMinRate_Ec03_05d(eZZ_minRateCriteria_Ec03_05d(:,i),i) = eZZ_Ec03_05d(eZZ_minRateCriteria_Ec03_05d(:,i),i);
    end
% parameter 04
    if sum(t_aboveMinRate_eXX_Ec04_05d(:,i)) > 0
        eXX_magAboveMinRate_Ec04_05d(eXX_minRateCriteria_Ec04_05d(:,i),i) = eXX_Ec04_05d(eXX_minRateCriteria_Ec04_05d(:,i),i);
    end
    if sum(t_aboveMinRate_eZZ_Ec04_05d(:,i)) > 0
        eZZ_magAboveMinRate_Ec04_05d(eZZ_minRateCriteria_Ec04_05d(:,i),i) = eZZ_Ec04_05d(eZZ_minRateCriteria_Ec04_05d(:,i),i);
    end
% parameter 05
    if sum(t_aboveMinRate_eXX_Ec05_05d(:,i)) > 0
        eXX_magAboveMinRate_Ec05_05d(eXX_minRateCriteria_Ec05_05d(:,i),i) = eXX_Ec05_05d(eXX_minRateCriteria_Ec05_05d(:,i),i);
    end
    if sum(t_aboveMinRate_eZZ_Ec05_05d(:,i)) > 0
        eZZ_magAboveMinRate_Ec05_05d(eZZ_minRateCriteria_Ec05_05d(:,i),i) = eZZ_Ec05_05d(eZZ_minRateCriteria_Ec05_05d(:,i),i);
    end

% ==================================================================================================== %
% Depth 10%
% ==================================================================================================== %
% parameter 01
    if sum(t_aboveMinRate_eXX_Ec01_10d(:,i)) > 0
        eXX_magAboveMinRate_Ec01_10d(eXX_minRateCriteria_Ec01_10d(:,i),i) = eXX_Ec01_10d(eXX_minRateCriteria_Ec01_10d(:,i),i);
    end
    if sum(t_aboveMinRate_eZZ_Ec01_10d(:,i)) > 0
        eZZ_magAboveMinRate_Ec01_10d(eZZ_minRateCriteria_Ec01_10d(:,i),i) = eZZ_Ec01_10d(eZZ_minRateCriteria_Ec01_10d(:,i),i);
    end
% parameter 02
    if sum(t_aboveMinRate_eXX_Ec02_10d(:,i)) > 0
        eXX_magAboveMinRate_Ec02_10d(eXX_minRateCriteria_Ec02_10d(:,i),i) = eXX_Ec02_10d(eXX_minRateCriteria_Ec02_10d(:,i),i);
    end
    if sum(t_aboveMinRate_eZZ_Ec02_10d(:,i)) > 0
        eZZ_magAboveMinRate_Ec02_10d(eZZ_minRateCriteria_Ec02_10d(:,i),i) = eZZ_Ec02_10d(eZZ_minRateCriteria_Ec02_10d(:,i),i);
    end
% parameter 03
    if sum(t_aboveMinRate_eXX_Ec03_10d(:,i)) > 0
        eXX_magAboveMinRate_Ec03_10d(eXX_minRateCriteria_Ec03_10d(:,i),i) = eXX_Ec03_10d(eXX_minRateCriteria_Ec03_10d(:,i),i);
    end
    if sum(t_aboveMinRate_eZZ_Ec03_10d(:,i)) > 0
        eZZ_magAboveMinRate_Ec03_10d(eZZ_minRateCriteria_Ec03_10d(:,i),i) = eZZ_Ec03_10d(eZZ_minRateCriteria_Ec03_10d(:,i),i);
    end
% parameter 04
    if sum(t_aboveMinRate_eXX_Ec04_10d(:,i)) > 0
        eXX_magAboveMinRate_Ec04_10d(eXX_minRateCriteria_Ec04_10d(:,i),i) = eXX_Ec04_10d(eXX_minRateCriteria_Ec04_10d(:,i),i);
    end
    if sum(t_aboveMinRate_eZZ_Ec04_10d(:,i)) > 0
        eZZ_magAboveMinRate_Ec04_10d(eZZ_minRateCriteria_Ec04_10d(:,i),i) = eZZ_Ec04_10d(eZZ_minRateCriteria_Ec04_10d(:,i),i);
    end
% parameter 05
    if sum(t_aboveMinRate_eXX_Ec05_10d(:,i)) > 0
        eXX_magAboveMinRate_Ec05_10d(eXX_minRateCriteria_Ec05_10d(:,i),i) = eXX_Ec05_10d(eXX_minRateCriteria_Ec05_10d(:,i),i);
    end
    if sum(t_aboveMinRate_eZZ_Ec05_10d(:,i)) > 0
        eZZ_magAboveMinRate_Ec05_10d(eZZ_minRateCriteria_Ec05_10d(:,i),i) = eZZ_Ec05_10d(eZZ_minRateCriteria_Ec05_10d(:,i),i);
    end

% ==================================================================================================== %
% Depth 50%
% ==================================================================================================== %
% parameter 01
    if sum(t_aboveMinRate_eXX_Ec01_50d(:,i)) > 0
        eXX_magAboveMinRate_Ec01_50d(eXX_minRateCriteria_Ec01_50d(:,i),i) = eXX_Ec01_50d(eXX_minRateCriteria_Ec01_50d(:,i),i);
    end
    if sum(t_aboveMinRate_eZZ_Ec01_50d(:,i)) > 0
        eZZ_magAboveMinRate_Ec01_50d(eZZ_minRateCriteria_Ec01_50d(:,i),i) = eZZ_Ec01_50d(eZZ_minRateCriteria_Ec01_50d(:,i),i);
    end
% parameter 02
    if sum(t_aboveMinRate_eXX_Ec02_50d(:,i)) > 0
        eXX_magAboveMinRate_Ec02_50d(eXX_minRateCriteria_Ec02_50d(:,i),i) = eXX_Ec02_50d(eXX_minRateCriteria_Ec02_50d(:,i),i);
    end
    if sum(t_aboveMinRate_eZZ_Ec02_50d(:,i)) > 0
        eZZ_magAboveMinRate_Ec02_50d(eZZ_minRateCriteria_Ec02_50d(:,i),i) = eZZ_Ec02_50d(eZZ_minRateCriteria_Ec02_50d(:,i),i);
    end
% parameter 03
    if sum(t_aboveMinRate_eXX_Ec03_50d(:,i)) > 0
        eXX_magAboveMinRate_Ec03_50d(eXX_minRateCriteria_Ec03_50d(:,i),i) = eXX_Ec03_50d(eXX_minRateCriteria_Ec03_50d(:,i),i);
    end
    if sum(t_aboveMinRate_eZZ_Ec03_50d(:,i)) > 0
        eZZ_magAboveMinRate_Ec03_50d(eZZ_minRateCriteria_Ec03_50d(:,i),i) = eZZ_Ec03_50d(eZZ_minRateCriteria_Ec03_50d(:,i),i);
    end
% parameter 04
    if sum(t_aboveMinRate_eXX_Ec04_50d(:,i)) > 0
        eXX_magAboveMinRate_Ec04_50d(eXX_minRateCriteria_Ec04_50d(:,i),i) = eXX_Ec04_50d(eXX_minRateCriteria_Ec04_50d(:,i),i);
    end
    if sum(t_aboveMinRate_eZZ_Ec04_50d(:,i)) > 0
        eZZ_magAboveMinRate_Ec04_50d(eZZ_minRateCriteria_Ec04_50d(:,i),i) = eZZ_Ec04_50d(eZZ_minRateCriteria_Ec04_50d(:,i),i);
    end
% parameter 05
    if sum(t_aboveMinRate_eXX_Ec05_50d(:,i)) > 0
        eXX_magAboveMinRate_Ec05_50d(eXX_minRateCriteria_Ec05_50d(:,i),i) = eXX_Ec05_50d(eXX_minRateCriteria_Ec05_50d(:,i),i);
    end
    if sum(t_aboveMinRate_eZZ_Ec05_50d(:,i)) > 0
        eZZ_magAboveMinRate_Ec05_50d(eZZ_minRateCriteria_Ec05_50d(:,i),i) = eZZ_Ec05_50d(eZZ_minRateCriteria_Ec05_50d(:,i),i);
    end
end

%% Detectable Strains

% parameter 01
eXXmeasCriteria_Ec01_01d = false(n_tSteps,n_probes);
eZZmeasCriteria_Ec01_01d = false(n_tSteps,n_probes);
eXXmeasCriteria_Ec01_03d = false(n_tSteps,n_probes);
eZZmeasCriteria_Ec01_03d = false(n_tSteps,n_probes);
eXXmeasCriteria_Ec01_05d = false(n_tSteps,n_probes);
eZZmeasCriteria_Ec01_05d = false(n_tSteps,n_probes);
eXXmeasCriteria_Ec01_10d = false(n_tSteps,n_probes);
eZZmeasCriteria_Ec01_10d = false(n_tSteps,n_probes);
eXXmeasCriteria_Ec01_50d = false(n_tSteps,n_probes);
eZZmeasCriteria_Ec01_50d = false(n_tSteps,n_probes);
% parameter 02
eXXmeasCriteria_Ec02_01d = false(n_tSteps,n_probes);
eZZmeasCriteria_Ec02_01d = false(n_tSteps,n_probes);
eXXmeasCriteria_Ec02_03d = false(n_tSteps,n_probes);
eZZmeasCriteria_Ec02_03d = false(n_tSteps,n_probes);
eXXmeasCriteria_Ec02_05d = false(n_tSteps,n_probes);
eZZmeasCriteria_Ec02_05d = false(n_tSteps,n_probes);
eXXmeasCriteria_Ec02_10d = false(n_tSteps,n_probes);
eZZmeasCriteria_Ec02_10d = false(n_tSteps,n_probes);
eXXmeasCriteria_Ec02_50d = false(n_tSteps,n_probes);
eZZmeasCriteria_Ec02_50d = false(n_tSteps,n_probes);
% parameter 03
eXXmeasCriteria_Ec03_01d = false(n_tSteps,n_probes);
eZZmeasCriteria_Ec03_01d = false(n_tSteps,n_probes);
eXXmeasCriteria_Ec03_03d = false(n_tSteps,n_probes);
eZZmeasCriteria_Ec03_03d = false(n_tSteps,n_probes);
eXXmeasCriteria_Ec03_05d = false(n_tSteps,n_probes);
eZZmeasCriteria_Ec03_05d = false(n_tSteps,n_probes);
eXXmeasCriteria_Ec03_10d = false(n_tSteps,n_probes);
eZZmeasCriteria_Ec03_10d = false(n_tSteps,n_probes);
eXXmeasCriteria_Ec03_50d = false(n_tSteps,n_probes);
eZZmeasCriteria_Ec03_50d = false(n_tSteps,n_probes);
% parameter 04
eXXmeasCriteria_Ec04_01d = false(n_tSteps,n_probes);
eZZmeasCriteria_Ec04_01d = false(n_tSteps,n_probes);
eXXmeasCriteria_Ec04_03d = false(n_tSteps,n_probes);
eZZmeasCriteria_Ec04_03d = false(n_tSteps,n_probes);
eXXmeasCriteria_Ec04_05d = false(n_tSteps,n_probes);
eZZmeasCriteria_Ec04_05d = false(n_tSteps,n_probes);
eXXmeasCriteria_Ec04_10d = false(n_tSteps,n_probes);
eZZmeasCriteria_Ec04_10d = false(n_tSteps,n_probes);
eXXmeasCriteria_Ec04_50d = false(n_tSteps,n_probes);
eZZmeasCriteria_Ec04_50d = false(n_tSteps,n_probes);
% parameter 05
eXXmeasCriteria_Ec05_01d = false(n_tSteps,n_probes);
eZZmeasCriteria_Ec05_01d = false(n_tSteps,n_probes);
eXXmeasCriteria_Ec05_03d = false(n_tSteps,n_probes);
eZZmeasCriteria_Ec05_03d = false(n_tSteps,n_probes);
eXXmeasCriteria_Ec05_05d = false(n_tSteps,n_probes);
eZZmeasCriteria_Ec05_05d = false(n_tSteps,n_probes);
eXXmeasCriteria_Ec05_10d = false(n_tSteps,n_probes);
eZZmeasCriteria_Ec05_10d = false(n_tSteps,n_probes);
eXXmeasCriteria_Ec05_50d = false(n_tSteps,n_probes);
eZZmeasCriteria_Ec05_50d = false(n_tSteps,n_probes);

% ==================================================================================================== %
% Define measurement criteria
% ==================================================================================================== %
for i = 1:n_probes
% ==================================================================================================== %
% Depth 1%
% ==================================================================================================== %
% parameter 01
    eXXmeasCriteria_Ec01_01d(:,i) = (abs(eXX_magAboveMinRate_Ec01_01d(:,i)) > minMag & eXXrate_Ec01_01d(:,i) > minRate);
    eZZmeasCriteria_Ec01_01d(:,i) = (abs(eZZ_magAboveMinRate_Ec01_01d(:,i)) > minMag & eZZrate_Ec01_01d(:,i) > minRate);
% parameter 02
    eXXmeasCriteria_Ec02_01d(:,i) = (abs(eXX_magAboveMinRate_Ec02_01d(:,i)) > minMag & eXXrate_Ec02_01d(:,i) > minRate);
    eZZmeasCriteria_Ec02_01d(:,i) = (abs(eZZ_magAboveMinRate_Ec02_01d(:,i)) > minMag & eZZrate_Ec02_01d(:,i) > minRate);
% parameter 03
    eXXmeasCriteria_Ec03_01d(:,i) = (abs(eXX_magAboveMinRate_Ec03_01d(:,i)) > minMag & eXXrate_Ec03_01d(:,i) > minRate);
    eZZmeasCriteria_Ec03_01d(:,i) = (abs(eZZ_magAboveMinRate_Ec03_01d(:,i)) > minMag & eZZrate_Ec03_01d(:,i) > minRate);
% parameter 04
    eXXmeasCriteria_Ec04_01d(:,i) = (abs(eXX_magAboveMinRate_Ec04_01d(:,i)) > minMag & eXXrate_Ec04_01d(:,i) > minRate);
    eZZmeasCriteria_Ec04_01d(:,i) = (abs(eZZ_magAboveMinRate_Ec04_01d(:,i)) > minMag & eZZrate_Ec04_01d(:,i) > minRate);
% parameter 05
    eXXmeasCriteria_Ec05_01d(:,i) = (abs(eXX_magAboveMinRate_Ec05_01d(:,i)) > minMag & eXXrate_Ec05_01d(:,i) > minRate);
    eZZmeasCriteria_Ec05_01d(:,i) = (abs(eZZ_magAboveMinRate_Ec05_01d(:,i)) > minMag & eZZrate_Ec05_01d(:,i) > minRate);
    
% ==================================================================================================== %
% Depth 3%
% ==================================================================================================== %
% parameter 01
    eXXmeasCriteria_Ec01_03d(:,i) = (abs(eXX_magAboveMinRate_Ec01_03d(:,i)) > minMag & eXXrate_Ec01_03d(:,i) > minRate);
    eZZmeasCriteria_Ec01_03d(:,i) = (abs(eZZ_magAboveMinRate_Ec01_03d(:,i)) > minMag & eZZrate_Ec01_03d(:,i) > minRate);
% parameter 02
    eXXmeasCriteria_Ec02_03d(:,i) = (abs(eXX_magAboveMinRate_Ec02_03d(:,i)) > minMag & eXXrate_Ec02_03d(:,i) > minRate);
    eZZmeasCriteria_Ec02_03d(:,i) = (abs(eZZ_magAboveMinRate_Ec02_03d(:,i)) > minMag & eZZrate_Ec02_03d(:,i) > minRate);
% parameter 03
    eXXmeasCriteria_Ec03_03d(:,i) = (abs(eXX_magAboveMinRate_Ec03_03d(:,i)) > minMag & eXXrate_Ec03_03d(:,i) > minRate);
    eZZmeasCriteria_Ec03_03d(:,i) = (abs(eZZ_magAboveMinRate_Ec03_03d(:,i)) > minMag & eZZrate_Ec03_03d(:,i) > minRate);
% parameter 04
    eXXmeasCriteria_Ec04_03d(:,i) = (abs(eXX_magAboveMinRate_Ec04_03d(:,i)) > minMag & eXXrate_Ec04_03d(:,i) > minRate);
    eZZmeasCriteria_Ec04_03d(:,i) = (abs(eZZ_magAboveMinRate_Ec04_03d(:,i)) > minMag & eZZrate_Ec04_03d(:,i) > minRate);
% parameter 05
    eXXmeasCriteria_Ec05_03d(:,i) = (abs(eXX_magAboveMinRate_Ec05_03d(:,i)) > minMag & eXXrate_Ec05_03d(:,i) > minRate);
    eZZmeasCriteria_Ec05_03d(:,i) = (abs(eZZ_magAboveMinRate_Ec05_03d(:,i)) > minMag & eZZrate_Ec05_03d(:,i) > minRate);
    
% ==================================================================================================== %
% Depth 5%
% ==================================================================================================== %
% parameter 01
    eXXmeasCriteria_Ec01_05d(:,i) = (abs(eXX_magAboveMinRate_Ec01_05d(:,i)) > minMag & eXXrate_Ec01_05d(:,i) > minRate);
    eZZmeasCriteria_Ec01_05d(:,i) = (abs(eZZ_magAboveMinRate_Ec01_05d(:,i)) > minMag & eZZrate_Ec01_05d(:,i) > minRate);
% parameter 02
    eXXmeasCriteria_Ec02_05d(:,i) = (abs(eXX_magAboveMinRate_Ec02_05d(:,i)) > minMag & eXXrate_Ec02_05d(:,i) > minRate);
    eZZmeasCriteria_Ec02_05d(:,i) = (abs(eZZ_magAboveMinRate_Ec02_05d(:,i)) > minMag & eZZrate_Ec02_05d(:,i) > minRate);
% parameter 03
    eXXmeasCriteria_Ec03_05d(:,i) = (abs(eXX_magAboveMinRate_Ec03_05d(:,i)) > minMag & eXXrate_Ec03_05d(:,i) > minRate);
    eZZmeasCriteria_Ec03_05d(:,i) = (abs(eZZ_magAboveMinRate_Ec03_05d(:,i)) > minMag & eZZrate_Ec03_05d(:,i) > minRate);
% parameter 04
    eXXmeasCriteria_Ec04_05d(:,i) = (abs(eXX_magAboveMinRate_Ec04_05d(:,i)) > minMag & eXXrate_Ec04_05d(:,i) > minRate);
    eZZmeasCriteria_Ec04_05d(:,i) = (abs(eZZ_magAboveMinRate_Ec04_05d(:,i)) > minMag & eZZrate_Ec04_05d(:,i) > minRate);
% parameter 05
    eXXmeasCriteria_Ec05_05d(:,i) = (abs(eXX_magAboveMinRate_Ec05_05d(:,i)) > minMag & eXXrate_Ec05_05d(:,i) > minRate);
    eZZmeasCriteria_Ec05_05d(:,i) = (abs(eZZ_magAboveMinRate_Ec05_05d(:,i)) > minMag & eZZrate_Ec05_05d(:,i) > minRate);
    
% ==================================================================================================== %
% Depth 10%
% ==================================================================================================== %
% parameter 01
    eXXmeasCriteria_Ec01_10d(:,i) = (abs(eXX_magAboveMinRate_Ec01_10d(:,i)) > minMag & eXXrate_Ec01_10d(:,i) > minRate);
    eZZmeasCriteria_Ec01_10d(:,i) = (abs(eZZ_magAboveMinRate_Ec01_10d(:,i)) > minMag & eZZrate_Ec01_10d(:,i) > minRate);
% parameter 02
    eXXmeasCriteria_Ec02_10d(:,i) = (abs(eXX_magAboveMinRate_Ec02_10d(:,i)) > minMag & eXXrate_Ec02_10d(:,i) > minRate);
    eZZmeasCriteria_Ec02_10d(:,i) = (abs(eZZ_magAboveMinRate_Ec02_10d(:,i)) > minMag & eZZrate_Ec02_10d(:,i) > minRate);
% parameter 03
    eXXmeasCriteria_Ec03_10d(:,i) = (abs(eXX_magAboveMinRate_Ec03_10d(:,i)) > minMag & eXXrate_Ec03_10d(:,i) > minRate);
    eZZmeasCriteria_Ec03_10d(:,i) = (abs(eZZ_magAboveMinRate_Ec03_10d(:,i)) > minMag & eZZrate_Ec03_10d(:,i) > minRate);
% parameter 04
    eXXmeasCriteria_Ec04_10d(:,i) = (abs(eXX_magAboveMinRate_Ec04_10d(:,i)) > minMag & eXXrate_Ec04_10d(:,i) > minRate);
    eZZmeasCriteria_Ec04_10d(:,i) = (abs(eZZ_magAboveMinRate_Ec04_10d(:,i)) > minMag & eZZrate_Ec04_10d(:,i) > minRate);
% parameter 05
    eXXmeasCriteria_Ec05_10d(:,i) = (abs(eXX_magAboveMinRate_Ec05_10d(:,i)) > minMag & eXXrate_Ec05_10d(:,i) > minRate);
    eZZmeasCriteria_Ec05_10d(:,i) = (abs(eZZ_magAboveMinRate_Ec05_10d(:,i)) > minMag & eZZrate_Ec05_10d(:,i) > minRate);

% ==================================================================================================== %
% Depth 50%
% ==================================================================================================== %
% parameter 01
    eXXmeasCriteria_Ec01_50d(:,i) = (abs(eXX_magAboveMinRate_Ec01_50d(:,i)) > minMag & eXXrate_Ec01_50d(:,i) > minRate);
    eZZmeasCriteria_Ec01_50d(:,i) = (abs(eZZ_magAboveMinRate_Ec01_50d(:,i)) > minMag & eZZrate_Ec01_50d(:,i) > minRate);
% parameter 02
    eXXmeasCriteria_Ec02_50d(:,i) = (abs(eXX_magAboveMinRate_Ec02_50d(:,i)) > minMag & eXXrate_Ec02_50d(:,i) > minRate);
    eZZmeasCriteria_Ec02_50d(:,i) = (abs(eZZ_magAboveMinRate_Ec02_50d(:,i)) > minMag & eZZrate_Ec02_50d(:,i) > minRate);
% parameter 03
    eXXmeasCriteria_Ec03_50d(:,i) = (abs(eXX_magAboveMinRate_Ec03_50d(:,i)) > minMag & eXXrate_Ec03_50d(:,i) > minRate);
    eZZmeasCriteria_Ec03_50d(:,i) = (abs(eZZ_magAboveMinRate_Ec03_50d(:,i)) > minMag & eZZrate_Ec03_50d(:,i) > minRate);
% parameter 04
    eXXmeasCriteria_Ec04_50d(:,i) = (abs(eXX_magAboveMinRate_Ec04_50d(:,i)) > minMag & eXXrate_Ec04_50d(:,i) > minRate);
    eZZmeasCriteria_Ec04_50d(:,i) = (abs(eZZ_magAboveMinRate_Ec04_50d(:,i)) > minMag & eZZrate_Ec04_50d(:,i) > minRate);
% parameter 05
    eXXmeasCriteria_Ec05_50d(:,i) = (abs(eXX_magAboveMinRate_Ec05_50d(:,i)) > minMag & eXXrate_Ec05_50d(:,i) > minRate);
    eZZmeasCriteria_Ec05_50d(:,i) = (abs(eZZ_magAboveMinRate_Ec05_50d(:,i)) > minMag & eZZrate_Ec05_50d(:,i) > minRate);
end

% ==================================================================================================== %
% Detectable Strains
% ==================================================================================================== %
% parameter 01
eXX_detectable_Ec01_01d = NaN(n_tSteps,n_probes);
eZZ_detectable_Ec01_01d = NaN(n_tSteps,n_probes);
eXX_detectable_Ec01_03d = NaN(n_tSteps,n_probes);
eZZ_detectable_Ec01_03d = NaN(n_tSteps,n_probes);
eXX_detectable_Ec01_05d = NaN(n_tSteps,n_probes);
eZZ_detectable_Ec01_05d = NaN(n_tSteps,n_probes);
eXX_detectable_Ec01_10d = NaN(n_tSteps,n_probes);
eZZ_detectable_Ec01_10d = NaN(n_tSteps,n_probes);
eXX_detectable_Ec01_50d = NaN(n_tSteps,n_probes);
eZZ_detectable_Ec01_50d = NaN(n_tSteps,n_probes);
% parameter 02
eXX_detectable_Ec02_01d = NaN(n_tSteps,n_probes);
eZZ_detectable_Ec02_01d = NaN(n_tSteps,n_probes);
eXX_detectable_Ec02_03d = NaN(n_tSteps,n_probes);
eZZ_detectable_Ec02_03d = NaN(n_tSteps,n_probes);
eXX_detectable_Ec02_05d = NaN(n_tSteps,n_probes);
eZZ_detectable_Ec02_05d = NaN(n_tSteps,n_probes);
eXX_detectable_Ec02_10d = NaN(n_tSteps,n_probes);
eZZ_detectable_Ec02_10d = NaN(n_tSteps,n_probes);
eXX_detectable_Ec02_50d = NaN(n_tSteps,n_probes);
eZZ_detectable_Ec02_50d = NaN(n_tSteps,n_probes);
% parameter 03
eXX_detectable_Ec03_01d = NaN(n_tSteps,n_probes);
eZZ_detectable_Ec03_01d = NaN(n_tSteps,n_probes);
eXX_detectable_Ec03_03d = NaN(n_tSteps,n_probes);
eZZ_detectable_Ec03_03d = NaN(n_tSteps,n_probes);
eXX_detectable_Ec03_05d = NaN(n_tSteps,n_probes);
eZZ_detectable_Ec03_05d = NaN(n_tSteps,n_probes);
eXX_detectable_Ec03_10d = NaN(n_tSteps,n_probes);
eZZ_detectable_Ec03_10d = NaN(n_tSteps,n_probes);
eXX_detectable_Ec03_50d = NaN(n_tSteps,n_probes);
eZZ_detectable_Ec03_50d = NaN(n_tSteps,n_probes);
% parameter 04
eXX_detectable_Ec04_01d = NaN(n_tSteps,n_probes);
eZZ_detectable_Ec04_01d = NaN(n_tSteps,n_probes);
eXX_detectable_Ec04_03d = NaN(n_tSteps,n_probes);
eZZ_detectable_Ec04_03d = NaN(n_tSteps,n_probes);
eXX_detectable_Ec04_05d = NaN(n_tSteps,n_probes);
eZZ_detectable_Ec04_05d = NaN(n_tSteps,n_probes);
eXX_detectable_Ec04_10d = NaN(n_tSteps,n_probes);
eZZ_detectable_Ec04_10d = NaN(n_tSteps,n_probes);
eXX_detectable_Ec04_50d = NaN(n_tSteps,n_probes);
eZZ_detectable_Ec04_50d = NaN(n_tSteps,n_probes);
% parameter 05
eXX_detectable_Ec05_01d = NaN(n_tSteps,n_probes);
eZZ_detectable_Ec05_01d = NaN(n_tSteps,n_probes);
eXX_detectable_Ec05_03d = NaN(n_tSteps,n_probes);
eZZ_detectable_Ec05_03d = NaN(n_tSteps,n_probes);
eXX_detectable_Ec05_05d = NaN(n_tSteps,n_probes);
eZZ_detectable_Ec05_05d = NaN(n_tSteps,n_probes);
eXX_detectable_Ec05_10d = NaN(n_tSteps,n_probes);
eZZ_detectable_Ec05_10d = NaN(n_tSteps,n_probes);
eXX_detectable_Ec05_50d = NaN(n_tSteps,n_probes);
eZZ_detectable_Ec05_50d = NaN(n_tSteps,n_probes);

for i = 1:size(eXXmeasCriteria_Ec01_01d,2)
% ==================================================================================================== %
% Depth 1%
% ==================================================================================================== %
% parameter 01
    if sum(eXXmeasCriteria_Ec01_01d(:,i)) > 0
        eXX_detectable_Ec01_01d((eXXmeasCriteria_Ec01_01d(:,i)),i) = eXX_Ec01_01d((eXXmeasCriteria_Ec01_01d(:,i)),i);
    end
    if sum(eZZmeasCriteria_Ec01_01d(:,i)) > 0
        eZZ_detectable_Ec01_01d((eZZmeasCriteria_Ec01_01d(:,i)),i) = eZZ_Ec01_01d((eZZmeasCriteria_Ec01_01d(:,i)),i);
    end
% parameter 02
    if sum(eXXmeasCriteria_Ec02_01d(:,i)) > 0
        eXX_detectable_Ec02_01d((eXXmeasCriteria_Ec02_01d(:,i)),i) = eXX_Ec02_01d((eXXmeasCriteria_Ec02_01d(:,i)),i);
    end
    if sum(eZZmeasCriteria_Ec02_01d(:,i)) > 0
        eZZ_detectable_Ec02_01d((eZZmeasCriteria_Ec02_01d(:,i)),i) = eZZ_Ec02_01d((eZZmeasCriteria_Ec02_01d(:,i)),i);
    end
% parameter 03
    if sum(eXXmeasCriteria_Ec03_01d(:,i)) > 0
        eXX_detectable_Ec03_01d((eXXmeasCriteria_Ec03_01d(:,i)),i) = eXX_Ec03_01d((eXXmeasCriteria_Ec03_01d(:,i)),i);
    end
    if sum(eZZmeasCriteria_Ec03_01d(:,i)) > 0
        eZZ_detectable_Ec03_01d((eZZmeasCriteria_Ec03_01d(:,i)),i) = eZZ_Ec03_01d((eZZmeasCriteria_Ec03_01d(:,i)),i);
    end
% parameter 04
    if sum(eXXmeasCriteria_Ec04_01d(:,i)) > 0
        eXX_detectable_Ec04_01d((eXXmeasCriteria_Ec04_01d(:,i)),i) = eXX_Ec04_01d((eXXmeasCriteria_Ec04_01d(:,i)),i);
    end
    if sum(eZZmeasCriteria_Ec04_01d(:,i)) > 0
        eZZ_detectable_Ec04_01d((eZZmeasCriteria_Ec04_01d(:,i)),i) = eZZ_Ec04_01d((eZZmeasCriteria_Ec04_01d(:,i)),i);
    end
% parameter 05
    if sum(eXXmeasCriteria_Ec05_01d(:,i)) > 0
        eXX_detectable_Ec05_01d((eXXmeasCriteria_Ec05_01d(:,i)),i) = eXX_Ec05_01d((eXXmeasCriteria_Ec05_01d(:,i)),i);
    end
    if sum(eZZmeasCriteria_Ec05_01d(:,i)) > 0
        eZZ_detectable_Ec05_01d((eZZmeasCriteria_Ec05_01d(:,i)),i) = eZZ_Ec05_01d((eZZmeasCriteria_Ec05_01d(:,i)),i);
    end
    
% ==================================================================================================== %
% Depth 3%
% ==================================================================================================== %
% parameter 01
    if sum(eXXmeasCriteria_Ec01_03d(:,i)) > 0
        eXX_detectable_Ec01_03d((eXXmeasCriteria_Ec01_03d(:,i)),i) = eXX_Ec01_03d((eXXmeasCriteria_Ec01_03d(:,i)),i);
    end
    if sum(eZZmeasCriteria_Ec01_03d(:,i)) > 0
        eZZ_detectable_Ec01_03d((eZZmeasCriteria_Ec01_03d(:,i)),i) = eZZ_Ec01_03d((eZZmeasCriteria_Ec01_03d(:,i)),i);
    end
% parameter 02
    if sum(eXXmeasCriteria_Ec02_03d(:,i)) > 0
        eXX_detectable_Ec02_03d((eXXmeasCriteria_Ec02_03d(:,i)),i) = eXX_Ec02_03d((eXXmeasCriteria_Ec02_03d(:,i)),i);
    end
    if sum(eZZmeasCriteria_Ec02_03d(:,i)) > 0
        eZZ_detectable_Ec02_03d((eZZmeasCriteria_Ec02_03d(:,i)),i) = eZZ_Ec02_03d((eZZmeasCriteria_Ec02_03d(:,i)),i);
    end
% parameter 03
    if sum(eXXmeasCriteria_Ec03_03d(:,i)) > 0
        eXX_detectable_Ec03_03d((eXXmeasCriteria_Ec03_03d(:,i)),i) = eXX_Ec03_03d((eXXmeasCriteria_Ec03_03d(:,i)),i);
    end
    if sum(eZZmeasCriteria_Ec03_03d(:,i)) > 0
        eZZ_detectable_Ec03_03d((eZZmeasCriteria_Ec03_03d(:,i)),i) = eZZ_Ec03_03d((eZZmeasCriteria_Ec03_03d(:,i)),i);
    end
% parameter 04
    if sum(eXXmeasCriteria_Ec04_03d(:,i)) > 0
        eXX_detectable_Ec04_03d((eXXmeasCriteria_Ec04_03d(:,i)),i) = eXX_Ec04_03d((eXXmeasCriteria_Ec04_03d(:,i)),i);
    end
    if sum(eZZmeasCriteria_Ec04_03d(:,i)) > 0
        eZZ_detectable_Ec04_03d((eZZmeasCriteria_Ec04_03d(:,i)),i) = eZZ_Ec04_03d((eZZmeasCriteria_Ec04_03d(:,i)),i);
    end
% parameter 05
    if sum(eXXmeasCriteria_Ec05_03d(:,i)) > 0
        eXX_detectable_Ec05_03d((eXXmeasCriteria_Ec05_03d(:,i)),i) = eXX_Ec05_03d((eXXmeasCriteria_Ec05_03d(:,i)),i);
    end
    if sum(eZZmeasCriteria_Ec05_03d(:,i)) > 0
        eZZ_detectable_Ec05_03d((eZZmeasCriteria_Ec05_03d(:,i)),i) = eZZ_Ec05_03d((eZZmeasCriteria_Ec05_03d(:,i)),i);
    end

% ==================================================================================================== %
% Depth 5%
% ==================================================================================================== %
% parameter 01
    if sum(eXXmeasCriteria_Ec01_05d(:,i)) > 0
        eXX_detectable_Ec01_05d((eXXmeasCriteria_Ec01_05d(:,i)),i) = eXX_Ec01_05d((eXXmeasCriteria_Ec01_05d(:,i)),i);
    end
    if sum(eZZmeasCriteria_Ec01_05d(:,i)) > 0
        eZZ_detectable_Ec01_05d((eZZmeasCriteria_Ec01_05d(:,i)),i) = eZZ_Ec01_05d((eZZmeasCriteria_Ec01_05d(:,i)),i);
    end
% parameter 02
    if sum(eXXmeasCriteria_Ec02_05d(:,i)) > 0
        eXX_detectable_Ec02_05d((eXXmeasCriteria_Ec02_05d(:,i)),i) = eXX_Ec02_05d((eXXmeasCriteria_Ec02_05d(:,i)),i);
    end
    if sum(eZZmeasCriteria_Ec02_05d(:,i)) > 0
        eZZ_detectable_Ec02_05d((eZZmeasCriteria_Ec02_05d(:,i)),i) = eZZ_Ec02_05d((eZZmeasCriteria_Ec02_05d(:,i)),i);
    end
% parameter 03
    if sum(eXXmeasCriteria_Ec03_05d(:,i)) > 0
        eXX_detectable_Ec03_05d((eXXmeasCriteria_Ec03_05d(:,i)),i) = eXX_Ec03_05d((eXXmeasCriteria_Ec03_05d(:,i)),i);
    end
    if sum(eZZmeasCriteria_Ec03_05d(:,i)) > 0
        eZZ_detectable_Ec03_05d((eZZmeasCriteria_Ec03_05d(:,i)),i) = eZZ_Ec03_05d((eZZmeasCriteria_Ec03_05d(:,i)),i);
    end
% parameter 04
    if sum(eXXmeasCriteria_Ec04_05d(:,i)) > 0
        eXX_detectable_Ec04_05d((eXXmeasCriteria_Ec04_05d(:,i)),i) = eXX_Ec04_05d((eXXmeasCriteria_Ec04_05d(:,i)),i);
    end
    if sum(eZZmeasCriteria_Ec04_05d(:,i)) > 0
        eZZ_detectable_Ec04_05d((eZZmeasCriteria_Ec04_05d(:,i)),i) = eZZ_Ec04_05d((eZZmeasCriteria_Ec04_05d(:,i)),i);
    end
% parameter 05
    if sum(eXXmeasCriteria_Ec05_05d(:,i)) > 0
        eXX_detectable_Ec05_05d((eXXmeasCriteria_Ec05_05d(:,i)),i) = eXX_Ec05_05d((eXXmeasCriteria_Ec05_05d(:,i)),i);
    end
    if sum(eZZmeasCriteria_Ec05_05d(:,i)) > 0
        eZZ_detectable_Ec05_05d((eZZmeasCriteria_Ec05_05d(:,i)),i) = eZZ_Ec05_05d((eZZmeasCriteria_Ec05_05d(:,i)),i);
    end
    
% ==================================================================================================== %
% Depth 10%
% ==================================================================================================== %
% parameter 01
    if sum(eXXmeasCriteria_Ec01_10d(:,i)) > 0
        eXX_detectable_Ec01_10d((eXXmeasCriteria_Ec01_10d(:,i)),i) = eXX_Ec01_10d((eXXmeasCriteria_Ec01_10d(:,i)),i);
    end
    if sum(eZZmeasCriteria_Ec01_10d(:,i)) > 0
        eZZ_detectable_Ec01_10d((eZZmeasCriteria_Ec01_10d(:,i)),i) = eZZ_Ec01_10d((eZZmeasCriteria_Ec01_10d(:,i)),i);
    end
% parameter 02
    if sum(eXXmeasCriteria_Ec02_10d(:,i)) > 0
        eXX_detectable_Ec02_10d((eXXmeasCriteria_Ec02_10d(:,i)),i) = eXX_Ec02_10d((eXXmeasCriteria_Ec02_10d(:,i)),i);
    end
    if sum(eZZmeasCriteria_Ec02_10d(:,i)) > 0
        eZZ_detectable_Ec02_10d((eZZmeasCriteria_Ec02_10d(:,i)),i) = eZZ_Ec02_10d((eZZmeasCriteria_Ec02_10d(:,i)),i);
    end
% parameter 03
    if sum(eXXmeasCriteria_Ec03_10d(:,i)) > 0
        eXX_detectable_Ec03_10d((eXXmeasCriteria_Ec03_10d(:,i)),i) = eXX_Ec03_10d((eXXmeasCriteria_Ec03_10d(:,i)),i);
    end
    if sum(eZZmeasCriteria_Ec03_10d(:,i)) > 0
        eZZ_detectable_Ec03_10d((eZZmeasCriteria_Ec03_10d(:,i)),i) = eZZ_Ec03_10d((eZZmeasCriteria_Ec03_10d(:,i)),i);
    end
% parameter 04
    if sum(eXXmeasCriteria_Ec04_10d(:,i)) > 0
        eXX_detectable_Ec04_10d((eXXmeasCriteria_Ec04_10d(:,i)),i) = eXX_Ec04_10d((eXXmeasCriteria_Ec04_10d(:,i)),i);
    end
    if sum(eZZmeasCriteria_Ec04_10d(:,i)) > 0
        eZZ_detectable_Ec04_10d((eZZmeasCriteria_Ec04_10d(:,i)),i) = eZZ_Ec04_10d((eZZmeasCriteria_Ec04_10d(:,i)),i);
    end
% parameter 05
    if sum(eXXmeasCriteria_Ec05_10d(:,i)) > 0
        eXX_detectable_Ec05_10d((eXXmeasCriteria_Ec05_10d(:,i)),i) = eXX_Ec05_10d((eXXmeasCriteria_Ec05_10d(:,i)),i);
    end
    if sum(eZZmeasCriteria_Ec05_10d(:,i)) > 0
        eZZ_detectable_Ec05_10d((eZZmeasCriteria_Ec05_10d(:,i)),i) = eZZ_Ec05_10d((eZZmeasCriteria_Ec05_10d(:,i)),i);
    end

% ==================================================================================================== %
% Depth 50%
% ==================================================================================================== %
% parameter 01
    if sum(eXXmeasCriteria_Ec01_50d(:,i)) > 0
        eXX_detectable_Ec01_50d((eXXmeasCriteria_Ec01_50d(:,i)),i) = eXX_Ec01_50d((eXXmeasCriteria_Ec01_50d(:,i)),i);
    end
    if sum(eZZmeasCriteria_Ec01_50d(:,i)) > 0
        eZZ_detectable_Ec01_50d((eZZmeasCriteria_Ec01_50d(:,i)),i) = eZZ_Ec01_50d((eZZmeasCriteria_Ec01_50d(:,i)),i);
    end
% parameter 02
    if sum(eXXmeasCriteria_Ec02_50d(:,i)) > 0
        eXX_detectable_Ec02_50d((eXXmeasCriteria_Ec02_50d(:,i)),i) = eXX_Ec02_50d((eXXmeasCriteria_Ec02_50d(:,i)),i);
    end
    if sum(eZZmeasCriteria_Ec02_50d(:,i)) > 0
        eZZ_detectable_Ec02_50d((eZZmeasCriteria_Ec02_50d(:,i)),i) = eZZ_Ec02_50d((eZZmeasCriteria_Ec02_50d(:,i)),i);
    end
% parameter 03
    if sum(eXXmeasCriteria_Ec03_50d(:,i)) > 0
        eXX_detectable_Ec03_50d((eXXmeasCriteria_Ec03_50d(:,i)),i) = eXX_Ec03_50d((eXXmeasCriteria_Ec03_50d(:,i)),i);
    end
    if sum(eZZmeasCriteria_Ec03_50d(:,i)) > 0
        eZZ_detectable_Ec03_50d((eZZmeasCriteria_Ec03_50d(:,i)),i) = eZZ_Ec03_50d((eZZmeasCriteria_Ec03_50d(:,i)),i);
    end
% parameter 04
    if sum(eXXmeasCriteria_Ec04_50d(:,i)) > 0
        eXX_detectable_Ec04_50d((eXXmeasCriteria_Ec04_50d(:,i)),i) = eXX_Ec04_50d((eXXmeasCriteria_Ec04_50d(:,i)),i);
    end
    if sum(eZZmeasCriteria_Ec04_50d(:,i)) > 0
        eZZ_detectable_Ec04_50d((eZZmeasCriteria_Ec04_50d(:,i)),i) = eZZ_Ec04_50d((eZZmeasCriteria_Ec04_50d(:,i)),i);
    end
% parameter 05
    if sum(eXXmeasCriteria_Ec05_50d(:,i)) > 0
        eXX_detectable_Ec05_50d((eXXmeasCriteria_Ec05_50d(:,i)),i) = eXX_Ec05_50d((eXXmeasCriteria_Ec05_50d(:,i)),i);
    end
    if sum(eZZmeasCriteria_Ec05_50d(:,i)) > 0
        eZZ_detectable_Ec05_50d((eZZmeasCriteria_Ec05_50d(:,i)),i) = eZZ_Ec05_50d((eZZmeasCriteria_Ec05_50d(:,i)),i);
    end
end

%% Times of Dectectable Strain (mag>minMag & rate>minRate)

% parameter 01
t_eXX_detectable_Ec01_01d = zeros(n_tSteps,n_probes);
t_eZZ_detectable_Ec01_01d = zeros(n_tSteps,n_probes);
t_eXX_detectable_Ec01_03d = zeros(n_tSteps,n_probes);
t_eZZ_detectable_Ec01_03d = zeros(n_tSteps,n_probes);
t_eXX_detectable_Ec01_05d = zeros(n_tSteps,n_probes);
t_eZZ_detectable_Ec01_05d = zeros(n_tSteps,n_probes);
t_eXX_detectable_Ec01_10d = zeros(n_tSteps,n_probes);
t_eZZ_detectable_Ec01_10d = zeros(n_tSteps,n_probes);
t_eXX_detectable_Ec01_50d = zeros(n_tSteps,n_probes);
t_eZZ_detectable_Ec01_50d = zeros(n_tSteps,n_probes);
% parameter 02
t_eXX_detectable_Ec02_01d = zeros(n_tSteps,n_probes);
t_eZZ_detectable_Ec02_01d = zeros(n_tSteps,n_probes);
t_eXX_detectable_Ec02_03d = zeros(n_tSteps,n_probes);
t_eZZ_detectable_Ec02_03d = zeros(n_tSteps,n_probes);
t_eXX_detectable_Ec02_05d = zeros(n_tSteps,n_probes);
t_eZZ_detectable_Ec02_05d = zeros(n_tSteps,n_probes);
t_eXX_detectable_Ec02_10d = zeros(n_tSteps,n_probes);
t_eZZ_detectable_Ec02_10d = zeros(n_tSteps,n_probes);
t_eXX_detectable_Ec02_50d = zeros(n_tSteps,n_probes);
t_eZZ_detectable_Ec02_50d = zeros(n_tSteps,n_probes);
% parameter 03
t_eXX_detectable_Ec03_01d = zeros(n_tSteps,n_probes);
t_eZZ_detectable_Ec03_01d = zeros(n_tSteps,n_probes);
t_eXX_detectable_Ec03_03d = zeros(n_tSteps,n_probes);
t_eZZ_detectable_Ec03_03d = zeros(n_tSteps,n_probes);
t_eXX_detectable_Ec03_05d = zeros(n_tSteps,n_probes);
t_eZZ_detectable_Ec03_05d = zeros(n_tSteps,n_probes);
t_eXX_detectable_Ec03_10d = zeros(n_tSteps,n_probes);
t_eZZ_detectable_Ec03_10d = zeros(n_tSteps,n_probes);
t_eXX_detectable_Ec03_50d = zeros(n_tSteps,n_probes);
t_eZZ_detectable_Ec03_50d = zeros(n_tSteps,n_probes);
% parameter 04
t_eXX_detectable_Ec04_01d = zeros(n_tSteps,n_probes);
t_eZZ_detectable_Ec04_01d = zeros(n_tSteps,n_probes);
t_eXX_detectable_Ec04_03d = zeros(n_tSteps,n_probes);
t_eZZ_detectable_Ec04_03d = zeros(n_tSteps,n_probes);
t_eXX_detectable_Ec04_05d = zeros(n_tSteps,n_probes);
t_eZZ_detectable_Ec04_05d = zeros(n_tSteps,n_probes);
t_eXX_detectable_Ec04_10d = zeros(n_tSteps,n_probes);
t_eZZ_detectable_Ec04_10d = zeros(n_tSteps,n_probes);
t_eXX_detectable_Ec04_50d = zeros(n_tSteps,n_probes);
t_eZZ_detectable_Ec04_50d = zeros(n_tSteps,n_probes);
% parameter 05
t_eXX_detectable_Ec05_01d = zeros(n_tSteps,n_probes);
t_eZZ_detectable_Ec05_01d = zeros(n_tSteps,n_probes);
t_eXX_detectable_Ec05_03d = zeros(n_tSteps,n_probes);
t_eZZ_detectable_Ec05_03d = zeros(n_tSteps,n_probes);
t_eXX_detectable_Ec05_05d = zeros(n_tSteps,n_probes);
t_eZZ_detectable_Ec05_05d = zeros(n_tSteps,n_probes);
t_eXX_detectable_Ec05_10d = zeros(n_tSteps,n_probes);
t_eZZ_detectable_Ec05_10d = zeros(n_tSteps,n_probes);
t_eXX_detectable_Ec05_50d = zeros(n_tSteps,n_probes);
t_eZZ_detectable_Ec05_50d = zeros(n_tSteps,n_probes);

for i = 1:size(eXXmeasCriteria_Ec01_03d,2)
% ==================================================================================================== %
% Depth 1%
% ==================================================================================================== %
% parameter 01
    if sum(eXXmeasCriteria_Ec01_01d(:,i)) > 0
        t_eXX_detectable_Ec01_01d((eXXmeasCriteria_Ec01_01d(:,i)),i) = t(eXXmeasCriteria_Ec01_01d(:,i));
    end
    if sum(eZZmeasCriteria_Ec01_01d(:,i)) > 0
        t_eZZ_detectable_Ec01_01d((eZZmeasCriteria_Ec01_01d(:,i)),i) = t(eZZmeasCriteria_Ec01_01d(:,i));
    end
% parameter 02
    if sum(eXXmeasCriteria_Ec02_01d(:,i)) > 0
        t_eXX_detectable_Ec02_01d((eXXmeasCriteria_Ec02_01d(:,i)),i) = t(eXXmeasCriteria_Ec02_01d(:,i));
    end
    if sum(eZZmeasCriteria_Ec02_01d(:,i)) > 0
        t_eZZ_detectable_Ec02_01d((eZZmeasCriteria_Ec02_01d(:,i)),i) = t(eZZmeasCriteria_Ec02_01d(:,i));
    end
% parameter 03
    if sum(eXXmeasCriteria_Ec03_01d(:,i)) > 0
        t_eXX_detectable_Ec03_01d((eXXmeasCriteria_Ec03_01d(:,i)),i) = t(eXXmeasCriteria_Ec03_01d(:,i));
    end
    if sum(eZZmeasCriteria_Ec03_01d(:,i)) > 0
        t_eZZ_detectable_Ec03_01d((eZZmeasCriteria_Ec03_01d(:,i)),i) = t(eZZmeasCriteria_Ec03_01d(:,i));
    end
% parameter 04
    if sum(eXXmeasCriteria_Ec04_01d(:,i)) > 0
        t_eXX_detectable_Ec04_01d((eXXmeasCriteria_Ec04_01d(:,i)),i) = t(eXXmeasCriteria_Ec04_01d(:,i));
    end
    if sum(eZZmeasCriteria_Ec04_01d(:,i)) > 0
        t_eZZ_detectable_Ec04_01d((eZZmeasCriteria_Ec04_01d(:,i)),i) = t(eZZmeasCriteria_Ec04_01d(:,i));
    end
% parameter 05
    if sum(eXXmeasCriteria_Ec05_01d(:,i)) > 0
        t_eXX_detectable_Ec05_01d((eXXmeasCriteria_Ec05_01d(:,i)),i) = t(eXXmeasCriteria_Ec05_01d(:,i));
    end
    if sum(eZZmeasCriteria_Ec05_01d(:,i)) > 0
        t_eZZ_detectable_Ec05_01d((eZZmeasCriteria_Ec05_01d(:,i)),i) = t(eZZmeasCriteria_Ec05_01d(:,i));
    end

% ==================================================================================================== %
% Depth 3%
% ==================================================================================================== %
% parameter 01
    if sum(eXXmeasCriteria_Ec01_03d(:,i)) > 0
        t_eXX_detectable_Ec01_03d((eXXmeasCriteria_Ec01_03d(:,i)),i) = t(eXXmeasCriteria_Ec01_03d(:,i));
    end
    if sum(eZZmeasCriteria_Ec01_03d(:,i)) > 0
        t_eZZ_detectable_Ec01_03d((eZZmeasCriteria_Ec01_03d(:,i)),i) = t(eZZmeasCriteria_Ec01_03d(:,i));
    end
% parameter 02
    if sum(eXXmeasCriteria_Ec02_03d(:,i)) > 0
        t_eXX_detectable_Ec02_03d((eXXmeasCriteria_Ec02_03d(:,i)),i) = t(eXXmeasCriteria_Ec02_03d(:,i));
    end
    if sum(eZZmeasCriteria_Ec02_03d(:,i)) > 0
        t_eZZ_detectable_Ec02_03d((eZZmeasCriteria_Ec02_03d(:,i)),i) = t(eZZmeasCriteria_Ec02_03d(:,i));
    end
% parameter 03
    if sum(eXXmeasCriteria_Ec03_03d(:,i)) > 0
        t_eXX_detectable_Ec03_03d((eXXmeasCriteria_Ec03_03d(:,i)),i) = t(eXXmeasCriteria_Ec03_03d(:,i));
    end
    if sum(eZZmeasCriteria_Ec03_03d(:,i)) > 0
        t_eZZ_detectable_Ec03_03d((eZZmeasCriteria_Ec03_03d(:,i)),i) = t(eZZmeasCriteria_Ec03_03d(:,i));
    end
% parameter 04
    if sum(eXXmeasCriteria_Ec04_03d(:,i)) > 0
        t_eXX_detectable_Ec04_03d((eXXmeasCriteria_Ec04_03d(:,i)),i) = t(eXXmeasCriteria_Ec04_03d(:,i));
    end
    if sum(eZZmeasCriteria_Ec04_03d(:,i)) > 0
        t_eZZ_detectable_Ec04_03d((eZZmeasCriteria_Ec04_03d(:,i)),i) = t(eZZmeasCriteria_Ec04_03d(:,i));
    end
% parameter 05
    if sum(eXXmeasCriteria_Ec05_03d(:,i)) > 0
        t_eXX_detectable_Ec05_03d((eXXmeasCriteria_Ec05_03d(:,i)),i) = t(eXXmeasCriteria_Ec05_03d(:,i));
    end
    if sum(eZZmeasCriteria_Ec05_03d(:,i)) > 0
        t_eZZ_detectable_Ec05_03d((eZZmeasCriteria_Ec05_03d(:,i)),i) = t(eZZmeasCriteria_Ec05_03d(:,i));
    end
    
% ==================================================================================================== %
% Depth 5%
% ==================================================================================================== %
% parameter 01
    if sum(eXXmeasCriteria_Ec01_05d(:,i)) > 0
        t_eXX_detectable_Ec01_05d((eXXmeasCriteria_Ec01_05d(:,i)),i) = t(eXXmeasCriteria_Ec01_05d(:,i));
    end
    if sum(eZZmeasCriteria_Ec01_05d(:,i)) > 0
        t_eZZ_detectable_Ec01_05d((eZZmeasCriteria_Ec01_05d(:,i)),i) = t(eZZmeasCriteria_Ec01_05d(:,i));
    end
% parameter 02
    if sum(eXXmeasCriteria_Ec02_05d(:,i)) > 0
        t_eXX_detectable_Ec02_05d((eXXmeasCriteria_Ec02_05d(:,i)),i) = t(eXXmeasCriteria_Ec02_05d(:,i));
    end
    if sum(eZZmeasCriteria_Ec02_05d(:,i)) > 0
        t_eZZ_detectable_Ec02_05d((eZZmeasCriteria_Ec02_05d(:,i)),i) = t(eZZmeasCriteria_Ec02_05d(:,i));
    end
% parameter 03
    if sum(eXXmeasCriteria_Ec03_05d(:,i)) > 0
        t_eXX_detectable_Ec03_05d((eXXmeasCriteria_Ec03_05d(:,i)),i) = t(eXXmeasCriteria_Ec03_05d(:,i));
    end
    if sum(eZZmeasCriteria_Ec03_05d(:,i)) > 0
        t_eZZ_detectable_Ec03_05d((eZZmeasCriteria_Ec03_05d(:,i)),i) = t(eZZmeasCriteria_Ec03_05d(:,i));
    end
% parameter 04
    if sum(eXXmeasCriteria_Ec04_05d(:,i)) > 0
        t_eXX_detectable_Ec04_05d((eXXmeasCriteria_Ec04_05d(:,i)),i) = t(eXXmeasCriteria_Ec04_05d(:,i));
    end
    if sum(eZZmeasCriteria_Ec04_05d(:,i)) > 0
        t_eZZ_detectable_Ec04_05d((eZZmeasCriteria_Ec04_05d(:,i)),i) = t(eZZmeasCriteria_Ec04_05d(:,i));
    end
% parameter 05
    if sum(eXXmeasCriteria_Ec05_05d(:,i)) > 0
        t_eXX_detectable_Ec05_05d((eXXmeasCriteria_Ec05_05d(:,i)),i) = t(eXXmeasCriteria_Ec05_05d(:,i));
    end
    if sum(eZZmeasCriteria_Ec05_05d(:,i)) > 0
        t_eZZ_detectable_Ec05_05d((eZZmeasCriteria_Ec05_05d(:,i)),i) = t(eZZmeasCriteria_Ec05_05d(:,i));
    end

% ==================================================================================================== %
% Depth 10%
% ==================================================================================================== %
% parameter 01
    if sum(eXXmeasCriteria_Ec01_10d(:,i)) > 0
        t_eXX_detectable_Ec01_10d((eXXmeasCriteria_Ec01_10d(:,i)),i) = t(eXXmeasCriteria_Ec01_10d(:,i));
    end
    if sum(eZZmeasCriteria_Ec01_10d(:,i)) > 0
        t_eZZ_detectable_Ec01_10d((eZZmeasCriteria_Ec01_10d(:,i)),i) = t(eZZmeasCriteria_Ec01_10d(:,i));
    end
% parameter 02
    if sum(eXXmeasCriteria_Ec02_10d(:,i)) > 0
        t_eXX_detectable_Ec02_10d((eXXmeasCriteria_Ec02_10d(:,i)),i) = t(eXXmeasCriteria_Ec02_10d(:,i));
    end
    if sum(eZZmeasCriteria_Ec02_10d(:,i)) > 0
        t_eZZ_detectable_Ec02_10d((eZZmeasCriteria_Ec02_10d(:,i)),i) = t(eZZmeasCriteria_Ec02_10d(:,i));
    end
% parameter 03
    if sum(eXXmeasCriteria_Ec03_10d(:,i)) > 0
        t_eXX_detectable_Ec03_10d((eXXmeasCriteria_Ec03_10d(:,i)),i) = t(eXXmeasCriteria_Ec03_10d(:,i));
    end
    if sum(eZZmeasCriteria_Ec03_10d(:,i)) > 0
        t_eZZ_detectable_Ec03_10d((eZZmeasCriteria_Ec03_10d(:,i)),i) = t(eZZmeasCriteria_Ec03_10d(:,i));
    end
% parameter 04
    if sum(eXXmeasCriteria_Ec04_10d(:,i)) > 0
        t_eXX_detectable_Ec04_10d((eXXmeasCriteria_Ec04_10d(:,i)),i) = t(eXXmeasCriteria_Ec04_10d(:,i));
    end
    if sum(eZZmeasCriteria_Ec04_10d(:,i)) > 0
        t_eZZ_detectable_Ec04_10d((eZZmeasCriteria_Ec04_10d(:,i)),i) = t(eZZmeasCriteria_Ec04_10d(:,i));
    end
% parameter 05
    if sum(eXXmeasCriteria_Ec05_10d(:,i)) > 0
        t_eXX_detectable_Ec05_10d((eXXmeasCriteria_Ec05_10d(:,i)),i) = t(eXXmeasCriteria_Ec05_10d(:,i));
    end
    if sum(eZZmeasCriteria_Ec05_10d(:,i)) > 0
        t_eZZ_detectable_Ec05_10d((eZZmeasCriteria_Ec05_10d(:,i)),i) = t(eZZmeasCriteria_Ec05_10d(:,i));
    end

% ==================================================================================================== %
% Depth 50%
% ==================================================================================================== %
% parameter 01
    if sum(eXXmeasCriteria_Ec01_50d(:,i)) > 0
        t_eXX_detectable_Ec01_50d((eXXmeasCriteria_Ec01_50d(:,i)),i) = t(eXXmeasCriteria_Ec01_50d(:,i));
    end
    if sum(eZZmeasCriteria_Ec01_50d(:,i)) > 0
        t_eZZ_detectable_Ec01_50d((eZZmeasCriteria_Ec01_50d(:,i)),i) = t(eZZmeasCriteria_Ec01_50d(:,i));
    end
% parameter 02
    if sum(eXXmeasCriteria_Ec02_50d(:,i)) > 0
        t_eXX_detectable_Ec02_50d((eXXmeasCriteria_Ec02_50d(:,i)),i) = t(eXXmeasCriteria_Ec02_50d(:,i));
    end
    if sum(eZZmeasCriteria_Ec02_50d(:,i)) > 0
        t_eZZ_detectable_Ec02_50d((eZZmeasCriteria_Ec02_50d(:,i)),i) = t(eZZmeasCriteria_Ec02_50d(:,i));
    end
% parameter 03
    if sum(eXXmeasCriteria_Ec03_50d(:,i)) > 0
        t_eXX_detectable_Ec03_50d((eXXmeasCriteria_Ec03_50d(:,i)),i) = t(eXXmeasCriteria_Ec03_50d(:,i));
    end
    if sum(eZZmeasCriteria_Ec03_50d(:,i)) > 0
        t_eZZ_detectable_Ec03_50d((eZZmeasCriteria_Ec03_50d(:,i)),i) = t(eZZmeasCriteria_Ec03_50d(:,i));
    end
% parameter 04
    if sum(eXXmeasCriteria_Ec04_50d(:,i)) > 0
        t_eXX_detectable_Ec04_50d((eXXmeasCriteria_Ec04_50d(:,i)),i) = t(eXXmeasCriteria_Ec04_50d(:,i));
    end
    if sum(eZZmeasCriteria_Ec04_50d(:,i)) > 0
        t_eZZ_detectable_Ec04_50d((eZZmeasCriteria_Ec04_50d(:,i)),i) = t(eZZmeasCriteria_Ec04_50d(:,i));
    end
% parameter 05
    if sum(eXXmeasCriteria_Ec05_50d(:,i)) > 0
        t_eXX_detectable_Ec05_50d((eXXmeasCriteria_Ec05_50d(:,i)),i) = t(eXXmeasCriteria_Ec05_50d(:,i));
    end
    if sum(eZZmeasCriteria_Ec05_50d(:,i)) > 0
        t_eZZ_detectable_Ec05_50d((eZZmeasCriteria_Ec05_50d(:,i)),i) = t(eZZmeasCriteria_Ec05_50d(:,i));
    end
end

%% Duration Strain is Detectable

% ==================================================================================================== %
% First and last time strain is detectable
% ==================================================================================================== %
% parameter 01
tFirst_eXX_detectable_Ec01_01d  = zeros(1,n_probes);
tLast_eXX_detectable_Ec01_01d   = zeros(1,n_probes);
tFirst_eZZ_detectable_Ec01_01d  = zeros(1,n_probes);
tLast_eZZ_detectable_Ec01_01d   = zeros(1,n_probes);
tFirst_eXX_detectable_Ec01_03d  = zeros(1,n_probes);
tLast_eXX_detectable_Ec01_03d   = zeros(1,n_probes);
tFirst_eZZ_detectable_Ec01_03d  = zeros(1,n_probes);
tLast_eZZ_detectable_Ec01_03d   = zeros(1,n_probes);
tFirst_eXX_detectable_Ec01_05d  = zeros(1,n_probes);
tLast_eXX_detectable_Ec01_05d   = zeros(1,n_probes);
tFirst_eZZ_detectable_Ec01_05d  = zeros(1,n_probes);
tLast_eZZ_detectable_Ec01_05d   = zeros(1,n_probes);
tFirst_eXX_detectable_Ec01_10d  = zeros(1,n_probes);
tLast_eXX_detectable_Ec01_10d   = zeros(1,n_probes);
tFirst_eZZ_detectable_Ec01_10d  = zeros(1,n_probes);
tLast_eZZ_detectable_Ec01_10d   = zeros(1,n_probes);
tFirst_eXX_detectable_Ec01_50d  = zeros(1,n_probes);
tLast_eXX_detectable_Ec01_50d   = zeros(1,n_probes);
tFirst_eZZ_detectable_Ec01_50d  = zeros(1,n_probes);
tLast_eZZ_detectable_Ec01_50d   = zeros(1,n_probes);
% parameter 02
tFirst_eXX_detectable_Ec02_01d  = zeros(1,n_probes);
tLast_eXX_detectable_Ec02_01d   = zeros(1,n_probes);
tFirst_eZZ_detectable_Ec02_01d  = zeros(1,n_probes);
tLast_eZZ_detectable_Ec02_01d   = zeros(1,n_probes);
tFirst_eXX_detectable_Ec02_03d  = zeros(1,n_probes);
tLast_eXX_detectable_Ec02_03d   = zeros(1,n_probes);
tFirst_eZZ_detectable_Ec02_03d  = zeros(1,n_probes);
tLast_eZZ_detectable_Ec02_03d   = zeros(1,n_probes);
tFirst_eXX_detectable_Ec02_05d  = zeros(1,n_probes);
tLast_eXX_detectable_Ec02_05d   = zeros(1,n_probes);
tFirst_eZZ_detectable_Ec02_05d  = zeros(1,n_probes);
tLast_eZZ_detectable_Ec02_05d   = zeros(1,n_probes);
tFirst_eXX_detectable_Ec02_10d  = zeros(1,n_probes);
tLast_eXX_detectable_Ec02_10d   = zeros(1,n_probes);
tFirst_eZZ_detectable_Ec02_10d  = zeros(1,n_probes);
tLast_eZZ_detectable_Ec02_10d   = zeros(1,n_probes);
tFirst_eXX_detectable_Ec02_50d  = zeros(1,n_probes);
tLast_eXX_detectable_Ec02_50d   = zeros(1,n_probes);
tFirst_eZZ_detectable_Ec02_50d  = zeros(1,n_probes);
tLast_eZZ_detectable_Ec02_50d   = zeros(1,n_probes);
% parameter 03
tFirst_eXX_detectable_Ec03_01d  = zeros(1,n_probes);
tLast_eXX_detectable_Ec03_01d   = zeros(1,n_probes);
tFirst_eZZ_detectable_Ec03_01d  = zeros(1,n_probes);
tLast_eZZ_detectable_Ec03_01d   = zeros(1,n_probes);
tFirst_eXX_detectable_Ec03_03d  = zeros(1,n_probes);
tLast_eXX_detectable_Ec03_03d   = zeros(1,n_probes);
tFirst_eZZ_detectable_Ec03_03d  = zeros(1,n_probes);
tLast_eZZ_detectable_Ec03_03d   = zeros(1,n_probes);
tFirst_eXX_detectable_Ec03_05d  = zeros(1,n_probes);
tLast_eXX_detectable_Ec03_05d   = zeros(1,n_probes);
tFirst_eZZ_detectable_Ec03_05d  = zeros(1,n_probes);
tLast_eZZ_detectable_Ec03_05d   = zeros(1,n_probes);
tFirst_eXX_detectable_Ec03_10d  = zeros(1,n_probes);
tLast_eXX_detectable_Ec03_10d   = zeros(1,n_probes);
tFirst_eZZ_detectable_Ec03_10d  = zeros(1,n_probes);
tLast_eZZ_detectable_Ec03_10d   = zeros(1,n_probes);
tFirst_eXX_detectable_Ec03_50d  = zeros(1,n_probes);
tLast_eXX_detectable_Ec03_50d   = zeros(1,n_probes);
tFirst_eZZ_detectable_Ec03_50d  = zeros(1,n_probes);
tLast_eZZ_detectable_Ec03_50d   = zeros(1,n_probes);
% parameter 04
tFirst_eXX_detectable_Ec04_01d  = zeros(1,n_probes);
tLast_eXX_detectable_Ec04_01d   = zeros(1,n_probes);
tFirst_eZZ_detectable_Ec04_01d  = zeros(1,n_probes);
tLast_eZZ_detectable_Ec04_01d   = zeros(1,n_probes);
tFirst_eXX_detectable_Ec04_03d  = zeros(1,n_probes);
tLast_eXX_detectable_Ec04_03d   = zeros(1,n_probes);
tFirst_eZZ_detectable_Ec04_03d  = zeros(1,n_probes);
tLast_eZZ_detectable_Ec04_03d   = zeros(1,n_probes);
tFirst_eXX_detectable_Ec04_05d  = zeros(1,n_probes);
tLast_eXX_detectable_Ec04_05d   = zeros(1,n_probes);
tFirst_eZZ_detectable_Ec04_05d  = zeros(1,n_probes);
tLast_eZZ_detectable_Ec04_05d   = zeros(1,n_probes);
tFirst_eXX_detectable_Ec04_10d  = zeros(1,n_probes);
tLast_eXX_detectable_Ec04_10d   = zeros(1,n_probes);
tFirst_eZZ_detectable_Ec04_10d  = zeros(1,n_probes);
tLast_eZZ_detectable_Ec04_10d   = zeros(1,n_probes);
tFirst_eXX_detectable_Ec04_50d  = zeros(1,n_probes);
tLast_eXX_detectable_Ec04_50d   = zeros(1,n_probes);
tFirst_eZZ_detectable_Ec04_50d  = zeros(1,n_probes);
tLast_eZZ_detectable_Ec04_50d   = zeros(1,n_probes);
% parameter 05
tFirst_eXX_detectable_Ec05_01d  = zeros(1,n_probes);
tLast_eXX_detectable_Ec05_01d   = zeros(1,n_probes);
tFirst_eZZ_detectable_Ec05_01d  = zeros(1,n_probes);
tLast_eZZ_detectable_Ec05_01d   = zeros(1,n_probes);
tFirst_eXX_detectable_Ec05_03d  = zeros(1,n_probes);
tLast_eXX_detectable_Ec05_03d   = zeros(1,n_probes);
tFirst_eZZ_detectable_Ec05_03d  = zeros(1,n_probes);
tLast_eZZ_detectable_Ec05_03d   = zeros(1,n_probes);
tFirst_eXX_detectable_Ec05_05d  = zeros(1,n_probes);
tLast_eXX_detectable_Ec05_05d   = zeros(1,n_probes);
tFirst_eZZ_detectable_Ec05_05d  = zeros(1,n_probes);
tLast_eZZ_detectable_Ec05_05d   = zeros(1,n_probes);
tFirst_eXX_detectable_Ec05_10d  = zeros(1,n_probes);
tLast_eXX_detectable_Ec05_10d   = zeros(1,n_probes);
tFirst_eZZ_detectable_Ec05_10d  = zeros(1,n_probes);
tLast_eZZ_detectable_Ec05_10d   = zeros(1,n_probes);
tFirst_eXX_detectable_Ec05_50d  = zeros(1,n_probes);
tLast_eXX_detectable_Ec05_50d   = zeros(1,n_probes);
tFirst_eZZ_detectable_Ec05_50d  = zeros(1,n_probes);
tLast_eZZ_detectable_Ec05_50d   = zeros(1,n_probes);

for i = 1:n_probes
% ==================================================================================================== %
% Depth 1%
% ==================================================================================================== %
% parameter 01
    if sum(t_eXX_detectable_Ec01_01d(:,i)) > 0
        tFirst_eXX_detectable_Ec01_01d(i) = t_eXX_detectable_Ec01_01d(find(t_eXX_detectable_Ec01_01d(:,i),1,'first'));
        tLast_eXX_detectable_Ec01_01d(i) = t_eXX_detectable_Ec01_01d(find(t_eXX_detectable_Ec01_01d(:,i),1,'last'));
    end
    if sum(t_eZZ_detectable_Ec01_01d(:,i)) > 0
        tFirst_eZZ_detectable_Ec01_01d(i) = t_eZZ_detectable_Ec01_01d(find(t_eZZ_detectable_Ec01_01d(:,i),1,'first'));
        tLast_eZZ_detectable_Ec01_01d(i) = t_eZZ_detectable_Ec01_01d(find(t_eZZ_detectable_Ec01_01d(:,i),1,'last'));
    end
% parameter 02
    if sum(t_eXX_detectable_Ec02_01d(:,i)) > 0
        tFirst_eXX_detectable_Ec02_01d(i) = t_eXX_detectable_Ec02_01d(find(t_eXX_detectable_Ec02_01d(:,i),1,'first'));
        tLast_eXX_detectable_Ec02_01d(i) = t_eXX_detectable_Ec02_01d(find(t_eXX_detectable_Ec02_01d(:,i),1,'last'));
    end
    if sum(t_eZZ_detectable_Ec02_01d(:,i)) > 0
        tFirst_eZZ_detectable_Ec02_01d(i) = t_eZZ_detectable_Ec02_01d(find(t_eZZ_detectable_Ec02_01d(:,i),1,'first'));
        tLast_eZZ_detectable_Ec02_01d(i) = t_eZZ_detectable_Ec02_01d(find(t_eZZ_detectable_Ec02_01d(:,i),1,'last'));
    end
% parameter 03
    if sum(t_eXX_detectable_Ec03_01d(:,i)) > 0
        tFirst_eXX_detectable_Ec03_01d(i) = t_eXX_detectable_Ec03_01d(find(t_eXX_detectable_Ec03_01d(:,i),1,'first'));
        tLast_eXX_detectable_Ec03_01d(i) = t_eXX_detectable_Ec03_01d(find(t_eXX_detectable_Ec03_01d(:,i),1,'last'));
    end
    if sum(t_eZZ_detectable_Ec03_01d(:,i)) > 0
        tFirst_eZZ_detectable_Ec03_01d(i) = t_eZZ_detectable_Ec03_01d(find(t_eZZ_detectable_Ec03_01d(:,i),1,'first'));
        tLast_eZZ_detectable_Ec03_01d(i) = t_eZZ_detectable_Ec03_01d(find(t_eZZ_detectable_Ec03_01d(:,i),1,'last'));
    end
% parameter 04
    if sum(t_eXX_detectable_Ec04_01d(:,i)) > 0
        tFirst_eXX_detectable_Ec04_01d(i) = t_eXX_detectable_Ec04_01d(find(t_eXX_detectable_Ec04_01d(:,i),1,'first'));
        tLast_eXX_detectable_Ec04_01d(i) = t_eXX_detectable_Ec04_01d(find(t_eXX_detectable_Ec04_01d(:,i),1,'last'));
    end
    if sum(t_eZZ_detectable_Ec04_01d(:,i)) > 0
        tFirst_eZZ_detectable_Ec04_01d(i) = t_eZZ_detectable_Ec04_01d(find(t_eZZ_detectable_Ec04_01d(:,i),1,'first'));
        tLast_eZZ_detectable_Ec04_01d(i) = t_eZZ_detectable_Ec04_01d(find(t_eZZ_detectable_Ec04_01d(:,i),1,'last'));
    end
% parameter 05
    if sum(t_eXX_detectable_Ec05_01d(:,i)) > 0
        tFirst_eXX_detectable_Ec05_01d(i) = t_eXX_detectable_Ec05_01d(find(t_eXX_detectable_Ec05_01d(:,i),1,'first'));
        tLast_eXX_detectable_Ec05_01d(i) = t_eXX_detectable_Ec05_01d(find(t_eXX_detectable_Ec05_01d(:,i),1,'last'));
    end
    if sum(t_eZZ_detectable_Ec05_01d(:,i)) > 0
        tFirst_eZZ_detectable_Ec05_01d(i) = t_eZZ_detectable_Ec05_01d(find(t_eZZ_detectable_Ec05_01d(:,i),1,'first'));
        tLast_eZZ_detectable_Ec05_01d(i) = t_eZZ_detectable_Ec05_01d(find(t_eZZ_detectable_Ec05_01d(:,i),1,'last'));
    end
    
% ==================================================================================================== %
% Depth 3%
% ==================================================================================================== %
% parameter 01
    if sum(t_eXX_detectable_Ec01_03d(:,i)) > 0
        tFirst_eXX_detectable_Ec01_03d(i) = t_eXX_detectable_Ec01_03d(find(t_eXX_detectable_Ec01_03d(:,i),1,'first'));
        tLast_eXX_detectable_Ec01_03d(i) = t_eXX_detectable_Ec01_03d(find(t_eXX_detectable_Ec01_03d(:,i),1,'last'));
    end
    if sum(t_eZZ_detectable_Ec01_03d(:,i)) > 0
        tFirst_eZZ_detectable_Ec01_03d(i) = t_eZZ_detectable_Ec01_03d(find(t_eZZ_detectable_Ec01_03d(:,i),1,'first'));
        tLast_eZZ_detectable_Ec01_03d(i) = t_eZZ_detectable_Ec01_03d(find(t_eZZ_detectable_Ec01_03d(:,i),1,'last'));
    end
% parameter 02
    if sum(t_eXX_detectable_Ec02_03d(:,i)) > 0
        tFirst_eXX_detectable_Ec02_03d(i) = t_eXX_detectable_Ec02_03d(find(t_eXX_detectable_Ec02_03d(:,i),1,'first'));
        tLast_eXX_detectable_Ec02_03d(i) = t_eXX_detectable_Ec02_03d(find(t_eXX_detectable_Ec02_03d(:,i),1,'last'));
    end
    if sum(t_eZZ_detectable_Ec02_03d(:,i)) > 0
        tFirst_eZZ_detectable_Ec02_03d(i) = t_eZZ_detectable_Ec02_03d(find(t_eZZ_detectable_Ec02_03d(:,i),1,'first'));
        tLast_eZZ_detectable_Ec02_03d(i) = t_eZZ_detectable_Ec02_03d(find(t_eZZ_detectable_Ec02_03d(:,i),1,'last'));
    end
% parameter 03
    if sum(t_eXX_detectable_Ec03_03d(:,i)) > 0
        tFirst_eXX_detectable_Ec03_03d(i) = t_eXX_detectable_Ec03_03d(find(t_eXX_detectable_Ec03_03d(:,i),1,'first'));
        tLast_eXX_detectable_Ec03_03d(i) = t_eXX_detectable_Ec03_03d(find(t_eXX_detectable_Ec03_03d(:,i),1,'last'));
    end
    if sum(t_eZZ_detectable_Ec03_03d(:,i)) > 0
        tFirst_eZZ_detectable_Ec03_03d(i) = t_eZZ_detectable_Ec03_03d(find(t_eZZ_detectable_Ec03_03d(:,i),1,'first'));
        tLast_eZZ_detectable_Ec03_03d(i) = t_eZZ_detectable_Ec03_03d(find(t_eZZ_detectable_Ec03_03d(:,i),1,'last'));
    end
% parameter 04
    if sum(t_eXX_detectable_Ec04_03d(:,i)) > 0
        tFirst_eXX_detectable_Ec04_03d(i) = t_eXX_detectable_Ec04_03d(find(t_eXX_detectable_Ec04_03d(:,i),1,'first'));
        tLast_eXX_detectable_Ec04_03d(i) = t_eXX_detectable_Ec04_03d(find(t_eXX_detectable_Ec04_03d(:,i),1,'last'));
    end
    if sum(t_eZZ_detectable_Ec04_03d(:,i)) > 0
        tFirst_eZZ_detectable_Ec04_03d(i) = t_eZZ_detectable_Ec04_03d(find(t_eZZ_detectable_Ec04_03d(:,i),1,'first'));
        tLast_eZZ_detectable_Ec04_03d(i) = t_eZZ_detectable_Ec04_03d(find(t_eZZ_detectable_Ec04_03d(:,i),1,'last'));
    end
% parameter 05
    if sum(t_eXX_detectable_Ec05_03d(:,i)) > 0
        tFirst_eXX_detectable_Ec05_03d(i) = t_eXX_detectable_Ec05_03d(find(t_eXX_detectable_Ec05_03d(:,i),1,'first'));
        tLast_eXX_detectable_Ec05_03d(i) = t_eXX_detectable_Ec05_03d(find(t_eXX_detectable_Ec05_03d(:,i),1,'last'));
    end
    if sum(t_eZZ_detectable_Ec05_03d(:,i)) > 0
        tFirst_eZZ_detectable_Ec05_03d(i) = t_eZZ_detectable_Ec05_03d(find(t_eZZ_detectable_Ec05_03d(:,i),1,'first'));
        tLast_eZZ_detectable_Ec05_03d(i) = t_eZZ_detectable_Ec05_03d(find(t_eZZ_detectable_Ec05_03d(:,i),1,'last'));
    end

% ==================================================================================================== %
% Depth 5%
% ==================================================================================================== %
% parameter 01
    if sum(t_eXX_detectable_Ec01_05d(:,i)) > 0
        tFirst_eXX_detectable_Ec01_05d(i) = t_eXX_detectable_Ec01_05d(find(t_eXX_detectable_Ec01_05d(:,i),1,'first'));
        tLast_eXX_detectable_Ec01_05d(i) = t_eXX_detectable_Ec01_05d(find(t_eXX_detectable_Ec01_05d(:,i),1,'last'));
    end
    if sum(t_eZZ_detectable_Ec01_05d(:,i)) > 0
        tFirst_eZZ_detectable_Ec01_05d(i) = t_eZZ_detectable_Ec01_05d(find(t_eZZ_detectable_Ec01_05d(:,i),1,'first'));
        tLast_eZZ_detectable_Ec01_05d(i) = t_eZZ_detectable_Ec01_05d(find(t_eZZ_detectable_Ec01_05d(:,i),1,'last'));
    end
% parameter 02
    if sum(t_eXX_detectable_Ec02_05d(:,i)) > 0
        tFirst_eXX_detectable_Ec02_05d(i) = t_eXX_detectable_Ec02_05d(find(t_eXX_detectable_Ec02_05d(:,i),1,'first'));
        tLast_eXX_detectable_Ec02_05d(i) = t_eXX_detectable_Ec02_05d(find(t_eXX_detectable_Ec02_05d(:,i),1,'last'));
    end
    if sum(t_eZZ_detectable_Ec02_05d(:,i)) > 0
        tFirst_eZZ_detectable_Ec02_05d(i) = t_eZZ_detectable_Ec02_05d(find(t_eZZ_detectable_Ec02_05d(:,i),1,'first'));
        tLast_eZZ_detectable_Ec02_05d(i) = t_eZZ_detectable_Ec02_05d(find(t_eZZ_detectable_Ec02_05d(:,i),1,'last'));
    end
% parameter 03
    if sum(t_eXX_detectable_Ec03_05d(:,i)) > 0
        tFirst_eXX_detectable_Ec03_05d(i) = t_eXX_detectable_Ec03_05d(find(t_eXX_detectable_Ec03_05d(:,i),1,'first'));
        tLast_eXX_detectable_Ec03_05d(i) = t_eXX_detectable_Ec03_05d(find(t_eXX_detectable_Ec03_05d(:,i),1,'last'));
    end
    if sum(t_eZZ_detectable_Ec03_05d(:,i)) > 0
        tFirst_eZZ_detectable_Ec03_05d(i) = t_eZZ_detectable_Ec03_05d(find(t_eZZ_detectable_Ec03_05d(:,i),1,'first'));
        tLast_eZZ_detectable_Ec03_05d(i) = t_eZZ_detectable_Ec03_05d(find(t_eZZ_detectable_Ec03_05d(:,i),1,'last'));
    end
% parameter 04
    if sum(t_eXX_detectable_Ec04_05d(:,i)) > 0
        tFirst_eXX_detectable_Ec04_05d(i) = t_eXX_detectable_Ec04_05d(find(t_eXX_detectable_Ec04_05d(:,i),1,'first'));
        tLast_eXX_detectable_Ec04_05d(i) = t_eXX_detectable_Ec04_05d(find(t_eXX_detectable_Ec04_05d(:,i),1,'last'));
    end
    if sum(t_eZZ_detectable_Ec04_05d(:,i)) > 0
        tFirst_eZZ_detectable_Ec04_05d(i) = t_eZZ_detectable_Ec04_05d(find(t_eZZ_detectable_Ec04_05d(:,i),1,'first'));
        tLast_eZZ_detectable_Ec04_05d(i) = t_eZZ_detectable_Ec04_05d(find(t_eZZ_detectable_Ec04_05d(:,i),1,'last'));
    end
% parameter 05
    if sum(t_eXX_detectable_Ec05_05d(:,i)) > 0
        tFirst_eXX_detectable_Ec05_05d(i) = t_eXX_detectable_Ec05_05d(find(t_eXX_detectable_Ec05_05d(:,i),1,'first'));
        tLast_eXX_detectable_Ec05_05d(i) = t_eXX_detectable_Ec05_05d(find(t_eXX_detectable_Ec05_05d(:,i),1,'last'));
    end
    if sum(t_eZZ_detectable_Ec05_05d(:,i)) > 0
        tFirst_eZZ_detectable_Ec05_05d(i) = t_eZZ_detectable_Ec05_05d(find(t_eZZ_detectable_Ec05_05d(:,i),1,'first'));
        tLast_eZZ_detectable_Ec05_05d(i) = t_eZZ_detectable_Ec05_05d(find(t_eZZ_detectable_Ec05_05d(:,i),1,'last'));
    end

% ==================================================================================================== %
% Depth 10%
% ==================================================================================================== %
% parameter 01
    if sum(t_eXX_detectable_Ec01_10d(:,i)) > 0
        tFirst_eXX_detectable_Ec01_10d(i) = t_eXX_detectable_Ec01_10d(find(t_eXX_detectable_Ec01_10d(:,i),1,'first'));
        tLast_eXX_detectable_Ec01_10d(i) = t_eXX_detectable_Ec01_10d(find(t_eXX_detectable_Ec01_10d(:,i),1,'last'));
    end
    if sum(t_eZZ_detectable_Ec01_10d(:,i)) > 0
        tFirst_eZZ_detectable_Ec01_10d(i) = t_eZZ_detectable_Ec01_10d(find(t_eZZ_detectable_Ec01_10d(:,i),1,'first'));
        tLast_eZZ_detectable_Ec01_10d(i) = t_eZZ_detectable_Ec01_10d(find(t_eZZ_detectable_Ec01_10d(:,i),1,'last'));
    end
% parameter 02
    if sum(t_eXX_detectable_Ec02_10d(:,i)) > 0
        tFirst_eXX_detectable_Ec02_10d(i) = t_eXX_detectable_Ec02_10d(find(t_eXX_detectable_Ec02_10d(:,i),1,'first'));
        tLast_eXX_detectable_Ec02_10d(i) = t_eXX_detectable_Ec02_10d(find(t_eXX_detectable_Ec02_10d(:,i),1,'last'));
    end
    if sum(t_eZZ_detectable_Ec02_10d(:,i)) > 0
        tFirst_eZZ_detectable_Ec02_10d(i) = t_eZZ_detectable_Ec02_10d(find(t_eZZ_detectable_Ec02_10d(:,i),1,'first'));
        tLast_eZZ_detectable_Ec02_10d(i) = t_eZZ_detectable_Ec02_10d(find(t_eZZ_detectable_Ec02_10d(:,i),1,'last'));
    end
% parameter 03
    if sum(t_eXX_detectable_Ec03_10d(:,i)) > 0
        tFirst_eXX_detectable_Ec03_10d(i) = t_eXX_detectable_Ec03_10d(find(t_eXX_detectable_Ec03_10d(:,i),1,'first'));
        tLast_eXX_detectable_Ec03_10d(i) = t_eXX_detectable_Ec03_10d(find(t_eXX_detectable_Ec03_10d(:,i),1,'last'));
    end
    if sum(t_eZZ_detectable_Ec03_10d(:,i)) > 0
        tFirst_eZZ_detectable_Ec03_10d(i) = t_eZZ_detectable_Ec03_10d(find(t_eZZ_detectable_Ec03_10d(:,i),1,'first'));
        tLast_eZZ_detectable_Ec03_10d(i) = t_eZZ_detectable_Ec03_10d(find(t_eZZ_detectable_Ec03_10d(:,i),1,'last'));
    end
% parameter 04
    if sum(t_eXX_detectable_Ec04_10d(:,i)) > 0
        tFirst_eXX_detectable_Ec04_10d(i) = t_eXX_detectable_Ec04_10d(find(t_eXX_detectable_Ec04_10d(:,i),1,'first'));
        tLast_eXX_detectable_Ec04_10d(i) = t_eXX_detectable_Ec04_10d(find(t_eXX_detectable_Ec04_10d(:,i),1,'last'));
    end
    if sum(t_eZZ_detectable_Ec04_10d(:,i)) > 0
        tFirst_eZZ_detectable_Ec04_10d(i) = t_eZZ_detectable_Ec04_10d(find(t_eZZ_detectable_Ec04_10d(:,i),1,'first'));
        tLast_eZZ_detectable_Ec04_10d(i) = t_eZZ_detectable_Ec04_10d(find(t_eZZ_detectable_Ec04_10d(:,i),1,'last'));
    end
% parameter 05
    if sum(t_eXX_detectable_Ec05_10d(:,i)) > 0
        tFirst_eXX_detectable_Ec05_10d(i) = t_eXX_detectable_Ec05_10d(find(t_eXX_detectable_Ec05_10d(:,i),1,'first'));
        tLast_eXX_detectable_Ec05_10d(i) = t_eXX_detectable_Ec05_10d(find(t_eXX_detectable_Ec05_10d(:,i),1,'last'));
    end
    if sum(t_eZZ_detectable_Ec05_10d(:,i)) > 0
        tFirst_eZZ_detectable_Ec05_10d(i) = t_eZZ_detectable_Ec05_10d(find(t_eZZ_detectable_Ec05_10d(:,i),1,'first'));
        tLast_eZZ_detectable_Ec05_10d(i) = t_eZZ_detectable_Ec05_10d(find(t_eZZ_detectable_Ec05_10d(:,i),1,'last'));
    end

% ==================================================================================================== %
% Depth 50%
% ==================================================================================================== %
% parameter 01
    if sum(t_eXX_detectable_Ec01_50d(:,i)) > 0
        tFirst_eXX_detectable_Ec01_50d(i) = t_eXX_detectable_Ec01_50d(find(t_eXX_detectable_Ec01_50d(:,i),1,'first'));
        tLast_eXX_detectable_Ec01_50d(i) = t_eXX_detectable_Ec01_50d(find(t_eXX_detectable_Ec01_50d(:,i),1,'last'));
    end
    if sum(t_eZZ_detectable_Ec01_50d(:,i)) > 0
        tFirst_eZZ_detectable_Ec01_50d(i) = t_eZZ_detectable_Ec01_50d(find(t_eZZ_detectable_Ec01_50d(:,i),1,'first'));
        tLast_eZZ_detectable_Ec01_50d(i) = t_eZZ_detectable_Ec01_50d(find(t_eZZ_detectable_Ec01_50d(:,i),1,'last'));
    end
% parameter 02
    if sum(t_eXX_detectable_Ec02_50d(:,i)) > 0
        tFirst_eXX_detectable_Ec02_50d(i) = t_eXX_detectable_Ec02_50d(find(t_eXX_detectable_Ec02_50d(:,i),1,'first'));
        tLast_eXX_detectable_Ec02_50d(i) = t_eXX_detectable_Ec02_50d(find(t_eXX_detectable_Ec02_50d(:,i),1,'last'));
    end
    if sum(t_eZZ_detectable_Ec02_50d(:,i)) > 0
        tFirst_eZZ_detectable_Ec02_50d(i) = t_eZZ_detectable_Ec02_50d(find(t_eZZ_detectable_Ec02_50d(:,i),1,'first'));
        tLast_eZZ_detectable_Ec02_50d(i) = t_eZZ_detectable_Ec02_50d(find(t_eZZ_detectable_Ec02_50d(:,i),1,'last'));
    end
% parameter 03
    if sum(t_eXX_detectable_Ec03_50d(:,i)) > 0
        tFirst_eXX_detectable_Ec03_50d(i) = t_eXX_detectable_Ec03_50d(find(t_eXX_detectable_Ec03_50d(:,i),1,'first'));
        tLast_eXX_detectable_Ec03_50d(i) = t_eXX_detectable_Ec03_50d(find(t_eXX_detectable_Ec03_50d(:,i),1,'last'));
    end
    if sum(t_eZZ_detectable_Ec03_50d(:,i)) > 0
        tFirst_eZZ_detectable_Ec03_50d(i) = t_eZZ_detectable_Ec03_50d(find(t_eZZ_detectable_Ec03_50d(:,i),1,'first'));
        tLast_eZZ_detectable_Ec03_50d(i) = t_eZZ_detectable_Ec03_50d(find(t_eZZ_detectable_Ec03_50d(:,i),1,'last'));
    end
% parameter 04
    if sum(t_eXX_detectable_Ec04_50d(:,i)) > 0
        tFirst_eXX_detectable_Ec04_50d(i) = t_eXX_detectable_Ec04_50d(find(t_eXX_detectable_Ec04_50d(:,i),1,'first'));
        tLast_eXX_detectable_Ec04_50d(i) = t_eXX_detectable_Ec04_50d(find(t_eXX_detectable_Ec04_50d(:,i),1,'last'));
    end
    if sum(t_eZZ_detectable_Ec04_50d(:,i)) > 0
        tFirst_eZZ_detectable_Ec04_50d(i) = t_eZZ_detectable_Ec04_50d(find(t_eZZ_detectable_Ec04_50d(:,i),1,'first'));
        tLast_eZZ_detectable_Ec04_50d(i) = t_eZZ_detectable_Ec04_50d(find(t_eZZ_detectable_Ec04_50d(:,i),1,'last'));
    end
% parameter 05
    if sum(t_eXX_detectable_Ec05_50d(:,i)) > 0
        tFirst_eXX_detectable_Ec05_50d(i) = t_eXX_detectable_Ec05_50d(find(t_eXX_detectable_Ec05_50d(:,i),1,'first'));
        tLast_eXX_detectable_Ec05_50d(i) = t_eXX_detectable_Ec05_50d(find(t_eXX_detectable_Ec05_50d(:,i),1,'last'));
    end
    if sum(t_eZZ_detectable_Ec05_50d(:,i)) > 0
        tFirst_eZZ_detectable_Ec05_50d(i) = t_eZZ_detectable_Ec05_50d(find(t_eZZ_detectable_Ec05_50d(:,i),1,'first'));
        tLast_eZZ_detectable_Ec05_50d(i) = t_eZZ_detectable_Ec05_50d(find(t_eZZ_detectable_Ec05_50d(:,i),1,'last'));
    end
end


% ==================================================================================================== %
% Duration strain is detectable
% ==================================================================================================== %
% parameter 01
eXX_detectableDuration_Ec01_01d = zeros(1,n_probes);
eZZ_detectableDuration_Ec01_01d = zeros(1,n_probes);
eXX_detectableDuration_Ec01_03d = zeros(1,n_probes);
eZZ_detectableDuration_Ec01_03d = zeros(1,n_probes);
eXX_detectableDuration_Ec01_05d = zeros(1,n_probes);
eZZ_detectableDuration_Ec01_05d = zeros(1,n_probes);
eXX_detectableDuration_Ec01_10d = zeros(1,n_probes);
eZZ_detectableDuration_Ec01_10d = zeros(1,n_probes);
eXX_detectableDuration_Ec01_50d = zeros(1,n_probes);
eZZ_detectableDuration_Ec01_50d = zeros(1,n_probes);
% parameter 02
eXX_detectableDuration_Ec02_01d = zeros(1,n_probes);
eZZ_detectableDuration_Ec02_01d = zeros(1,n_probes);
eXX_detectableDuration_Ec02_03d = zeros(1,n_probes);
eZZ_detectableDuration_Ec02_03d = zeros(1,n_probes);
eXX_detectableDuration_Ec02_05d = zeros(1,n_probes);
eZZ_detectableDuration_Ec02_05d = zeros(1,n_probes);
eXX_detectableDuration_Ec02_10d = zeros(1,n_probes);
eZZ_detectableDuration_Ec02_10d = zeros(1,n_probes);
eXX_detectableDuration_Ec02_50d = zeros(1,n_probes);
eZZ_detectableDuration_Ec02_50d = zeros(1,n_probes);
% parameter 03
eXX_detectableDuration_Ec03_01d = zeros(1,n_probes);
eZZ_detectableDuration_Ec03_01d = zeros(1,n_probes);
eXX_detectableDuration_Ec03_03d = zeros(1,n_probes);
eZZ_detectableDuration_Ec03_03d = zeros(1,n_probes);
eXX_detectableDuration_Ec03_05d = zeros(1,n_probes);
eZZ_detectableDuration_Ec03_05d = zeros(1,n_probes);
eXX_detectableDuration_Ec03_10d = zeros(1,n_probes);
eZZ_detectableDuration_Ec03_10d = zeros(1,n_probes);
eXX_detectableDuration_Ec03_50d = zeros(1,n_probes);
eZZ_detectableDuration_Ec03_50d = zeros(1,n_probes);
% parameter 04
eXX_detectableDuration_Ec04_01d = zeros(1,n_probes);
eZZ_detectableDuration_Ec04_01d = zeros(1,n_probes);
eXX_detectableDuration_Ec04_03d = zeros(1,n_probes);
eZZ_detectableDuration_Ec04_03d = zeros(1,n_probes);
eXX_detectableDuration_Ec04_05d = zeros(1,n_probes);
eZZ_detectableDuration_Ec04_05d = zeros(1,n_probes);
eXX_detectableDuration_Ec04_10d = zeros(1,n_probes);
eZZ_detectableDuration_Ec04_10d = zeros(1,n_probes);
eXX_detectableDuration_Ec04_50d = zeros(1,n_probes);
eZZ_detectableDuration_Ec04_50d = zeros(1,n_probes);
% parameter 05
eXX_detectableDuration_Ec05_01d = zeros(1,n_probes);
eZZ_detectableDuration_Ec05_01d = zeros(1,n_probes);
eXX_detectableDuration_Ec05_03d = zeros(1,n_probes);
eZZ_detectableDuration_Ec05_03d = zeros(1,n_probes);
eXX_detectableDuration_Ec05_05d = zeros(1,n_probes);
eZZ_detectableDuration_Ec05_05d = zeros(1,n_probes);
eXX_detectableDuration_Ec05_10d = zeros(1,n_probes);
eZZ_detectableDuration_Ec05_10d = zeros(1,n_probes);
eXX_detectableDuration_Ec05_50d = zeros(1,n_probes);
eZZ_detectableDuration_Ec05_50d = zeros(1,n_probes);

for i = 1:n_probes
% ==================================================================================================== %
% Depth 1%
% ==================================================================================================== %
% parameter 01
    eXX_detectableDuration_Ec01_01d(i) = tLast_eXX_detectable_Ec01_01d(i) - tFirst_eXX_detectable_Ec01_01d(i);
    eZZ_detectableDuration_Ec01_01d(i) = tLast_eZZ_detectable_Ec01_01d(i) - tFirst_eZZ_detectable_Ec01_01d(i);
% parameter 02
    eXX_detectableDuration_Ec02_01d(i) = tLast_eXX_detectable_Ec02_01d(i) - tFirst_eXX_detectable_Ec02_01d(i);
    eZZ_detectableDuration_Ec02_01d(i) = tLast_eZZ_detectable_Ec02_01d(i) - tFirst_eZZ_detectable_Ec02_01d(i);
% parameter 03
    eXX_detectableDuration_Ec03_01d(i) = tLast_eXX_detectable_Ec03_01d(i) - tFirst_eXX_detectable_Ec03_01d(i);
    eZZ_detectableDuration_Ec03_01d(i) = tLast_eZZ_detectable_Ec03_01d(i) - tFirst_eZZ_detectable_Ec03_01d(i);
% parameter 04
    eXX_detectableDuration_Ec04_01d(i) = tLast_eXX_detectable_Ec04_01d(i) - tFirst_eXX_detectable_Ec04_01d(i);
    eZZ_detectableDuration_Ec04_01d(i) = tLast_eZZ_detectable_Ec04_01d(i) - tFirst_eZZ_detectable_Ec04_01d(i);
% parameter 05
    eXX_detectableDuration_Ec05_01d(i) = tLast_eXX_detectable_Ec05_01d(i) - tFirst_eXX_detectable_Ec05_01d(i);
    eZZ_detectableDuration_Ec05_01d(i) = tLast_eZZ_detectable_Ec05_01d(i) - tFirst_eZZ_detectable_Ec05_01d(i);
    
% ==================================================================================================== %
% Depth 3%
% ==================================================================================================== %
% parameter 01
    eXX_detectableDuration_Ec01_03d(i) = tLast_eXX_detectable_Ec01_03d(i) - tFirst_eXX_detectable_Ec01_03d(i);
    eZZ_detectableDuration_Ec01_03d(i) = tLast_eZZ_detectable_Ec01_03d(i) - tFirst_eZZ_detectable_Ec01_03d(i);
% parameter 02
    eXX_detectableDuration_Ec02_03d(i) = tLast_eXX_detectable_Ec02_03d(i) - tFirst_eXX_detectable_Ec02_03d(i);
    eZZ_detectableDuration_Ec02_03d(i) = tLast_eZZ_detectable_Ec02_03d(i) - tFirst_eZZ_detectable_Ec02_03d(i);
% parameter 03
    eXX_detectableDuration_Ec03_03d(i) = tLast_eXX_detectable_Ec03_03d(i) - tFirst_eXX_detectable_Ec03_03d(i);
    eZZ_detectableDuration_Ec03_03d(i) = tLast_eZZ_detectable_Ec03_03d(i) - tFirst_eZZ_detectable_Ec03_03d(i);
% parameter 04
    eXX_detectableDuration_Ec04_03d(i) = tLast_eXX_detectable_Ec04_03d(i) - tFirst_eXX_detectable_Ec04_03d(i);
    eZZ_detectableDuration_Ec04_03d(i) = tLast_eZZ_detectable_Ec04_03d(i) - tFirst_eZZ_detectable_Ec04_03d(i);
% parameter 05
    eXX_detectableDuration_Ec05_03d(i) = tLast_eXX_detectable_Ec05_03d(i) - tFirst_eXX_detectable_Ec05_03d(i);
    eZZ_detectableDuration_Ec05_03d(i) = tLast_eZZ_detectable_Ec05_03d(i) - tFirst_eZZ_detectable_Ec05_03d(i);
    
% ==================================================================================================== %
% Depth 5%
% ==================================================================================================== %
% parameter 01
    eXX_detectableDuration_Ec01_05d(i) = tLast_eXX_detectable_Ec01_05d(i) - tFirst_eXX_detectable_Ec01_05d(i);
    eZZ_detectableDuration_Ec01_05d(i) = tLast_eZZ_detectable_Ec01_05d(i) - tFirst_eZZ_detectable_Ec01_05d(i);
% parameter 02
    eXX_detectableDuration_Ec02_05d(i) = tLast_eXX_detectable_Ec02_05d(i) - tFirst_eXX_detectable_Ec02_05d(i);
    eZZ_detectableDuration_Ec02_05d(i) = tLast_eZZ_detectable_Ec02_05d(i) - tFirst_eZZ_detectable_Ec02_05d(i);
% parameter 03
    eXX_detectableDuration_Ec03_05d(i) = tLast_eXX_detectable_Ec03_05d(i) - tFirst_eXX_detectable_Ec03_05d(i);
    eZZ_detectableDuration_Ec03_05d(i) = tLast_eZZ_detectable_Ec03_05d(i) - tFirst_eZZ_detectable_Ec03_05d(i);
% parameter 04
    eXX_detectableDuration_Ec04_05d(i) = tLast_eXX_detectable_Ec04_05d(i) - tFirst_eXX_detectable_Ec04_05d(i);
    eZZ_detectableDuration_Ec04_05d(i) = tLast_eZZ_detectable_Ec04_05d(i) - tFirst_eZZ_detectable_Ec04_05d(i);
% parameter 05
    eXX_detectableDuration_Ec05_05d(i) = tLast_eXX_detectable_Ec05_05d(i) - tFirst_eXX_detectable_Ec05_05d(i);
    eZZ_detectableDuration_Ec05_05d(i) = tLast_eZZ_detectable_Ec05_05d(i) - tFirst_eZZ_detectable_Ec05_05d(i);
    
% ==================================================================================================== %
% Depth 10%
% ==================================================================================================== %
% parameter 01
    eXX_detectableDuration_Ec01_10d(i) = tLast_eXX_detectable_Ec01_10d(i) - tFirst_eXX_detectable_Ec01_10d(i);
    eZZ_detectableDuration_Ec01_10d(i) = tLast_eZZ_detectable_Ec01_10d(i) - tFirst_eZZ_detectable_Ec01_10d(i);
% parameter 02
    eXX_detectableDuration_Ec02_10d(i) = tLast_eXX_detectable_Ec02_10d(i) - tFirst_eXX_detectable_Ec02_10d(i);
    eZZ_detectableDuration_Ec02_10d(i) = tLast_eZZ_detectable_Ec02_10d(i) - tFirst_eZZ_detectable_Ec02_10d(i);
% parameter 03
    eXX_detectableDuration_Ec03_10d(i) = tLast_eXX_detectable_Ec03_10d(i) - tFirst_eXX_detectable_Ec03_10d(i);
    eZZ_detectableDuration_Ec03_10d(i) = tLast_eZZ_detectable_Ec03_10d(i) - tFirst_eZZ_detectable_Ec03_10d(i);
% parameter 04
    eXX_detectableDuration_Ec04_10d(i) = tLast_eXX_detectable_Ec04_10d(i) - tFirst_eXX_detectable_Ec04_10d(i);
    eZZ_detectableDuration_Ec04_10d(i) = tLast_eZZ_detectable_Ec04_10d(i) - tFirst_eZZ_detectable_Ec04_10d(i);
% parameter 05
    eXX_detectableDuration_Ec05_10d(i) = tLast_eXX_detectable_Ec05_10d(i) - tFirst_eXX_detectable_Ec05_10d(i);
    eZZ_detectableDuration_Ec05_10d(i) = tLast_eZZ_detectable_Ec05_10d(i) - tFirst_eZZ_detectable_Ec05_10d(i);
    
% ==================================================================================================== %
% Depth 50%
% ==================================================================================================== %
% parameter 01
    eXX_detectableDuration_Ec01_50d(i) = tLast_eXX_detectable_Ec01_50d(i) - tFirst_eXX_detectable_Ec01_50d(i);
    eZZ_detectableDuration_Ec01_50d(i) = tLast_eZZ_detectable_Ec01_50d(i) - tFirst_eZZ_detectable_Ec01_50d(i);
% parameter 02
    eXX_detectableDuration_Ec02_50d(i) = tLast_eXX_detectable_Ec02_50d(i) - tFirst_eXX_detectable_Ec02_50d(i);
    eZZ_detectableDuration_Ec02_50d(i) = tLast_eZZ_detectable_Ec02_50d(i) - tFirst_eZZ_detectable_Ec02_50d(i);
% parameter 03
    eXX_detectableDuration_Ec03_50d(i) = tLast_eXX_detectable_Ec03_50d(i) - tFirst_eXX_detectable_Ec03_50d(i);
    eZZ_detectableDuration_Ec03_50d(i) = tLast_eZZ_detectable_Ec03_50d(i) - tFirst_eZZ_detectable_Ec03_50d(i);
% parameter 04
    eXX_detectableDuration_Ec04_50d(i) = tLast_eXX_detectable_Ec04_50d(i) - tFirst_eXX_detectable_Ec04_50d(i);
    eZZ_detectableDuration_Ec04_50d(i) = tLast_eZZ_detectable_Ec04_50d(i) - tFirst_eZZ_detectable_Ec04_50d(i);
% parameter 05
    eXX_detectableDuration_Ec05_50d(i) = tLast_eXX_detectable_Ec05_50d(i) - tFirst_eXX_detectable_Ec05_50d(i);
    eZZ_detectableDuration_Ec05_50d(i) = tLast_eZZ_detectable_Ec05_50d(i) - tFirst_eZZ_detectable_Ec05_50d(i);
end

% parameter 01
clear tFirst_eXX_detectable_Ec01_01d    tLast_eXX_detectable_Ec01_01d
clear tFirst_eZZ_detectable_Ec01_01d    tLast_eZZ_detectable_Ec01_01d
clear tFirst_eXX_detectable_Ec01_03d    tLast_eXX_detectable_Ec01_03d
clear tFirst_eZZ_detectable_Ec01_03d    tLast_eZZ_detectable_Ec01_03d
clear tFirst_eXX_detectable_Ec01_05d    tLast_eXX_detectable_Ec01_05d
clear tFirst_eZZ_detectable_Ec01_05d    tLast_eZZ_detectable_Ec01_05d
clear tFirst_eXX_detectable_Ec01_10d    tLast_eXX_detectable_Ec01_10d
clear tFirst_eZZ_detectable_Ec01_10d    tLast_eZZ_detectable_Ec01_10d
clear tFirst_eXX_detectable_Ec01_50d    tLast_eXX_detectable_Ec01_50d
clear tFirst_eZZ_detectable_Ec01_50d    tLast_eZZ_detectable_Ec01_50d
% parameter 02
clear tFirst_eXX_detectable_Ec02_01d    tLast_eXX_detectable_Ec02_01d
clear tFirst_eZZ_detectable_Ec02_01d    tLast_eZZ_detectable_Ec02_01d
clear tFirst_eXX_detectable_Ec02_03d    tLast_eXX_detectable_Ec02_03d
clear tFirst_eZZ_detectable_Ec02_03d    tLast_eZZ_detectable_Ec02_03d
clear tFirst_eXX_detectable_Ec02_05d    tLast_eXX_detectable_Ec02_05d
clear tFirst_eZZ_detectable_Ec02_05d    tLast_eZZ_detectable_Ec02_05d
clear tFirst_eXX_detectable_Ec02_10d    tLast_eXX_detectable_Ec02_10d
clear tFirst_eZZ_detectable_Ec02_10d    tLast_eZZ_detectable_Ec02_10d
clear tFirst_eXX_detectable_Ec02_50d    tLast_eXX_detectable_Ec02_50d
clear tFirst_eZZ_detectable_Ec02_50d    tLast_eZZ_detectable_Ec02_50d
% parameter 03
clear tFirst_eXX_detectable_Ec03_01d    tLast_eXX_detectable_Ec03_01d
clear tFirst_eZZ_detectable_Ec03_01d    tLast_eZZ_detectable_Ec03_01d
clear tFirst_eXX_detectable_Ec03_03d    tLast_eXX_detectable_Ec03_03d
clear tFirst_eZZ_detectable_Ec03_03d    tLast_eZZ_detectable_Ec03_03d
clear tFirst_eXX_detectable_Ec03_05d    tLast_eXX_detectable_Ec03_05d
clear tFirst_eZZ_detectable_Ec03_05d    tLast_eZZ_detectable_Ec03_05d
clear tFirst_eXX_detectable_Ec03_10d    tLast_eXX_detectable_Ec03_10d
clear tFirst_eZZ_detectable_Ec03_10d    tLast_eZZ_detectable_Ec03_10d
clear tFirst_eXX_detectable_Ec03_50d    tLast_eXX_detectable_Ec03_50d
clear tFirst_eZZ_detectable_Ec03_50d    tLast_eZZ_detectable_Ec03_50d
% parameter 04
clear tFirst_eXX_detectable_Ec04_01d    tLast_eXX_detectable_Ec04_01d
clear tFirst_eZZ_detectable_Ec04_01d    tLast_eZZ_detectable_Ec04_01d
clear tFirst_eXX_detectable_Ec04_03d    tLast_eXX_detectable_Ec04_03d
clear tFirst_eZZ_detectable_Ec04_03d    tLast_eZZ_detectable_Ec04_03d
clear tFirst_eXX_detectable_Ec04_05d    tLast_eXX_detectable_Ec04_05d
clear tFirst_eZZ_detectable_Ec04_05d    tLast_eZZ_detectable_Ec04_05d
clear tFirst_eXX_detectable_Ec04_10d    tLast_eXX_detectable_Ec04_10d
clear tFirst_eZZ_detectable_Ec04_10d    tLast_eZZ_detectable_Ec04_10d
clear tFirst_eXX_detectable_Ec04_50d    tLast_eXX_detectable_Ec04_50d
clear tFirst_eZZ_detectable_Ec04_50d    tLast_eZZ_detectable_Ec04_50d
% parameter 05
clear tFirst_eXX_detectable_Ec05_01d    tLast_eXX_detectable_Ec05_01d
clear tFirst_eZZ_detectable_Ec05_01d    tLast_eZZ_detectable_Ec05_01d
clear tFirst_eXX_detectable_Ec05_03d    tLast_eXX_detectable_Ec05_03d
clear tFirst_eZZ_detectable_Ec05_03d    tLast_eZZ_detectable_Ec05_03d
clear tFirst_eXX_detectable_Ec05_05d    tLast_eXX_detectable_Ec05_05d
clear tFirst_eZZ_detectable_Ec05_05d    tLast_eZZ_detectable_Ec05_05d
clear tFirst_eXX_detectable_Ec05_10d    tLast_eXX_detectable_Ec05_10d
clear tFirst_eZZ_detectable_Ec05_10d    tLast_eZZ_detectable_Ec05_10d
clear tFirst_eXX_detectable_Ec05_50d    tLast_eXX_detectable_Ec05_50d
clear tFirst_eZZ_detectable_Ec05_50d    tLast_eZZ_detectable_Ec05_50d


clear eXX_minRateCriteria_Ec01_01d      eZZ_minRateCriteria_Ec01_01d
clear eXX_minRateCriteria_Ec02_01d      eZZ_minRateCriteria_Ec02_01d
clear eXX_minRateCriteria_Ec03_01d      eZZ_minRateCriteria_Ec03_01d
clear eXX_minRateCriteria_Ec04_01d      eZZ_minRateCriteria_Ec04_01d
clear eXX_minRateCriteria_Ec05_01d      eZZ_minRateCriteria_Ec05_01d

clear eXX_minRateCriteria_Ec01_03d      eZZ_minRateCriteria_Ec01_03d
clear eXX_minRateCriteria_Ec02_03d      eZZ_minRateCriteria_Ec02_03d
clear eXX_minRateCriteria_Ec03_03d      eZZ_minRateCriteria_Ec03_03d
clear eXX_minRateCriteria_Ec04_03d      eZZ_minRateCriteria_Ec04_03d
clear eXX_minRateCriteria_Ec05_03d      eZZ_minRateCriteria_Ec05_03d

clear eXX_minRateCriteria_Ec01_05d      eZZ_minRateCriteria_Ec01_05d
clear eXX_minRateCriteria_Ec02_05d      eZZ_minRateCriteria_Ec02_05d
clear eXX_minRateCriteria_Ec03_05d      eZZ_minRateCriteria_Ec03_05d
clear eXX_minRateCriteria_Ec04_05d      eZZ_minRateCriteria_Ec04_05d
clear eXX_minRateCriteria_Ec05_05d      eZZ_minRateCriteria_Ec05_05d

clear eXX_minRateCriteria_Ec01_10d      eZZ_minRateCriteria_Ec01_10d
clear eXX_minRateCriteria_Ec02_10d      eZZ_minRateCriteria_Ec02_10d
clear eXX_minRateCriteria_Ec03_10d      eZZ_minRateCriteria_Ec03_10d
clear eXX_minRateCriteria_Ec04_10d      eZZ_minRateCriteria_Ec04_10d
clear eXX_minRateCriteria_Ec05_10d      eZZ_minRateCriteria_Ec05_10d

clear eXX_minRateCriteria_Ec01_50d      eZZ_minRateCriteria_Ec01_50d
clear eXX_minRateCriteria_Ec02_50d      eZZ_minRateCriteria_Ec02_50d
clear eXX_minRateCriteria_Ec03_50d      eZZ_minRateCriteria_Ec03_50d
clear eXX_minRateCriteria_Ec04_50d      eZZ_minRateCriteria_Ec04_50d
clear eXX_minRateCriteria_Ec05_50d      eZZ_minRateCriteria_Ec05_50d

%% Corelation Coef and polyfit to eXXrate_minRateDuration
% eXXrate_minRateDuration_03d_coef = (eXXrate_minRateDuration_03d(end)-eXXrate_minRateDuration_03d(1))/(r(end)-r(1)); %s/m
% eXXrate_minRateDuration_03d_polyFit = polyfit(r,eXXrate_minRateDuration_03d,2);
% eXXrate_minRateDuration_03d_polyVal = polyval(eXXrate_minRateDuration_03d_polyFit,r);eZZrate_minRateDuration_03d_coef = (eZZrate_minRateDuration_03d(end)-eZZrate_minRateDuration_03d(1))/(r(end)-r(1)); %s/m
% eZZrate_minRateDuration_03d_polyFit = polyfit(r,eZZrate_minRateDuration_03d,2);
% eZZrate_minRateDuration_03d_polyVal = polyval(eZZrate_minRateDuration_03d_polyFit,r);
