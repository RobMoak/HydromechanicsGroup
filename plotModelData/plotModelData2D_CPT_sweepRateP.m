%% plotModelData2D_CPT_swpRateP
% Author: R. Moak
% Date: 03/04/20

%% Set Path to Output Folder
cd 'X:\Clemson\Thesis\Models\COMSOL\00_Simulations\LeakDetection\01_ConceptualModels\01a_LD_WDp2D_fS_XPTf\OutputPlots'
addpath('X:\Clemson\Thesis\Models\COMSOL\00_Simulations\LeakDetection\Analyses_All\plotModelData');

%% Load Plot Formatting Variables
plotFormatting;

%% Scaling Parameters
% ===============================================================================================%
% Define Parameters
% ===============================================================================================%
alpha_b = 1;
p_inj = ModelParams_sweepRateP(1).p_inj;
Pc = p_inj;
X_frx = ModelParams_sweepRateP.X_frx;
X_conf = ModelParams_sweepRateP.X_conf;

% ===============================================================================================%
% Dimensionless Scaling
% ===============================================================================================%
% Transformational Strain
e0_frx = alpha_b*Pc*X_frx;
e0_conf = alpha_b*Pc*X_conf;

% Dimensionless Time
tStar_swpRateP = zeros(size(t_swpRateP));
for i = 1:size(tStar_swpRateP,2)
    tStar_swpRateP(:,i) = t_swpRateP(:,i)/tc_sweepRateP;
end

%% Magnitude: Normal Strains (eXX & eZZ)
% ===============================================================================================%
% Strain Magnitude - semilogx (Dimensionless)
% ===============================================================================================%
fig = figure('Name','sweepRateP_eNNmag','NumberTitle','off');
% par 01 - eXX
semilogx(tStar_swpRateP(:,1),eXX_pRate01_03d(:,1)/e0_frx,'-r','LineWidth',3);hold on
semilogx(tStar_swpRateP(:,1),eXX_pRate01_03d(:,2)/e0_frx,'-b','LineWidth',3)
semilogx(tStar_swpRateP(:,1),eXX_pRate01_03d(:,3)/e0_frx,'-g','LineWidth',3)
semilogx(tStar_swpRateP(:,1),eXX_pRate01_03d(:,4)/e0_frx,'-m','LineWidth',3)
semilogx(tStar_swpRateP(:,1),eXX_pRate01_03d(:,5)/e0_frx,'-c','LineWidth',3)
semilogx(tStar_swpRateP(:,1),eXX_pRate01_03d(:,6)/e0_frx,'-y','LineWidth',3)
semilogx(tStar_swpRateP(:,1),eXX_pRate01_03d(:,8)/e0_frx,'-k','LineWidth',3)
% par 03 - eXX
semilogx(tStar_swpRateP(:,3),eXX_pRate03_03d(:,1)/e0_frx,'--r','LineWidth',3)
semilogx(tStar_swpRateP(:,3),eXX_pRate03_03d(:,2)/e0_frx,'--b','LineWidth',3)
semilogx(tStar_swpRateP(:,3),eXX_pRate03_03d(:,3)/e0_frx,'--g','LineWidth',3)
semilogx(tStar_swpRateP(:,3),eXX_pRate03_03d(:,4)/e0_frx,'--m','LineWidth',3)
semilogx(tStar_swpRateP(:,3),eXX_pRate03_03d(:,5)/e0_frx,'--c','LineWidth',3)
semilogx(tStar_swpRateP(:,3),eXX_pRate03_03d(:,6)/e0_frx,'--y','LineWidth',3)
semilogx(tStar_swpRateP(:,3),eXX_pRate03_03d(:,8)/e0_frx,'--k','LineWidth',3)
% par 06 - eXX
semilogx(tStar_swpRateP(:,6),eXX_pRate06_03d(:,1)/e0_frx,'.r','LineWidth',3)
semilogx(tStar_swpRateP(:,6),eXX_pRate06_03d(:,2)/e0_frx,'.b','LineWidth',3)
semilogx(tStar_swpRateP(:,6),eXX_pRate06_03d(:,3)/e0_frx,'.g','LineWidth',3)
semilogx(tStar_swpRateP(:,6),eXX_pRate06_03d(:,4)/e0_frx,'.m','LineWidth',3)
semilogx(tStar_swpRateP(:,6),eXX_pRate06_03d(:,5)/e0_frx,'.c','LineWidth',3)
semilogx(tStar_swpRateP(:,6),eXX_pRate06_03d(:,6)/e0_frx,'.y','LineWidth',3)
semilogx(tStar_swpRateP(:,6),eXX_pRate06_03d(:,8)/e0_frx,'.k','LineWidth',3);hold off;grid on;
pbaspect([1 1 1])
% xlim([3E-3,1.25])
xlabel('t*','FontSize',15)
ylabel('Dimensionless Strain','FontSize',15)
legend('r = 5%', 'r = 25%', 'r = 50%', 'r = 100%', 'r = 110%', 'r = 125%', 'r = 200%','Location','NorthWest')
pbaspect([1 1 1])
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_CPT_swpRateP_eNNmag_allParVals.pdf','-dpdf','-r0')
print(fig,'01a_CPT_swpRateP_eNNmag_allParVals.tif','-dtiff','-r0')

%% Detectable Normal Strains
% ===============================================================================================%
% PARAMETER VALUE 01: Detectable Normal Strain Magnitude - (eXX & eZZ) - Semilogx (Dimensionless)
% ===============================================================================================%
fig = figure('Name','pRate01_eNNmagDet','NumberTitle','off');
% eXX
semilogx(tStar_swpRateP(:,1),eXX_detectable_pRate01_03d(:,1)/e0_frx,'r','LineWidth',7,'HandleVisibility','off');hold on
semilogx(tStar_swpRateP(:,1),eXX_detectable_pRate01_03d(:,2)/e0_frx,'r','LineWidth',7,'HandleVisibility','off');
semilogx(tStar_swpRateP(:,1),eXX_detectable_pRate01_03d(:,3)/e0_frx,'r','LineWidth',7,'HandleVisibility','off');
semilogx(tStar_swpRateP(:,1),eXX_detectable_pRate01_03d(:,4)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpRateP(:,1),eXX_detectable_pRate01_03d(:,5)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpRateP(:,1),eXX_detectable_pRate01_03d(:,6)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpRateP(:,1),eXX_detectable_pRate01_03d(:,8)/e0_frx,'r','LineWidth',7,'HandleVisibility','off');
semilogx(tStar_swpRateP(:,1),eXX_pRate01_03d(:,1)/e0_frx,'r','LineWidth',3)
semilogx(tStar_swpRateP(:,1),eXX_pRate01_03d(:,2)/e0_frx,'b','LineWidth',3)
semilogx(tStar_swpRateP(:,1),eXX_pRate01_03d(:,3)/e0_frx,'g','LineWidth',3)
semilogx(tStar_swpRateP(:,1),eXX_pRate01_03d(:,4)/e0_frx,'m','LineWidth',3)
semilogx(tStar_swpRateP(:,1),eXX_pRate01_03d(:,5)/e0_frx,'c','LineWidth',3)
semilogx(tStar_swpRateP(:,1),eXX_pRate01_03d(:,6)/e0_frx,'y','LineWidth',3)
semilogx(tStar_swpRateP(:,1),eXX_pRate01_03d(:,8)/e0_frx,'k','LineWidth',3);hold on;grid on
pbaspect([1 1 1])
xlim([5E-3,4])
xlabel('t*','FontSize',15)
ylabel('Dimensionless Strain','FontSize',15)
legend('r = 5%', 'r = 25%', 'r = 50%', 'r = 100%', 'r = 110%', 'r = 125%', 'r = 200%','Location','NorthWest')
pbaspect([1 1 1])
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_CPT_pRate01_eNNmagDet.pdf','-dpdf','-r0')
print(fig,'01a_CPT_pRate01_eNNmagDet.tif','-dtiff','-r0')

% ===============================================================================================%
% PARAMETER VALUE 02: Detectable Normal Strain Magnitude - (eXX & eZZ) - Semilogx (Dimensionless)
% ===============================================================================================%
fig = figure('Name','pRate02_eNNmagDet','NumberTitle','off');
semilogx(tStar_swpRateP(:,2),eXX_detectable_pRate02_03d(:,1)/e0_frx,'r','LineWidth',7,'HandleVisibility','off');hold on
semilogx(tStar_swpRateP(:,2),eXX_detectable_pRate02_03d(:,2)/e0_frx,'r','LineWidth',7,'HandleVisibility','off');
semilogx(tStar_swpRateP(:,2),eXX_detectable_pRate02_03d(:,3)/e0_frx,'r','LineWidth',7,'HandleVisibility','off');
semilogx(tStar_swpRateP(:,2),eXX_detectable_pRate02_03d(:,4)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpRateP(:,2),eXX_detectable_pRate02_03d(:,5)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpRateP(:,2),eXX_detectable_pRate02_03d(:,6)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpRateP(:,2),eXX_detectable_pRate02_03d(:,8)/e0_frx,'r','LineWidth',7,'HandleVisibility','off');
semilogx(tStar_swpRateP(:,2),eXX_pRate02_03d(:,1)/e0_frx,'r','LineWidth',3)
semilogx(tStar_swpRateP(:,2),eXX_pRate02_03d(:,2)/e0_frx,'b','LineWidth',3)
semilogx(tStar_swpRateP(:,2),eXX_pRate02_03d(:,3)/e0_frx,'g','LineWidth',3)
semilogx(tStar_swpRateP(:,2),eXX_pRate02_03d(:,4)/e0_frx,'m','LineWidth',3)
semilogx(tStar_swpRateP(:,2),eXX_pRate02_03d(:,5)/e0_frx,'c','LineWidth',3)
semilogx(tStar_swpRateP(:,2),eXX_pRate02_03d(:,6)/e0_frx,'y','LineWidth',3)
semilogx(tStar_swpRateP(:,2),eXX_pRate02_03d(:,8)/e0_frx,'k','LineWidth',3);hold off;grid on
pbaspect([1 1 1])
xlim([5E-3,4])
xlabel('t*','FontSize',15)
ylabel('Dimensionless Strain','FontSize',15)
legend('r = 5%', 'r = 25%', 'r = 50%', 'r = 100%', 'r = 110%', 'r = 125%', 'r = 200%','Location','NorthWest')
pbaspect([1 1 1])
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_CPT_pRate02_eNNmagDet.pdf','-dpdf','-r0')
print(fig,'01a_CPT_pRate02_eNNmagDet.tif','-dtiff','-r0')

% ===============================================================================================%
% PARAMETER VALUE 03: Detectable Normal Strain Magnitude - (eXX & eZZ) - Semilogx (Dimensionless)
% ===============================================================================================%
fig = figure('Name','pRate03_eNNmagDet','NumberTitle','off');
semilogx(tStar_swpRateP(:,3),eXX_detectable_pRate03_03d(:,1)/e0_frx,'r','LineWidth',7,'HandleVisibility','off');hold on
semilogx(tStar_swpRateP(:,3),eXX_detectable_pRate03_03d(:,2)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpRateP(:,3),eXX_detectable_pRate03_03d(:,3)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpRateP(:,3),eXX_detectable_pRate03_03d(:,4)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpRateP(:,3),eXX_detectable_pRate03_03d(:,5)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpRateP(:,3),eXX_detectable_pRate03_03d(:,6)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpRateP(:,3),eXX_detectable_pRate03_03d(:,8)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpRateP(:,3),eXX_pRate03_03d(:,1)/e0_frx,'r','LineWidth',3)
semilogx(tStar_swpRateP(:,3),eXX_pRate03_03d(:,2)/e0_frx,'b','LineWidth',3)
semilogx(tStar_swpRateP(:,3),eXX_pRate03_03d(:,3)/e0_frx,'g','LineWidth',3)
semilogx(tStar_swpRateP(:,3),eXX_pRate03_03d(:,4)/e0_frx,'m','LineWidth',3)
semilogx(tStar_swpRateP(:,3),eXX_pRate03_03d(:,5)/e0_frx,'c','LineWidth',3)
semilogx(tStar_swpRateP(:,3),eXX_pRate03_03d(:,6)/e0_frx,'y','LineWidth',3)
semilogx(tStar_swpRateP(:,3),eXX_pRate03_03d(:,8)/e0_frx,'k','LineWidth',3);hold off;grid on
pbaspect([1 1 1])
xlim([5E-3,4])
xlabel('t*','FontSize',15)
ylabel('Dimensionless Strain','FontSize',15)
legend('r = 5%', 'r = 25%', 'r = 50%', 'r = 100%', 'r = 110%', 'r = 125%', 'r = 200%','Location','NorthWest')
pbaspect([1 1 1])
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_CPT_pRate03_eNNmagDet.pdf','-dpdf','-r0')
print(fig,'01a_CPT_pRate03_eNNmagDet.tif','-dtiff','-r0')

% ===============================================================================================%
% PARAMETER VALUE 04: Detectable Normal Strain Magnitude - (eXX & eZZ) - Semilogx (Dimensionless)
% ===============================================================================================%
fig = figure('Name','pRate04_eNNmagDet','NumberTitle','off');
semilogx(tStar_swpRateP(:,4),eXX_detectable_pRate04_03d(:,1)/e0_frx,'r','LineWidth',7,'HandleVisibility','off');hold on
semilogx(tStar_swpRateP(:,4),eXX_detectable_pRate04_03d(:,2)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpRateP(:,4),eXX_detectable_pRate04_03d(:,3)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpRateP(:,4),eXX_detectable_pRate04_03d(:,4)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpRateP(:,4),eXX_detectable_pRate04_03d(:,5)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpRateP(:,4),eXX_detectable_pRate04_03d(:,6)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpRateP(:,4),eXX_detectable_pRate04_03d(:,8)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpRateP(:,4),eXX_pRate04_03d(:,1)/e0_frx,'r','LineWidth',3)
semilogx(tStar_swpRateP(:,4),eXX_pRate04_03d(:,2)/e0_frx,'b','LineWidth',3)
semilogx(tStar_swpRateP(:,4),eXX_pRate04_03d(:,3)/e0_frx,'g','LineWidth',3)
semilogx(tStar_swpRateP(:,4),eXX_pRate04_03d(:,4)/e0_frx,'m','LineWidth',3)
semilogx(tStar_swpRateP(:,4),eXX_pRate04_03d(:,5)/e0_frx,'c','LineWidth',3)
semilogx(tStar_swpRateP(:,4),eXX_pRate04_03d(:,6)/e0_frx,'y','LineWidth',3)
semilogx(tStar_swpRateP(:,4),eXX_pRate04_03d(:,8)/e0_frx,'k','LineWidth',3);hold off;grid on
pbaspect([1 1 1])
xlim([5E-3,4])
xlabel('t*','FontSize',15)
ylabel('Dimensionless Strain','FontSize',15)
legend('r = 5%', 'r = 25%', 'r = 50%', 'r = 100%', 'r = 110%', 'r = 125%', 'r = 200%','Location','NorthWest')
pbaspect([1 1 1])
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_CPT_pRate04_eNNmagDet.pdf','-dpdf','-r0')
print(fig,'01a_CPT_pRate04_eNNmagDet.tif','-dtiff','-r0')

% ===============================================================================================%
% PARAMETER VALUE 05: Detectable Normal Strain Magnitude - (eXX & eZZ) - Semilogx (Dimensionless)
% ===============================================================================================%
fig = figure('Name','pRate05_eNNmagDet','NumberTitle','off');
semilogx(tStar_swpRateP(:,5),eXX_detectable_pRate05_03d(:,1)/e0_frx,'r','LineWidth',7,'HandleVisibility','off');hold on
semilogx(tStar_swpRateP(:,5),eXX_detectable_pRate05_03d(:,2)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpRateP(:,5),eXX_detectable_pRate05_03d(:,3)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpRateP(:,5),eXX_detectable_pRate05_03d(:,4)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpRateP(:,5),eXX_detectable_pRate05_03d(:,5)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpRateP(:,5),eXX_detectable_pRate05_03d(:,6)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpRateP(:,5),eXX_detectable_pRate05_03d(:,8)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpRateP(:,5),eXX_pRate05_03d(:,1)/e0_frx,'r','LineWidth',3)
semilogx(tStar_swpRateP(:,5),eXX_pRate05_03d(:,2)/e0_frx,'b','LineWidth',3)
semilogx(tStar_swpRateP(:,5),eXX_pRate05_03d(:,3)/e0_frx,'g','LineWidth',3)
semilogx(tStar_swpRateP(:,5),eXX_pRate05_03d(:,4)/e0_frx,'m','LineWidth',3)
semilogx(tStar_swpRateP(:,5),eXX_pRate05_03d(:,5)/e0_frx,'c','LineWidth',3)
semilogx(tStar_swpRateP(:,5),eXX_pRate05_03d(:,6)/e0_frx,'y','LineWidth',3)
semilogx(tStar_swpRateP(:,5),eXX_pRate05_03d(:,8)/e0_frx,'k','LineWidth',3);hold off;grid on
pbaspect([1 1 1])
xlim([5E-3,4])
xlabel('t*','FontSize',15)
ylabel('Dimensionless Strain','FontSize',15)
legend('r = 5%', 'r = 25%', 'r = 50%', 'r = 100%', 'r = 110%', 'r = 125%', 'r = 200%','Location','NorthWest')
pbaspect([1 1 1])
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_CPT_pRate05_eNNmagDet.pdf','-dpdf','-r0')
print(fig,'01a_CPT_pRate05_eNNmagDet.tif','-dtiff','-r0')

% ===============================================================================================%
% PARAMETER VALUE 06: Detectable Normal Strain Magnitude - (eXX & eZZ) - Semilogx (Dimensionless)
% ===============================================================================================%
fig = figure('Name','pRate06_eNNmagDet','NumberTitle','off');
semilogx(tStar_swpRateP(:,6),eXX_detectable_pRate06_03d(:,1)/e0_frx,'r','LineWidth',7,'HandleVisibility','off');hold on
semilogx(tStar_swpRateP(:,6),eXX_detectable_pRate06_03d(:,2)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpRateP(:,6),eXX_detectable_pRate06_03d(:,3)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpRateP(:,6),eXX_detectable_pRate06_03d(:,4)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpRateP(:,6),eXX_detectable_pRate06_03d(:,5)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpRateP(:,6),eXX_detectable_pRate06_03d(:,6)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpRateP(:,6),eXX_detectable_pRate06_03d(:,8)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpRateP(:,6),eXX_pRate06_03d(:,1)/e0_frx,'r','LineWidth',3)
semilogx(tStar_swpRateP(:,6),eXX_pRate06_03d(:,2)/e0_frx,'b','LineWidth',3)
semilogx(tStar_swpRateP(:,6),eXX_pRate06_03d(:,3)/e0_frx,'g','LineWidth',3)
semilogx(tStar_swpRateP(:,6),eXX_pRate06_03d(:,4)/e0_frx,'m','LineWidth',3)
semilogx(tStar_swpRateP(:,6),eXX_pRate06_03d(:,5)/e0_frx,'c','LineWidth',3)
semilogx(tStar_swpRateP(:,6),eXX_pRate06_03d(:,6)/e0_frx,'y','LineWidth',3)
semilogx(tStar_swpRateP(:,6),eXX_pRate06_03d(:,8)/e0_frx,'k','LineWidth',3);hold off;grid on
pbaspect([1 1 1])
xlim([5E-3,4])
xlabel('t*','FontSize',15)
ylabel('Dimensionless Strain','FontSize',15)
legend('r = 5%', 'r = 25%', 'r = 50%', 'r = 100%', 'r = 110%', 'r = 125%', 'r = 200%','Location','NorthWest')
pbaspect([1 1 1])
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_CPT_pRate06_eNNmagDet.pdf','-dpdf','-r0')
print(fig,'01a_CPT_pRate06_eNNmagDet.tif','-dtiff','-r0')

%% Strain Rate
% ===============================================================================================%
% INDIVIDUAL LOCATIONS: Strain Rate (eXX) - loglog (Dimensionless)
% ===============================================================================================%
% LOCATION: PROBE 05w03d
fig = figure('Name','swpRateP_eXXrate_05w03d','NumberTitle','off');
% par01
loglog(tStar_swpRateP(:,1),eXXrate_pRate01_03d(:,1),'LineWidth',3);hold on
% par02
loglog(tStar_swpRateP(:,2),eXXrate_pRate02_03d(:,1),'LineWidth',3)
% par03
loglog(tStar_swpRateP(:,3),eXXrate_pRate03_03d(:,1),'LineWidth',3)
% par04
loglog(tStar_swpRateP(:,4),eXXrate_pRate04_03d(:,1),'LineWidth',3)
% par05
loglog(tStar_swpRateP(:,5),eXXrate_pRate05_03d(:,1),'LineWidth',3)
% par06
loglog(tStar_swpRateP(:,6),eXXrate_pRate06_03d(:,1),'LineWidth',3);hold off;grid on
pbaspect([1 1 1])
% xlim([1E-2,1.25])
xlabel('t*','FontSize',15)
ylabel('Dimensionless Strain Rate','FontSize',15)
% legend('D01', 'D02', 'D03','Location','SouthWest')
pbaspect([1 1 1])
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_CPT_swpRateP_eXXrate_05w03d.pdf','-dpdf','-r0')
print(fig,'01a_CPT_swpRateP_eXXrate_05w03d.tif','-dtiff','-r0')

% ===============================================================================================%

% LOCATION: PROBE 25w03d
fig = figure('Name','swpRateP_eXXrate_25w03d','NumberTitle','off');
% par01
loglog(tStar_swpRateP(:,1),eXXrate_pRate01_03d(:,2),'LineWidth',3);hold on
% par02
loglog(tStar_swpRateP(:,2),eXXrate_pRate02_03d(:,2),'LineWidth',3)
% par03
loglog(tStar_swpRateP(:,3),eXXrate_pRate03_03d(:,2),'LineWidth',3)
% par04
loglog(tStar_swpRateP(:,4),eXXrate_pRate04_03d(:,2),'LineWidth',3)
% par05
loglog(tStar_swpRateP(:,5),eXXrate_pRate05_03d(:,2),'LineWidth',3)
% par06
loglog(tStar_swpRateP(:,6),eXXrate_pRate06_03d(:,2),'LineWidth',3);hold off;grid on
pbaspect([1 1 1])
% xlim([1E-2,1.25])
xlabel('t*','FontSize',15)
ylabel('Dimensionless Strain Rate','FontSize',15)
% legend('D01', 'D02', 'D03','Location','SouthWest')
pbaspect([1 1 1])
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_CPT_swpRateP_eXXrate_25w03d.pdf','-dpdf','-r0')
print(fig,'01a_CPT_swpRateP_eXXrate_25w03d.tif','-dtiff','-r0')

% ===============================================================================================%

% LOCATION: PROBE 50w03d
fig = figure('Name','swpRateP_eXXrate_50w03d','NumberTitle','off');
% par01
loglog(tStar_swpRateP(:,1),eXXrate_pRate01_03d(:,3),'LineWidth',3);hold on
% par02
loglog(tStar_swpRateP(:,2),eXXrate_pRate02_03d(:,3),'LineWidth',3)
% par03
loglog(tStar_swpRateP(:,3),eXXrate_pRate03_03d(:,3),'LineWidth',3)
% par04
loglog(tStar_swpRateP(:,4),eXXrate_pRate04_03d(:,3),'LineWidth',3)
% par05
loglog(tStar_swpRateP(:,5),eXXrate_pRate05_03d(:,3),'LineWidth',3)
% par06
loglog(tStar_swpRateP(:,6),eXXrate_pRate06_03d(:,3),'LineWidth',3);hold off;grid on
pbaspect([1 1 1])
% xlim([1E-2,1.25])
xlabel('t*','FontSize',15)
ylabel('Dimensionless Strain Rate','FontSize',15)
% legend('D01', 'D02', 'D03','Location','SouthWest')
pbaspect([1 1 1])
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_CPT_swpRateP_eXXrate_50w03d.pdf','-dpdf','-r0')
print(fig,'01a_CPT_swpRateP_eXXrate_50w03d.tif','-dtiff','-r0')

% ===============================================================================================%

% LOCATION: PROBE 100W03d
fig = figure('Name','swpRateP_eXXrate_100w03d','NumberTitle','off');
% par01
loglog(tStar_swpRateP(:,1),eXXrate_pRate01_03d(:,4),'LineWidth',3);hold on
% par02
loglog(tStar_swpRateP(:,2),eXXrate_pRate02_03d(:,4),'LineWidth',3)
% par03
loglog(tStar_swpRateP(:,3),eXXrate_pRate03_03d(:,4),'LineWidth',3)
% par04
loglog(tStar_swpRateP(:,4),eXXrate_pRate04_03d(:,4),'LineWidth',3)
% par05
loglog(tStar_swpRateP(:,5),eXXrate_pRate05_03d(:,4),'LineWidth',3)
% par06
loglog(tStar_swpRateP(:,6),eXXrate_pRate06_03d(:,4),'LineWidth',3);hold off;grid on
pbaspect([1 1 1])
% xlim([1E-2,1.25])
xlabel('t*','FontSize',15)
ylabel('Dimensionless Strain Rate','FontSize',15)
% legend('D01', 'D02', 'D03','Location','SouthWest')
pbaspect([1 1 1])
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_CPT_swpRateP_eXXrate_100w03d.pdf','-dpdf','-r0')
print(fig,'01a_CPT_swpRateP_eXXrate_100w03d.tif','-dtiff','-r0')

% ===============================================================================================%

% LOCATION: PROBE 110W03d
fig = figure('Name','swpRateP_eXXrate_110w03d','NumberTitle','off');
% par01
loglog(tStar_swpRateP(:,1),eXXrate_pRate01_03d(:,5),'LineWidth',3);hold on
% par02
loglog(tStar_swpRateP(:,2),eXXrate_pRate02_03d(:,5),'LineWidth',3)
% par03
loglog(tStar_swpRateP(:,3),eXXrate_pRate03_03d(:,5),'LineWidth',3)
% par04
loglog(tStar_swpRateP(:,4),eXXrate_pRate04_03d(:,5),'LineWidth',3)
% par05
loglog(tStar_swpRateP(:,5),eXXrate_pRate05_03d(:,5),'LineWidth',3)
% par06
loglog(tStar_swpRateP(:,6),eXXrate_pRate06_03d(:,5),'LineWidth',3);hold off;grid on
pbaspect([1 1 1])
% xlim([1E-2,1.25])
xlabel('t*','FontSize',15)
ylabel('Dimensionless Strain Rate','FontSize',15)
% legend('D01', 'D02', 'D03','Location','SouthWest')
pbaspect([1 1 1])
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_CPT_swpRateP_eXXrate_110w03d.pdf','-dpdf','-r0')
print(fig,'01a_CPT_swpRateP_eXXrate_110w03d.tif','-dtiff','-r0')

% ===============================================================================================%

% LOCATION: PROBE 125W03d
fig = figure('Name','swpRateP_eXXrate_125w03d','NumberTitle','off');
% par01
loglog(tStar_swpRateP(:,1),eXXrate_pRate01_03d(:,6),'LineWidth',3);hold on
% par02
loglog(tStar_swpRateP(:,2),eXXrate_pRate02_03d(:,6),'LineWidth',3)
% par03
loglog(tStar_swpRateP(:,3),eXXrate_pRate03_03d(:,6),'LineWidth',3)
% par04
loglog(tStar_swpRateP(:,4),eXXrate_pRate04_03d(:,6),'LineWidth',3)
% par05
loglog(tStar_swpRateP(:,5),eXXrate_pRate05_03d(:,6),'LineWidth',3)
% par06
loglog(tStar_swpRateP(:,6),eXXrate_pRate06_03d(:,6),'LineWidth',3);hold off;grid on
pbaspect([1 1 1])
% xlim([1E-2,1.25])
xlabel('t*','FontSize',15)
ylabel('Dimensionless Strain Rate','FontSize',15)
% legend('D01', 'D02', 'D03','Location','SouthWest')
pbaspect([1 1 1])
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_CPT_swpRateP_eXXrate_125w03d.pdf','-dpdf','-r0')
print(fig,'01a_CPT_swpRateP_eXXrate_125w03d.tif','-dtiff','-r0')


% ===============================================================================================%

% LOCATION: PROBE 150W03d
fig = figure('Name','swpRateP_eXXrate_150w03d','NumberTitle','off');
% par01
loglog(tStar_swpRateP(:,1),eXXrate_pRate01_03d(:,7),'LineWidth',3);hold on
% par02
loglog(tStar_swpRateP(:,2),eXXrate_pRate02_03d(:,7),'LineWidth',3)
% par03
loglog(tStar_swpRateP(:,3),eXXrate_pRate03_03d(:,7),'LineWidth',3)
% par04
loglog(tStar_swpRateP(:,4),eXXrate_pRate04_03d(:,7),'LineWidth',3)
% par05
loglog(tStar_swpRateP(:,5),eXXrate_pRate05_03d(:,7),'LineWidth',3)
% par06
loglog(tStar_swpRateP(:,6),eXXrate_pRate06_03d(:,7),'LineWidth',3);hold off;grid on
pbaspect([1 1 1])
% xlim([1E-2,1.25])
xlabel('t*','FontSize',15)
ylabel('Dimensionless Strain Rate','FontSize',15)
% legend('D01', 'D02', 'D03','Location','SouthWest')
pbaspect([1 1 1])
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_CPT_swpRateP_eXXrate_150w03d.pdf','-dpdf','-r0')
print(fig,'01a_CPT_swpRateP_eXXrate_150w03d.tif','-dtiff','-r0')

% ===============================================================================================%

% LOCATION: PROBE 200W03d
fig = figure('Name','swpRateP_eXXrate_200w03d','NumberTitle','off');
% par01
loglog(tStar_swpRateP(:,1),eXXrate_pRate01_03d(:,8),'LineWidth',3);hold on
% par02
loglog(tStar_swpRateP(:,2),eXXrate_pRate02_03d(:,8),'LineWidth',3)
% par03
loglog(tStar_swpRateP(:,3),eXXrate_pRate03_03d(:,8),'LineWidth',3)
% par04
loglog(tStar_swpRateP(:,4),eXXrate_pRate04_03d(:,8),'LineWidth',3)
% par05
loglog(tStar_swpRateP(:,5),eXXrate_pRate05_03d(:,8),'LineWidth',3)
% par06
loglog(tStar_swpRateP(:,6),eXXrate_pRate06_03d(:,8),'LineWidth',3);hold off;grid on
pbaspect([1 1 1])
% xlim([1E-2,1.25])
xlabel('t*','FontSize',15)
ylabel('Dimensionless Strain Rate','FontSize',15)
% legend('D01', 'D02', 'D03','Location','SouthWest')
pbaspect([1 1 1])
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_CPT_swpRateP_eXXrate_200w03d.pdf','-dpdf','-r0')
print(fig,'01a_CPT_swpRateP_eXXrate_200w03d.tif','-dtiff','-r0')

% ===============================================================================================%
% ALL LOCATIONS: Strain Rate (eXX) - loglog (Dimensionless)
% ===============================================================================================%
fig = figure('Name','swpRateP_eXXrate_allProbes','NumberTitle','off');
% ===============================================================================================%
% LOCATION: PROBE 05w03d
subplot(4,4,1)
% par01
loglog(tStar_swpRateP,eXXrate_pRate01_03d(:,1)/e0_frx,'r','LineWidth',3);hold on
% par03
loglog(tStar_swpRateP,eXXrate_pRate03_03d(:,1)/e0_frx,'--r','LineWidth',3)
% par06
loglog(tStar_swpRateP,eXXrate_pRate06_03d(:,1)/e0_frx,'.r','LineWidth',3);hold off;grid on
pbaspect([1 1 1])
% xlim([1E-2,1.25])
% xlabel('t*','FontSize',15)
ylabel('Strain Rate (Scaled)','FontSize',12)
% ===============================================================================================%
% LOCATION: PROBE 25w03d
subplot(4,4,2)
% par01
loglog(tStar_swpRateP,eXXrate_pRate01_03d(:,2)/e0_frx,'b','LineWidth',3);hold on
% par03
loglog(tStar_swpRateP,eXXrate_pRate03_03d(:,2)/e0_frx,'--b','LineWidth',3)
% par06
loglog(tStar_swpRateP,eXXrate_pRate06_03d(:,2)/e0_frx,'.b','LineWidth',3);hold off;grid on
pbaspect([1 1 1])
% xlim([1E-2,1.25])
% xlabel('t*','FontSize',15)
% ===============================================================================================%
% LOCATION: PROBE 50w03d
subplot(4,4,3)
% par01
loglog(tStar_swpRateP,eXXrate_pRate01_03d(:,3)/e0_frx,'g','LineWidth',3);hold on
% par03
loglog(tStar_swpRateP,eXXrate_pRate03_03d(:,3)/e0_frx,'--g','LineWidth',3)
% par06
loglog(tStar_swpRateP,eXXrate_pRate06_03d(:,3)/e0_frx,'.g','LineWidth',3);hold off;grid on
pbaspect([1 1 1])
% xlim([1E-2,1.25])
xlabel('t*','FontSize',15)
% ylabel('Strain Rate (Scaled)','FontSize',12)
% ===============================================================================================%
% LOCATION: PROBE 100w03d
subplot(4,4,4)
% par01
loglog(tStar_swpRateP,eXXrate_pRate01_03d(:,4)/e0_frx,'m','LineWidth',3);hold on
% par03
loglog(tStar_swpRateP,eXXrate_pRate03_03d(:,4)/e0_frx,'--m','LineWidth',3)
% par06
loglog(tStar_swpRateP,eXXrate_pRate06_03d(:,4)/e0_frx,'.m','LineWidth',3);hold off;grid on
pbaspect([1 1 1])
% xlim([1E-2,1.25])
xlabel('t*','FontSize',15)
% legend('D01', 'D02', 'D03','Location','SouthWest')
pbaspect([1 1 1])
% ===============================================================================================%
% LOCATION: PROBE 110w03d
subplot(4,4,5)
% par01
loglog(tStar_swpRateP,eXXrate_pRate01_03d(:,5)/e0_frx,'c','LineWidth',3);hold on
% par03
loglog(tStar_swpRateP,eXXrate_pRate03_03d(:,5)/e0_frx,'--c','LineWidth',3)
% par06
loglog(tStar_swpRateP,eXXrate_pRate06_03d(:,5)/e0_frx,'.c','LineWidth',3);hold off;grid on
pbaspect([1 1 1])
% xlim([1E-2,1.25])
xlabel('t*','FontSize',15)
% legend('D01', 'D02', 'D03','Location','SouthWest')
pbaspect([1 1 1])
% ===============================================================================================%
% LOCATION: PROBE 125w03d
subplot(4,4,6)
% par01
loglog(tStar_swpRateP,eXXrate_pRate01_03d(:,6)/e0_frx,'y','LineWidth',3);hold on
% par03
loglog(tStar_swpRateP,eXXrate_pRate03_03d(:,6)/e0_frx,'--y','LineWidth',3)
% par06
loglog(tStar_swpRateP,eXXrate_pRate06_03d(:,6)/e0_frx,'.y','LineWidth',3);hold off;grid on
pbaspect([1 1 1])
% xlim([1E-2,1.25])
xlabel('t*','FontSize',15)
% legend('D01', 'D02', 'D03','Location','SouthWest')
pbaspect([1 1 1])
% ===============================================================================================%
% LOCATION: PROBE 150w03d
subplot(4,4,7)
% par01
loglog(tStar_swpRateP,eXXrate_pRate01_03d(:,7)/e0_frx,'-','LineWidth',3);hold on
% par03
loglog(tStar_swpRateP,eXXrate_pRate03_03d(:,7)/e0_frx,'--','LineWidth',3)
% par06
loglog(tStar_swpRateP,eXXrate_pRate06_03d(:,7)/e0_frx,'.','LineWidth',3);hold off;grid on
pbaspect([1 1 1])
% xlim([1E-2,1.25])
xlabel('t*','FontSize',15)
% legend('D01', 'D02', 'D03','Location','SouthWest')
pbaspect([1 1 1])
% ===============================================================================================%
% LOCATION: PROBE 110w03d
subplot(4,4,8)
% par01
loglog(tStar_swpRateP,eXXrate_pRate01_03d(:,8)/e0_frx,'k','LineWidth',3);hold on
% par03
loglog(tStar_swpRateP,eXXrate_pRate03_03d(:,8)/e0_frx,'--k','LineWidth',3)
% par06
loglog(tStar_swpRateP,eXXrate_pRate06_03d(:,8)/e0_frx,'.k','LineWidth',3);hold off;grid on
pbaspect([1 1 1])
% xlim([1E-2,1.25])
xlabel('t*','FontSize',15)
% legend('D01', 'D02', 'D03','Location','SouthWest')
pbaspect([1 1 1])

% ===============================================================================================%
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_2by2 paperSizeH_2by2];
fig.PaperPosition = [0 0 paperSizeW_2by2 paperSizeH_2by2];
print(fig,'01a_CPT_swpRateP_eXXrate_allProbes.pdf','-dpdf','-r0')
print(fig,'01a_CPT_swpRateP_eXXrate_allProbes.tif','-dtiff','-r0')

%%  Tilt
% ===============================================================================================%
% X-Tilt Magnitude - Semilogx (Dimensionless)
% ===============================================================================================%
fig = figure('Name','sweepRateP_eTXmag','NumberTitle','off');
% par 01
semilogx(tStar_swpRateP,eTX_pRate01_03d(:,1)/e0_frx,'r','LineWidth',3);hold on
semilogx(tStar_swpRateP,eTX_pRate01_03d(:,2)/e0_frx,'b','LineWidth',3)
semilogx(tStar_swpRateP,eTX_pRate01_03d(:,3)/e0_frx,'g','LineWidth',3)
semilogx(tStar_swpRateP,eTX_pRate01_03d(:,4)/e0_frx,'m','LineWidth',3)
semilogx(tStar_swpRateP,eTX_pRate01_03d(:,5)/e0_frx,'c','LineWidth',3)
semilogx(tStar_swpRateP,eTX_pRate01_03d(:,6)/e0_frx,'y','LineWidth',3)
semilogx(tStar_swpRateP,eTX_pRate01_03d(:,8)/e0_frx,'k','LineWidth',3)
% par 03
semilogx(tStar_swpRateP,eTX_pRate03_03d(:,1)/e0_frx,'--r','LineWidth',3)
semilogx(tStar_swpRateP,eTX_pRate03_03d(:,2)/e0_frx,'--b','LineWidth',3)
semilogx(tStar_swpRateP,eTX_pRate03_03d(:,3)/e0_frx,'--g','LineWidth',3)
semilogx(tStar_swpRateP,eTX_pRate03_03d(:,4)/e0_frx,'--m','LineWidth',3)
semilogx(tStar_swpRateP,eTX_pRate03_03d(:,5)/e0_frx,'--c','LineWidth',3)
semilogx(tStar_swpRateP,eTX_pRate03_03d(:,6)/e0_frx,'--y','LineWidth',3)
semilogx(tStar_swpRateP,eTX_pRate03_03d(:,8)/e0_frx,'--k','LineWidth',3)
% par 06
semilogx(tStar_swpRateP,eTX_pRate06_03d(:,1)/e0_frx,'.r','LineWidth',3)
semilogx(tStar_swpRateP,eTX_pRate06_03d(:,2)/e0_frx,'.b','LineWidth',3)
semilogx(tStar_swpRateP,eTX_pRate06_03d(:,3)/e0_frx,'.g','LineWidth',3)
semilogx(tStar_swpRateP,eTX_pRate06_03d(:,4)/e0_frx,'.m','LineWidth',3)
semilogx(tStar_swpRateP,eTX_pRate06_03d(:,5)/e0_frx,'.c','LineWidth',3)
semilogx(tStar_swpRateP,eTX_pRate06_03d(:,6)/e0_frx,'.y','LineWidth',3)
semilogx(tStar_swpRateP,eTX_pRate06_03d(:,8)/e0_frx,'.k','LineWidth',3);hold off;grid on;
pbaspect([1 1 1])
% xlim([1E-2,1.25])
xlabel('t*','FontSize',15)
ylabel('Dimensionless Tilt','FontSize',15)
% legend('r = 5%', 'r = 25%', 'r = 50%', 'r = 100%','Location','NorthWest')
pbaspect([1 1 1])
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_CPT_swpRateP_eTXmag.pdf','-dpdf','-r0')
print(fig,'01a_CPT_swpRateP_eTXmag.tif','-dtiff','-r0')

% ===============================================================================================%
% X-Tilt Rate - Semilogx (Dimensionless)
% ===============================================================================================%
fig = figure('Name','sweepRateP_eTXrate','NumberTitle','off');
% par 01
semilogx(tStar_swpRateP,eTXrate_pRate01_03d(:,1)/e0_frx,'r','LineWidth',3);hold on
semilogx(tStar_swpRateP,eTXrate_pRate01_03d(:,2)/e0_frx,'b','LineWidth',3)
semilogx(tStar_swpRateP,eTXrate_pRate01_03d(:,3)/e0_frx,'g','LineWidth',3)
semilogx(tStar_swpRateP,eTXrate_pRate01_03d(:,4)/e0_frx,'m','LineWidth',3)
semilogx(tStar_swpRateP,eTXrate_pRate01_03d(:,5)/e0_frx,'c','LineWidth',3)
semilogx(tStar_swpRateP,eTXrate_pRate01_03d(:,6)/e0_frx,'y','LineWidth',3)
semilogx(tStar_swpRateP,eTXrate_pRate01_03d(:,8)/e0_frx,'k','LineWidth',3)
% par 03
semilogx(tStar_swpRateP,eTXrate_pRate03_03d(:,1)/e0_frx,'--r','LineWidth',3)
semilogx(tStar_swpRateP,eTXrate_pRate03_03d(:,2)/e0_frx,'--b','LineWidth',3)
semilogx(tStar_swpRateP,eTXrate_pRate03_03d(:,3)/e0_frx,'--g','LineWidth',3)
semilogx(tStar_swpRateP,eTXrate_pRate03_03d(:,4)/e0_frx,'--m','LineWidth',3)
semilogx(tStar_swpRateP,eTXrate_pRate03_03d(:,5)/e0_frx,'--c','LineWidth',3)
semilogx(tStar_swpRateP,eTXrate_pRate03_03d(:,6)/e0_frx,'--y','LineWidth',3)
semilogx(tStar_swpRateP,eTXrate_pRate03_03d(:,8)/e0_frx,'--k','LineWidth',3)
% par 06
semilogx(tStar_swpRateP,eTXrate_pRate06_03d(:,1)/e0_frx,'.r','LineWidth',3)
semilogx(tStar_swpRateP,eTXrate_pRate06_03d(:,2)/e0_frx,'.b','LineWidth',3)
semilogx(tStar_swpRateP,eTXrate_pRate06_03d(:,3)/e0_frx,'.g','LineWidth',3)
semilogx(tStar_swpRateP,eTXrate_pRate06_03d(:,4)/e0_frx,'.m','LineWidth',3)
semilogx(tStar_swpRateP,eTXrate_pRate06_03d(:,5)/e0_frx,'.c','LineWidth',3)
semilogx(tStar_swpRateP,eTXrate_pRate06_03d(:,6)/e0_frx,'.y','LineWidth',3)
semilogx(tStar_swpRateP,eTXrate_pRate06_03d(:,8)/e0_frx,'.k','LineWidth',3);hold off;grid on;
pbaspect([1 1 1])
% xlim([5E-7,3E-4])
xlabel('t*','FontSize',15)
ylabel('Dimensionless Tilt','FontSize',15)
% legend('r = 5%', 'r = 25%', 'r = 50%', 'r = 100%','Location','NorthWest')
pbaspect([1 1 1])
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_CPT_swpRateP_eTXrate.pdf','-dpdf','-r0')
print(fig,'01a_CPT_swpRateP_eTXrate.tif','-dtiff','-r0')
% ===============================================================================================%
% ===============================================================================================%