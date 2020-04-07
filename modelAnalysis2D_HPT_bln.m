%% modelAnalysis2D_frxSurf_bln
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
minMag = 1E-9; 
minRate = 1E-13; 

% radial distances of probe locations (% of x_c)
r = [50; 250; 500; 1000]; 

% Frequency of Injection Rate
f_inj = 1/Tp_inj;

%% Calculate Characteristic Parameters

% Characteristic Time
tc_frx_bln = (MaterialProps_bln(1).x_c^2)/(4*MaterialProps_bln(1).D_frx);
% tc_frx_bln = tc_frx_bln/86400;

% Characteristic Length
x_c = 1000; % [m]

%% Obtain absolute values of strain rates

eXXrate_bln_03d = abs(eXXrate_bln_03d);
eZZrate_bln_03d = abs(eZZrate_bln_03d);

%% Maximum Strain Rate

eXXrateMax_bln_03d = zeros(1,length(r));
eZZrateMax_bln_03d = zeros(1,length(r));
for i = 1:length(r)
    eXXrateMax_bln_03d(i) = max(eXXrate_bln_03d(:,i));
    eZZrateMax_bln_03d(i) = max(eZZrate_bln_03d(:,i));
end

%% Average Strain Rate

eXXrateMean_bln_03d = zeros(1,length(r));
eZZrateMean_bln_03d = zeros(1,length(r));
for i = 1:length(r)
    eXXrateMean_bln_03d(i) = mean(eXXrate_bln_03d(:,i));
    eZZrateMean_bln_03d(i) = mean(eZZrate_bln_03d(:,i));
end

%% Times during which Strain Rate > minRate

eXX_minRateCriteria_bln_03d = zeros(length(t),length(r));
eZZ_minRateCriteria_bln_03d = zeros(length(t),length(r));
for i = 1:length(r)
    eXX_minRateCriteria_bln_03d(:,i) = eXXrate_bln_03d(:,i)>minRate;
    eZZ_minRateCriteria_bln_03d(:,i) = eZZrate_bln_03d(:,i)>minRate;
end

% Times meeting criteria
t_aboveMinRate_eXX_bln_03d = zeros(length(t),length(r));
t_aboveMinRate_eZZ_bln_03d = zeros(length(t),length(r));
for i = 1:length(r)
    if sum(eXX_minRateCriteria_bln_03d(:,i)) > 0
        t_aboveMinRate_eXX_bln_03d(find(eXX_minRateCriteria_bln_03d(:,i)),i) = t(find(eXX_minRateCriteria_bln_03d(:,i)));
    else
        t_aboveMinRate_eXX_bln_03d(:,i) = 0;
    end
    if sum(eZZ_minRateCriteria_bln_03d(:,i)) > 0
        t_aboveMinRate_eZZ_bln_03d(find(eZZ_minRateCriteria_bln_03d(:,i)),i) = t(find(eZZ_minRateCriteria_bln_03d(:,i)));
    else
        t_aboveMinRate_eZZ_bln_03d(:,i) = 0;
    end
end

%% Duration during which strain rate > minRate

% first time at which eXXrate > minRate (last non-zero value)
for i = 1:length(r)
    if sum(t_aboveMinRate_eXX_bln_03d(:,i)) > 0
        tFirst_aboveMinRate_eXX_bln_03d(i) = t_aboveMinRate_eXX_bln_03d(find(t_aboveMinRate_eXX_bln_03d(:,i),1,'first'));
        tLast_aboveMinRate_eXX_bln_03d(i) = t_aboveMinRate_eXX_bln_03d(find(t_aboveMinRate_eXX_bln_03d(:,i),1,'last'));
    else
        tFirst_aboveMinRate_eXX_bln_03d(:,i) = 0;
        tLast_aboveMinRate_eXX_bln_03d(:,i) = 0;
    end
    if sum(t_aboveMinRate_eZZ_bln_03d(:,i)) > 0
        tFirst_aboveMinRate_eZZ_bln_03d(i) = t_aboveMinRate_eZZ_bln_03d(find(t_aboveMinRate_eZZ_bln_03d(:,i),1,'first'));
        tLast_aboveMinRate_eZZ_bln_03d(i) = t_aboveMinRate_eZZ_bln_03d(find(t_aboveMinRate_eZZ_bln_03d(:,i),1,'last'));
    else
       tFirst_aboveMinRate_eZZ_bln_03d(:,i) = 0;
       tLast_aboveMinRate_eZZ_bln_03d(:,i) = 0;
    end
end

% Durations for which strain rate > minRate
for i = 1:length(r)
    t_aboveMinRateDuration_eXX_bln_03d(1,i) = tLast_aboveMinRate_eXX_bln_03d(1,i)-tFirst_aboveMinRate_eXX_bln_03d(1,i);
    t_aboveMinRateDuration_eZZ_bln_03d(1,i) = tLast_aboveMinRate_eZZ_bln_03d(1,i)-tFirst_aboveMinRate_eZZ_bln_03d(1,i);
end

clear tFirst_aboveMinRate_eXX_bln_03d
clear tFirst_aboveMinRate_eZZ_bln_03d
clear tLast_aboveMinRate_eXX_bln_03d
clear tLast_aboveMinRate_eZZ_bln_03d

%% Magnitude while strain rate > minRate

eXX_magAboveMinRate_bln_03d = zeros(length(t),length(r));
eYY_magAboveMinRate_bln_03d = zeros(length(t),length(r));
eZZ_magAboveMinRate_bln_03d = zeros(length(t),length(r));
for i = 1:length(r)
    if sum(t_aboveMinRate_eXX_bln_03d(:,i)) > 0
        eXX_magAboveMinRate_bln_03d(find(t_aboveMinRate_eXX_bln_03d(:,i)),i) = eXX_bln_03d(find(t_aboveMinRate_eXX_bln_03d(:,i)),i);
    else
        eXX_magAboveMinRate_bln_03d(:,i) = 0;
    end
    if sum(t_aboveMinRate_eZZ_bln_03d(:,i)) > 0
        eZZ_magAboveMinRate_bln_03d(find(t_aboveMinRate_eZZ_bln_03d(:,i)),i) = eZZ_bln_03d(find(t_aboveMinRate_eZZ_bln_03d(:,i)),i);
    else
        eZZ_magAboveMinRate_bln_03d(:,i) = 0;
    end
end

%% Detectable Strains

% Define Measurement Criteria 
for i = 1:length(r)
    eXXmeasCriteria(:,i) = (abs(eXX_magAboveMinRate_bln_03d(:,i)) > minMag & eXXrate_bln_03d(:,i) > minRate);
    eZZmeasCriteria(:,i) = (abs(eZZ_magAboveMinRate_bln_03d(:,i)) > minMag & eZZrate_bln_03d(:,i) > minRate);
end

% Detectable Strains
eXX_detectable_bln_03d = NaN(length(t),length(r));
eZZ_detectable_bln_03d = NaN(length(t),length(r));
for i = 1:size(eXXmeasCriteria,2)
    if sum(eXXmeasCriteria(:,i)) > 0
        eXX_detectable_bln_03d((eXXmeasCriteria(:,i)),i) = eXX_bln_03d((eXXmeasCriteria(:,i)),i);
    else
        eXX_detectable_bln_03d(:,i) = NaN;
    end
    if sum(eZZmeasCriteria(:,i)) > 0
        eZZ_detectable_bln_03d((eZZmeasCriteria(:,i)),i) = eZZ_bln_03d((eZZmeasCriteria(:,i)),i);
    else
        eZZ_detectable_bln_03d(:,i) = NaN;
    end
end

%% Times of Dectectable Strain (mag>minMag & rate>minRate)

t_eXX_detectable_bln_03d = zeros(length(t),length(r));
t_eZZ_detectable_bln_03d = zeros(length(t),length(r));
for i = 1:size(eXXmeasCriteria,2)
    if sum(eXXmeasCriteria(:,i)) > 0
        t_eXX_detectable_bln_03d((eXXmeasCriteria(:,i)),i) = t(eXXmeasCriteria(:,i));
    else
        t_eXX_detectable_bln_03d(:,i) = 0;
    end
    if sum(eZZmeasCriteria(:,i)) > 0
        t_eZZ_detectable_bln_03d((eZZmeasCriteria(:,i)),i) = t(eZZmeasCriteria(:,i));
    else
        t_eZZ_detectable_bln_03d(:,i) = 0;
    end
end
    
%% Duration Strain is Detectable

% first and last time strain is detectable
for i = 1:length(r)
    if sum(t_eXX_detectable_bln_03d(:,i)) > 0
        tFirst_eXX_detectable_bln_03d(i) = t_eXX_detectable_bln_03d(find(t_eXX_detectable_bln_03d(:,i),1,'first'));
        tLast_eXX_detectable_bln_03d(i) = t_eXX_detectable_bln_03d(find(t_eXX_detectable_bln_03d(:,i),1,'last'));
    else
        tFirst_eXX_detectable_bln_03d(i) = 0;
        tLast_eXX_detectable_bln_03d(i) = 0;
    end
    if sum(t_eZZ_detectable_bln_03d(:,i)) > 0
        tFirst_eZZ_detectable_bln_03d(i) = t_eZZ_detectable_bln_03d(find(t_eZZ_detectable_bln_03d(:,i),1,'first'));
        tLast_eZZ_detectable_bln_03d(i) = t_eZZ_detectable_bln_03d(find(t_eZZ_detectable_bln_03d(:,i),1,'last'));
    else
        tFirst_eZZ_detectable_bln_03d(i) = 0;
        tLast_eZZ_detectable_bln_03d(i) = 0;
    end
end

% Duration strain is detectable
eXX_detectableDuration_bln_03d = zeros(1,length(r));
eZZ_detectableDuration_bln_03d = zeros(1,length(r));
for i = 1:length(r)
    eXX_detectableDuration_bln_03d(i) = tLast_eXX_detectable_bln_03d(i) - tFirst_eXX_detectable_bln_03d(i);
    eZZ_detectableDuration_bln_03d(i) = tLast_eZZ_detectable_bln_03d(i) - tFirst_eZZ_detectable_bln_03d(i);
end

clear tFirst_eXX_detectable_bln_03d tFirst_eZZ_detectable_bln_03d
clear tLast_eXX_detectable_bln_03d tLast_eZZ_detectable_bln_03d

%% Compute Magnitude Spectra

[F_bln, eXXmagSpec_05w03d_bln] = magSpectra(eXX_bln_03d(:,1),sampleRate_bln);
[~,     eXXmagSpec_25w03d_bln] = magSpectra(eXX_bln_03d(:,2),sampleRate_bln);
[~,     eXXmagSpec_50w03d_bln] = magSpectra(eXX_bln_03d(:,3),sampleRate_bln);
[~,     eXXmagSpec_100w03d_bln] = magSpectra(eXX_bln_03d(:,4),sampleRate_bln);

eXXmagSpec_bln_03d = [eXXmagSpec_05w03d_bln eXXmagSpec_25w03d_bln eXXmagSpec_50w03d_bln eXXmagSpec_100w03d_bln];
clear eXXmagSpec_05w03d_bln eXXmagSpec_25w03d_bln eXXmagSpec_50w03d_bln eXXmagSpec_100w03d_bln

%% Find Maximum Value of each Magnitude Spectra Series

eXXmagSpecMax_bln_03d = zeros(length(r),1);
for i = 1:length(r)
    eXXmagSpecMax_bln_03d(i) = max(eXXmagSpec_bln_03d(:,i));
end

%% Find Time at which Maximum Value of Magnitude Spectra Occurs

t_eXXmagSpecMax_bln_03d = zeros(length(r),1);
for i = 1:length(r)
    t_eXXmagSpecMax_bln_03d(i) = t(find(eXXmagSpec_bln_03d(:,i) == eXXmagSpecMax_bln_03d(i)));
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
