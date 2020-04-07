%% plotModelData2D_CPT_bln
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
p_inj = ModelParams_bln.p_inj;
Pc = p_inj;
X_frx = ModelParams_bln.X_frx;
X_conf = ModelParams_bln.X_conf;

% ===============================================================================================%
% Dimensionless Scaling
% ===============================================================================================%
% Transformational Strain
e0_frx = alpha_b*Pc*X_frx;
e0_conf = alpha_b*Pc*X_conf;

% Dimensionless Time
tStar = t/tc_bln;

%% Normal Strains (eXX & eZZ)
% ===============================================================================================%
% Strain Magnitude - Semilogx (Dimensionless)
% ===============================================================================================%
fig = figure('Name','bln_eNNmag','NumberTitle','off');
semilogx(tStar,eXX_bln_03d(:,1)/e0_frx,'r','LineWidth',3);hold on
semilogx(tStar,eXX_bln_03d(:,2)/e0_frx,'b','LineWidth',3)
semilogx(tStar,eXX_bln_03d(:,3)/e0_frx,'g','LineWidth',3)
semilogx(tStar,eXX_bln_03d(:,4)/e0_frx,'m','LineWidth',3)
semilogx(tStar,eXX_bln_03d(:,5)/e0_frx,'c','LineWidth',3)
semilogx(tStar,eXX_bln_03d(:,6)/e0_frx,'y','LineWidth',3)
semilogx(tStar,eXX_bln_03d(:,8)/e0_frx,'k','LineWidth',3);hold off;grid on;
% semilogx(tStar,eZZ_bln_03d(:,1)/e0_frx,'--r','LineWidth',3)
% semilogx(tStar,eZZ_bln_03d(:,2)/e0_frx,'--b','LineWidth',3)
% semilogx(tStar,eZZ_bln_03d(:,3)/e0_frx,'--g','LineWidth',3)
% semilogx(tStar,eZZ_bln_03d(:,4)/e0_frx,'--m','LineWidth',3)
% semilogx(tStar,eZZ_bln_03d(:,5)/e0_frx,'--c','LineWidth',3)
% semilogx(tStar,eZZ_bln_03d(:,6)/e0_frx,'--y','LineWidth',3)
% semilogx(tStar,eZZ_bln_03d(:,8)/e0_frx,'--k','LineWidth',3);hold off;grid on;
pbaspect([1 1 1])
xlim([1E-2,1.25])
xlabel('t*','FontSize',15)
ylabel('Dimensionless Strain','FontSize',15)
legend('r = 5%', 'r = 25%', 'r = 50%', 'r = 100%','r = 110%', 'r = 125%', 'r = 200%','Location','NorthWest')
pbaspect([1 1 1])
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_CPT_bln_eNNmag.pdf','-dpdf','-r0')
print(fig,'01a_CPT_bln_eNNmag.tif','-dtiff','-r0')

% ===============================================================================================%
% Strain Rate - eXX - Semilogx (Dimensionless)
% ===============================================================================================%
fig = figure('Name','bln_eNNrate','NumberTitle','off');
semilogx(tStar,eXXrate_bln_03d(:,1)/e0_frx,'r','LineWidth',3);hold on
semilogx(tStar,eXXrate_bln_03d(:,2)/e0_frx,'b','LineWidth',3)
semilogx(tStar,eXXrate_bln_03d(:,3)/e0_frx,'g','LineWidth',3)
semilogx(tStar,eXXrate_bln_03d(:,4)/e0_frx,'m','LineWidth',3)
semilogx(tStar,eXXrate_bln_03d(:,5)/e0_frx,'c','LineWidth',3)
semilogx(tStar,eXXrate_bln_03d(:,6)/e0_frx,'y','LineWidth',3)
semilogx(tStar,eXXrate_bln_03d(:,8)/e0_frx,'k','LineWidth',3);hold off;grid on;
pbaspect([1 1 1])
xlim([1E-2,1.25])
xlabel('t*','FontSize',15)
ylabel('Dimensionless Strain Rate','FontSize',15)
legend('r = 5%', 'r = 25%', 'r = 50%', 'r = 100%','r = 110%', 'r = 125%', 'r = 200%','Location','NorthEast')
pbaspect([1 1 1])
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_CPT_bln_eNNrate.pdf','-dpdf','-r0')
print(fig,'01a_CPT_bln_eNNrate.tif','-dtiff','-r0')

% ===============================================================================================%
% Detectable Normal Strain Magnitude - (eXX & eZZ) - Semilogx (Dimensionless)
% ===============================================================================================%

fig = figure('Name','bln_eNNmagDet','NumberTitle','off');
semilogx(tStar,eXX_detectable_bln_03d(:,1)/e0_frx,'r','LineWidth',7,'HandleVisibility','off');hold on
semilogx(tStar,eXX_detectable_bln_03d(:,2)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar,eXX_detectable_bln_03d(:,3)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar,eXX_detectable_bln_03d(:,4)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar,eXX_detectable_bln_03d(:,5)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar,eXX_detectable_bln_03d(:,6)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar,eXX_detectable_bln_03d(:,8)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar,eXX_bln_03d(:,1)/e0_frx,'r','LineWidth',3)
semilogx(tStar,eXX_bln_03d(:,2)/e0_frx,'b','LineWidth',3)
semilogx(tStar,eXX_bln_03d(:,3)/e0_frx,'g','LineWidth',3)
semilogx(tStar,eXX_bln_03d(:,4)/e0_frx,'m','LineWidth',3)
semilogx(tStar,eXX_bln_03d(:,5)/e0_frx,'c','LineWidth',3)
semilogx(tStar,eXX_bln_03d(:,6)/e0_frx,'y','LineWidth',3)
semilogx(tStar,eXX_bln_03d(:,8)/e0_frx,'k','LineWidth',3);hold off;grid on;
pbaspect([1 1 1])
xlim([1E-2,1.25])
xlabel('t*','FontSize',15)
ylabel('Dimensionless Strain','FontSize',15)
legend('r = 5%', 'r = 25%', 'r = 50%', 'r = 100%','r = 110%', 'r = 125%', 'r = 200%','Location','NorthWest')
pbaspect([1 1 1])
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_CPT_bln_eNNmagDet.pdf','-dpdf','-r0')
print(fig,'01a_CPT_bln_eNNmagDet.tif','-dtiff','-r0')
% ===============================================================================================%

%% Tilt
% ===============================================================================================%
% X-Tilt Magnitude - Semilogx (Dimensionless)
% ===============================================================================================%
fig = figure('Name','bln_eTXmag','NumberTitle','off');
semilogx(tStar,eTX_bln_03d(:,1)/e0_frx,'r','LineWidth',3);hold on
semilogx(tStar,eTX_bln_03d(:,2)/e0_frx,'b','LineWidth',3)
semilogx(tStar,eTX_bln_03d(:,3)/e0_frx,'g','LineWidth',3)
semilogx(tStar,eTX_bln_03d(:,4)/e0_frx,'m','LineWidth',3)
semilogx(tStar,eTX_bln_03d(:,5)/e0_frx,'c','LineWidth',3)
semilogx(tStar,eTX_bln_03d(:,6)/e0_frx,'y','LineWidth',3)
semilogx(tStar,eTX_bln_03d(:,8)/e0_frx,'k','LineWidth',3);hold off;grid on;
pbaspect([1 1 1])
xlim([1E-2,1.25])
xlabel('t*','FontSize',15)
ylabel('Dimensionless Tilt','FontSize',15)
legend('r = 5%', 'r = 25%', 'r = 50%', 'r = 100%','r = 110%', 'r = 125%', 'r = 200%','Location','NorthWest')
pbaspect([1 1 1])
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_CPT_bln_eTXmag.pdf','-dpdf','-r0')
print(fig,'01a_CPT_bln_eTXmag.tif','-dtiff','-r0')

% ===============================================================================================%
% X-Tilt Rate - Semilogx (Dimensionless)
% ===============================================================================================%
fig = figure('Name','bln_eTXrate','NumberTitle','off');
semilogx(tStar,eTXrate_bln_03d(:,1)/e0_frx,'r','LineWidth',3);hold on
semilogx(tStar,eTXrate_bln_03d(:,2)/e0_frx,'b','LineWidth',3)
semilogx(tStar,eTXrate_bln_03d(:,3)/e0_frx,'g','LineWidth',3)
semilogx(tStar,eTXrate_bln_03d(:,4)/e0_frx,'m','LineWidth',3)
semilogx(tStar,eTXrate_bln_03d(:,5)/e0_frx,'c','LineWidth',3)
semilogx(tStar,eTXrate_bln_03d(:,6)/e0_frx,'y','LineWidth',3)
semilogx(tStar,eTXrate_bln_03d(:,8)/e0_frx,'k','LineWidth',3);hold off;grid on;
pbaspect([1 1 1])
xlim([1E-2,1.25])
xlabel('t*','FontSize',15)
ylabel('Dimensionless Tilt Rate','FontSize',15)
legend('r = 5%', 'r = 25%', 'r = 50%', 'r = 100%','Location','NorthEast')
pbaspect([1 1 1])
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_CPT_bln_eTXrate.pdf','-dpdf','-r0')
print(fig,'01a_CPT_bln_eTXrate.tif','-dtiff','-r0')
% ===============================================================================================%
% ===============================================================================================%