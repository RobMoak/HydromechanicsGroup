%% modelAnalysis2D_sweepTp
% Author: R. Moak
% Date: 02/19/20

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
minCriteria;

% radial distances of probe locations (% of x_c)
r = [50; 250; 500; 1000]; 

% injection rates
injRate_Tp01 = 1E5/ModelParams_sweepTp.Tp01;
injRate_Tp02 = 1E5/ModelParams_sweepTp.Tp02;
injRate_Tp03 = 1E5/ModelParams_sweepTp.Tp03;
injRate_Tp04 = 1E5/ModelParams_sweepTp.Tp04;
injRate_Tp05 = 1E5/ModelParams_sweepTp.Tp05;

pRates = [injRate_Tp01 injRate_Tp02 injRate_Tp03 injRate_Tp04 injRate_Tp05];
clear injRate_Tp01 injRate_Tp02 injRate_Tp03 injRate_Tp04 injRate_Tp05

% Period in Hours
Tp01_hr = ModelParams_sweepTp.Tp01/3600;
Tp02_hr = ModelParams_sweepTp.Tp02/3600;
Tp03_hr = ModelParams_sweepTp.Tp03/3600;
Tp04_hr = ModelParams_sweepTp.Tp04/3600;
Tp05_hr = ModelParams_sweepTp.Tp05/3600;

Tp_hr = [Tp01_hr Tp02_hr Tp03_hr Tp04_hr Tp05_hr];
clear Tp01_hr Tp02_hr Tp03_hr Tp04_hr Tp05_hr

%% Calculate Characteristic Parameters

% Characteristic Time
tc_frx_sweepTp = (ModelParams_sweepTp(1).x_c^2)/(4*ModelParams_sweepTp(1).D_frx);
% tc_frx_sweepTp = tc_frx_sweepTp/86400;

% Characteristic Length
x_c = 1000; % [m]

%% Obtain absolute values of strain rates

% Parameter 01
eXXrate_Tp01_03d = abs(eXXrate_Tp01_03d);
eZZrate_Tp01_03d = abs(eZZrate_Tp01_03d);

% Parameter 02
eXXrate_Tp02_03d = abs(eXXrate_Tp02_03d);
eZZrate_Tp02_03d = abs(eZZrate_Tp02_03d);

% Parameter 03
eXXrate_Tp03_03d = abs(eXXrate_Tp03_03d);
eZZrate_Tp03_03d = abs(eZZrate_Tp03_03d);

% Parameter 04
eXXrate_Tp04_03d = abs(eXXrate_Tp04_03d);
eZZrate_Tp04_03d = abs(eZZrate_Tp04_03d);

% Parameter 05
eXXrate_Tp05_03d = abs(eXXrate_Tp05_03d);
eZZrate_Tp05_03d = abs(eZZrate_Tp05_03d);


%% Maximum Strain Rate
eXXrateMax_Tp01_03d = zeros(1,length(r));
eZZrateMax_Tp01_03d = zeros(1,length(r));
eXXrateMax_Tp02_03d = zeros(1,length(r));
eZZrateMax_Tp02_03d = zeros(1,length(r));
eXXrateMax_Tp03_03d = zeros(1,length(r));
eZZrateMax_Tp03_03d = zeros(1,length(r));
eXXrateMax_Tp04_03d = zeros(1,length(r));
eZZrateMax_Tp04_03d = zeros(1,length(r));
eXXrateMax_Tp05_03d = zeros(1,length(r));
eZZrateMax_Tp05_03d = zeros(1,length(r));
% Parameter 01
for i = 1:length(r)
    eXXrateMax_Tp01_03d(i) = max(eXXrate_Tp01_03d(:,i));
    eZZrateMax_Tp01_03d(i) = max(eZZrate_Tp01_03d(:,i));
end

% Parameter 02
for i = 1:length(r)
    eXXrateMax_Tp02_03d(i) = max(eXXrate_Tp02_03d(:,i));
    eZZrateMax_Tp02_03d(i) = max(eZZrate_Tp02_03d(:,i));
end

% Parameter 03
for i = 1:length(r)
    eXXrateMax_Tp03_03d(i) = max(eXXrate_Tp03_03d(:,i));
    eZZrateMax_Tp03_03d(i) = max(eZZrate_Tp03_03d(:,i));
end

% Parameter 04
for i = 1:length(r)
    eXXrateMax_Tp04_03d(i) = max(eXXrate_Tp04_03d(:,i));
    eZZrateMax_Tp04_03d(i) = max(eZZrate_Tp04_03d(:,i));
end

% Parameter 05
for i = 1:length(r)
    eXXrateMax_Tp05_03d(i) = max(eXXrate_Tp05_03d(:,i));
    eZZrateMax_Tp05_03d(i) = max(eZZrate_Tp05_03d(:,i));
end

%% Time after injection at which maximum strain rate occurs

eXXrateMean_Tp01_03d = zeros(1,length(r));
eZZrateMean_Tp01_03d = zeros(1,length(r));
eXXrateMean_Tp02_03d = zeros(1,length(r));
eZZrateMean_Tp02_03d = zeros(1,length(r));
eXXrateMean_Tp03_03d = zeros(1,length(r));
eZZrateMean_Tp03_03d = zeros(1,length(r));
eXXrateMean_Tp04_03d = zeros(1,length(r));
eZZrateMean_Tp04_03d = zeros(1,length(r));
eXXrateMean_Tp05_03d = zeros(1,length(r));
eZZrateMean_Tp05_03d = zeros(1,length(r));

for i = 1:length(r)
% Parameter 01
    eXXrateMean_Tp01_03d(i) = mean(eXXrate_Tp01_03d(:,i));
    eZZrateMean_Tp01_03d(i) = mean(eZZrate_Tp01_03d(:,i));
% Parameter 02
    eXXrateMean_Tp02_03d(i) = mean(eXXrate_Tp02_03d(:,i));
    eZZrateMean_Tp02_03d(i) = mean(eZZrate_Tp02_03d(:,i));
% Parameter 03
    eXXrateMean_Tp03_03d(i) = mean(eXXrate_Tp03_03d(:,i));
    eZZrateMean_Tp03_03d(i) = mean(eZZrate_Tp03_03d(:,i));
% Parameter 04
    eXXrateMean_Tp04_03d(i) = mean(eXXrate_Tp04_03d(:,i));
    eZZrateMean_Tp04_03d(i) = mean(eZZrate_Tp04_03d(:,i));
% Parameter 05
    eXXrateMean_Tp05_03d(i) = mean(eXXrate_Tp05_03d(:,i));
    eZZrateMean_Tp05_03d(i) = mean(eZZrate_Tp05_03d(:,i));
end

%% Times during which Strain Rate > minRate

% Define minRateCriteria
% Parameter 01
for i = 1:length(r)
    eXX_minRateCriteria_Tp01_03d(:,i) = eXXrate_Tp01_03d(:,i)>minRate;
    eZZ_minRateCriteria_Tp01_03d(:,i) = eZZrate_Tp01_03d(:,i)>minRate;
end

% Parameter 02
for i = 1:length(r)
    eXX_minRateCriteria_Tp02_03d(:,i) = eXXrate_Tp02_03d(:,i)>minRate;
    eZZ_minRateCriteria_Tp02_03d(:,i) = eZZrate_Tp02_03d(:,i)>minRate;
end

% Parameter 03
for i = 1:length(r)
    eXX_minRateCriteria_Tp03_03d(:,i) = eXXrate_Tp03_03d(:,i)>minRate;
    eZZ_minRateCriteria_Tp03_03d(:,i) = eZZrate_Tp03_03d(:,i)>minRate;
end

% Parameter 04
for i = 1:length(r)
    eXX_minRateCriteria_Tp04_03d(:,i) = eXXrate_Tp04_03d(:,i)>minRate;
    eZZ_minRateCriteria_Tp04_03d(:,i) = eZZrate_Tp04_03d(:,i)>minRate;
end

% Parameter 05
for i = 1:length(r)
    eXX_minRateCriteria_Tp05_03d(:,i) = eXXrate_Tp05_03d(:,i)>minRate;
    eZZ_minRateCriteria_Tp05_03d(:,i) = eZZrate_Tp05_03d(:,i)>minRate;
end

% Times meeting criteria
% Parameter 01
t_aboveMinRate_eXX_Tp01_03d = zeros(length(t),length(r));
t_aboveMinRate_eZZ_Tp01_03d = zeros(length(t),length(r));
for i = 1:length(r)
    if sum(eXX_minRateCriteria_Tp01_03d(:,i)) > 0
        t_aboveMinRate_eXX_Tp01_03d(find(eXX_minRateCriteria_Tp01_03d(:,i)),i) = t(find(eXX_minRateCriteria_Tp01_03d(:,i)));
    else
        t_aboveMinRate_eXX_Tp01_03d(:,i) = 0;
    end
    if sum(eZZ_minRateCriteria_Tp01_03d(:,i)) > 0
        t_aboveMinRate_eZZ_Tp01_03d(find(eZZ_minRateCriteria_Tp01_03d(:,i)),i) = t(find(eZZ_minRateCriteria_Tp01_03d(:,i)));
    else
        t_aboveMinRate_eZZ_Tp01_03d(:,i) = 0;
    end
end

% Parameter 02
t_aboveMinRate_eXX_Tp02_03d = zeros(length(t),length(r));
t_aboveMinRate_eZZ_Tp02_03d = zeros(length(t),length(r));
for i = 1:length(r)
    if sum(eXX_minRateCriteria_Tp02_03d(:,i)) > 0
        t_aboveMinRate_eXX_Tp02_03d(find(eXX_minRateCriteria_Tp02_03d(:,i)),i) = t(find(eXX_minRateCriteria_Tp02_03d(:,i)));
    else
        t_aboveMinRate_eXX_Tp02_03d(:,i) = 0;
    end
    if sum(eZZ_minRateCriteria_Tp02_03d(:,i)) > 0
        t_aboveMinRate_eZZ_Tp02_03d(find(eZZ_minRateCriteria_Tp02_03d(:,i)),i) = t(find(eZZ_minRateCriteria_Tp02_03d(:,i)));
    else
        t_aboveMinRate_eZZ_Tp02_03d(:,i) = 0;
    end
end

% Parameter 03
t_aboveMinRate_eXX_Tp03_03d = zeros(length(t),length(r));
t_aboveMinRate_eZZ_Tp03_03d = zeros(length(t),length(r));
for i = 1:length(r)
    if sum(eXX_minRateCriteria_Tp03_03d(:,i)) > 0
        t_aboveMinRate_eXX_Tp03_03d(find(eXX_minRateCriteria_Tp03_03d(:,i)),i) = t(find(eXX_minRateCriteria_Tp03_03d(:,i)));
    else
        t_aboveMinRate_eXX_Tp03_03d(:,i) = 0;
    end
    if sum(eZZ_minRateCriteria_Tp03_03d(:,i)) > 0
        t_aboveMinRate_eZZ_Tp03_03d(find(eZZ_minRateCriteria_Tp03_03d(:,i)),i) = t(find(eZZ_minRateCriteria_Tp03_03d(:,i)));
    else
        t_aboveMinRate_eZZ_Tp03_03d(:,i) = 0;
    end
end

% Parameter 04
t_aboveMinRate_eXX_Tp04_03d = zeros(length(t),length(r));
t_aboveMinRate_eZZ_Tp04_03d = zeros(length(t),length(r));
for i = 1:length(r)
    if sum(eXX_minRateCriteria_Tp04_03d(:,i)) > 0
        t_aboveMinRate_eXX_Tp04_03d(find(eXX_minRateCriteria_Tp04_03d(:,i)),i) = t(find(eXX_minRateCriteria_Tp04_03d(:,i)));
    else
        t_aboveMinRate_eXX_Tp04_03d(:,i) = 0;
    end
    if sum(eZZ_minRateCriteria_Tp04_03d(:,i)) > 0
        t_aboveMinRate_eZZ_Tp04_03d(find(eZZ_minRateCriteria_Tp04_03d(:,i)),i) = t(find(eZZ_minRateCriteria_Tp04_03d(:,i)));
    else
        t_aboveMinRate_eZZ_Tp04_03d(:,i) = 0;
    end
end

% Parameter 05
t_aboveMinRate_eXX_Tp05_03d = zeros(length(t),length(r));
t_aboveMinRate_eZZ_Tp05_03d = zeros(length(t),length(r));
for i = 1:length(r)
    if sum(eXX_minRateCriteria_Tp05_03d(:,i)) > 0
        t_aboveMinRate_eXX_Tp05_03d(find(eXX_minRateCriteria_Tp05_03d(:,i)),i) = t(find(eXX_minRateCriteria_Tp05_03d(:,i)));
    else
        t_aboveMinRate_eXX_Tp05_03d(:,i) = 0;
    end
    if sum(eZZ_minRateCriteria_Tp05_03d(:,i)) > 0
        t_aboveMinRate_eZZ_Tp05_03d(find(eZZ_minRateCriteria_Tp05_03d(:,i)),i) = t(find(eZZ_minRateCriteria_Tp05_03d(:,i)));
    else
        t_aboveMinRate_eZZ_Tp05_03d(:,i) = 0;
    end
end

clear eXX_minRateCriteria_Tp01_03d eZZ_minRateCriteria_Tp01_03d
clear eXX_minRateCriteria_Tp02_03d eZZ_minRateCriteria_Tp02_03d
clear eXX_minRateCriteria_Tp03_03d eZZ_minRateCriteria_Tp03_03d
clear eXX_minRateCriteria_Tp04_03d eZZ_minRateCriteria_Tp04_03d
clear eXX_minRateCriteria_Tp05_03d eZZ_minRateCriteria_Tp05_03d
clear eXX_minRateCriteria_Tp06_03d eZZ_minRateCriteria_Tp06_03d

%% Duration during which strain rate > minRate

% first time at which eXXrate > minRate (last non-zero value)
% Parameter 01
for i = 1:length(r)
    if sum(t_aboveMinRate_eXX_Tp01_03d(:,i)) > 0
        tFirst_aboveMinRate_eXX_Tp01_03d(i) = t_aboveMinRate_eXX_Tp01_03d(find(t_aboveMinRate_eXX_Tp01_03d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_Tp01_03d(i) = t_aboveMinRate_eXX_Tp01_03d(find(t_aboveMinRate_eXX_Tp01_03d(:,i),1,'last'));
    else
        tFirst_aboveMinRate_eXX_Tp01_03d(:,i) = 0;
        tLast_aboveMinRate_eXX_Tp01_03d(:,i) = 0;
    end
    if sum(t_aboveMinRate_eZZ_Tp01_03d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_Tp01_03d(i) = t_aboveMinRate_eZZ_Tp01_03d(find(t_aboveMinRate_eZZ_Tp01_03d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_Tp01_03d(i) = t_aboveMinRate_eZZ_Tp01_03d(find(t_aboveMinRate_eZZ_Tp01_03d(:,i),1,'last'));
    else
       tFirst_aboveMinRate_eZZ_Tp01_03d(:,i) = 0;
       tLast_aboveMinRate_eZZ_Tp01_03d(:,i) = 0;
    end
end

% Parameter 02
for i = 1:length(r)
    if sum(t_aboveMinRate_eXX_Tp02_03d(:,i)) > 0
        tFirst_aboveMinRate_eXX_Tp02_03d(i) = t_aboveMinRate_eXX_Tp02_03d(find(t_aboveMinRate_eXX_Tp02_03d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_Tp02_03d(i) = t_aboveMinRate_eXX_Tp02_03d(find(t_aboveMinRate_eXX_Tp02_03d(:,i),1,'last'));
    else
        tFirst_aboveMinRate_eXX_Tp02_03d(:,i) = 0;
        tLast_aboveMinRate_eXX_Tp02_03d(:,i) = 0;
    end
    if sum(t_aboveMinRate_eZZ_Tp02_03d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_Tp02_03d(i) = t_aboveMinRate_eZZ_Tp02_03d(find(t_aboveMinRate_eZZ_Tp02_03d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_Tp02_03d(i) = t_aboveMinRate_eZZ_Tp02_03d(find(t_aboveMinRate_eZZ_Tp02_03d(:,i),1,'last'));
    else
       tFirst_aboveMinRate_eZZ_Tp02_03d(:,i) = 0;
       tLast_aboveMinRate_eZZ_Tp02_03d(:,i) = 0;
    end
end

% Parameter 03
for i = 1:length(r)
    if sum(t_aboveMinRate_eXX_Tp03_03d(:,i)) > 0
        tFirst_aboveMinRate_eXX_Tp03_03d(i) = t_aboveMinRate_eXX_Tp03_03d(find(t_aboveMinRate_eXX_Tp03_03d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_Tp03_03d(i) = t_aboveMinRate_eXX_Tp03_03d(find(t_aboveMinRate_eXX_Tp03_03d(:,i),1,'last'));
    else
        tFirst_aboveMinRate_eXX_Tp03_03d(:,i) = 0;
        tLast_aboveMinRate_eXX_Tp03_03d(:,i) = 0;
    end
    if sum(t_aboveMinRate_eZZ_Tp03_03d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_Tp03_03d(i) = t_aboveMinRate_eZZ_Tp03_03d(find(t_aboveMinRate_eZZ_Tp03_03d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_Tp03_03d(i) = t_aboveMinRate_eZZ_Tp03_03d(find(t_aboveMinRate_eZZ_Tp03_03d(:,i),1,'last'));
    else
       tFirst_aboveMinRate_eZZ_Tp03_03d(:,i) = 0;
       tLast_aboveMinRate_eZZ_Tp03_03d(:,i) = 0;
    end
end

% Parameter 04
for i = 1:length(r)
    if sum(t_aboveMinRate_eXX_Tp04_03d(:,i)) > 0
        tFirst_aboveMinRate_eXX_Tp04_03d(i) = t_aboveMinRate_eXX_Tp04_03d(find(t_aboveMinRate_eXX_Tp04_03d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_Tp04_03d(i) = t_aboveMinRate_eXX_Tp04_03d(find(t_aboveMinRate_eXX_Tp04_03d(:,i),1,'last'));
    else
        tFirst_aboveMinRate_eXX_Tp04_03d(:,i) = 0;
        tLast_aboveMinRate_eXX_Tp04_03d(:,i) = 0;
    end
    if sum(t_aboveMinRate_eZZ_Tp04_03d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_Tp04_03d(i) = t_aboveMinRate_eZZ_Tp04_03d(find(t_aboveMinRate_eZZ_Tp04_03d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_Tp04_03d(i) = t_aboveMinRate_eZZ_Tp04_03d(find(t_aboveMinRate_eZZ_Tp04_03d(:,i),1,'last'));
    else
       tFirst_aboveMinRate_eZZ_Tp04_03d(:,i) = 0;
       tLast_aboveMinRate_eZZ_Tp04_03d(:,i) = 0;
    end
end

% Parameter 05
for i = 1:length(r)
    if sum(t_aboveMinRate_eXX_Tp05_03d(:,i)) > 0
        tFirst_aboveMinRate_eXX_Tp05_03d(i) = t_aboveMinRate_eXX_Tp05_03d(find(t_aboveMinRate_eXX_Tp05_03d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_Tp05_03d(i) = t_aboveMinRate_eXX_Tp05_03d(find(t_aboveMinRate_eXX_Tp05_03d(:,i),1,'last'));
    else
        tFirst_aboveMinRate_eXX_Tp05_03d(:,i) = 0;
        tLast_aboveMinRate_eXX_Tp05_03d(:,i) = 0;
    end
    if sum(t_aboveMinRate_eZZ_Tp05_03d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_Tp05_03d(i) = t_aboveMinRate_eZZ_Tp05_03d(find(t_aboveMinRate_eZZ_Tp05_03d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_Tp05_03d(i) = t_aboveMinRate_eZZ_Tp05_03d(find(t_aboveMinRate_eZZ_Tp05_03d(:,i),1,'last'));
    else
       tFirst_aboveMinRate_eZZ_Tp05_03d(:,i) = 0;
       tLast_aboveMinRate_eZZ_Tp05_03d(:,i) = 0;
    end
end

% Durations for which strain rate > minRate
% Parameter 01
for i = 1:length(r)
    t_aboveMinRateDuration_eXX_Tp01_03d(1,i) = tLast_aboveMinRate_eXX_Tp01_03d(1,i)-tFirst_aboveMinRate_eXX_Tp01_03d(1,i);
    t_aboveMinRateDuration_eZZ_Tp01_03d(1,i) = tLast_aboveMinRate_eZZ_Tp01_03d(1,i)-tFirst_aboveMinRate_eZZ_Tp01_03d(1,i);
end

% Parameter 02
for i = 1:length(r)
    t_aboveMinRateDuration_eXX_Tp02_03d(1,i) = tLast_aboveMinRate_eXX_Tp02_03d(1,i)-tFirst_aboveMinRate_eXX_Tp02_03d(1,i);
    t_aboveMinRateDuration_eZZ_Tp02_03d(1,i) = tLast_aboveMinRate_eZZ_Tp02_03d(1,i)-tFirst_aboveMinRate_eZZ_Tp02_03d(1,i);
end

% Parameter 03
for i = 1:length(r)
    t_aboveMinRateDuration_eXX_Tp03_03d(1,i) = tLast_aboveMinRate_eXX_Tp03_03d(1,i)-tFirst_aboveMinRate_eXX_Tp03_03d(1,i);
    t_aboveMinRateDuration_eZZ_Tp03_03d(1,i) = tLast_aboveMinRate_eZZ_Tp03_03d(1,i)-tFirst_aboveMinRate_eZZ_Tp03_03d(1,i);
end

% Parameter 04
for i = 1:length(r)
    t_aboveMinRateDuration_eXX_Tp04_03d(1,i) = tLast_aboveMinRate_eXX_Tp04_03d(1,i)-tFirst_aboveMinRate_eXX_Tp04_03d(1,i);
    t_aboveMinRateDuration_eZZ_Tp04_03d(1,i) = tLast_aboveMinRate_eZZ_Tp04_03d(1,i)-tFirst_aboveMinRate_eZZ_Tp04_03d(1,i);
end

% Parameter 05
for i = 1:length(r)
    t_aboveMinRateDuration_eXX_Tp05_03d(1,i) = tLast_aboveMinRate_eXX_Tp05_03d(1,i)-tFirst_aboveMinRate_eXX_Tp05_03d(1,i);
    t_aboveMinRateDuration_eZZ_Tp05_03d(1,i) = tLast_aboveMinRate_eZZ_Tp05_03d(1,i)-tFirst_aboveMinRate_eZZ_Tp05_03d(1,i);
end

clear tFirst_aboveMinRate_eXX_Tp01_03d
clear tFirst_aboveMinRate_eZZ_Tp01_03d
clear tLast_aboveMinRate_eXX_Tp01_03d
clear tLast_aboveMinRate_eZZ_Tp01_03d

clear tFirst_aboveMinRate_eXX_Tp02_03d
clear tFirst_aboveMinRate_eZZ_Tp02_03d
clear tLast_aboveMinRate_eXX_Tp02_03d
clear tLast_aboveMinRate_eZZ_Tp02_03d

clear tFirst_aboveMinRate_eXX_Tp03_03d
clear tFirst_aboveMinRate_eZZ_Tp03_03d
clear tLast_aboveMinRate_eXX_Tp03_03d
clear tLast_aboveMinRate_eZZ_Tp03_03d

clear tFirst_aboveMinRate_eXX_Tp04_03d
clear tFirst_aboveMinRate_eZZ_Tp04_03d
clear tLast_aboveMinRate_eXX_Tp04_03d
clear tLast_aboveMinRate_eZZ_Tp04_03d

clear tFirst_aboveMinRate_eXX_Tp05_03d
clear tFirst_aboveMinRate_eZZ_Tp05_03d
clear tLast_aboveMinRate_eXX_Tp05_03d
clear tLast_aboveMinRate_eZZ_Tp05_03d

clear tFirst_aboveMinRate_eXX_Tp06_03d
clear tFirst_aboveMinRate_eZZ_Tp06_03d
clear tLast_aboveMinRate_eXX_Tp06_03d
clear tLast_aboveMinRate_eZZ_Tp06_03d

%% Magnitude while strain rate > minRate

% Parameter 01
eXX_magAboveMinRate_Tp01_03d = zeros(length(t),length(r));
eZZ_magAboveMinRate_Tp01_03d = zeros(length(t),length(r));
for i = 1:length(r)
    if sum(t_aboveMinRate_eXX_Tp01_03d(:,i)) > 0
        eXX_magAboveMinRate_Tp01_03d(find(t_aboveMinRate_eXX_Tp01_03d(:,i)),i) = eXX_Tp01_03d(find(t_aboveMinRate_eXX_Tp01_03d(:,i)),i);
    else
        eXX_magAboveMinRate_Tp01_03d(:,i) = 0;
    end
    if sum(t_aboveMinRate_eZZ_Tp01_03d(:,i)) > 0
        eZZ_magAboveMinRate_Tp01_03d(find(t_aboveMinRate_eZZ_Tp01_03d(:,i)),i) = eZZ_Tp01_03d(find(t_aboveMinRate_eZZ_Tp01_03d(:,i)),i);
    else
        eZZ_magAboveMinRate_Tp01_03d(:,i) = 0;
    end
end

% Parameter 02
eXX_magAboveMinRate_Tp02_03d = zeros(length(t),length(r));
eZZ_magAboveMinRate_Tp02_03d = zeros(length(t),length(r));
for i = 1:length(r)
    if sum(t_aboveMinRate_eXX_Tp02_03d(:,i)) > 0
        eXX_magAboveMinRate_Tp02_03d(find(t_aboveMinRate_eXX_Tp02_03d(:,i)),i) = eXX_Tp02_03d(find(t_aboveMinRate_eXX_Tp02_03d(:,i)),i);
    else
        eXX_magAboveMinRate_Tp02_03d(:,i) = 0;
    end
    if sum(t_aboveMinRate_eZZ_Tp02_03d(:,i)) > 0
        eZZ_magAboveMinRate_Tp02_03d(find(t_aboveMinRate_eZZ_Tp02_03d(:,i)),i) = eZZ_Tp02_03d(find(t_aboveMinRate_eZZ_Tp02_03d(:,i)),i);
    else
        eZZ_magAboveMinRate_Tp02_03d(:,i) = 0;
    end
end

% Parameter 03
eXX_magAboveMinRate_Tp03_03d = zeros(length(t),length(r));
eZZ_magAboveMinRate_Tp03_03d = zeros(length(t),length(r));
for i = 1:length(r)
    if sum(t_aboveMinRate_eXX_Tp03_03d(:,i)) > 0
        eXX_magAboveMinRate_Tp03_03d(find(t_aboveMinRate_eXX_Tp03_03d(:,i)),i) = eXX_Tp03_03d(find(t_aboveMinRate_eXX_Tp03_03d(:,i)),i);
    else
        eXX_magAboveMinRate_Tp03_03d(:,i) = 0;
    end
    if sum(t_aboveMinRate_eZZ_Tp03_03d(:,i)) > 0
        eZZ_magAboveMinRate_Tp03_03d(find(t_aboveMinRate_eZZ_Tp03_03d(:,i)),i) = eZZ_Tp03_03d(find(t_aboveMinRate_eZZ_Tp03_03d(:,i)),i);
    else
        eZZ_magAboveMinRate_Tp03_03d(:,i) = 0;
    end
end

% Parameter 04
eXX_magAboveMinRate_Tp04_03d = zeros(length(t),length(r));
eZZ_magAboveMinRate_Tp04_03d = zeros(length(t),length(r));
for i = 1:length(r)
    if sum(t_aboveMinRate_eXX_Tp04_03d(:,i)) > 0
        eXX_magAboveMinRate_Tp04_03d(find(t_aboveMinRate_eXX_Tp04_03d(:,i)),i) = eXX_Tp04_03d(find(t_aboveMinRate_eXX_Tp04_03d(:,i)),i);
    else
        eXX_magAboveMinRate_Tp04_03d(:,i) = 0;
    end
    if sum(t_aboveMinRate_eZZ_Tp04_03d(:,i)) > 0
        eZZ_magAboveMinRate_Tp04_03d(find(t_aboveMinRate_eZZ_Tp04_03d(:,i)),i) = eZZ_Tp04_03d(find(t_aboveMinRate_eZZ_Tp04_03d(:,i)),i);
    else
        eZZ_magAboveMinRate_Tp04_03d(:,i) = 0;
    end
end

% Parameter 05
eXX_magAboveMinRate_Tp05_03d = zeros(length(t),length(r));
eZZ_magAboveMinRate_Tp05_03d = zeros(length(t),length(r));
for i = 1:length(r)
    if sum(t_aboveMinRate_eXX_Tp05_03d(:,i)) > 0
        eXX_magAboveMinRate_Tp05_03d(find(t_aboveMinRate_eXX_Tp05_03d(:,i)),i) = eXX_Tp05_03d(find(t_aboveMinRate_eXX_Tp05_03d(:,i)),i);
    else
        eXX_magAboveMinRate_Tp05_03d(:,i) = 0;
    end
    if sum(t_aboveMinRate_eZZ_Tp05_03d(:,i)) > 0
        eZZ_magAboveMinRate_Tp05_03d(find(t_aboveMinRate_eZZ_Tp05_03d(:,i)),i) = eZZ_Tp05_03d(find(t_aboveMinRate_eZZ_Tp05_03d(:,i)),i);
    else
        eZZ_magAboveMinRate_Tp05_03d(:,i) = 0;
    end
end

%% Detectable Strains

% Define Measurement Criteria 
% Parameter 01
for i = 1:length(r)
    eXXmeasCriteria01(:,i) = (abs(eXX_magAboveMinRate_Tp01_03d(:,i)) > minMag & eXXrate_Tp01_03d(:,i) > minRate);
    eZZmeasCriteria01(:,i) = (abs(eZZ_magAboveMinRate_Tp01_03d(:,i)) > minMag & eZZrate_Tp01_03d(:,i) > minRate);
end

% Parameter 02
for i = 1:length(r)
    eXXmeasCriteria02(:,i) = (abs(eXX_magAboveMinRate_Tp02_03d(:,i)) > minMag & eXXrate_Tp02_03d(:,i) > minRate);
    eZZmeasCriteria02(:,i) = (abs(eZZ_magAboveMinRate_Tp02_03d(:,i)) > minMag & eZZrate_Tp02_03d(:,i) > minRate);
end

% Parameter 03
for i = 1:length(r)
    eXXmeasCriteria03(:,i) = (abs(eXX_magAboveMinRate_Tp03_03d(:,i)) > minMag & eXXrate_Tp03_03d(:,i) > minRate);
    eZZmeasCriteria03(:,i) = (abs(eZZ_magAboveMinRate_Tp03_03d(:,i)) > minMag & eZZrate_Tp03_03d(:,i) > minRate);
end

% Parameter 04
for i = 1:length(r)
    eXXmeasCriteria04(:,i) = (abs(eXX_magAboveMinRate_Tp04_03d(:,i)) > minMag & eXXrate_Tp04_03d(:,i) > minRate);
    eZZmeasCriteria04(:,i) = (abs(eZZ_magAboveMinRate_Tp04_03d(:,i)) > minMag & eZZrate_Tp04_03d(:,i) > minRate);
end

% Parameter 05
for i = 1:length(r)
    eXXmeasCriteria05(:,i) = (abs(eXX_magAboveMinRate_Tp05_03d(:,i)) > minMag & eXXrate_Tp05_03d(:,i) > minRate);
    eZZmeasCriteria05(:,i) = (abs(eZZ_magAboveMinRate_Tp05_03d(:,i)) > minMag & eZZrate_Tp05_03d(:,i) > minRate);
end

% Detectable Strains
% Parameter 01
eXX_detectable_Tp01_03d = NaN(length(t),length(r));
eZZ_detectable_Tp01_03d = NaN(length(t),length(r));
for i = 1:size(eXXmeasCriteria01,2)
    if sum(eXXmeasCriteria01(:,i)) > 0
        eXX_detectable_Tp01_03d((eXXmeasCriteria01(:,i)),i) = eXX_Tp01_03d((eXXmeasCriteria01(:,i)),i);
    else
        eXX_detectable_Tp01_03d(:,i) = NaN;
    end
    if sum(eZZmeasCriteria01(:,i)) > 0
        eZZ_detectable_Tp01_03d((eZZmeasCriteria01(:,i)),i) = eZZ_Tp01_03d((eZZmeasCriteria01(:,i)),i);
    else
        eZZ_detectable_Tp01_03d(:,i) = NaN;
    end
end

% Parameter 02
eXX_detectable_Tp02_03d = NaN(length(t),length(r));
eZZ_detectable_Tp02_03d = NaN(length(t),length(r));
for i = 1:size(eXXmeasCriteria02,2)
    if sum(eXXmeasCriteria02(:,i)) > 0
        eXX_detectable_Tp02_03d((eXXmeasCriteria02(:,i)),i) = eXX_Tp02_03d((eXXmeasCriteria02(:,i)),i);
    else
        eXX_detectable_Tp02_03d(:,i) = NaN;
    end
    if sum(eZZmeasCriteria02(:,i)) > 0
        eZZ_detectable_Tp02_03d((eZZmeasCriteria02(:,i)),i) = eZZ_Tp02_03d((eZZmeasCriteria02(:,i)),i);
    else
        eZZ_detectable_Tp02_03d(:,i) = NaN;
    end
end

% Parameter 03
eXX_detectable_Tp03_03d = NaN(length(t),length(r));
eZZ_detectable_Tp03_03d = NaN(length(t),length(r));
for i = 1:size(eXXmeasCriteria03,2)
    if sum(eXXmeasCriteria03(:,i)) > 0
        eXX_detectable_Tp03_03d((eXXmeasCriteria03(:,i)),i) = eXX_Tp03_03d((eXXmeasCriteria03(:,i)),i);
    else
        eXX_detectable_Tp03_03d(:,i) = NaN;
    end
    if sum(eZZmeasCriteria03(:,i)) > 0
        eZZ_detectable_Tp03_03d((eZZmeasCriteria03(:,i)),i) = eZZ_Tp03_03d((eZZmeasCriteria03(:,i)),i);
    else
        eZZ_detectable_Tp03_03d(:,i) = NaN;
    end
end

% Parameter 04  
eXX_detectable_Tp04_03d = NaN(length(t),length(r));
eZZ_detectable_Tp04_03d = NaN(length(t),length(r));
for i = 1:size(eXXmeasCriteria04,2)
    if sum(eXXmeasCriteria04(:,i)) > 0
        eXX_detectable_Tp04_03d((eXXmeasCriteria04(:,i)),i) = eXX_Tp04_03d((eXXmeasCriteria04(:,i)),i);
    else
        eXX_detectable_Tp04_03d(:,i) = NaN;
    end
    if sum(eZZmeasCriteria04(:,i)) > 0
        eZZ_detectable_Tp04_03d((eZZmeasCriteria04(:,i)),i) = eZZ_Tp04_03d((eZZmeasCriteria04(:,i)),i);
    else
        eZZ_detectable_Tp04_03d(:,i) = NaN;
    end
end

% Parameter 05  
eXX_detectable_Tp05_03d = NaN(length(t),length(r));
eZZ_detectable_Tp05_03d = NaN(length(t),length(r));
for i = 1:size(eXXmeasCriteria05,2)
    if sum(eXXmeasCriteria05(:,i)) > 0
        eXX_detectable_Tp05_03d((eXXmeasCriteria05(:,i)),i) = eXX_Tp05_03d((eXXmeasCriteria05(:,i)),i);
    else
        eXX_detectable_Tp05_03d(:,i) = NaN;
    end
    if sum(eZZmeasCriteria05(:,i)) > 0
        eZZ_detectable_Tp05_03d((eZZmeasCriteria05(:,i)),i) = eZZ_Tp05_03d((eZZmeasCriteria05(:,i)),i);
    else
        eZZ_detectable_Tp05_03d(:,i) = NaN;
    end
end

%% Times of Dectectable Strain (mag>minMag & rate>minRate)

% Parameter 01
t_eXX_detectable_Tp01_03d = zeros(length(t),length(r));
t_eZZ_detectable_Tp01_03d = zeros(length(t),length(r));
for i = 1:size(eXXmeasCriteria01,2)
    if sum(eXXmeasCriteria01(:,i)) > 0
        t_eXX_detectable_Tp01_03d((eXXmeasCriteria01(:,i)),i) = t(eXXmeasCriteria01(:,i));
    else
        t_eXX_detectable_Tp01_03d(:,i) = 0;
    end
    if sum(eZZmeasCriteria01(:,i)) > 0
        t_eZZ_detectable_Tp01_03d((eZZmeasCriteria01(:,i)),i) = t(eZZmeasCriteria01(:,i));
    else
        t_eZZ_detectable_Tp01_03d(:,i) = 0;
    end
end

% Parameter 02
t_eXX_detectable_Tp02_03d = zeros(length(t),length(r));
t_eZZ_detectable_Tp02_03d = zeros(length(t),length(r));
for i = 1:size(eXXmeasCriteria02,2)
    if sum(eXXmeasCriteria02(:,i)) > 0
        t_eXX_detectable_Tp02_03d((eXXmeasCriteria02(:,i)),i) = t(eXXmeasCriteria02(:,i));
    else
        t_eXX_detectable_Tp02_03d(:,i) = 0;
    end
    if sum(eZZmeasCriteria02(:,i)) > 0
        t_eZZ_detectable_Tp02_03d((eZZmeasCriteria02(:,i)),i) = t(eZZmeasCriteria02(:,i));
    else
        t_eZZ_detectable_Tp02_03d(:,i) = 0;
    end
end

% Parameter 03
t_eXX_detectable_Tp03_03d = zeros(length(t),length(r));
t_eZZ_detectable_Tp03_03d = zeros(length(t),length(r));
for i = 1:size(eXXmeasCriteria03,2)
    if sum(eXXmeasCriteria03(:,i)) > 0
        t_eXX_detectable_Tp03_03d((eXXmeasCriteria03(:,i)),i) = t(eXXmeasCriteria03(:,i));
    else
        t_eXX_detectable_Tp03_03d(:,i) = 0;
    end
    if sum(eZZmeasCriteria03(:,i)) > 0
        t_eZZ_detectable_Tp03_03d((eZZmeasCriteria03(:,i)),i) = t(eZZmeasCriteria03(:,i));
    else
        t_eZZ_detectable_Tp03_03d(:,i) = 0;
    end
end

% Parameter 04
t_eXX_detectable_Tp04_03d = zeros(length(t),length(r));
t_eZZ_detectable_Tp04_03d = zeros(length(t),length(r));
for i = 1:size(eXXmeasCriteria04,2)
    if sum(eXXmeasCriteria04(:,i)) > 0
        t_eXX_detectable_Tp04_03d((eXXmeasCriteria04(:,i)),i) = t(eXXmeasCriteria04(:,i));
    else
        t_eXX_detectable_Tp04_03d(:,i) = 0;
    end
    if sum(eZZmeasCriteria04(:,i)) > 0
        t_eZZ_detectable_Tp04_03d((eZZmeasCriteria04(:,i)),i) = t(eZZmeasCriteria04(:,i));
    else
        t_eZZ_detectable_Tp04_03d(:,i) = 0;
    end
end

% Parameter 05
t_eXX_detectable_Tp05_03d = zeros(length(t),length(r));
t_eZZ_detectable_Tp05_03d = zeros(length(t),length(r));
for i = 1:size(eXXmeasCriteria05,2)
    if sum(eXXmeasCriteria05(:,i)) > 0
        t_eXX_detectable_Tp05_03d((eXXmeasCriteria05(:,i)),i) = t(eXXmeasCriteria05(:,i));
    else
        t_eXX_detectable_Tp05_03d(:,i) = 0;
    end
    if sum(eZZmeasCriteria05(:,i)) > 0
        t_eZZ_detectable_Tp05_03d((eZZmeasCriteria05(:,i)),i) = t(eZZmeasCriteria05(:,i));
    else
        t_eZZ_detectable_Tp05_03d(:,i) = 0;
    end
end

clear eXXmeasCriteria01 eZZmeasCriteria01
clear eXXmeasCriteria02 eZZmeasCriteria02
clear eXXmeasCriteria03 eZZmeasCriteria03
clear eXXmeasCriteria04 eZZmeasCriteria04
clear eXXmeasCriteria05 eZZmeasCriteria05
clear eXXmeasCriteria06 eZZmeasCriteria06
    
%% Duration Strain is Detectable

% first and last time strain is detectable
% Parameter 01
for i = 1:length(r)
    if sum(t_eXX_detectable_Tp01_03d(:,i)) > 0
        tFirst_eXX_detectable_Tp01_03d(i) = t_eXX_detectable_Tp01_03d(find(t_eXX_detectable_Tp01_03d(:,i),1,'first'));
        tLast_eXX_detectable_Tp01_03d(i) = t_eXX_detectable_Tp01_03d(find(t_eXX_detectable_Tp01_03d(:,i),1,'last'));
    else
        tFirst_eXX_detectable_Tp01_03d(i) = 0;
        tLast_eXX_detectable_Tp01_03d(i) = 0;
    end
    if sum(t_eZZ_detectable_Tp01_03d(:,i)) > 0
        tFirst_eZZ_detectable_Tp01_03d(i) = t_eZZ_detectable_Tp01_03d(find(t_eZZ_detectable_Tp01_03d(:,i),1,'first'));
        tLast_eZZ_detectable_Tp01_03d(i) = t_eZZ_detectable_Tp01_03d(find(t_eZZ_detectable_Tp01_03d(:,i),1,'last'));
    else
        tFirst_eZZ_detectable_Tp01_03d(i) = 0;
        tLast_eZZ_detectable_Tp01_03d(i) = 0;
    end
end

% Parameter 02
for i = 1:length(r)
    if sum(t_eXX_detectable_Tp02_03d(:,i)) > 0
        tFirst_eXX_detectable_Tp02_03d(i) = t_eXX_detectable_Tp02_03d(find(t_eXX_detectable_Tp02_03d(:,i),1,'first'));
        tLast_eXX_detectable_Tp02_03d(i) = t_eXX_detectable_Tp02_03d(find(t_eXX_detectable_Tp02_03d(:,i),1,'last'));
    else
        tFirst_eXX_detectable_Tp02_03d(i) = 0;
        tLast_eXX_detectable_Tp02_03d(i) = 0;
    end
    if sum(t_eZZ_detectable_Tp02_03d(:,i)) > 0
        tFirst_eZZ_detectable_Tp02_03d(i) = t_eZZ_detectable_Tp02_03d(find(t_eZZ_detectable_Tp02_03d(:,i),1,'first'));
        tLast_eZZ_detectable_Tp02_03d(i) = t_eZZ_detectable_Tp02_03d(find(t_eZZ_detectable_Tp02_03d(:,i),1,'last'));
    else
        tFirst_eZZ_detectable_Tp02_03d(i) = 0;
        tLast_eZZ_detectable_Tp02_03d(i) = 0;
    end
end

% Parameter 03
for i = 1:length(r)
    if sum(t_eXX_detectable_Tp03_03d(:,i)) > 0
        tFirst_eXX_detectable_Tp03_03d(i) = t_eXX_detectable_Tp03_03d(find(t_eXX_detectable_Tp03_03d(:,i),1,'first'));
        tLast_eXX_detectable_Tp03_03d(i) = t_eXX_detectable_Tp03_03d(find(t_eXX_detectable_Tp03_03d(:,i),1,'last'));
    else
        tFirst_eXX_detectable_Tp03_03d(i) = 0;
        tLast_eXX_detectable_Tp03_03d(i) = 0;
    end
    if sum(t_eZZ_detectable_Tp03_03d(:,i)) > 0
        tFirst_eZZ_detectable_Tp03_03d(i) = t_eZZ_detectable_Tp03_03d(find(t_eZZ_detectable_Tp03_03d(:,i),1,'first'));
        tLast_eZZ_detectable_Tp03_03d(i) = t_eZZ_detectable_Tp03_03d(find(t_eZZ_detectable_Tp03_03d(:,i),1,'last'));
    else
        tFirst_eZZ_detectable_Tp03_03d(i) = 0;
        tLast_eZZ_detectable_Tp03_03d(i) = 0;
    end
end

% Parameter 04
for i = 1:length(r)
    if sum(t_eXX_detectable_Tp04_03d(:,i)) > 0
        tFirst_eXX_detectable_Tp04_03d(i) = t_eXX_detectable_Tp04_03d(find(t_eXX_detectable_Tp04_03d(:,i),1,'first'));
        tLast_eXX_detectable_Tp04_03d(i) = t_eXX_detectable_Tp04_03d(find(t_eXX_detectable_Tp04_03d(:,i),1,'last'));
    else
        tFirst_eXX_detectable_Tp04_03d(i) = 0;
        tLast_eXX_detectable_Tp04_03d(i) = 0;
    end
    if sum(t_eZZ_detectable_Tp04_03d(:,i)) > 0
        tFirst_eZZ_detectable_Tp04_03d(i) = t_eZZ_detectable_Tp04_03d(find(t_eZZ_detectable_Tp04_03d(:,i),1,'first'));
        tLast_eZZ_detectable_Tp04_03d(i) = t_eZZ_detectable_Tp04_03d(find(t_eZZ_detectable_Tp04_03d(:,i),1,'last'));
    else
        tFirst_eZZ_detectable_Tp04_03d(i) = 0;
        tLast_eZZ_detectable_Tp04_03d(i) = 0;
    end
end

% Parameter 05
for i = 1:length(r)
    if sum(t_eXX_detectable_Tp05_03d(:,i)) > 0
        tFirst_eXX_detectable_Tp05_03d(i) = t_eXX_detectable_Tp05_03d(find(t_eXX_detectable_Tp05_03d(:,i),1,'first'));
        tLast_eXX_detectable_Tp05_03d(i) = t_eXX_detectable_Tp05_03d(find(t_eXX_detectable_Tp05_03d(:,i),1,'last'));
    else
        tFirst_eXX_detectable_Tp05_03d(i) = 0;
        tLast_eXX_detectable_Tp05_03d(i) = 0;
    end
    if sum(t_eZZ_detectable_Tp05_03d(:,i)) > 0
        tFirst_eZZ_detectable_Tp05_03d(i) = t_eZZ_detectable_Tp05_03d(find(t_eZZ_detectable_Tp05_03d(:,i),1,'first'));
        tLast_eZZ_detectable_Tp05_03d(i) = t_eZZ_detectable_Tp05_03d(find(t_eZZ_detectable_Tp05_03d(:,i),1,'last'));
    else
        tFirst_eZZ_detectable_Tp05_03d(i) = 0;
        tLast_eZZ_detectable_Tp05_03d(i) = 0;
    end
end

% Duration strain is detectable
% Parameter 01
for i = 1:length(r)
    eXX_detectableDuration_Tp01_03d(i) = tLast_eXX_detectable_Tp01_03d(i) - tFirst_eXX_detectable_Tp01_03d(i);
    eZZ_detectableDuration_Tp01_03d(i) = tLast_eZZ_detectable_Tp01_03d(i) - tFirst_eZZ_detectable_Tp01_03d(i);
end

% Parameter 02
for i = 1:length(r)
    eXX_detectableDuration_Tp02_03d(i) = tLast_eXX_detectable_Tp02_03d(i) - tFirst_eXX_detectable_Tp02_03d(i);
    eZZ_detectableDuration_Tp02_03d(i) = tLast_eZZ_detectable_Tp02_03d(i) - tFirst_eZZ_detectable_Tp02_03d(i);
end

% Parameter 03
for i = 1:length(r)
    eXX_detectableDuration_Tp03_03d(i) = tLast_eXX_detectable_Tp03_03d(i) - tFirst_eXX_detectable_Tp03_03d(i);
    eZZ_detectableDuration_Tp03_03d(i) = tLast_eZZ_detectable_Tp03_03d(i) - tFirst_eZZ_detectable_Tp03_03d(i);
end

% Parameter 04
for i = 1:length(r)
    eXX_detectableDuration_Tp04_03d(i) = tLast_eXX_detectable_Tp04_03d(i) - tFirst_eXX_detectable_Tp04_03d(i);
    eZZ_detectableDuration_Tp04_03d(i) = tLast_eZZ_detectable_Tp04_03d(i) - tFirst_eZZ_detectable_Tp04_03d(i);
end

% Parameter 05
for i = 1:length(r)
    eXX_detectableDuration_Tp05_03d(i) = tLast_eXX_detectable_Tp05_03d(i) - tFirst_eXX_detectable_Tp05_03d(i);
    eZZ_detectableDuration_Tp05_03d(i) = tLast_eZZ_detectable_Tp05_03d(i) - tFirst_eZZ_detectable_Tp05_03d(i);
end

clear tFirst_eXX_detectable_Tp01_03d tFirst_eZZ_detectable_Tp01_03d
clear tLast_eXX_detectable_Tp01_03d tLast_eZZ_detectable_Tp01_03d
clear tFirst_eXX_detectable_Tp02_03d tFirst_eZZ_detectable_Tp02_03d
clear tLast_eXX_detectable_Tp02_03d tLast_eZZ_detectable_Tp02_03d
clear tFirst_eXX_detectable_Tp03_03d tFirst_eZZ_detectable_Tp03_03d
clear tLast_eXX_detectable_Tp03_03d tLast_eZZ_detectable_Tp03_03d
clear tFirst_eXX_detectable_Tp04_03d tFirst_eZZ_detectable_Tp04_03d
clear tLast_eXX_detectable_Tp04_03d tLast_eZZ_detectable_Tp04_03d
clear tFirst_eXX_detectable_Tp05_03d tFirst_eZZ_detectable_Tp05_03d
clear tLast_eXX_detectable_Tp05_03d tLast_eZZ_detectable_Tp05_03d
clear tFirst_eXX_detectable_Tp06_03d tFirst_eZZ_detectable_Tp06_03d
clear tLast_eXX_detectable_Tp06_03d tLast_eZZ_detectable_Tp06_03d

%% Compute Magnitude Spectra

% parameter 01
[F_Tp01,      eXXmagSpec_05w03d_Tp01] = magSpectra(eXX_Tp01_03d(:,1),sampleRate_bln);
[~,           eXXmagSpec_25w03d_Tp01] = magSpectra(eXX_Tp01_03d(:,2),sampleRate_bln);
[~,           eXXmagSpec_50w03d_Tp01] = magSpectra(eXX_Tp01_03d(:,3),sampleRate_bln);
[~,           eXXmagSpec_100w03d_Tp01] = magSpectra(eXX_Tp01_03d(:,4),sampleRate_bln);
[~,           eZZmagSpec_05w03d_Tp01] = magSpectra(eZZ_Tp01_03d(:,1),sampleRate_bln);
[~,           eZZmagSpec_25w03d_Tp01] = magSpectra(eZZ_Tp01_03d(:,2),sampleRate_bln);
[~,           eZZmagSpec_50w03d_Tp01] = magSpectra(eZZ_Tp01_03d(:,3),sampleRate_bln);
[~,           eZZmagSpec_100w03d_Tp01] = magSpectra(eZZ_Tp01_03d(:,4),sampleRate_bln);

eXXmagSpec_Tp01_03d = [eXXmagSpec_05w03d_Tp01 eXXmagSpec_25w03d_Tp01 eXXmagSpec_50w03d_Tp01 eXXmagSpec_100w03d_Tp01];
eZZmagSpec_Tp01_03d = [eZZmagSpec_05w03d_Tp01 eZZmagSpec_25w03d_Tp01 eZZmagSpec_50w03d_Tp01 eZZmagSpec_100w03d_Tp01];
clear eXXmagSpec_05w03d_Tp01 eXXmagSpec_25w03d_Tp01 eXXmagSpec_50w03d_Tp01 eXXmagSpec_100w03d_Tp01
clear eZZmagSpec_05w03d_Tp01 eZZmagSpec_25w03d_Tp01 eZZmagSpec_50w03d_Tp01 eZZmagSpec_100w03d_Tp01

% parameter 02
[F_Tp02,      eXXmagSpec_05w03d_Tp02] = magSpectra(eXX_Tp02_03d(:,1),sampleRate_bln);
[~,           eXXmagSpec_25w03d_Tp02] = magSpectra(eXX_Tp02_03d(:,2),sampleRate_bln);
[~,           eXXmagSpec_50w03d_Tp02] = magSpectra(eXX_Tp02_03d(:,3),sampleRate_bln);
[~,           eXXmagSpec_100w03d_Tp02] = magSpectra(eXX_Tp02_03d(:,4),sampleRate_bln);
[~,           eZZmagSpec_05w03d_Tp02] = magSpectra(eZZ_Tp02_03d(:,1),sampleRate_bln);
[~,           eZZmagSpec_25w03d_Tp02] = magSpectra(eZZ_Tp02_03d(:,2),sampleRate_bln);
[~,           eZZmagSpec_50w03d_Tp02] = magSpectra(eZZ_Tp02_03d(:,3),sampleRate_bln);
[~,           eZZmagSpec_100w03d_Tp02] = magSpectra(eZZ_Tp02_03d(:,4),sampleRate_bln);

eXXmagSpec_Tp02_03d = [eXXmagSpec_05w03d_Tp02 eXXmagSpec_25w03d_Tp02 eXXmagSpec_50w03d_Tp02 eXXmagSpec_100w03d_Tp02];
eZZmagSpec_Tp02_03d = [eZZmagSpec_05w03d_Tp02 eZZmagSpec_25w03d_Tp02 eZZmagSpec_50w03d_Tp02 eZZmagSpec_100w03d_Tp02];
clear eXXmagSpec_05w03d_Tp02 eXXmagSpec_25w03d_Tp02 eXXmagSpec_50w03d_Tp02 eXXmagSpec_100w03d_Tp02
clear eZZmagSpec_05w03d_Tp02 eZZmagSpec_25w03d_Tp02 eZZmagSpec_50w03d_Tp02 eZZmagSpec_100w03d_Tp02

% parameter 03
[F_Tp03,      eXXmagSpec_05w03d_Tp03] = magSpectra(eXX_Tp03_03d(:,1),sampleRate_bln);
[~,           eXXmagSpec_25w03d_Tp03] = magSpectra(eXX_Tp03_03d(:,2),sampleRate_bln);
[~,           eXXmagSpec_50w03d_Tp03] = magSpectra(eXX_Tp03_03d(:,3),sampleRate_bln);
[~,           eXXmagSpec_100w03d_Tp03] = magSpectra(eXX_Tp03_03d(:,4),sampleRate_bln);
[~,           eZZmagSpec_05w03d_Tp03] = magSpectra(eZZ_Tp03_03d(:,1),sampleRate_bln);
[~,           eZZmagSpec_25w03d_Tp03] = magSpectra(eZZ_Tp03_03d(:,2),sampleRate_bln);
[~,           eZZmagSpec_50w03d_Tp03] = magSpectra(eZZ_Tp03_03d(:,3),sampleRate_bln);
[~,           eZZmagSpec_100w03d_Tp03] = magSpectra(eZZ_Tp03_03d(:,4),sampleRate_bln);

eXXmagSpec_Tp03_03d = [eXXmagSpec_05w03d_Tp03 eXXmagSpec_25w03d_Tp03 eXXmagSpec_50w03d_Tp03 eXXmagSpec_100w03d_Tp03];
eZZmagSpec_Tp03_03d = [eZZmagSpec_05w03d_Tp03 eZZmagSpec_25w03d_Tp03 eZZmagSpec_50w03d_Tp03 eZZmagSpec_100w03d_Tp03];
clear eXXmagSpec_05w03d_Tp03 eXXmagSpec_25w03d_Tp03 eXXmagSpec_50w03d_Tp03 eXXmagSpec_100w03d_Tp03
clear eZZmagSpec_05w03d_Tp03 eZZmagSpec_25w03d_Tp03 eZZmagSpec_50w03d_Tp03 eZZmagSpec_100w03d_Tp03

% parameter 04
[F_Tp04,      eXXmagSpec_05w03d_Tp04] = magSpectra(eXX_Tp04_03d(:,1),sampleRate_bln);
[~,           eXXmagSpec_25w03d_Tp04] = magSpectra(eXX_Tp04_03d(:,2),sampleRate_bln);
[~,           eXXmagSpec_50w03d_Tp04] = magSpectra(eXX_Tp04_03d(:,3),sampleRate_bln);
[~,           eXXmagSpec_100w03d_Tp04] = magSpectra(eXX_Tp04_03d(:,4),sampleRate_bln);
[~,           eZZmagSpec_05w03d_Tp04] = magSpectra(eZZ_Tp04_03d(:,1),sampleRate_bln);
[~,           eZZmagSpec_25w03d_Tp04] = magSpectra(eZZ_Tp04_03d(:,2),sampleRate_bln);
[~,           eZZmagSpec_50w03d_Tp04] = magSpectra(eZZ_Tp04_03d(:,3),sampleRate_bln);
[~,           eZZmagSpec_100w03d_Tp04] = magSpectra(eZZ_Tp04_03d(:,4),sampleRate_bln);

eXXmagSpec_Tp04_03d = [eXXmagSpec_05w03d_Tp04 eXXmagSpec_25w03d_Tp04 eXXmagSpec_50w03d_Tp04 eXXmagSpec_100w03d_Tp04];
eZZmagSpec_Tp04_03d = [eZZmagSpec_05w03d_Tp04 eZZmagSpec_25w03d_Tp04 eZZmagSpec_50w03d_Tp04 eZZmagSpec_100w03d_Tp04];
clear eXXmagSpec_05w03d_Tp04 eXXmagSpec_25w03d_Tp04 eXXmagSpec_50w03d_Tp04 eXXmagSpec_100w03d_Tp04
clear eZZmagSpec_05w03d_Tp04 eZZmagSpec_25w03d_Tp04 eZZmagSpec_50w03d_Tp04 eZZmagSpec_100w03d_Tp04

% parameter 05
[F_Tp05,      eXXmagSpec_05w03d_Tp05] = magSpectra(eXX_Tp05_03d(:,1),sampleRate_bln);
[~,           eXXmagSpec_25w03d_Tp05] = magSpectra(eXX_Tp05_03d(:,2),sampleRate_bln);
[~,           eXXmagSpec_50w03d_Tp05] = magSpectra(eXX_Tp05_03d(:,3),sampleRate_bln);
[~,           eXXmagSpec_100w03d_Tp05] = magSpectra(eXX_Tp05_03d(:,4),sampleRate_bln);
[~,           eZZmagSpec_05w03d_Tp05] = magSpectra(eZZ_Tp05_03d(:,1),sampleRate_bln);
[~,           eZZmagSpec_25w03d_Tp05] = magSpectra(eZZ_Tp05_03d(:,2),sampleRate_bln);
[~,           eZZmagSpec_50w03d_Tp05] = magSpectra(eZZ_Tp05_03d(:,3),sampleRate_bln);
[~,           eZZmagSpec_100w03d_Tp05] = magSpectra(eZZ_Tp05_03d(:,4),sampleRate_bln);

eXXmagSpec_Tp05_03d = [eXXmagSpec_05w03d_Tp05 eXXmagSpec_25w03d_Tp05 eXXmagSpec_50w03d_Tp05 eXXmagSpec_100w03d_Tp05];
eZZmagSpec_Tp05_03d = [eZZmagSpec_05w03d_Tp05 eZZmagSpec_25w03d_Tp05 eZZmagSpec_50w03d_Tp05 eZZmagSpec_100w03d_Tp05];
clear eXXmagSpec_05w03d_Tp05 eXXmagSpec_25w03d_Tp05 eXXmagSpec_50w03d_Tp05 eXXmagSpec_100w03d_Tp05
clear eZZmagSpec_05w03d_Tp05 eZZmagSpec_25w03d_Tp05 eZZmagSpec_50w03d_Tp05 eZZmagSpec_100w03d_Tp05

%% Find Maximum Value of each Magnitude Spectra Series

% parameter 01
eXXmagSpecMax_Tp01_03d = zeros(1,length(r));
eZZmagSpecMax_Tp01_03d = zeros(1,length(r));
for i = 1:length(r)
    eXXmagSpecMax_Tp01_03d(i) = max(eXXmagSpec_Tp01_03d(:,i));
    eZZmagSpecMax_Tp01_03d(i) = max(eZZmagSpec_Tp01_03d(:,i));
end

% parameter 02      
eXXmagSpecMax_Tp02_03d = zeros(1,length(r));
eZZmagSpecMax_Tp02_03d = zeros(1,length(r));
for i = 1:length(r)
    eXXmagSpecMax_Tp02_03d(i) = max(eXXmagSpec_Tp02_03d(:,i));
    eZZmagSpecMax_Tp02_03d(i) = max(eZZmagSpec_Tp02_03d(:,i));
end

% parameter 03      
eXXmagSpecMax_Tp03_03d = zeros(1,length(r));
eZZmagSpecMax_Tp03_03d = zeros(1,length(r));
for i = 1:length(r)
    eXXmagSpecMax_Tp03_03d(i) = max(eXXmagSpec_Tp03_03d(:,i));
    eZZmagSpecMax_Tp03_03d(i) = max(eZZmagSpec_Tp03_03d(:,i));
end

% parameter 04
eXXmagSpecMax_Tp04_03d = zeros(1,length(r));
eZZmagSpecMax_Tp04_03d = zeros(1,length(r));
for i = 1:length(r)
    eXXmagSpecMax_Tp04_03d(i) = max(eXXmagSpec_Tp04_03d(:,i));
    eZZmagSpecMax_Tp04_03d(i) = max(eZZmagSpec_Tp04_03d(:,i));
end

% parameter 05      
eXXmagSpecMax_Tp05_03d = zeros(1,length(r));
eZZmagSpecMax_Tp05_03d = zeros(1,length(r));
for i = 1:length(r)
    eXXmagSpecMax_Tp05_03d(i) = max(eXXmagSpec_Tp05_03d(:,i));
    eZZmagSpecMax_Tp05_03d(i) = max(eZZmagSpec_Tp05_03d(:,i));
end