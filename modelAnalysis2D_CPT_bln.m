%% modelAnalysis2D_frxSurf_bln
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

%% Calculate Characteristic Parameters

% ==================================================================================================== %
% Characteristic Length
% ==================================================================================================== %
x_c = ModelParams_bln(1).x_c; % [m]

% ==================================================================================================== %
% Characteristic Time
% ==================================================================================================== %
tc_bln = (x_c^2)/(4*ModelParams_bln(1).D_frx); % [s]

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
injStart = t(find(p_frxBot_bln(:,1)>0,1));

n_tSteps =length(t);

%% Obtain absolute values of strain rates

% Depth 1%
eXXrate_bln_01d = abs(eXXrate_bln_01d);
eZZrate_bln_01d = abs(eZZrate_bln_01d);
eTXrate_bln_01d = abs(eTXrate_bln_01d);
% Depth 3%
eXXrate_bln_03d = abs(eXXrate_bln_03d);
eZZrate_bln_03d = abs(eZZrate_bln_03d);
eTXrate_bln_03d = abs(eTXrate_bln_03d);
% Depth 5%
eXXrate_bln_05d = abs(eXXrate_bln_05d);
eZZrate_bln_05d = abs(eZZrate_bln_05d);
eTXrate_bln_05d = abs(eTXrate_bln_05d);
% Depth 10%
eXXrate_bln_10d = abs(eXXrate_bln_10d);
eZZrate_bln_10d = abs(eZZrate_bln_10d);
eTXrate_bln_10d = abs(eTXrate_bln_10d);
% Depth 50%
eXXrate_bln_50d = abs(eXXrate_bln_50d);
eZZrate_bln_50d = abs(eZZrate_bln_50d);
eTXrate_bln_50d = abs(eTXrate_bln_50d);

%% Maximum Strain Rate

eXXrateMax_bln_01d = zeros(n_tSteps,n_probes);
eZZrateMax_bln_01d = zeros(n_tSteps,n_probes);
eTXrateMax_bln_01d = zeros(n_tSteps,n_probes);
eXXrateMax_bln_03d = zeros(n_tSteps,n_probes);
eZZrateMax_bln_03d = zeros(n_tSteps,n_probes);
eTXrateMax_bln_03d = zeros(n_tSteps,n_probes);
eXXrateMax_bln_05d = zeros(n_tSteps,n_probes);
eZZrateMax_bln_05d = zeros(n_tSteps,n_probes);
eTXrateMax_bln_05d = zeros(n_tSteps,n_probes);
eXXrateMax_bln_10d = zeros(n_tSteps,n_probes);
eZZrateMax_bln_10d = zeros(n_tSteps,n_probes);
eTXrateMax_bln_10d = zeros(n_tSteps,n_probes);
eXXrateMax_bln_50d = zeros(n_tSteps,n_probes);
eZZrateMax_bln_50d = zeros(n_tSteps,n_probes);
eTXrateMax_bln_50d = zeros(n_tSteps,n_probes);

for i = 1:n_probes
% Depth 1%
    eXXrateMax_bln_01d(i) = max(eXXrate_bln_01d(:,i));
    eZZrateMax_bln_01d(i) = max(eZZrate_bln_01d(:,i));
    eTXrateMax_bln_01d(i) = max(eTXrate_bln_01d(:,i));
% Depth 3%
    eXXrateMax_bln_03d(i) = max(eXXrate_bln_03d(:,i));
    eZZrateMax_bln_03d(i) = max(eZZrate_bln_03d(:,i));
    eTXrateMax_bln_03d(i) = max(eTXrate_bln_03d(:,i));
% Depth 5%
    eXXrateMax_bln_05d(i) = max(eXXrate_bln_05d(:,i));
    eZZrateMax_bln_05d(i) = max(eZZrate_bln_05d(:,i));
    eTXrateMax_bln_05d(i) = max(eTXrate_bln_05d(:,i));
% Depth 10%
    eXXrateMax_bln_10d(i) = max(eXXrate_bln_10d(:,i));
    eZZrateMax_bln_10d(i) = max(eZZrate_bln_10d(:,i));
    eTXrateMax_bln_10d(i) = max(eTXrate_bln_10d(:,i));
% Depth 50%
    eXXrateMax_bln_50d(i) = max(eXXrate_bln_50d(:,i));
    eZZrateMax_bln_50d(i) = max(eZZrate_bln_50d(:,i));
    eTXrateMax_bln_50d(i) = max(eTXrate_bln_50d(:,i));
end

%% Time after injection at which maximum strain rate occurs

t_eXXrateMax_bln_01d = zeros(1,n_probes);
t_eZZrateMax_bln_01d = zeros(1,n_probes);
t_eTXrateMax_bln_01d = zeros(1,n_probes);
t_eXXrateMax_bln_03d = zeros(1,n_probes);
t_eZZrateMax_bln_03d = zeros(1,n_probes);
t_eTXrateMax_bln_03d = zeros(1,n_probes);
t_eXXrateMax_bln_05d = zeros(1,n_probes);
t_eZZrateMax_bln_05d = zeros(1,n_probes);
t_eTXrateMax_bln_05d = zeros(1,n_probes);
t_eXXrateMax_bln_10d = zeros(1,n_probes);
t_eZZrateMax_bln_10d = zeros(1,n_probes);
t_eTXrateMax_bln_10d = zeros(1,n_probes);
t_eXXrateMax_bln_50d = zeros(1,n_probes);
t_eZZrateMax_bln_50d = zeros(1,n_probes);
t_eTXrateMax_bln_50d = zeros(1,n_probes);
    
for i = 1:n_probes
% Depth 1%
    t_eXXrateMax_bln_01d(i) = t(eXXrate_bln_01d(:,i)==eXXrateMax_bln_01d(i))-injStart;
    t_eZZrateMax_bln_01d(i) = t(eZZrate_bln_01d(:,i)==eZZrateMax_bln_01d(i))-injStart;
    t_eTXrateMax_bln_01d(i) = t(eTXrate_bln_01d(:,i)==eTXrateMax_bln_01d(i))-injStart;
% Depth 3%
    t_eXXrateMax_bln_03d(i) = t(eXXrate_bln_03d(:,i)==eXXrateMax_bln_03d(i))-injStart;
    t_eZZrateMax_bln_03d(i) = t(eZZrate_bln_03d(:,i)==eZZrateMax_bln_03d(i))-injStart;
    t_eTXrateMax_bln_03d(i) = t(eTXrate_bln_03d(:,i)==eTXrateMax_bln_03d(i))-injStart;
% Depth 5%
    t_eXXrateMax_bln_05d(i) = t(eXXrate_bln_05d(:,i)==eXXrateMax_bln_05d(i))-injStart;
    t_eZZrateMax_bln_05d(i) = t(eZZrate_bln_05d(:,i)==eZZrateMax_bln_05d(i))-injStart;
    t_eTXrateMax_bln_05d(i) = t(eTXrate_bln_05d(:,i)==eTXrateMax_bln_05d(i))-injStart;
% Depth 10%
    t_eXXrateMax_bln_10d(i) = t(eXXrate_bln_10d(:,i)==eXXrateMax_bln_10d(i))-injStart;
    t_eZZrateMax_bln_10d(i) = t(eZZrate_bln_10d(:,i)==eZZrateMax_bln_10d(i))-injStart;
    t_eTXrateMax_bln_10d(i) = t(eTXrate_bln_10d(:,i)==eTXrateMax_bln_10d(i))-injStart;
% Depth 50%
    t_eXXrateMax_bln_50d(i) = t(eXXrate_bln_50d(:,i)==eXXrateMax_bln_50d(i))-injStart;
    t_eZZrateMax_bln_50d(i) = t(eZZrate_bln_50d(:,i)==eZZrateMax_bln_50d(i))-injStart;
    t_eTXrateMax_bln_50d(i) = t(eTXrate_bln_50d(:,i)==eTXrateMax_bln_50d(i))-injStart;
end

%% Times during which Strain Rate > minRate

% ==================================================================================================== %
% Logical array of samples meeting criteria
% ==================================================================================================== %
eXX_minRateCriteria_bln_01d = false(n_tSteps,n_probes);
eZZ_minRateCriteria_bln_01d = false(n_tSteps,n_probes);
eXX_minRateCriteria_bln_03d = false(n_tSteps,n_probes);
eZZ_minRateCriteria_bln_03d = false(n_tSteps,n_probes);
eXX_minRateCriteria_bln_05d = false(n_tSteps,n_probes);
eZZ_minRateCriteria_bln_05d = false(n_tSteps,n_probes);
eXX_minRateCriteria_bln_10d = false(n_tSteps,n_probes);
eZZ_minRateCriteria_bln_10d = false(n_tSteps,n_probes);
eXX_minRateCriteria_bln_50d = false(n_tSteps,n_probes);
eZZ_minRateCriteria_bln_50d = false(n_tSteps,n_probes);
for i = 1:n_probes
% Depth 1%
    eXX_minRateCriteria_bln_01d(:,i) = eXXrate_bln_01d(:,i)>minRate;
    eZZ_minRateCriteria_bln_01d(:,i) = eXXrate_bln_01d(:,i)>minRate;
% Depth 3%
    eXX_minRateCriteria_bln_03d(:,i) = eXXrate_bln_03d(:,i)>minRate;
    eZZ_minRateCriteria_bln_03d(:,i) = eXXrate_bln_03d(:,i)>minRate;
% Depth 5%
    eXX_minRateCriteria_bln_05d(:,i) = eXXrate_bln_05d(:,i)>minRate;
    eZZ_minRateCriteria_bln_05d(:,i) = eXXrate_bln_05d(:,i)>minRate;
% Depth 10%
    eXX_minRateCriteria_bln_10d(:,i) = eXXrate_bln_10d(:,i)>minRate;
    eZZ_minRateCriteria_bln_10d(:,i) = eXXrate_bln_10d(:,i)>minRate;
% Depth 50%
    eXX_minRateCriteria_bln_50d(:,i) = eXXrate_bln_50d(:,i)>minRate;
    eZZ_minRateCriteria_bln_50d(:,i) = eXXrate_bln_50d(:,i)>minRate;
end

% ==================================================================================================== %
% Times meeting criteria
% ==================================================================================================== %
t_aboveMinRate_eXX_bln_01d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eZZ_bln_01d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eXX_bln_03d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eZZ_bln_03d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eXX_bln_05d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eZZ_bln_05d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eXX_bln_10d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eZZ_bln_10d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eXX_bln_50d = zeros(n_tSteps,n_probes);
t_aboveMinRate_eZZ_bln_50d = zeros(n_tSteps,n_probes);
for i = 1:n_probes
% Depth 1%
    if sum(eXX_minRateCriteria_bln_01d(:,i)) > 0
        t_aboveMinRate_eXX_bln_01d(eXX_minRateCriteria_bln_01d(:,i),i) = t(eXX_minRateCriteria_bln_01d(:,i));
    end
    if sum(eZZ_minRateCriteria_bln_01d(:,i)) > 0
        t_aboveMinRate_eZZ_bln_01d(eZZ_minRateCriteria_bln_01d(:,i),i) = t(eZZ_minRateCriteria_bln_01d(:,i));
    end
% Depth 3%
    if sum(eXX_minRateCriteria_bln_03d(:,i)) > 0
        t_aboveMinRate_eXX_bln_03d(eXX_minRateCriteria_bln_03d(:,i),i) = t(eXX_minRateCriteria_bln_03d(:,i));
    end
    if sum(eZZ_minRateCriteria_bln_03d(:,i)) > 0
        t_aboveMinRate_eZZ_bln_03d(eZZ_minRateCriteria_bln_03d(:,i),i) = t(eZZ_minRateCriteria_bln_03d(:,i));
    end
% Depth 5%
    if sum(eXX_minRateCriteria_bln_05d(:,i)) > 0
        t_aboveMinRate_eXX_bln_05d(eXX_minRateCriteria_bln_05d(:,i),i) = t(eXX_minRateCriteria_bln_05d(:,i));
    end
    if sum(eZZ_minRateCriteria_bln_05d(:,i)) > 0
        t_aboveMinRate_eZZ_bln_05d(eZZ_minRateCriteria_bln_05d(:,i),i) = t(eZZ_minRateCriteria_bln_05d(:,i));
    end
% Depth 10%
    if sum(eXX_minRateCriteria_bln_10d(:,i)) > 0
        t_aboveMinRate_eXX_bln_10d(eXX_minRateCriteria_bln_10d(:,i),i) = t(eXX_minRateCriteria_bln_10d(:,i));
    end
    if sum(eZZ_minRateCriteria_bln_10d(:,i)) > 0
        t_aboveMinRate_eZZ_bln_10d(eZZ_minRateCriteria_bln_10d(:,i),i) = t(eZZ_minRateCriteria_bln_10d(:,i));
    end
% Depth 50%
    if sum(eXX_minRateCriteria_bln_50d(:,i)) > 0
        t_aboveMinRate_eXX_bln_50d(eXX_minRateCriteria_bln_50d(:,i),i) = t(eXX_minRateCriteria_bln_50d(:,i));
    end
    if sum(eZZ_minRateCriteria_bln_50d(:,i)) > 0
        t_aboveMinRate_eZZ_bln_50d(eZZ_minRateCriteria_bln_50d(:,i),i) = t(eZZ_minRateCriteria_bln_50d(:,i));
    end
end

%% Duration during which strain rate > minRate

tFirst_aboveMinRate_eXX_bln_01d = zeros(1,n_probes);
tLast_aboveMinRate_eXX_bln_01d  = zeros(1,n_probes);
tFirst_aboveMinRate_eZZ_bln_01d = zeros(1,n_probes);
tLast_aboveMinRate_eZZ_bln_01d  = zeros(1,n_probes);
tFirst_aboveMinRate_eXX_bln_03d = zeros(1,n_probes);
tLast_aboveMinRate_eXX_bln_03d  = zeros(1,n_probes);
tFirst_aboveMinRate_eZZ_bln_03d = zeros(1,n_probes);
tLast_aboveMinRate_eZZ_bln_03d  = zeros(1,n_probes);
tFirst_aboveMinRate_eXX_bln_05d = zeros(1,n_probes);
tLast_aboveMinRate_eXX_bln_05d  = zeros(1,n_probes);
tFirst_aboveMinRate_eZZ_bln_05d = zeros(1,n_probes);
tLast_aboveMinRate_eZZ_bln_05d  = zeros(1,n_probes);
tFirst_aboveMinRate_eXX_bln_10d = zeros(1,n_probes);
tLast_aboveMinRate_eXX_bln_10d  = zeros(1,n_probes);
tFirst_aboveMinRate_eZZ_bln_10d = zeros(1,n_probes);
tLast_aboveMinRate_eZZ_bln_10d  = zeros(1,n_probes);
tFirst_aboveMinRate_eXX_bln_50d = zeros(1,n_probes);
tLast_aboveMinRate_eXX_bln_50d  = zeros(1,n_probes);
tFirst_aboveMinRate_eZZ_bln_50d = zeros(1,n_probes);
tLast_aboveMinRate_eZZ_bln_50d  = zeros(1,n_probes);

% ==================================================================================================== %
% First time at which eXXrate > minRate (last non-zero value)
% ==================================================================================================== %
for i = 1:n_probes
% Depth 1%
    if sum(t_aboveMinRate_eXX_bln_01d(:,i)) > 0
        tFirst_aboveMinRate_eXX_bln_01d(i) = t_aboveMinRate_eXX_bln_01d(find(t_aboveMinRate_eXX_bln_01d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_bln_01d(i)  = t_aboveMinRate_eXX_bln_01d(find(t_aboveMinRate_eXX_bln_01d(:,i),1,'last'));
    else
        tFirst_aboveMinRate_eXX_bln_01d(:,i) = 0;
        tLast_aboveMinRate_eXX_bln_01d(:,i)  = 0;
    end
    if sum(t_aboveMinRate_eZZ_bln_01d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_bln_01d(i) = t_aboveMinRate_eZZ_bln_01d(find(t_aboveMinRate_eZZ_bln_01d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_bln_01d(i)  = t_aboveMinRate_eZZ_bln_01d(find(t_aboveMinRate_eZZ_bln_01d(:,i),1,'last'));
    else
       tFirst_aboveMinRate_eZZ_bln_01d(:,i) = 0;
       tLast_aboveMinRate_eZZ_bln_01d(:,i)  = 0;
    end
% Depth 3%
    if sum(t_aboveMinRate_eXX_bln_03d(:,i)) > 0
        tFirst_aboveMinRate_eXX_bln_03d(i) = t_aboveMinRate_eXX_bln_03d(find(t_aboveMinRate_eXX_bln_03d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_bln_03d(i)  = t_aboveMinRate_eXX_bln_03d(find(t_aboveMinRate_eXX_bln_03d(:,i),1,'last'));
    else
        tFirst_aboveMinRate_eXX_bln_03d(:,i) = 0;
        tLast_aboveMinRate_eXX_bln_03d(:,i)  = 0;
    end
    if sum(t_aboveMinRate_eZZ_bln_03d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_bln_03d(i) = t_aboveMinRate_eZZ_bln_03d(find(t_aboveMinRate_eZZ_bln_03d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_bln_03d(i)  = t_aboveMinRate_eZZ_bln_03d(find(t_aboveMinRate_eZZ_bln_03d(:,i),1,'last'));
    else
       tFirst_aboveMinRate_eZZ_bln_03d(:,i) = 0;
       tLast_aboveMinRate_eZZ_bln_03d(:,i)  = 0;
    end
% Depth 5%
    if sum(t_aboveMinRate_eXX_bln_05d(:,i)) > 0
        tFirst_aboveMinRate_eXX_bln_05d(i) = t_aboveMinRate_eXX_bln_05d(find(t_aboveMinRate_eXX_bln_05d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_bln_05d(i)  = t_aboveMinRate_eXX_bln_05d(find(t_aboveMinRate_eXX_bln_05d(:,i),1,'last'));
    else
        tFirst_aboveMinRate_eXX_bln_05d(:,i) = 0;
        tLast_aboveMinRate_eXX_bln_05d(:,i)  = 0;
    end
    if sum(t_aboveMinRate_eZZ_bln_05d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_bln_05d(i) = t_aboveMinRate_eZZ_bln_05d(find(t_aboveMinRate_eZZ_bln_05d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_bln_05d(i)  = t_aboveMinRate_eZZ_bln_05d(find(t_aboveMinRate_eZZ_bln_05d(:,i),1,'last'));
    else
       tFirst_aboveMinRate_eZZ_bln_05d(:,i) = 0;
       tLast_aboveMinRate_eZZ_bln_05d(:,i)  = 0;
    end
% Depth 10%
    if sum(t_aboveMinRate_eXX_bln_10d(:,i)) > 0
        tFirst_aboveMinRate_eXX_bln_10d(i) = t_aboveMinRate_eXX_bln_10d(find(t_aboveMinRate_eXX_bln_10d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_bln_10d(i)  = t_aboveMinRate_eXX_bln_10d(find(t_aboveMinRate_eXX_bln_10d(:,i),1,'last'));
    else
        tFirst_aboveMinRate_eXX_bln_10d(:,i) = 0;
        tLast_aboveMinRate_eXX_bln_10d(:,i)  = 0;
    end
    if sum(t_aboveMinRate_eZZ_bln_10d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_bln_10d(i) = t_aboveMinRate_eZZ_bln_10d(find(t_aboveMinRate_eZZ_bln_10d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_bln_10d(i)  = t_aboveMinRate_eZZ_bln_10d(find(t_aboveMinRate_eZZ_bln_10d(:,i),1,'last'));
    else
       tFirst_aboveMinRate_eZZ_bln_10d(:,i) = 0;
       tLast_aboveMinRate_eZZ_bln_10d(:,i)  = 0;
    end
% Depth 50%
    if sum(t_aboveMinRate_eXX_bln_50d(:,i)) > 0
        tFirst_aboveMinRate_eXX_bln_50d(i) = t_aboveMinRate_eXX_bln_50d(find(t_aboveMinRate_eXX_bln_50d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_bln_50d(i)  = t_aboveMinRate_eXX_bln_50d(find(t_aboveMinRate_eXX_bln_50d(:,i),1,'last'));
    else
        tFirst_aboveMinRate_eXX_bln_50d(:,i) = 0;
        tLast_aboveMinRate_eXX_bln_50d(:,i)  = 0;
    end
    if sum(t_aboveMinRate_eZZ_bln_50d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_bln_50d(i) = t_aboveMinRate_eZZ_bln_50d(find(t_aboveMinRate_eZZ_bln_50d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_bln_50d(i)  = t_aboveMinRate_eZZ_bln_50d(find(t_aboveMinRate_eZZ_bln_50d(:,i),1,'last'));
    else
       tFirst_aboveMinRate_eZZ_bln_50d(:,i) = 0;
       tLast_aboveMinRate_eZZ_bln_50d(:,i)  = 0;
    end
end

% ==================================================================================================== %
% Durations for which strain rate > minRate
% ==================================================================================================== %
t_aboveMinRateDuration_eXX_bln_01d = zeros(1,n_probes);
t_aboveMinRateDuration_eZZ_bln_01d = zeros(1,n_probes);
t_aboveMinRateDuration_eXX_bln_03d = zeros(1,n_probes);
t_aboveMinRateDuration_eZZ_bln_03d = zeros(1,n_probes);
t_aboveMinRateDuration_eXX_bln_05d = zeros(1,n_probes);
t_aboveMinRateDuration_eZZ_bln_05d = zeros(1,n_probes);
t_aboveMinRateDuration_eXX_bln_10d = zeros(1,n_probes);
t_aboveMinRateDuration_eZZ_bln_10d = zeros(1,n_probes);
t_aboveMinRateDuration_eXX_bln_50d = zeros(1,n_probes);
t_aboveMinRateDuration_eZZ_bln_50d = zeros(1,n_probes);

for i = 1:n_probes
% Depth 1%
    t_aboveMinRateDuration_eXX_bln_01d(1,i) = tLast_aboveMinRate_eXX_bln_01d(1,i)-tFirst_aboveMinRate_eXX_bln_01d(1,i);
    t_aboveMinRateDuration_eZZ_bln_01d(1,i) = tLast_aboveMinRate_eZZ_bln_01d(1,i)-tFirst_aboveMinRate_eZZ_bln_01d(1,i);
% Depth 3%
    t_aboveMinRateDuration_eXX_bln_03d(1,i) = tLast_aboveMinRate_eXX_bln_03d(1,i)-tFirst_aboveMinRate_eXX_bln_03d(1,i);
    t_aboveMinRateDuration_eZZ_bln_03d(1,i) = tLast_aboveMinRate_eZZ_bln_03d(1,i)-tFirst_aboveMinRate_eZZ_bln_03d(1,i);
% Depth 5%
    t_aboveMinRateDuration_eXX_bln_05d(1,i) = tLast_aboveMinRate_eXX_bln_05d(1,i)-tFirst_aboveMinRate_eXX_bln_05d(1,i);
    t_aboveMinRateDuration_eZZ_bln_05d(1,i) = tLast_aboveMinRate_eZZ_bln_05d(1,i)-tFirst_aboveMinRate_eZZ_bln_05d(1,i);
% Depth 10%
    t_aboveMinRateDuration_eXX_bln_10d(1,i) = tLast_aboveMinRate_eXX_bln_10d(1,i)-tFirst_aboveMinRate_eXX_bln_10d(1,i);
    t_aboveMinRateDuration_eZZ_bln_10d(1,i) = tLast_aboveMinRate_eZZ_bln_10d(1,i)-tFirst_aboveMinRate_eZZ_bln_10d(1,i);
% Depth 50%
    t_aboveMinRateDuration_eXX_bln_50d(1,i) = tLast_aboveMinRate_eXX_bln_50d(1,i)-tFirst_aboveMinRate_eXX_bln_50d(1,i);
    t_aboveMinRateDuration_eZZ_bln_50d(1,i) = tLast_aboveMinRate_eZZ_bln_50d(1,i)-tFirst_aboveMinRate_eZZ_bln_50d(1,i);
end

clear tFirst_aboveMinRate_eXX_bln_01d    tLast_aboveMinRate_eXX_bln_01d
clear tFirst_aboveMinRate_eZZ_bln_01d    tLast_aboveMinRate_eZZ_bln_01d
clear tFirst_aboveMinRate_eXX_bln_03d    tLast_aboveMinRate_eXX_bln_03d
clear tFirst_aboveMinRate_eZZ_bln_03d    tLast_aboveMinRate_eZZ_bln_03d
clear tFirst_aboveMinRate_eXX_bln_05d    tLast_aboveMinRate_eXX_bln_05d
clear tFirst_aboveMinRate_eZZ_bln_05d    tLast_aboveMinRate_eZZ_bln_05d
clear tFirst_aboveMinRate_eXX_bln_10d    tLast_aboveMinRate_eXX_bln_10d
clear tFirst_aboveMinRate_eZZ_bln_10d    tLast_aboveMinRate_eZZ_bln_10d
clear tFirst_aboveMinRate_eXX_bln_50d    tLast_aboveMinRate_eXX_bln_50d
clear tFirst_aboveMinRate_eZZ_bln_50d    tLast_aboveMinRate_eZZ_bln_50d

%% Magnitude while strain rate > minRate

eXX_magAboveMinRate_bln_01d = zeros(n_tSteps,n_probes);
eZZ_magAboveMinRate_bln_01d = zeros(n_tSteps,n_probes);
eXX_magAboveMinRate_bln_03d = zeros(n_tSteps,n_probes);
eZZ_magAboveMinRate_bln_03d = zeros(n_tSteps,n_probes);
eXX_magAboveMinRate_bln_05d = zeros(n_tSteps,n_probes);
eZZ_magAboveMinRate_bln_05d = zeros(n_tSteps,n_probes);
eXX_magAboveMinRate_bln_10d = zeros(n_tSteps,n_probes);
eZZ_magAboveMinRate_bln_10d = zeros(n_tSteps,n_probes);
eXX_magAboveMinRate_bln_50d = zeros(n_tSteps,n_probes);
eZZ_magAboveMinRate_bln_50d = zeros(n_tSteps,n_probes);
for i = 1:n_probes
% Depth 1%
    if sum(t_aboveMinRate_eXX_bln_01d(:,i)) > 0
        eXX_magAboveMinRate_bln_01d(eXX_minRateCriteria_bln_01d(:,i),i) = eXX_bln_01d(eXX_minRateCriteria_bln_01d(:,i),i);
    end
    if sum(t_aboveMinRate_eZZ_bln_01d(:,i)) > 0
        eZZ_magAboveMinRate_bln_01d(eZZ_minRateCriteria_bln_01d(:,i),i) = eZZ_bln_01d(eZZ_minRateCriteria_bln_01d(:,i),i);
    end
% Depth 3%
    if sum(t_aboveMinRate_eXX_bln_03d(:,i)) > 0
        eXX_magAboveMinRate_bln_03d(eXX_minRateCriteria_bln_01d(:,i),i) = eXX_bln_03d(eXX_minRateCriteria_bln_01d(:,i),i);
    end
    if sum(t_aboveMinRate_eZZ_bln_03d(:,i)) > 0
        eZZ_magAboveMinRate_bln_03d(eZZ_minRateCriteria_bln_01d(:,i),i) = eZZ_bln_03d(eZZ_minRateCriteria_bln_01d(:,i),i);
    end
% Depth 5%
    if sum(t_aboveMinRate_eXX_bln_05d(:,i)) > 0
        eXX_magAboveMinRate_bln_05d(eXX_minRateCriteria_bln_05d(:,i),i) = eXX_bln_05d(eXX_minRateCriteria_bln_05d(:,i),i);
    end
    if sum(t_aboveMinRate_eZZ_bln_05d(:,i)) > 0
        eZZ_magAboveMinRate_bln_05d(eZZ_minRateCriteria_bln_05d(:,i),i) = eZZ_bln_05d(eZZ_minRateCriteria_bln_05d(:,i),i);
    end
% Depth 10%
    if sum(t_aboveMinRate_eXX_bln_10d(:,i)) > 0
        eXX_magAboveMinRate_bln_10d(eXX_minRateCriteria_bln_10d(:,i),i) = eXX_bln_10d(eXX_minRateCriteria_bln_10d(:,i),i);
    end
    if sum(t_aboveMinRate_eZZ_bln_10d(:,i)) > 0
        eZZ_magAboveMinRate_bln_10d(eZZ_minRateCriteria_bln_10d(:,i),i) = eZZ_bln_10d(eZZ_minRateCriteria_bln_10d(:,i),i);
    end
% Depth 50%
    if sum(t_aboveMinRate_eXX_bln_50d(:,i)) > 0
        eXX_magAboveMinRate_bln_50d(eXX_minRateCriteria_bln_50d(:,i),i) = eXX_bln_50d(eXX_minRateCriteria_bln_50d(:,i),i);
    end
    if sum(t_aboveMinRate_eZZ_bln_50d(:,i)) > 0
        eZZ_magAboveMinRate_bln_50d(eZZ_minRateCriteria_bln_50d(:,i),i) = eZZ_bln_50d(eZZ_minRateCriteria_bln_50d(:,i),i);
    end
end

%% Detectable Strains

eXXmeasCriteria_bln_01d = false(n_tSteps,n_probes);
eZZmeasCriteria_bln_01d = false(n_tSteps,n_probes);
eXXmeasCriteria_bln_03d = false(n_tSteps,n_probes);
eZZmeasCriteria_bln_03d = false(n_tSteps,n_probes);
eXXmeasCriteria_bln_05d = false(n_tSteps,n_probes);
eZZmeasCriteria_bln_05d = false(n_tSteps,n_probes);
eXXmeasCriteria_bln_10d = false(n_tSteps,n_probes);
eZZmeasCriteria_bln_10d = false(n_tSteps,n_probes);
eXXmeasCriteria_bln_50d = false(n_tSteps,n_probes);
eZZmeasCriteria_bln_50d = false(n_tSteps,n_probes);

% ==================================================================================================== %
% Define measurement criteria
% ==================================================================================================== %
for i = 1:n_probes
% Depth 1%
    eXXmeasCriteria_bln_01d(:,i) = (abs(eXX_magAboveMinRate_bln_01d(:,i)) > minMag & eXXrate_bln_01d(:,i) > minRate);
    eZZmeasCriteria_bln_01d(:,i) = (abs(eZZ_magAboveMinRate_bln_01d(:,i)) > minMag & eZZrate_bln_01d(:,i) > minRate);
% Depth 3%
    eXXmeasCriteria_bln_03d(:,i) = (abs(eXX_magAboveMinRate_bln_03d(:,i)) > minMag & eXXrate_bln_03d(:,i) > minRate);
    eZZmeasCriteria_bln_03d(:,i) = (abs(eZZ_magAboveMinRate_bln_03d(:,i)) > minMag & eZZrate_bln_03d(:,i) > minRate);
% Depth 5%
    eXXmeasCriteria_bln_05d(:,i) = (abs(eXX_magAboveMinRate_bln_05d(:,i)) > minMag & eXXrate_bln_05d(:,i) > minRate);
    eZZmeasCriteria_bln_05d(:,i) = (abs(eZZ_magAboveMinRate_bln_05d(:,i)) > minMag & eZZrate_bln_05d(:,i) > minRate);
% Depth 10%
    eXXmeasCriteria_bln_10d(:,i) = (abs(eXX_magAboveMinRate_bln_10d(:,i)) > minMag & eXXrate_bln_10d(:,i) > minRate);
    eZZmeasCriteria_bln_10d(:,i) = (abs(eZZ_magAboveMinRate_bln_10d(:,i)) > minMag & eZZrate_bln_10d(:,i) > minRate);
% Depth 50%
    eXXmeasCriteria_bln_50d(:,i) = (abs(eXX_magAboveMinRate_bln_50d(:,i)) > minMag & eXXrate_bln_50d(:,i) > minRate);
    eZZmeasCriteria_bln_50d(:,i) = (abs(eZZ_magAboveMinRate_bln_50d(:,i)) > minMag & eZZrate_bln_50d(:,i) > minRate);
end

% ==================================================================================================== %
% Detectable Strains
% ==================================================================================================== %
eXX_detectable_bln_01d = NaN(n_tSteps,n_probes);
eZZ_detectable_bln_01d = NaN(n_tSteps,n_probes);
eXX_detectable_bln_03d = NaN(n_tSteps,n_probes);
eZZ_detectable_bln_03d = NaN(n_tSteps,n_probes);
eXX_detectable_bln_05d = NaN(n_tSteps,n_probes);
eZZ_detectable_bln_05d = NaN(n_tSteps,n_probes);
eXX_detectable_bln_10d = NaN(n_tSteps,n_probes);
eZZ_detectable_bln_10d = NaN(n_tSteps,n_probes);
eXX_detectable_bln_50d = NaN(n_tSteps,n_probes);
eZZ_detectable_bln_50d = NaN(n_tSteps,n_probes);
for i = 1:size(eXXmeasCriteria_bln_01d,2)
% Depth 1%
    if sum(eXXmeasCriteria_bln_01d(:,i)) > 0
        eXX_detectable_bln_01d((eXXmeasCriteria_bln_01d(:,i)),i) = eXX_bln_01d((eXXmeasCriteria_bln_01d(:,i)),i);
    end
    if sum(eZZmeasCriteria_bln_01d(:,i)) > 0
        eZZ_detectable_bln_01d((eZZmeasCriteria_bln_01d(:,i)),i) = eZZ_bln_01d((eZZmeasCriteria_bln_01d(:,i)),i);
    end
% Depth 3%
    if sum(eXXmeasCriteria_bln_03d(:,i)) > 0
        eXX_detectable_bln_03d((eXXmeasCriteria_bln_03d(:,i)),i) = eXX_bln_03d((eXXmeasCriteria_bln_03d(:,i)),i);
    end
    if sum(eZZmeasCriteria_bln_03d(:,i)) > 0
        eZZ_detectable_bln_03d((eZZmeasCriteria_bln_03d(:,i)),i) = eZZ_bln_03d((eZZmeasCriteria_bln_03d(:,i)),i);
    end
% Depth 5%
    if sum(eXXmeasCriteria_bln_05d(:,i)) > 0
        eXX_detectable_bln_05d((eXXmeasCriteria_bln_05d(:,i)),i) = eXX_bln_05d((eXXmeasCriteria_bln_05d(:,i)),i);
    end
    if sum(eZZmeasCriteria_bln_05d(:,i)) > 0
        eZZ_detectable_bln_05d((eZZmeasCriteria_bln_05d(:,i)),i) = eZZ_bln_05d((eZZmeasCriteria_bln_05d(:,i)),i);
    end
% Depth 10%
    if sum(eXXmeasCriteria_bln_10d(:,i)) > 0
        eXX_detectable_bln_10d((eXXmeasCriteria_bln_10d(:,i)),i) = eXX_bln_10d((eXXmeasCriteria_bln_10d(:,i)),i);
    end
    if sum(eZZmeasCriteria_bln_10d(:,i)) > 0
        eZZ_detectable_bln_10d((eZZmeasCriteria_bln_10d(:,i)),i) = eZZ_bln_10d((eZZmeasCriteria_bln_10d(:,i)),i);
    end
% Depth 50%
    if sum(eXXmeasCriteria_bln_50d(:,i)) > 0
        eXX_detectable_bln_50d((eXXmeasCriteria_bln_50d(:,i)),i) = eXX_bln_50d((eXXmeasCriteria_bln_50d(:,i)),i);
    end
    if sum(eZZmeasCriteria_bln_50d(:,i)) > 0
        eZZ_detectable_bln_50d((eZZmeasCriteria_bln_50d(:,i)),i) = eZZ_bln_50d((eZZmeasCriteria_bln_50d(:,i)),i);
    end
end

%% Times of Dectectable Strain (mag>minMag & rate>minRate)

t_eXX_detectable_bln_01d = zeros(n_tSteps,n_probes);
t_eZZ_detectable_bln_01d = zeros(n_tSteps,n_probes);
t_eXX_detectable_bln_03d = zeros(n_tSteps,n_probes);
t_eZZ_detectable_bln_03d = zeros(n_tSteps,n_probes);
t_eXX_detectable_bln_05d = zeros(n_tSteps,n_probes);
t_eZZ_detectable_bln_05d = zeros(n_tSteps,n_probes);
t_eXX_detectable_bln_10d = zeros(n_tSteps,n_probes);
t_eZZ_detectable_bln_10d = zeros(n_tSteps,n_probes);
t_eXX_detectable_bln_50d = zeros(n_tSteps,n_probes);
t_eZZ_detectable_bln_50d = zeros(n_tSteps,n_probes);
for i = 1:size(eXXmeasCriteria_bln_03d,2)
% Depth 1%
    if sum(eXXmeasCriteria_bln_01d(:,i)) > 0
        t_eXX_detectable_bln_01d((eXXmeasCriteria_bln_01d(:,i)),i) = t(eXXmeasCriteria_bln_01d(:,i));
    end
    if sum(eZZmeasCriteria_bln_01d(:,i)) > 0
        t_eZZ_detectable_bln_01d((eZZmeasCriteria_bln_01d(:,i)),i) = t(eZZmeasCriteria_bln_01d(:,i));
    end
% Depth 3%
    if sum(eXXmeasCriteria_bln_03d(:,i)) > 0
        t_eXX_detectable_bln_03d((eXXmeasCriteria_bln_03d(:,i)),i) = t(eXXmeasCriteria_bln_03d(:,i));
    end
    if sum(eZZmeasCriteria_bln_03d(:,i)) > 0
        t_eZZ_detectable_bln_03d((eZZmeasCriteria_bln_03d(:,i)),i) = t(eZZmeasCriteria_bln_03d(:,i));
    end
% Depth 5%
    if sum(eXXmeasCriteria_bln_05d(:,i)) > 0
        t_eXX_detectable_bln_05d((eXXmeasCriteria_bln_05d(:,i)),i) = t(eXXmeasCriteria_bln_05d(:,i));
    end
    if sum(eZZmeasCriteria_bln_05d(:,i)) > 0
        t_eZZ_detectable_bln_05d((eZZmeasCriteria_bln_05d(:,i)),i) = t(eZZmeasCriteria_bln_05d(:,i));
    end
% Depth 10%
    if sum(eXXmeasCriteria_bln_10d(:,i)) > 0
        t_eXX_detectable_bln_10d((eXXmeasCriteria_bln_10d(:,i)),i) = t(eXXmeasCriteria_bln_10d(:,i));
    end
    if sum(eZZmeasCriteria_bln_10d(:,i)) > 0
        t_eZZ_detectable_bln_10d((eZZmeasCriteria_bln_10d(:,i)),i) = t(eZZmeasCriteria_bln_10d(:,i));
    end
% Depth 50%
    if sum(eXXmeasCriteria_bln_50d(:,i)) > 0
        t_eXX_detectable_bln_50d((eXXmeasCriteria_bln_50d(:,i)),i) = t(eXXmeasCriteria_bln_50d(:,i));
    end
    if sum(eZZmeasCriteria_bln_50d(:,i)) > 0
        t_eZZ_detectable_bln_50d((eZZmeasCriteria_bln_50d(:,i)),i) = t(eZZmeasCriteria_bln_50d(:,i));
    end
end

%% Duration Strain is Detectable

% ==================================================================================================== %
% First and last time strain is detectable
% ==================================================================================================== %
tFirst_eXX_detectable_bln_01d  = zeros(1,n_probes);
tLast_eXX_detectable_bln_01d   = zeros(1,n_probes);
tFirst_eZZ_detectable_bln_01d  = zeros(1,n_probes);
tLast_eZZ_detectable_bln_01d   = zeros(1,n_probes);
tFirst_eXX_detectable_bln_03d  = zeros(1,n_probes);
tLast_eXX_detectable_bln_03d   = zeros(1,n_probes);
tFirst_eZZ_detectable_bln_03d  = zeros(1,n_probes);
tLast_eZZ_detectable_bln_03d   = zeros(1,n_probes);
tFirst_eXX_detectable_bln_05d  = zeros(1,n_probes);
tLast_eXX_detectable_bln_05d   = zeros(1,n_probes);
tFirst_eZZ_detectable_bln_05d  = zeros(1,n_probes);
tLast_eZZ_detectable_bln_05d   = zeros(1,n_probes);
tFirst_eXX_detectable_bln_10d  = zeros(1,n_probes);
tLast_eXX_detectable_bln_10d   = zeros(1,n_probes);
tFirst_eZZ_detectable_bln_10d  = zeros(1,n_probes);
tLast_eZZ_detectable_bln_10d   = zeros(1,n_probes);
tFirst_eXX_detectable_bln_50d  = zeros(1,n_probes);
tLast_eXX_detectable_bln_50d   = zeros(1,n_probes);
tFirst_eZZ_detectable_bln_50d  = zeros(1,n_probes);
tLast_eZZ_detectable_bln_50d   = zeros(1,n_probes);
for i = 1:n_probes
% Depth 1%
    if sum(t_eXX_detectable_bln_01d(:,i)) > 0
        tFirst_eXX_detectable_bln_01d(i) = t_eXX_detectable_bln_01d(find(t_eXX_detectable_bln_01d(:,i),1,'first'));
        tLast_eXX_detectable_bln_01d(i) = t_eXX_detectable_bln_01d(find(t_eXX_detectable_bln_01d(:,i),1,'last'));
    end
    if sum(t_eZZ_detectable_bln_01d(:,i)) > 0
        tFirst_eZZ_detectable_bln_01d(i) = t_eZZ_detectable_bln_01d(find(t_eZZ_detectable_bln_01d(:,i),1,'first'));
        tLast_eZZ_detectable_bln_01d(i) = t_eZZ_detectable_bln_01d(find(t_eZZ_detectable_bln_01d(:,i),1,'last'));
    end
% Depth 3%
    if sum(t_eXX_detectable_bln_03d(:,i)) > 0
        tFirst_eXX_detectable_bln_03d(i) = t_eXX_detectable_bln_03d(find(t_eXX_detectable_bln_03d(:,i),1,'first'));
        tLast_eXX_detectable_bln_03d(i) = t_eXX_detectable_bln_03d(find(t_eXX_detectable_bln_03d(:,i),1,'last'));
    end
    if sum(t_eZZ_detectable_bln_03d(:,i)) > 0
        tFirst_eZZ_detectable_bln_03d(i) = t_eZZ_detectable_bln_03d(find(t_eZZ_detectable_bln_03d(:,i),1,'first'));
        tLast_eZZ_detectable_bln_03d(i) = t_eZZ_detectable_bln_03d(find(t_eZZ_detectable_bln_03d(:,i),1,'last'));
    end
% Depth 5%
    if sum(t_eXX_detectable_bln_05d(:,i)) > 0
        tFirst_eXX_detectable_bln_05d(i) = t_eXX_detectable_bln_05d(find(t_eXX_detectable_bln_05d(:,i),1,'first'));
        tLast_eXX_detectable_bln_05d(i) = t_eXX_detectable_bln_05d(find(t_eXX_detectable_bln_05d(:,i),1,'last'));
    end
    if sum(t_eZZ_detectable_bln_05d(:,i)) > 0
        tFirst_eZZ_detectable_bln_05d(i) = t_eZZ_detectable_bln_05d(find(t_eZZ_detectable_bln_05d(:,i),1,'first'));
        tLast_eZZ_detectable_bln_05d(i) = t_eZZ_detectable_bln_05d(find(t_eZZ_detectable_bln_05d(:,i),1,'last'));
    end
% Depth 10%
    if sum(t_eXX_detectable_bln_10d(:,i)) > 0
        tFirst_eXX_detectable_bln_10d(i) = t_eXX_detectable_bln_10d(find(t_eXX_detectable_bln_10d(:,i),1,'first'));
        tLast_eXX_detectable_bln_10d(i) = t_eXX_detectable_bln_10d(find(t_eXX_detectable_bln_10d(:,i),1,'last'));
    end
    if sum(t_eZZ_detectable_bln_10d(:,i)) > 0
        tFirst_eZZ_detectable_bln_10d(i) = t_eZZ_detectable_bln_10d(find(t_eZZ_detectable_bln_10d(:,i),1,'first'));
        tLast_eZZ_detectable_bln_10d(i) = t_eZZ_detectable_bln_10d(find(t_eZZ_detectable_bln_10d(:,i),1,'last'));
    end
% Depth 50%
    if sum(t_eXX_detectable_bln_50d(:,i)) > 0
        tFirst_eXX_detectable_bln_50d(i) = t_eXX_detectable_bln_50d(find(t_eXX_detectable_bln_50d(:,i),1,'first'));
        tLast_eXX_detectable_bln_50d(i) = t_eXX_detectable_bln_50d(find(t_eXX_detectable_bln_50d(:,i),1,'last'));
    end
    if sum(t_eZZ_detectable_bln_50d(:,i)) > 0
        tFirst_eZZ_detectable_bln_50d(i) = t_eZZ_detectable_bln_50d(find(t_eZZ_detectable_bln_50d(:,i),1,'first'));
        tLast_eZZ_detectable_bln_50d(i) = t_eZZ_detectable_bln_50d(find(t_eZZ_detectable_bln_50d(:,i),1,'last'));
    end
end

% ==================================================================================================== %
% Duration strain is detectable
% ==================================================================================================== %
eXX_detectableDuration_bln_01d = zeros(1,n_probes);
eZZ_detectableDuration_bln_01d = zeros(1,n_probes);
eXX_detectableDuration_bln_03d = zeros(1,n_probes);
eZZ_detectableDuration_bln_03d = zeros(1,n_probes);
eXX_detectableDuration_bln_05d = zeros(1,n_probes);
eZZ_detectableDuration_bln_05d = zeros(1,n_probes);
eXX_detectableDuration_bln_10d = zeros(1,n_probes);
eZZ_detectableDuration_bln_10d = zeros(1,n_probes);
eXX_detectableDuration_bln_50d = zeros(1,n_probes);
eZZ_detectableDuration_bln_50d = zeros(1,n_probes);
for i = 1:n_probes
% Depth 1%
    eXX_detectableDuration_bln_01d(i) = tLast_eXX_detectable_bln_01d(i) - tFirst_eXX_detectable_bln_01d(i);
    eZZ_detectableDuration_bln_01d(i) = tLast_eZZ_detectable_bln_01d(i) - tFirst_eZZ_detectable_bln_01d(i);
% Depth 3%
    eXX_detectableDuration_bln_03d(i) = tLast_eXX_detectable_bln_03d(i) - tFirst_eXX_detectable_bln_03d(i);
    eZZ_detectableDuration_bln_03d(i) = tLast_eZZ_detectable_bln_03d(i) - tFirst_eZZ_detectable_bln_03d(i);
% Depth 5%
    eXX_detectableDuration_bln_05d(i) = tLast_eXX_detectable_bln_05d(i) - tFirst_eXX_detectable_bln_05d(i);
    eZZ_detectableDuration_bln_05d(i) = tLast_eZZ_detectable_bln_05d(i) - tFirst_eZZ_detectable_bln_05d(i);
% Depth 10%
    eXX_detectableDuration_bln_10d(i) = tLast_eXX_detectable_bln_10d(i) - tFirst_eXX_detectable_bln_10d(i);
    eZZ_detectableDuration_bln_10d(i) = tLast_eZZ_detectable_bln_10d(i) - tFirst_eZZ_detectable_bln_10d(i);
% Depth 50%
    eXX_detectableDuration_bln_50d(i) = tLast_eXX_detectable_bln_50d(i) - tFirst_eXX_detectable_bln_50d(i);
    eZZ_detectableDuration_bln_50d(i) = tLast_eZZ_detectable_bln_50d(i) - tFirst_eZZ_detectable_bln_50d(i);
end

clear tFirst_eXX_detectable_bln_01d    tLast_eXX_detectable_bln_01d
clear tFirst_eZZ_detectable_bln_01d    tLast_eZZ_detectable_bln_01d
clear tFirst_eXX_detectable_bln_03d    tLast_eXX_detectable_bln_03d
clear tFirst_eZZ_detectable_bln_03d    tLast_eZZ_detectable_bln_03d
clear tFirst_eXX_detectable_bln_05d    tLast_eXX_detectable_bln_05d
clear tFirst_eZZ_detectable_bln_05d    tLast_eZZ_detectable_bln_05d
clear tFirst_eXX_detectable_bln_10d    tLast_eXX_detectable_bln_10d
clear tFirst_eZZ_detectable_bln_10d    tLast_eZZ_detectable_bln_10d
clear tFirst_eXX_detectable_bln_50d    tLast_eXX_detectable_bln_50d
clear tFirst_eZZ_detectable_bln_50d    tLast_eZZ_detectable_bln_50d

clear eXX_minRateCriteria_bln_01d      eZZ_minRateCriteria_bln_01d
clear eXX_minRateCriteria_bln_03d      eZZ_minRateCriteria_bln_03d
clear eXX_minRateCriteria_bln_05d      eZZ_minRateCriteria_bln_05d
clear eXX_minRateCriteria_bln_10d      eZZ_minRateCriteria_bln_10d
clear eXX_minRateCriteria_bln_50d      eZZ_minRateCriteria_bln_50d

%% Corelation Coef and polyfit to eXXrate_minRateDuration
% eXXrate_minRateDuration_03d_coef = (eXXrate_minRateDuration_03d(end)-eXXrate_minRateDuration_03d(1))/(r(end)-r(1)); %s/m
% eXXrate_minRateDuration_03d_polyFit = polyfit(r,eXXrate_minRateDuration_03d,2);
% eXXrate_minRateDuration_03d_polyVal = polyval(eXXrate_minRateDuration_03d_polyFit,r);eZZrate_minRateDuration_03d_coef = (eZZrate_minRateDuration_03d(end)-eZZrate_minRateDuration_03d(1))/(r(end)-r(1)); %s/m
% eZZrate_minRateDuration_03d_polyFit = polyfit(r,eZZrate_minRateDuration_03d,2);
% eZZrate_minRateDuration_03d_polyVal = polyval(eZZrate_minRateDuration_03d_polyFit,r);
