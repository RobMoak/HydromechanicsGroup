%% modelAnalysis2D_sweepEconf
% Author: R. Moak
% Date: 03/05/20

%% Evaluate effect of Parameter on Pressure & Strain Signals
% % This code evaluates:
% 1) maximum strain rate
% 2) average strain rate
% 3) times strain rate is above a minimum threshold
% 4) duration strain rate is above a minimum threshold
% 5) strain magnitude while strain rate is above threshold
% 6) detectable strains based on minMag and minRate
% 7) duration strain meets threshold criteria
% 8) compute magnitude spectra
% 9) perfoms correlations and polynomial fits to data for interpretation

%% Define Key Values

% lower detection thresholds for strain magnitude and rate
minMag = 1E-9; 
minRate = 1E-13; 

% radial distances of probe locations (% of x_c)
r = [50; 250; 500; 1000]; 

%% Calculate Characteristic Parameters

% ===============================================================================================%
% Characteristic Time (t_c)
% ===============================================================================================%

% Parameter 01
tc_frx_sweepEc = (MaterialProps_sweepEc(1).x_c^2)/(4*MaterialProps_sweepEc(1).Ec01);
% tc_frx_sweepEc = tc_frx_sweepEc/86400;

% ===============================================================================================%
% Characteristic Length (x_c)
% ===============================================================================================%
x_c = 1000; % [m]

%% Obtain absolute values of strain rates

% Parameter 01
eXXrate_Ec01_03d = abs(eXXrate_Ec01_03d);
eZZrate_Ec01_03d = abs(eZZrate_Ec01_03d);

% Parameter 02
eXXrate_Ec02_03d = abs(eXXrate_Ec02_03d);
eZZrate_Ec02_03d = abs(eZZrate_Ec02_03d);

% Parameter 03
eXXrate_Ec03_03d = abs(eXXrate_Ec03_03d);
eZZrate_Ec03_03d = abs(eZZrate_Ec03_03d);

%% Maximum Strain Rate

eXXrateMax_Ec01_03d = zeros(1,length(r));
eZZrateMax_Ec01_03d = zeros(1,length(r));
eXXrateMax_Ec02_03d = zeros(1,length(r));
eZZrateMax_Ec02_03d = zeros(1,length(r));
eXXrateMax_Ec03_03d = zeros(1,length(r));
eZZrateMax_Ec03_03d = zeros(1,length(r));
for i = 1:length(r)
% Parameter 01
    eXXrateMax_Ec01_03d(i) = max(eXXrate_Ec01_03d(:,i));
    eZZrateMax_Ec01_03d(i) = max(eZZrate_Ec01_03d(:,i));
% Parameter 02
    eXXrateMax_Ec02_03d(i) = max(eXXrate_Ec02_03d(:,i));
    eZZrateMax_Ec02_03d(i) = max(eZZrate_Ec02_03d(:,i));
% Parameter 03
    eXXrateMax_Ec03_03d(i) = max(eXXrate_Ec03_03d(:,i));
    eZZrateMax_Ec03_03d(i) = max(eZZrate_Ec03_03d(:,i));
end

%% Average Strain Rate

eXXrateMean_Ec01_03d = zeros(1,length(r));
eZZrateMean_Ec01_03d = zeros(1,length(r));
eXXrateMean_Ec02_03d = zeros(1,length(r));
eZZrateMean_Ec02_03d = zeros(1,length(r));
eXXrateMean_Ec03_03d = zeros(1,length(r));
eZZrateMean_Ec03_03d = zeros(1,length(r));
for i = 1:length(r)
% Parameter 01
    eXXrateMean_Ec01_03d(i) = mean(eXXrate_Ec01_03d(:,i));
    eZZrateMean_Ec01_03d(i) = mean(eZZrate_Ec01_03d(:,i));
% Parameter 02
    eXXrateMean_Ec02_03d(i) = mean(eXXrate_Ec02_03d(:,i));
    eZZrateMean_Ec02_03d(i) = mean(eZZrate_Ec02_03d(:,i));
% Parameter 03
    eXXrateMean_Ec03_03d(i) = mean(eXXrate_Ec03_03d(:,i));
    eZZrateMean_Ec03_03d(i) = mean(eZZrate_Ec03_03d(:,i));
end

%% Times during which Strain Rate > minRate

% Define minRateCriteria

eXX_minRateCriteria_Ec01_03d = zeros(length(t),length(r));
eZZ_minRateCriteria_Ec01_03d = zeros(length(t),length(r));
eXX_minRateCriteria_Ec02_03d = zeros(length(t),length(r));
eZZ_minRateCriteria_Ec02_03d = zeros(length(t),length(r));
eXX_minRateCriteria_Ec03_03d = zeros(length(t),length(r));
eZZ_minRateCriteria_Ec03_03d = zeros(length(t),length(r));
for i = 1:length(r)
% Paramter 01
    eXX_minRateCriteria_Ec01_03d(:,i) = eXXrate_Ec01_03d(:,i)>minRate;
    eZZ_minRateCriteria_Ec01_03d(:,i) = eZZrate_Ec01_03d(:,i)>minRate;
% Paramter 02
    eXX_minRateCriteria_Ec02_03d(:,i) = eXXrate_Ec02_03d(:,i)>minRate;
    eZZ_minRateCriteria_Ec02_03d(:,i) = eZZrate_Ec02_03d(:,i)>minRate;
% Paramter 03
    eXX_minRateCriteria_Ec03_03d(:,i) = eXXrate_Ec03_03d(:,i)>minRate;
    eZZ_minRateCriteria_Ec03_03d(:,i) = eZZrate_Ec03_03d(:,i)>minRate;
end

% Times meeting criteria
t_aboveMinRate_eXX_Ec01_03d = zeros(length(t),length(r));
t_aboveMinRate_eZZ_Ec01_03d = zeros(length(t),length(r));
t_aboveMinRate_eXX_Ec02_03d = zeros(length(t),length(r));
t_aboveMinRate_eZZ_Ec02_03d = zeros(length(t),length(r));
t_aboveMinRate_eXX_Ec03_03d = zeros(length(t),length(r));
t_aboveMinRate_eZZ_Ec03_03d = zeros(length(t),length(r));
for i = 1:length(r)
% Parameter 01
    if sum(eXX_minRateCriteria_Ec01_03d(:,i)) > 0
        t_aboveMinRate_eXX_Ec01_03d(find(eXX_minRateCriteria_Ec01_03d(:,i)),i) = t(find(eXX_minRateCriteria_Ec01_03d(:,i)));
    else
        t_aboveMinRate_eXX_Ec01_03d(:,i) = 0;
    end
    if sum(eZZ_minRateCriteria_Ec01_03d(:,i)) > 0
        t_aboveMinRate_eZZ_Ec01_03d(find(eZZ_minRateCriteria_Ec01_03d(:,i)),i) = t(find(eZZ_minRateCriteria_Ec01_03d(:,i)));
    else
        t_aboveMinRate_eZZ_Ec01_03d(:,i) = 0;
    end
% Parameter 02
    if sum(eXX_minRateCriteria_Ec02_03d(:,i)) > 0
        t_aboveMinRate_eXX_Ec02_03d(find(eXX_minRateCriteria_Ec02_03d(:,i)),i) = t(find(eXX_minRateCriteria_Ec02_03d(:,i)));
    else
        t_aboveMinRate_eXX_Ec02_03d(:,i) = 0;
    end
    if sum(eZZ_minRateCriteria_Ec02_03d(:,i)) > 0
        t_aboveMinRate_eZZ_Ec02_03d(find(eZZ_minRateCriteria_Ec02_03d(:,i)),i) = t(find(eZZ_minRateCriteria_Ec02_03d(:,i)));
    else
        t_aboveMinRate_eZZ_Ec02_03d(:,i) = 0;
    end
% Parameter 03
    if sum(eXX_minRateCriteria_Ec03_03d(:,i)) > 0
        t_aboveMinRate_eXX_Ec03_03d(find(eXX_minRateCriteria_Ec03_03d(:,i)),i) = t(find(eXX_minRateCriteria_Ec03_03d(:,i)));
    else
        t_aboveMinRate_eXX_Ec03_03d(:,i) = 0;
    end
    if sum(eZZ_minRateCriteria_Ec03_03d(:,i)) > 0
        t_aboveMinRate_eZZ_Ec03_03d(find(eZZ_minRateCriteria_Ec03_03d(:,i)),i) = t(find(eZZ_minRateCriteria_Ec03_03d(:,i)));
    else
        t_aboveMinRate_eZZ_Ec03_03d(:,i) = 0;
    end
end

clear eXX_minRateCriteria_Ec01_03d eZZ_minRateCriteria_Ec01_03d
clear eXX_minRateCriteria_Ec02_03d eZZ_minRateCriteria_Ec02_03d
clear eXX_minRateCriteria_Ec03_03d eZZ_minRateCriteria_Ec03_03d

%% Duration during which strain rate > minRate

% first time at which eXXrate > minRate (last non-zero value)
for i = 1:length(r)
% Paramter 01
    if sum(t_aboveMinRate_eXX_Ec01_03d(:,i)) > 0
        tFirst_aboveMinRate_eXX_Ec01_03d(i) = t_aboveMinRate_eXX_Ec01_03d(find(t_aboveMinRate_eXX_Ec01_03d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_Ec01_03d(i) = t_aboveMinRate_eXX_Ec01_03d(find(t_aboveMinRate_eXX_Ec01_03d(:,i),1,'last'));
    else
        tFirst_aboveMinRate_eXX_Ec01_03d(:,i) = 0;
        tLast_aboveMinRate_eXX_Ec01_03d(:,i) = 0;
    end
    if sum(t_aboveMinRate_eZZ_Ec01_03d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_Ec01_03d(i) = t_aboveMinRate_eZZ_Ec01_03d(find(t_aboveMinRate_eZZ_Ec01_03d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_Ec01_03d(i) = t_aboveMinRate_eZZ_Ec01_03d(find(t_aboveMinRate_eZZ_Ec01_03d(:,i),1,'last'));
    else
       tFirst_aboveMinRate_eZZ_Ec01_03d(:,i) = 0;
       tLast_aboveMinRate_eZZ_Ec01_03d(:,i) = 0;
    end
% Paramter 02
    if sum(t_aboveMinRate_eXX_Ec02_03d(:,i)) > 0
        tFirst_aboveMinRate_eXX_Ec02_03d(i) = t_aboveMinRate_eXX_Ec02_03d(find(t_aboveMinRate_eXX_Ec02_03d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_Ec02_03d(i) = t_aboveMinRate_eXX_Ec02_03d(find(t_aboveMinRate_eXX_Ec02_03d(:,i),1,'last'));
    else
        tFirst_aboveMinRate_eXX_Ec02_03d(:,i) = 0;
        tLast_aboveMinRate_eXX_Ec02_03d(:,i) = 0;
    end
    if sum(t_aboveMinRate_eZZ_Ec02_03d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_Ec02_03d(i) = t_aboveMinRate_eZZ_Ec02_03d(find(t_aboveMinRate_eZZ_Ec02_03d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_Ec02_03d(i) = t_aboveMinRate_eZZ_Ec02_03d(find(t_aboveMinRate_eZZ_Ec02_03d(:,i),1,'last'));
    else
       tFirst_aboveMinRate_eZZ_Ec02_03d(:,i) = 0;
       tLast_aboveMinRate_eZZ_Ec02_03d(:,i) = 0;
    end
% Paramter 03
    if sum(t_aboveMinRate_eXX_Ec03_03d(:,i)) > 0
        tFirst_aboveMinRate_eXX_Ec03_03d(i) = t_aboveMinRate_eXX_Ec03_03d(find(t_aboveMinRate_eXX_Ec03_03d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_Ec03_03d(i) = t_aboveMinRate_eXX_Ec03_03d(find(t_aboveMinRate_eXX_Ec03_03d(:,i),1,'last'));
    else
        tFirst_aboveMinRate_eXX_Ec03_03d(:,i) = 0;
        tLast_aboveMinRate_eXX_Ec03_03d(:,i) = 0;
    end
    if sum(t_aboveMinRate_eZZ_Ec03_03d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_Ec03_03d(i) = t_aboveMinRate_eZZ_Ec03_03d(find(t_aboveMinRate_eZZ_Ec03_03d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_Ec03_03d(i) = t_aboveMinRate_eZZ_Ec03_03d(find(t_aboveMinRate_eZZ_Ec03_03d(:,i),1,'last'));
    else
       tFirst_aboveMinRate_eZZ_Ec03_03d(:,i) = 0;
       tLast_aboveMinRate_eZZ_Ec03_03d(:,i) = 0;
    end
end

% Durations for which strain rate > minRate
for i = 1:length(r)
% Parameter 01
    t_aboveMinRateDuration_eXX_Ec01_03d(1,i) = tLast_aboveMinRate_eXX_Ec01_03d(1,i)-tFirst_aboveMinRate_eXX_Ec01_03d(1,i);
    t_aboveMinRateDuration_eZZ_Ec01_03d(1,i) = tLast_aboveMinRate_eZZ_Ec01_03d(1,i)-tFirst_aboveMinRate_eZZ_Ec01_03d(1,i);
% Parameter 02
    t_aboveMinRateDuration_eXX_Ec02_03d(1,i) = tLast_aboveMinRate_eXX_Ec02_03d(1,i)-tFirst_aboveMinRate_eXX_Ec02_03d(1,i);
    t_aboveMinRateDuration_eZZ_Ec02_03d(1,i) = tLast_aboveMinRate_eZZ_Ec02_03d(1,i)-tFirst_aboveMinRate_eZZ_Ec02_03d(1,i);
% Parameter 03
    t_aboveMinRateDuration_eXX_Ec03_03d(1,i) = tLast_aboveMinRate_eXX_Ec03_03d(1,i)-tFirst_aboveMinRate_eXX_Ec03_03d(1,i);
    t_aboveMinRateDuration_eZZ_Ec03_03d(1,i) = tLast_aboveMinRate_eZZ_Ec03_03d(1,i)-tFirst_aboveMinRate_eZZ_Ec03_03d(1,i);
end

clear tFirst_aboveMinRate_eXX_Ec01_03d
clear tFirst_aboveMinRate_eZZ_Ec01_03d
clear tLast_aboveMinRate_eXX_Ec01_03d
clear tLast_aboveMinRate_eZZ_Ec01_03d

clear tFirst_aboveMinRate_eXX_Ec02_03d
clear tFirst_aboveMinRate_eZZ_Ec02_03d
clear tLast_aboveMinRate_eXX_Ec02_03d
clear tLast_aboveMinRate_eZZ_Ec02_03d

clear tFirst_aboveMinRate_eXX_Ec03_03d
clear tFirst_aboveMinRate_eZZ_Ec03_03d
clear tLast_aboveMinRate_eXX_Ec03_03d
clear tLast_aboveMinRate_eZZ_Ec03_03d

%% Magnitude while strain rate > minRate

eXX_magAboveMinRate_Ec01_03d = zeros(length(t),length(r));
eZZ_magAboveMinRate_Ec01_03d = zeros(length(t),length(r));
eXX_magAboveMinRate_Ec02_03d = zeros(length(t),length(r));
eZZ_magAboveMinRate_Ec02_03d = zeros(length(t),length(r));
eXX_magAboveMinRate_Ec03_03d = zeros(length(t),length(r));
eZZ_magAboveMinRate_Ec03_03d = zeros(length(t),length(r));
for i = 1:length(r)
% Parameter 01
    if sum(t_aboveMinRate_eXX_Ec01_03d(:,i)) > 0
        eXX_magAboveMinRate_Ec01_03d(find(t_aboveMinRate_eXX_Ec01_03d(:,i)),i) = eXX_Ec01_03d(find(t_aboveMinRate_eXX_Ec01_03d(:,i)),i);
    else
        eXX_magAboveMinRate_Ec01_03d(:,i) = 0;
    end
    if sum(t_aboveMinRate_eZZ_Ec01_03d(:,i)) > 0
        eZZ_magAboveMinRate_Ec01_03d(find(t_aboveMinRate_eZZ_Ec01_03d(:,i)),i) = eZZ_Ec01_03d(find(t_aboveMinRate_eZZ_Ec01_03d(:,i)),i);
    else
        eZZ_magAboveMinRate_Ec01_03d(:,i) = 0;
    end
% Parameter 02
    if sum(t_aboveMinRate_eXX_Ec02_03d(:,i)) > 0
        eXX_magAboveMinRate_Ec02_03d(find(t_aboveMinRate_eXX_Ec02_03d(:,i)),i) = eXX_Ec02_03d(find(t_aboveMinRate_eXX_Ec02_03d(:,i)),i);
    else
        eXX_magAboveMinRate_Ec02_03d(:,i) = 0;
    end
    if sum(t_aboveMinRate_eZZ_Ec02_03d(:,i)) > 0
        eZZ_magAboveMinRate_Ec02_03d(find(t_aboveMinRate_eZZ_Ec02_03d(:,i)),i) = eZZ_Ec02_03d(find(t_aboveMinRate_eZZ_Ec02_03d(:,i)),i);
    else
        eZZ_magAboveMinRate_Ec02_03d(:,i) = 0;
    end
% Parameter 03
    if sum(t_aboveMinRate_eXX_Ec03_03d(:,i)) > 0
        eXX_magAboveMinRate_Ec03_03d(find(t_aboveMinRate_eXX_Ec03_03d(:,i)),i) = eXX_Ec03_03d(find(t_aboveMinRate_eXX_Ec03_03d(:,i)),i);
    else
        eXX_magAboveMinRate_Ec03_03d(:,i) = 0;
    end
    if sum(t_aboveMinRate_eZZ_Ec03_03d(:,i)) > 0
        eZZ_magAboveMinRate_Ec03_03d(find(t_aboveMinRate_eZZ_Ec03_03d(:,i)),i) = eZZ_Ec03_03d(find(t_aboveMinRate_eZZ_Ec03_03d(:,i)),i);
    else
        eZZ_magAboveMinRate_Ec03_03d(:,i) = 0;
    end
end

%% Detectable Strains

% Define Measurement Criteria 
for i = 1:length(r)
% Parameter 01
    eXXmeasCriteria01(:,i) = (abs(eXX_magAboveMinRate_Ec01_03d(:,i)) > minMag & eXXrate_Ec01_03d(:,i) > minRate);
    eZZmeasCriteria01(:,i) = (abs(eZZ_magAboveMinRate_Ec01_03d(:,i)) > minMag & eZZrate_Ec01_03d(:,i) > minRate);
% Parameter 02
    eXXmeasCriteria02(:,i) = (abs(eXX_magAboveMinRate_Ec02_03d(:,i)) > minMag & eXXrate_Ec02_03d(:,i) > minRate);
    eZZmeasCriteria02(:,i) = (abs(eZZ_magAboveMinRate_Ec02_03d(:,i)) > minMag & eZZrate_Ec02_03d(:,i) > minRate);
% Parameter 03
    eXXmeasCriteria03(:,i) = (abs(eXX_magAboveMinRate_Ec03_03d(:,i)) > minMag & eXXrate_Ec03_03d(:,i) > minRate);
    eZZmeasCriteria03(:,i) = (abs(eZZ_magAboveMinRate_Ec03_03d(:,i)) > minMag & eZZrate_Ec03_03d(:,i) > minRate);
end

% Detectable Strains
eXX_detectable_Ec01_03d = NaN(length(t),length(r));
eZZ_detectable_Ec01_03d = NaN(length(t),length(r));
eXX_detectable_Ec02_03d = NaN(length(t),length(r));
eZZ_detectable_Ec02_03d = NaN(length(t),length(r));
eXX_detectable_Ec03_03d = NaN(length(t),length(r));
eZZ_detectable_Ec03_03d = NaN(length(t),length(r));
for i = 1:length(r)
% Parameter 01
    if sum(eXXmeasCriteria01(:,i)) > 0
        eXX_detectable_Ec01_03d((eXXmeasCriteria01(:,i)),i) = eXX_Ec01_03d((eXXmeasCriteria01(:,i)),i);
    else
        eXX_detectable_Ec01_03d(:,i) = NaN;
    end
    if sum(eZZmeasCriteria01(:,i)) > 0
        eZZ_detectable_Ec01_03d((eZZmeasCriteria01(:,i)),i) = eZZ_Ec01_03d((eZZmeasCriteria01(:,i)),i);
    else
        eZZ_detectable_Ec01_03d(:,i) = NaN;
    end
% Parameter 02
    if sum(eXXmeasCriteria02(:,i)) > 0
        eXX_detectable_Ec02_03d((eXXmeasCriteria02(:,i)),i) = eXX_Ec02_03d((eXXmeasCriteria02(:,i)),i);
    else
        eXX_detectable_Ec02_03d(:,i) = NaN;
    end
    if sum(eZZmeasCriteria02(:,i)) > 0
        eZZ_detectable_Ec02_03d((eZZmeasCriteria02(:,i)),i) = eZZ_Ec02_03d((eZZmeasCriteria02(:,i)),i);
    else
        eZZ_detectable_Ec02_03d(:,i) = NaN;
    end
% Parameter 03
    if sum(eXXmeasCriteria03(:,i)) > 0
        eXX_detectable_Ec03_03d((eXXmeasCriteria03(:,i)),i) = eXX_Ec03_03d((eXXmeasCriteria03(:,i)),i);
    else
        eXX_detectable_Ec03_03d(:,i) = NaN;
    end
    if sum(eZZmeasCriteria03(:,i)) > 0
        eZZ_detectable_Ec03_03d((eZZmeasCriteria03(:,i)),i) = eZZ_Ec03_03d((eZZmeasCriteria03(:,i)),i);
    else
        eZZ_detectable_Ec03_03d(:,i) = NaN;
    end
end

%% Times of Dectectable Strain (mag>minMag & rate>minRate)

t_eXX_detectable_Ec01_03d = zeros(length(t),length(r));
t_eZZ_detectable_Ec01_03d = zeros(length(t),length(r));
t_eXX_detectable_Ec02_03d = zeros(length(t),length(r));
t_eZZ_detectable_Ec02_03d = zeros(length(t),length(r));
t_eXX_detectable_Ec03_03d = zeros(length(t),length(r));
t_eZZ_detectable_Ec03_03d = zeros(length(t),length(r));
for i = 1:length(r)
% Parameter 01
    if sum(eXXmeasCriteria01(:,i)) > 0
        t_eXX_detectable_Ec01_03d((eXXmeasCriteria01(:,i)),i) = t(eXXmeasCriteria01(:,i));
    else
        t_eXX_detectable_Ec01_03d(:,i) = 0;
    end
    if sum(eZZmeasCriteria01(:,i)) > 0
        t_eZZ_detectable_Ec01_03d((eZZmeasCriteria01(:,i)),i) = t(eZZmeasCriteria01(:,i));
    else
        t_eZZ_detectable_Ec01_03d(:,i) = 0;
    end
% Parameter 02
    if sum(eXXmeasCriteria02(:,i)) > 0
        t_eXX_detectable_Ec02_03d((eXXmeasCriteria02(:,i)),i) = t(eXXmeasCriteria02(:,i));
    else
        t_eXX_detectable_Ec02_03d(:,i) = 0;
    end
    if sum(eZZmeasCriteria02(:,i)) > 0
        t_eZZ_detectable_Ec02_03d((eZZmeasCriteria02(:,i)),i) = t(eZZmeasCriteria02(:,i));
    else
        t_eZZ_detectable_Ec02_03d(:,i) = 0;
    end
% Parameter 03
    if sum(eXXmeasCriteria03(:,i)) > 0
        t_eXX_detectable_Ec03_03d((eXXmeasCriteria03(:,i)),i) = t(eXXmeasCriteria03(:,i));
    else
        t_eXX_detectable_Ec03_03d(:,i) = 0;
    end
    if sum(eZZmeasCriteria03(:,i)) > 0
        t_eZZ_detectable_Ec03_03d((eZZmeasCriteria03(:,i)),i) = t(eZZmeasCriteria03(:,i));
    else
        t_eZZ_detectable_Ec03_03d(:,i) = 0;
    end
end

clear eXXmeasCriteria01 eZZmeasCriteria01
clear eXXmeasCriteria02 eZZmeasCriteria02
clear eXXmeasCriteria03 eZZmeasCriteria03

%% Duration Strain is Detectable

% first and last time strain is detectable
for i = 1:length(r)
% Parameter 01
    if sum(t_eXX_detectable_Ec01_03d(:,i)) > 0
        tFirst_eXX_detectable_Ec01_03d(i) = t_eXX_detectable_Ec01_03d(find(t_eXX_detectable_Ec01_03d(:,i),1,'first'));
        tLast_eXX_detectable_Ec01_03d(i) = t_eXX_detectable_Ec01_03d(find(t_eXX_detectable_Ec01_03d(:,i),1,'last'));
    else
        tFirst_eXX_detectable_Ec01_03d(i) = 0;
        tLast_eXX_detectable_Ec01_03d(i) = 0;
    end
    if sum(t_eZZ_detectable_Ec01_03d(:,i)) > 0
        tFirst_eZZ_detectable_Ec01_03d(i) = t_eZZ_detectable_Ec01_03d(find(t_eZZ_detectable_Ec01_03d(:,i),1,'first'));
        tLast_eZZ_detectable_Ec01_03d(i) = t_eZZ_detectable_Ec01_03d(find(t_eZZ_detectable_Ec01_03d(:,i),1,'last'));
    else
        tFirst_eZZ_detectable_Ec01_03d(i) = 0;
        tLast_eZZ_detectable_Ec01_03d(i) = 0;
    end
% Parameter 02
    if sum(t_eXX_detectable_Ec02_03d(:,i)) > 0
        tFirst_eXX_detectable_Ec02_03d(i) = t_eXX_detectable_Ec02_03d(find(t_eXX_detectable_Ec02_03d(:,i),1,'first'));
        tLast_eXX_detectable_Ec02_03d(i) = t_eXX_detectable_Ec02_03d(find(t_eXX_detectable_Ec02_03d(:,i),1,'last'));
    else
        tFirst_eXX_detectable_Ec02_03d(i) = 0;
        tLast_eXX_detectable_Ec02_03d(i) = 0;
    end
    if sum(t_eZZ_detectable_Ec02_03d(:,i)) > 0
        tFirst_eZZ_detectable_Ec02_03d(i) = t_eZZ_detectable_Ec02_03d(find(t_eZZ_detectable_Ec02_03d(:,i),1,'first'));
        tLast_eZZ_detectable_Ec02_03d(i) = t_eZZ_detectable_Ec02_03d(find(t_eZZ_detectable_Ec02_03d(:,i),1,'last'));
    else
        tFirst_eZZ_detectable_Ec02_03d(i) = 0;
        tLast_eZZ_detectable_Ec02_03d(i) = 0;
    end
% Parameter 03
    if sum(t_eXX_detectable_Ec03_03d(:,i)) > 0
        tFirst_eXX_detectable_Ec03_03d(i) = t_eXX_detectable_Ec03_03d(find(t_eXX_detectable_Ec03_03d(:,i),1,'first'));
        tLast_eXX_detectable_Ec03_03d(i) = t_eXX_detectable_Ec03_03d(find(t_eXX_detectable_Ec03_03d(:,i),1,'last'));
    else
        tFirst_eXX_detectable_Ec03_03d(i) = 0;
        tLast_eXX_detectable_Ec03_03d(i) = 0;
    end
    if sum(t_eZZ_detectable_Ec03_03d(:,i)) > 0
        tFirst_eZZ_detectable_Ec03_03d(i) = t_eZZ_detectable_Ec03_03d(find(t_eZZ_detectable_Ec03_03d(:,i),1,'first'));
        tLast_eZZ_detectable_Ec03_03d(i) = t_eZZ_detectable_Ec03_03d(find(t_eZZ_detectable_Ec03_03d(:,i),1,'last'));
    else
        tFirst_eZZ_detectable_Ec03_03d(i) = 0;
        tLast_eZZ_detectable_Ec03_03d(i) = 0;
    end
end

% Duration strain is detectable
eXX_detectableDuration_Ec01_03d = zeros(1,length(r));
eZZ_detectableDuration_Ec01_03d = zeros(1,length(r));
eXX_detectableDuration_Ec02_03d = zeros(1,length(r));
eZZ_detectableDuration_Ec02_03d = zeros(1,length(r));
eXX_detectableDuration_Ec03_03d = zeros(1,length(r));
eZZ_detectableDuration_Ec03_03d = zeros(1,length(r));
for i = 1:length(r)
% Parameter 01
    eXX_detectableDuration_Ec01_03d(i) = tLast_eXX_detectable_Ec01_03d(i) - tFirst_eXX_detectable_Ec01_03d(i);
    eZZ_detectableDuration_Ec01_03d(i) = tLast_eZZ_detectable_Ec01_03d(i) - tFirst_eZZ_detectable_Ec01_03d(i);
% Parameter 02
    eXX_detectableDuration_Ec02_03d(i) = tLast_eXX_detectable_Ec02_03d(i) - tFirst_eXX_detectable_Ec02_03d(i);
    eZZ_detectableDuration_Ec02_03d(i) = tLast_eZZ_detectable_Ec02_03d(i) - tFirst_eZZ_detectable_Ec02_03d(i);
% Parameter 03
    eXX_detectableDuration_Ec03_03d(i) = tLast_eXX_detectable_Ec03_03d(i) - tFirst_eXX_detectable_Ec03_03d(i);
    eZZ_detectableDuration_Ec03_03d(i) = tLast_eZZ_detectable_Ec03_03d(i) - tFirst_eZZ_detectable_Ec03_03d(i);
end

clear tFirst_eXX_detectable_Ec01_03d tFirst_eZZ_detectable_Ec01_03d
clear tLast_eXX_detectable_Ec01_03d tLast_eZZ_detectable_Ec01_03d
clear tFirst_eXX_detectable_Ec02_03d tFirst_eZZ_detectable_Ec02_03d
clear tLast_eXX_detectable_Ec02_03d tLast_eZZ_detectable_Ec02_03d
clear tFirst_eXX_detectable_Ec03_03d tFirst_eZZ_detectable_Ec03_03d
clear tLast_eXX_detectable_Ec03_03d tLast_eZZ_detectable_Ec03_03d

%% Compute Magnitude Spectra

% parameter 01
[F_Ec01,    eXXmagSpec_05w03d_Ec01] = magSpectra(eXX_Ec01_03d(:,1),sampleRate_bln);
[~,           eXXmagSpec_25w03d_Ec01] = magSpectra(eXX_Ec01_03d(:,2),sampleRate_bln);
[~,           eXXmagSpec_50w03d_Ec01] = magSpectra(eXX_Ec01_03d(:,3),sampleRate_bln);
[~,           eXXmagSpec_100w03d_Ec01] = magSpectra(eXX_Ec01_03d(:,4),sampleRate_bln);

eXXmagSpec_Ec01_03d = [eXXmagSpec_05w03d_Ec01 eXXmagSpec_25w03d_Ec01 eXXmagSpec_50w03d_Ec01 eXXmagSpec_100w03d_Ec01];
clear eXXmagSpec_05w03d_Ec01 eXXmagSpec_25w03d_Ec01 eXXmagSpec_50w03d_Ec01 eXXmagSpec_100w03d_Ec01

% parameter 02
[F_Ec02,    eXXmagSpec_05w03d_Ec02] = magSpectra(eXX_Ec02_03d(:,1),sampleRate_bln);
[~,           eXXmagSpec_25w03d_Ec02] = magSpectra(eXX_Ec02_03d(:,2),sampleRate_bln);
[~,           eXXmagSpec_50w03d_Ec02] = magSpectra(eXX_Ec02_03d(:,3),sampleRate_bln);
[~,           eXXmagSpec_100w03d_Ec02] = magSpectra(eXX_Ec02_03d(:,4),sampleRate_bln);

eXXmagSpec_Ec02_03d = [eXXmagSpec_05w03d_Ec02 eXXmagSpec_25w03d_Ec02 eXXmagSpec_50w03d_Ec02 eXXmagSpec_100w03d_Ec02];
clear eXXmagSpec_05w03d_Ec02 eXXmagSpec_25w03d_Ec02 eXXmagSpec_50w03d_Ec02 eXXmagSpec_100w03d_Ec02

% parameter 03
[F_Ec03,    eXXmagSpec_05w03d_Ec03] = magSpectra(eXX_Ec03_03d(:,1),sampleRate_bln);
[~,           eXXmagSpec_25w03d_Ec03] = magSpectra(eXX_Ec03_03d(:,2),sampleRate_bln);
[~,           eXXmagSpec_50w03d_Ec03] = magSpectra(eXX_Ec03_03d(:,3),sampleRate_bln);
[~,           eXXmagSpec_100w03d_Ec03] = magSpectra(eXX_Ec03_03d(:,4),sampleRate_bln);

eXXmagSpec_Ec03_03d = [eXXmagSpec_05w03d_Ec03 eXXmagSpec_25w03d_Ec03 eXXmagSpec_50w03d_Ec03 eXXmagSpec_100w03d_Ec03];
clear eXXmagSpec_05w03d_Ec03 eXXmagSpec_25w03d_Ec03 eXXmagSpec_50w03d_Ec03 eXXmagSpec_100w03d_Ec03

%% Find Maximum Value of each Magnitude Spectra Series

% parameter 01
eXXmagSpecMax_Ec01_03d = zeros(1,length(r));
for i = 1:length(r)
    eXXmagSpecMax_Ec01_03d(i) = max(eXXmagSpec_Ec01_03d(:,i));
end

% parameter 02      
eXXmagSpecMax_Ec02_03d = zeros(1,length(r));
for i = 1:length(r)
    eXXmagSpecMax_Ec02_03d(i) = max(eXXmagSpec_Ec02_03d(:,i));
end

% parameter 03      
eXXmagSpecMax_Ec03_03d = zeros(1,length(r));
for i = 1:length(r)
    eXXmagSpecMax_Ec03_03d(i) = max(eXXmagSpec_Ec03_03d(:,i));
end

%% Corelation Coef and polyfit to eXXrate_minRateDuration
% eXXrate_minRateDuration_03d_coef = (eXXrate_minRateDuration_03d(end)-eXXrate_minRateDuration_03d(1))/(r(end)-r(1)); %s/m
% eXXrate_minRateDuration_03d_polyFit = polyfit(r,eXXrate_minRateDuration_03d,2);
% eXXrate_minRateDuration_03d_polyVal = polyval(eXXrate_minRateDuration_03d_polyFit,r);eZZrate_minRateDuration_03d_coef = (eZZrate_minRateDuration_03d(end)-eZZrate_minRateDuration_03d(1))/(r(end)-r(1)); %s/m
% eZZrate_minRateDuration_03d_polyFit = polyfit(r,eZZrate_minRateDuration_03d,2);
% eZZrate_minRateDuration_03d_polyVal = polyval(eZZrate_minRateDuration_03d_polyFit,r);