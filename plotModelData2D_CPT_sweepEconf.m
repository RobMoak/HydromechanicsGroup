%% plotModelData2D_CPT_swpEconf
% Author: R. Moak
% Date: 03/04/20

%% Set Path to Output Folder
cd 'X:\Clemson\Thesis\Models\COMSOL\00_Simulations\LeakDetection\01_ConceptualModels\01a_LD_WDp2D_fS_XPTf\OutputPlots'
addpath('X:\Clemson\Thesis\Models\COMSOL\00_Simulations\LeakDetection\Analyses_All');

%% Load Plot Formatting Variables
plotFormatting;

%% Scaling Parameters
% ===============================================================================================%
% Define Parameters
% ===============================================================================================%
alpha_b = 1;
p_inj = ModelParams_sweepEconf(1).p_inj;
Pc = p_inj;
X_frx = ModelParams_sweepEconf.X_frx;
% X_conf = ModelParams_sweepEconf.X_conf;

% ===============================================================================================%
% Dimensionless Scaling
% ===============================================================================================%
% Transformational Strain
e0_frx = alpha_b*Pc*X_frx;
e0_conf = alpha_b*Pc*X_conf;

% Dimensionless Time
tStar_swpEconf = t_swpEconf/tc_sweepEconf;

%% Magnitude: Normal Strains (eXX & eZZ)
% ===============================================================================================%
% Strain Magnitude - semilogx (Dimensionless)
% ===============================================================================================%
fig = figure('Name','sweepEconf_eNNmag','NumberTitle','off');
% par 01 - eXX
semilogx(tStar_swpEconf(:,1),eXX_Ec01_03d(:,1)/e0_frx,'-r','LineWidth',3);hold on
semilogx(tStar_swpEconf(:,1),eXX_Ec01_03d(:,2)/e0_frx,'-b','LineWidth',3)
semilogx(tStar_swpEconf(:,1),eXX_Ec01_03d(:,3)/e0_frx,'-g','LineWidth',3)
semilogx(tStar_swpEconf(:,1),eXX_Ec01_03d(:,4)/e0_frx,'-m','LineWidth',3)
semilogx(tStar_swpEconf(:,1),eXX_Ec01_03d(:,5)/e0_frx,'-c','LineWidth',3)
semilogx(tStar_swpEconf(:,1),eXX_Ec01_03d(:,6)/e0_frx,'-y','LineWidth',3)
semilogx(tStar_swpEconf(:,1),eXX_Ec01_03d(:,8)/e0_frx,'-k','LineWidth',3)
% par 02 - eXX
semilogx(tStar_swpEconf(:,2),eXX_Ec02_03d(:,1)/e0_frx,'--r','LineWidth',3)
semilogx(tStar_swpEconf(:,2),eXX_Ec02_03d(:,2)/e0_frx,'--b','LineWidth',3)
semilogx(tStar_swpEconf(:,2),eXX_Ec02_03d(:,3)/e0_frx,'--g','LineWidth',3)
semilogx(tStar_swpEconf(:,2),eXX_Ec02_03d(:,4)/e0_frx,'--m','LineWidth',3)
semilogx(tStar_swpEconf(:,2),eXX_Ec02_03d(:,5)/e0_frx,'--c','LineWidth',3)
semilogx(tStar_swpEconf(:,2),eXX_Ec02_03d(:,6)/e0_frx,'--y','LineWidth',3)
semilogx(tStar_swpEconf(:,2),eXX_Ec02_03d(:,8)/e0_frx,'--k','LineWidth',3)
% par 03 - eXX
semilogx(tStar_swpEconf(:,3),eXX_Ec03_03d(:,1)/e0_frx,'.r','LineWidth',3)
semilogx(tStar_swpEconf(:,3),eXX_Ec03_03d(:,2)/e0_frx,'.b','LineWidth',3)
semilogx(tStar_swpEconf(:,3),eXX_Ec03_03d(:,3)/e0_frx,'.g','LineWidth',3)
semilogx(tStar_swpEconf(:,3),eXX_Ec03_03d(:,4)/e0_frx,'.m','LineWidth',3)
semilogx(tStar_swpEconf(:,3),eXX_Ec03_03d(:,5)/e0_frx,'.c','LineWidth',3)
semilogx(tStar_swpEconf(:,3),eXX_Ec03_03d(:,6)/e0_frx,'.y','LineWidth',3)
semilogx(tStar_swpEconf(:,3),eXX_Ec03_03d(:,8)/e0_frx,'.k','LineWidth',3);hold off;grid on;
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
print(fig,'01a_CPT_swpEconf_eNNmag_allParVals.pdf','-dpdf','-r0')
print(fig,'01a_CPT_swpEconf_eNNmag_allParVals.tif','-dtiff','-r0')

%% Detectable Normal Strains
% ===============================================================================================%
% PARAMETER VALUE 01: Detectable Normal Strain Magnitude - (eXX & eZZ) - Semilogx (Dimensionless)
% ===============================================================================================%
fig = figure('Name','Ec01_eNNmagDet','NumberTitle','off');
% eXX
semilogx(tStar_swpEconf(:,1),eXX_detectable_Ec01_03d(:,1)/e0_frx,'r','LineWidth',7,'HandleVisibility','off');hold on
semilogx(tStar_swpEconf(:,1),eXX_detectable_Ec01_03d(:,2)/e0_frx,'r','LineWidth',7,'HandleVisibility','off');
semilogx(tStar_swpEconf(:,1),eXX_detectable_Ec01_03d(:,3)/e0_frx,'r','LineWidth',7,'HandleVisibility','off');
semilogx(tStar_swpEconf(:,1),eXX_detectable_Ec01_03d(:,4)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpEconf(:,1),eXX_detectable_Ec01_03d(:,5)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpEconf(:,1),eXX_detectable_Ec01_03d(:,6)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpEconf(:,1),eXX_detectable_Ec01_03d(:,8)/e0_frx,'r','LineWidth',7,'HandleVisibility','off');
semilogx(tStar_swpEconf(:,1),eXX_Ec01_03d(:,1)/e0_frx,'r','LineWidth',3)
semilogx(tStar_swpEconf(:,1),eXX_Ec01_03d(:,2)/e0_frx,'b','LineWidth',3)
semilogx(tStar_swpEconf(:,1),eXX_Ec01_03d(:,3)/e0_frx,'g','LineWidth',3)
semilogx(tStar_swpEconf(:,1),eXX_Ec01_03d(:,4)/e0_frx,'m','LineWidth',3)
semilogx(tStar_swpEconf(:,1),eXX_Ec01_03d(:,5)/e0_frx,'c','LineWidth',3)
semilogx(tStar_swpEconf(:,1),eXX_Ec01_03d(:,6)/e0_frx,'y','LineWidth',3)
semilogx(tStar_swpEconf(:,1),eXX_Ec01_03d(:,8)/e0_frx,'k','LineWidth',3);hold on;grid on
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
print(fig,'01a_CPT_Ec01_eNNmagDet.pdf','-dpdf','-r0')
print(fig,'01a_CPT_Ec01_eNNmagDet.tif','-dtiff','-r0')

% ===============================================================================================%
% PARAMETER VALUE 02: Detectable Normal Strain Magnitude - (eXX & eZZ) - Semilogx (Dimensionless)
% ===============================================================================================%
fig = figure('Name','Ec02_eNNmagDet','NumberTitle','off');
semilogx(tStar_swpEconf(:,2),eXX_detectable_Ec02_03d(:,1)/e0_frx,'r','LineWidth',7,'HandleVisibility','off');hold on
semilogx(tStar_swpEconf(:,2),eXX_detectable_Ec02_03d(:,2)/e0_frx,'r','LineWidth',7,'HandleVisibility','off');
semilogx(tStar_swpEconf(:,2),eXX_detectable_Ec02_03d(:,3)/e0_frx,'r','LineWidth',7,'HandleVisibility','off');
semilogx(tStar_swpEconf(:,2),eXX_detectable_Ec02_03d(:,4)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpEconf(:,2),eXX_detectable_Ec02_03d(:,5)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpEconf(:,2),eXX_detectable_Ec02_03d(:,6)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpEconf(:,2),eXX_detectable_Ec02_03d(:,8)/e0_frx,'r','LineWidth',7,'HandleVisibility','off');
semilogx(tStar_swpEconf(:,2),eXX_Ec02_03d(:,1)/e0_frx,'r','LineWidth',3)
semilogx(tStar_swpEconf(:,2),eXX_Ec02_03d(:,2)/e0_frx,'b','LineWidth',3)
semilogx(tStar_swpEconf(:,2),eXX_Ec02_03d(:,3)/e0_frx,'g','LineWidth',3)
semilogx(tStar_swpEconf(:,2),eXX_Ec02_03d(:,4)/e0_frx,'m','LineWidth',3)
semilogx(tStar_swpEconf(:,2),eXX_Ec02_03d(:,5)/e0_frx,'c','LineWidth',3)
semilogx(tStar_swpEconf(:,2),eXX_Ec02_03d(:,6)/e0_frx,'y','LineWidth',3)
semilogx(tStar_swpEconf(:,2),eXX_Ec02_03d(:,8)/e0_frx,'k','LineWidth',3);hold off;grid on
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
print(fig,'01a_CPT_Ec02_eNNmagDet.pdf','-dpdf','-r0')
print(fig,'01a_CPT_Ec02_eNNmagDet.tif','-dtiff','-r0')

% ===============================================================================================%
% PARAMETER VALUE 03: Detectable Normal Strain Magnitude - (eXX & eZZ) - Semilogx (Dimensionless)
% ===============================================================================================%
fig = figure('Name','Ec03_eNNmagDet','NumberTitle','off');
semilogx(tStar_swpEconf(:,3),eXX_detectable_Ec03_03d(:,1)/e0_frx,'r','LineWidth',7,'HandleVisibility','off');hold on
semilogx(tStar_swpEconf(:,3),eXX_detectable_Ec03_03d(:,2)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpEconf(:,3),eXX_detectable_Ec03_03d(:,3)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpEconf(:,3),eXX_detectable_Ec03_03d(:,4)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpEconf(:,3),eXX_detectable_Ec03_03d(:,5)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpEconf(:,3),eXX_detectable_Ec03_03d(:,6)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpEconf(:,3),eXX_detectable_Ec03_03d(:,8)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpEconf(:,3),eXX_Ec03_03d(:,1)/e0_frx,'r','LineWidth',3)
semilogx(tStar_swpEconf(:,3),eXX_Ec03_03d(:,2)/e0_frx,'b','LineWidth',3)
semilogx(tStar_swpEconf(:,3),eXX_Ec03_03d(:,3)/e0_frx,'g','LineWidth',3)
semilogx(tStar_swpEconf(:,3),eXX_Ec03_03d(:,4)/e0_frx,'m','LineWidth',3)
semilogx(tStar_swpEconf(:,3),eXX_Ec03_03d(:,5)/e0_frx,'c','LineWidth',3)
semilogx(tStar_swpEconf(:,3),eXX_Ec03_03d(:,6)/e0_frx,'y','LineWidth',3)
semilogx(tStar_swpEconf(:,3),eXX_Ec03_03d(:,8)/e0_frx,'k','LineWidth',3);hold off;grid on
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
print(fig,'01a_CPT_Ec03_eNNmagDet.pdf','-dpdf','-r0')
print(fig,'01a_CPT_Ec03_eNNmagDet.tif','-dtiff','-r0')

% ===============================================================================================%
% PARAMETER VALUE 04: Detectable Normal Strain Magnitude - (eXX & eZZ) - Semilogx (Dimensionless)
% ===============================================================================================%
fig = figure('Name','Ec04_eNNmagDet','NumberTitle','off');
semilogx(tStar_swpEconf(:,4),eXX_detectable_Ec04_03d(:,1)/e0_frx,'r','LineWidth',7,'HandleVisibility','off');hold on
semilogx(tStar_swpEconf(:,4),eXX_detectable_Ec04_03d(:,2)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpEconf(:,4),eXX_detectable_Ec04_03d(:,3)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpEconf(:,4),eXX_detectable_Ec04_03d(:,4)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpEconf(:,4),eXX_detectable_Ec04_03d(:,5)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpEconf(:,4),eXX_detectable_Ec04_03d(:,6)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpEconf(:,4),eXX_detectable_Ec04_03d(:,8)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpEconf(:,4),eXX_Ec04_03d(:,1)/e0_frx,'r','LineWidth',3)
semilogx(tStar_swpEconf(:,4),eXX_Ec04_03d(:,2)/e0_frx,'b','LineWidth',3)
semilogx(tStar_swpEconf(:,4),eXX_Ec04_03d(:,3)/e0_frx,'g','LineWidth',3)
semilogx(tStar_swpEconf(:,4),eXX_Ec04_03d(:,4)/e0_frx,'m','LineWidth',3)
semilogx(tStar_swpEconf(:,4),eXX_Ec04_03d(:,5)/e0_frx,'c','LineWidth',3)
semilogx(tStar_swpEconf(:,4),eXX_Ec04_03d(:,6)/e0_frx,'y','LineWidth',3)
semilogx(tStar_swpEconf(:,4),eXX_Ec04_03d(:,8)/e0_frx,'k','LineWidth',3);hold off;grid on
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
print(fig,'01a_CPT_Ec04_eNNmagDet.pdf','-dpdf','-r0')
print(fig,'01a_CPT_Ec04_eNNmagDet.tif','-dtiff','-r0')

% ===============================================================================================%
% PARAMETER VALUE 05: Detectable Normal Strain Magnitude - (eXX & eZZ) - Semilogx (Dimensionless)
% ===============================================================================================%
fig = figure('Name','Ec05_eNNmagDet','NumberTitle','off');
semilogx(tStar_swpEconf(:,5),eXX_detectable_Ec05_03d(:,1)/e0_frx,'r','LineWidth',7,'HandleVisibility','off');hold on
semilogx(tStar_swpEconf(:,5),eXX_detectable_Ec05_03d(:,2)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpEconf(:,5),eXX_detectable_Ec05_03d(:,3)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpEconf(:,5),eXX_detectable_Ec05_03d(:,4)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpEconf(:,5),eXX_detectable_Ec05_03d(:,5)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpEconf(:,5),eXX_detectable_Ec05_03d(:,6)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpEconf(:,5),eXX_detectable_Ec05_03d(:,8)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpEconf(:,5),eXX_Ec05_03d(:,1)/e0_frx,'r','LineWidth',3)
semilogx(tStar_swpEconf(:,5),eXX_Ec05_03d(:,2)/e0_frx,'b','LineWidth',3)
semilogx(tStar_swpEconf(:,5),eXX_Ec05_03d(:,3)/e0_frx,'g','LineWidth',3)
semilogx(tStar_swpEconf(:,5),eXX_Ec05_03d(:,4)/e0_frx,'m','LineWidth',3)
semilogx(tStar_swpEconf(:,5),eXX_Ec05_03d(:,5)/e0_frx,'c','LineWidth',3)
semilogx(tStar_swpEconf(:,5),eXX_Ec05_03d(:,6)/e0_frx,'y','LineWidth',3)
semilogx(tStar_swpEconf(:,5),eXX_Ec05_03d(:,8)/e0_frx,'k','LineWidth',3);hold off;grid on
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
print(fig,'01a_CPT_Ec05_eNNmagDet.pdf','-dpdf','-r0')
print(fig,'01a_CPT_Ec05_eNNmagDet.tif','-dtiff','-r0')

%% Strain Rate
% ===============================================================================================%
% INDIVIDUAL LOCATIONS: Strain Rate (eXX) - loglog (Dimensionless)
% ===============================================================================================%
% LOCATION: PROBE 05w03d
fig = figure('Name','swpEconf_eXXrate_05w03d','NumberTitle','off');
% par01
loglog(tStar_swpEconf(:,1),eXXrate_Ec01_03d(:,1),'LineWidth',3);hold on
% par02
loglog(tStar_swpEconf(:,2),eXXrate_Ec02_03d(:,1),'LineWidth',3)
% par03
loglog(tStar_swpEconf(:,3),eXXrate_Ec03_03d(:,1),'LineWidth',3)
% par04
loglog(tStar_swpEconf(:,4),eXXrate_Ec04_03d(:,1),'LineWidth',3)
% par05
loglog(tStar_swpEconf(:,5),eXXrate_Ec05_03d(:,1),'LineWidth',3);hold off;grid on
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
print(fig,'01a_CPT_swpEconf_eXXrate_05w03d.pdf','-dpdf','-r0')
print(fig,'01a_CPT_swpEconf_eXXrate_05w03d.tif','-dtiff','-r0')

% ===============================================================================================%

% LOCATION: PROBE 25w03d
fig = figure('Name','swpEconf_eXXrate_25w03d','NumberTitle','off');
% par01
loglog(tStar_swpEconf(:,1),eXXrate_Ec01_03d(:,2),'LineWidth',3);hold on
% par02
loglog(tStar_swpEconf(:,2),eXXrate_Ec02_03d(:,2),'LineWidth',3)
% par03
loglog(tStar_swpEconf(:,3),eXXrate_Ec03_03d(:,2),'LineWidth',3)
% par04
loglog(tStar_swpEconf(:,4),eXXrate_Ec04_03d(:,2),'LineWidth',3)
% par05
loglog(tStar_swpEconf(:,5),eXXrate_Ec05_03d(:,2),'LineWidth',3);hold off;grid on
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
print(fig,'01a_CPT_swpEconf_eXXrate_25w03d.pdf','-dpdf','-r0')
print(fig,'01a_CPT_swpEconf_eXXrate_25w03d.tif','-dtiff','-r0')

% ===============================================================================================%

% LOCATION: PROBE 50w03d
fig = figure('Name','swpEconf_eXXrate_50w03d','NumberTitle','off');
% par01
loglog(tStar_swpEconf(:,1),eXXrate_Ec01_03d(:,3),'LineWidth',3);hold on
% par02
loglog(tStar_swpEconf(:,2),eXXrate_Ec02_03d(:,3),'LineWidth',3)
% par03
loglog(tStar_swpEconf(:,3),eXXrate_Ec03_03d(:,3),'LineWidth',3)
% par04
loglog(tStar_swpEconf(:,4),eXXrate_Ec04_03d(:,3),'LineWidth',3)
% par05
loglog(tStar_swpEconf(:,5),eXXrate_Ec05_03d(:,3),'LineWidth',3);hold off;grid on
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
print(fig,'01a_CPT_swpEconf_eXXrate_50w03d.pdf','-dpdf','-r0')
print(fig,'01a_CPT_swpEconf_eXXrate_50w03d.tif','-dtiff','-r0')

% ===============================================================================================%

% LOCATION: PROBE 100W03d
fig = figure('Name','swpEconf_eXXrate_100w03d','NumberTitle','off');
% par01
loglog(tStar_swpEconf(:,1),eXXrate_Ec01_03d(:,4),'LineWidth',3);hold on
% par02
loglog(tStar_swpEconf(:,2),eXXrate_Ec02_03d(:,4),'LineWidth',3)
% par03
loglog(tStar_swpEconf(:,3),eXXrate_Ec03_03d(:,4),'LineWidth',3)
% par04
loglog(tStar_swpEconf(:,4),eXXrate_Ec04_03d(:,4),'LineWidth',3)
% par05
loglog(tStar_swpEconf(:,5),eXXrate_Ec05_03d(:,4),'LineWidth',3);hold off;grid on
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
print(fig,'01a_CPT_swpEconf_eXXrate_100w03d.pdf','-dpdf','-r0')
print(fig,'01a_CPT_swpEconf_eXXrate_100w03d.tif','-dtiff','-r0')

% ===============================================================================================%

% LOCATION: PROBE 110W03d
fig = figure('Name','swpEconf_eXXrate_110w03d','NumberTitle','off');
% par01
loglog(tStar_swpEconf(:,1),eXXrate_Ec01_03d(:,5),'LineWidth',3);hold on
% par02
loglog(tStar_swpEconf(:,2),eXXrate_Ec02_03d(:,5),'LineWidth',3)
% par03
loglog(tStar_swpEconf(:,3),eXXrate_Ec03_03d(:,5),'LineWidth',3)
% par04
loglog(tStar_swpEconf(:,4),eXXrate_Ec04_03d(:,5),'LineWidth',3)
% par05
loglog(tStar_swpEconf(:,5),eXXrate_Ec05_03d(:,5),'LineWidth',3);hold off;grid on
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
print(fig,'01a_CPT_swpEconf_eXXrate_110w03d.pdf','-dpdf','-r0')
print(fig,'01a_CPT_swpEconf_eXXrate_110w03d.tif','-dtiff','-r0')

% ===============================================================================================%

% LOCATION: PROBE 125W03d
fig = figure('Name','swpEconf_eXXrate_125w03d','NumberTitle','off');
% par01
loglog(tStar_swpEconf(:,1),eXXrate_Ec01_03d(:,6),'LineWidth',3);hold on
% par02
loglog(tStar_swpEconf(:,2),eXXrate_Ec02_03d(:,6),'LineWidth',3)
% par03
loglog(tStar_swpEconf(:,3),eXXrate_Ec03_03d(:,6),'LineWidth',3)
% par04
loglog(tStar_swpEconf(:,4),eXXrate_Ec04_03d(:,6),'LineWidth',3)
% par05
loglog(tStar_swpEconf(:,5),eXXrate_Ec05_03d(:,6),'LineWidth',3);hold off;grid on
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
print(fig,'01a_CPT_swpEconf_eXXrate_125w03d.pdf','-dpdf','-r0')
print(fig,'01a_CPT_swpEconf_eXXrate_125w03d.tif','-dtiff','-r0')


% ===============================================================================================%

% LOCATION: PROBE 150W03d
fig = figure('Name','swpEconf_eXXrate_150w03d','NumberTitle','off');
% par01
loglog(tStar_swpEconf(:,1),eXXrate_Ec01_03d(:,7),'LineWidth',3);hold on
% par02
loglog(tStar_swpEconf(:,2),eXXrate_Ec02_03d(:,7),'LineWidth',3)
% par03
loglog(tStar_swpEconf(:,3),eXXrate_Ec03_03d(:,7),'LineWidth',3)
% par04
loglog(tStar_swpEconf(:,4),eXXrate_Ec04_03d(:,7),'LineWidth',3)
% par05
loglog(tStar_swpEconf(:,5),eXXrate_Ec05_03d(:,7),'LineWidth',3);hold off;grid on
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
print(fig,'01a_CPT_swpEconf_eXXrate_150w03d.pdf','-dpdf','-r0')
print(fig,'01a_CPT_swpEconf_eXXrate_150w03d.tif','-dtiff','-r0')

% ===============================================================================================%

% LOCATION: PROBE 200W03d
fig = figure('Name','swpEconf_eXXrate_200w03d','NumberTitle','off');
% par01
loglog(tStar_swpEconf(:,1),eXXrate_Ec01_03d(:,8),'LineWidth',3);hold on
% par02
loglog(tStar_swpEconf(:,2),eXXrate_Ec02_03d(:,8),'LineWidth',3)
% par03
loglog(tStar_swpEconf(:,3),eXXrate_Ec03_03d(:,8),'LineWidth',3)
% par04
loglog(tStar_swpEconf(:,4),eXXrate_Ec04_03d(:,8),'LineWidth',3)
% par05
loglog(tStar_swpEconf(:,5),eXXrate_Ec05_03d(:,8),'LineWidth',3)
;hold off;grid on
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
print(fig,'01a_CPT_swpEconf_eXXrate_200w03d.pdf','-dpdf','-r0')
print(fig,'01a_CPT_swpEconf_eXXrate_200w03d.tif','-dtiff','-r0')

% ===============================================================================================%
% ALL LOCATIONS: Strain Rate (eXX) - loglog (Dimensionless)
% ===============================================================================================%
fig = figure('Name','swpEconf_eXXrate_allProbes','NumberTitle','off');
% ===============================================================================================%
% LOCATION: PROBE 05w03d
subplot(4,4,1)
% par01
loglog(tStar_swpEconf,eXXrate_Ec01_03d(:,1)/e0_frx,'r','LineWidth',3);hold on
% par03
loglog(tStar_swpEconf,eXXrate_Ec03_03d(:,1)/e0_frx,'--r','LineWidth',3)
% par05
loglog(tStar_swpEconf,eXXrate_Ec05_03d(:,1)/e0_frx,'.r','LineWidth',3);hold off;grid on
pbaspect([1 1 1])
% xlim([1E-2,1.25])
% xlabel('t*','FontSize',15)
ylabel('Strain Rate (Scaled)','FontSize',12)
% ===============================================================================================%
% LOCATION: PROBE 25w03d
subplot(4,4,2)
% par01
loglog(tStar_swpEconf,eXXrate_Ec01_03d(:,2)/e0_frx,'b','LineWidth',3);hold on
% par03
loglog(tStar_swpEconf,eXXrate_Ec03_03d(:,2)/e0_frx,'--b','LineWidth',3)
% par05
loglog(tStar_swpEconf,eXXrate_Ec05_03d(:,2)/e0_frx,'.b','LineWidth',3);hold off;grid on
pbaspect([1 1 1])
% xlim([1E-2,1.25])
% xlabel('t*','FontSize',15)
% ===============================================================================================%
% LOCATION: PROBE 50w03d
subplot(4,4,3)
% par01
loglog(tStar_swpEconf,eXXrate_Ec01_03d(:,3)/e0_frx,'g','LineWidth',3);hold on
% par03
loglog(tStar_swpEconf,eXXrate_Ec03_03d(:,3)/e0_frx,'--g','LineWidth',3)
% par05
loglog(tStar_swpEconf,eXXrate_Ec05_03d(:,3)/e0_frx,'.g','LineWidth',3);hold off;grid on
pbaspect([1 1 1])
% xlim([1E-2,1.25])
xlabel('t*','FontSize',15)
% ylabel('Strain Rate (Scaled)','FontSize',12)
% ===============================================================================================%
% LOCATION: PROBE 100w03d
subplot(4,4,4)
% par01
loglog(tStar_swpEconf,eXXrate_Ec01_03d(:,4)/e0_frx,'m','LineWidth',3);hold on
% par03
loglog(tStar_swpEconf,eXXrate_Ec03_03d(:,4)/e0_frx,'--m','LineWidth',3)
% par05
loglog(tStar_swpEconf,eXXrate_Ec05_03d(:,4)/e0_frx,'.m','LineWidth',3);hold off;grid on
pbaspect([1 1 1])
% xlim([1E-2,1.25])
xlabel('t*','FontSize',15)
% legend('D01', 'D02', 'D03','Location','SouthWest')
pbaspect([1 1 1])
% ===============================================================================================%
% LOCATION: PROBE 110w03d
subplot(4,4,5)
% par01
loglog(tStar_swpEconf,eXXrate_Ec01_03d(:,5)/e0_frx,'c','LineWidth',3);hold on
% par03
loglog(tStar_swpEconf,eXXrate_Ec03_03d(:,5)/e0_frx,'--c','LineWidth',3)
% par05
loglog(tStar_swpEconf,eXXrate_Ec05_03d(:,5)/e0_frx,'.c','LineWidth',3);hold off;grid on
pbaspect([1 1 1])
% xlim([1E-2,1.25])
xlabel('t*','FontSize',15)
% legend('D01', 'D02', 'D03','Location','SouthWest')
pbaspect([1 1 1])
% ===============================================================================================%
% LOCATION: PROBE 125w03d
subplot(4,4,6)
% par01
loglog(tStar_swpEconf,eXXrate_Ec01_03d(:,6)/e0_frx,'y','LineWidth',3);hold on
% par03
loglog(tStar_swpEconf,eXXrate_Ec03_03d(:,6)/e0_frx,'--y','LineWidth',3)
% par05
loglog(tStar_swpEconf,eXXrate_Ec05_03d(:,6)/e0_frx,'.y','LineWidth',3);hold off;grid on
pbaspect([1 1 1])
% xlim([1E-2,1.25])
xlabel('t*','FontSize',15)
% legend('D01', 'D02', 'D03','Location','SouthWest')
pbaspect([1 1 1])
% ===============================================================================================%
% LOCATION: PROBE 150w03d
subplot(4,4,7)
% par01
loglog(tStar_swpEconf,eXXrate_Ec01_03d(:,7)/e0_frx,'-','LineWidth',3);hold on
% par03
loglog(tStar_swpEconf,eXXrate_Ec03_03d(:,7)/e0_frx,'--','LineWidth',3)
% par03
loglog(tStar_swpEconf,eXXrate_Ec05_03d(:,7)/e0_frx,'.','LineWidth',3);hold off;grid on
pbaspect([1 1 1])
% xlim([1E-2,1.25])
xlabel('t*','FontSize',15)
% legend('D01', 'D02', 'D03','Location','SouthWest')
pbaspect([1 1 1])
% ===============================================================================================%
% LOCATION: PROBE 110w03d
subplot(4,4,8)
% par01
loglog(tStar_swpEconf,eXXrate_Ec01_03d(:,8)/e0_frx,'k','LineWidth',3);hold on
% par03
loglog(tStar_swpEconf,eXXrate_Ec03_03d(:,8)/e0_frx,'--k','LineWidth',3)
% par05
loglog(tStar_swpEconf,eXXrate_Ec05_03d(:,8)/e0_frx,'.k','LineWidth',3);hold off;grid on
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
print(fig,'01a_CPT_swpEconf_eXXrate_allProbes.pdf','-dpdf','-r0')
print(fig,'01a_CPT_swpEconf_eXXrate_allProbes.tif','-dtiff','-r0')

%%  Tilt
% ===============================================================================================%
% X-Tilt Magnitude - Semilogx (Dimensionless)
% ===============================================================================================%
fig = figure('Name','sweepEconf_eTXmag','NumberTitle','off');
% par 01
semilogx(tStar_swpEconf,eTX_Ec01_03d(:,1)/e0_frx,'r','LineWidth',3);hold on
semilogx(tStar_swpEconf,eTX_Ec01_03d(:,2)/e0_frx,'b','LineWidth',3)
semilogx(tStar_swpEconf,eTX_Ec01_03d(:,3)/e0_frx,'g','LineWidth',3)
semilogx(tStar_swpEconf,eTX_Ec01_03d(:,4)/e0_frx,'m','LineWidth',3)
semilogx(tStar_swpEconf,eTX_Ec01_03d(:,5)/e0_frx,'c','LineWidth',3)
semilogx(tStar_swpEconf,eTX_Ec01_03d(:,6)/e0_frx,'y','LineWidth',3)
semilogx(tStar_swpEconf,eTX_Ec01_03d(:,8)/e0_frx,'k','LineWidth',3)
% par 03
semilogx(tStar_swpEconf,eTX_Ec03_03d(:,1)/e0_frx,'--r','LineWidth',3)
semilogx(tStar_swpEconf,eTX_Ec03_03d(:,2)/e0_frx,'--b','LineWidth',3)
semilogx(tStar_swpEconf,eTX_Ec03_03d(:,3)/e0_frx,'--g','LineWidth',3)
semilogx(tStar_swpEconf,eTX_Ec03_03d(:,4)/e0_frx,'--m','LineWidth',3)
semilogx(tStar_swpEconf,eTX_Ec03_03d(:,5)/e0_frx,'--c','LineWidth',3)
semilogx(tStar_swpEconf,eTX_Ec03_03d(:,6)/e0_frx,'--y','LineWidth',3)
semilogx(tStar_swpEconf,eTX_Ec03_03d(:,8)/e0_frx,'--k','LineWidth',3)
% par 05
semilogx(tStar_swpEconf,eTX_Ec05_03d(:,1)/e0_frx,'.r','LineWidth',3)
semilogx(tStar_swpEconf,eTX_Ec05_03d(:,2)/e0_frx,'.b','LineWidth',3)
semilogx(tStar_swpEconf,eTX_Ec05_03d(:,3)/e0_frx,'.g','LineWidth',3)
semilogx(tStar_swpEconf,eTX_Ec05_03d(:,4)/e0_frx,'.m','LineWidth',3)
semilogx(tStar_swpEconf,eTX_Ec05_03d(:,5)/e0_frx,'.c','LineWidth',3)
semilogx(tStar_swpEconf,eTX_Ec05_03d(:,6)/e0_frx,'.y','LineWidth',3)
semilogx(tStar_swpEconf,eTX_Ec05_03d(:,8)/e0_frx,'.k','LineWidth',3);hold off;grid on;
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
print(fig,'01a_CPT_swpEconf_eTXmag.pdf','-dpdf','-r0')
print(fig,'01a_CPT_swpEconf_eTXmag.tif','-dtiff','-r0')

% ===============================================================================================%
% X-Tilt Rate - Semilogx (Dimensionless)
% ===============================================================================================%
fig = figure('Name','sweepEconf_eTXrate','NumberTitle','off');
% par 01
semilogx(tStar_swpEconf,eTXrate_Ec01_03d(:,1)/e0_frx,'r','LineWidth',3);hold on
semilogx(tStar_swpEconf,eTXrate_Ec01_03d(:,2)/e0_frx,'b','LineWidth',3)
semilogx(tStar_swpEconf,eTXrate_Ec01_03d(:,3)/e0_frx,'g','LineWidth',3)
semilogx(tStar_swpEconf,eTXrate_Ec01_03d(:,4)/e0_frx,'m','LineWidth',3)
semilogx(tStar_swpEconf,eTXrate_Ec01_03d(:,5)/e0_frx,'c','LineWidth',3)
semilogx(tStar_swpEconf,eTXrate_Ec01_03d(:,6)/e0_frx,'y','LineWidth',3)
semilogx(tStar_swpEconf,eTXrate_Ec01_03d(:,8)/e0_frx,'k','LineWidth',3)
% par 03
semilogx(tStar_swpEconf,eTXrate_Ec03_03d(:,1)/e0_frx,'--r','LineWidth',3)
semilogx(tStar_swpEconf,eTXrate_Ec03_03d(:,2)/e0_frx,'--b','LineWidth',3)
semilogx(tStar_swpEconf,eTXrate_Ec03_03d(:,3)/e0_frx,'--g','LineWidth',3)
semilogx(tStar_swpEconf,eTXrate_Ec03_03d(:,4)/e0_frx,'--m','LineWidth',3)
semilogx(tStar_swpEconf,eTXrate_Ec03_03d(:,5)/e0_frx,'--c','LineWidth',3)
semilogx(tStar_swpEconf,eTXrate_Ec03_03d(:,6)/e0_frx,'--y','LineWidth',3)
semilogx(tStar_swpEconf,eTXrate_Ec03_03d(:,8)/e0_frx,'--k','LineWidth',3)
% par 05
semilogx(tStar_swpEconf,eTXrate_Ec05_03d(:,1)/e0_frx,'.r','LineWidth',3)
semilogx(tStar_swpEconf,eTXrate_Ec05_03d(:,2)/e0_frx,'.b','LineWidth',3)
semilogx(tStar_swpEconf,eTXrate_Ec05_03d(:,3)/e0_frx,'.g','LineWidth',3)
semilogx(tStar_swpEconf,eTXrate_Ec05_03d(:,4)/e0_frx,'.m','LineWidth',3)
semilogx(tStar_swpEconf,eTXrate_Ec05_03d(:,5)/e0_frx,'.c','LineWidth',3)
semilogx(tStar_swpEconf,eTXrate_Ec05_03d(:,6)/e0_frx,'.y','LineWidth',3)
semilogx(tStar_swpEconf,eTXrate_Ec05_03d(:,8)/e0_frx,'.k','LineWidth',3);hold off;grid on;
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
print(fig,'01a_CPT_swpEconf_eTXrate.pdf','-dpdf','-r0')
print(fig,'01a_CPT_swpEconf_eTXrate.tif','-dtiff','-r0')
% ===============================================================================================%
% ===============================================================================================%