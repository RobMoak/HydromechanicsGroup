%% plotModelData2D_CPT_swpDfrx
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
p_inj = ModelParams_sweepDfrx(1).p_inj;
Pc = p_inj;
X_frx = ModelParams_sweepDfrx.X_frx;
X_conf = ModelParams_sweepDfrx.X_conf;

% ===============================================================================================%
% Dimensionless Scaling
% ===============================================================================================%
% Transformational Strain
e0_frx = alpha_b*Pc*X_frx;
e0_conf = alpha_b*Pc*X_conf;

% Dimensionless Time
tStar_swpDfrx = zeros(size(t_swpDfrx));
for i = 1:size(tStar_swpDfrx,2)
    tStar_swpDfrx(:,i) = t_swpDfrx(:,i)/tc_sweepDfrx(i);
end

%% Magnitude: Normal Strains (eXX & eZZ)
% ===============================================================================================%
% Strain Magnitude - semilogx (Dimensionless)
% ===============================================================================================%
fig = figure('Name','sweepDfrx_eNNmag','NumberTitle','off');
% par 01 - eXX
semilogx(tStar_swpDfrx(:,1),eXX_frxD01_03d(:,1)/e0_frx,'-r','LineWidth',3);hold on
semilogx(tStar_swpDfrx(:,1),eXX_frxD01_03d(:,2)/e0_frx,'-b','LineWidth',3)
semilogx(tStar_swpDfrx(:,1),eXX_frxD01_03d(:,3)/e0_frx,'-g','LineWidth',3)
semilogx(tStar_swpDfrx(:,1),eXX_frxD01_03d(:,4)/e0_frx,'-m','LineWidth',3)
semilogx(tStar_swpDfrx(:,1),eXX_frxD01_03d(:,5)/e0_frx,'-c','LineWidth',3)
semilogx(tStar_swpDfrx(:,1),eXX_frxD01_03d(:,6)/e0_frx,'-y','LineWidth',3)
semilogx(tStar_swpDfrx(:,1),eXX_frxD01_03d(:,8)/e0_frx,'-k','LineWidth',3)
% par 02 - eXX
semilogx(tStar_swpDfrx(:,2),eXX_frxD02_03d(:,1)/e0_frx,'--r','LineWidth',3)
semilogx(tStar_swpDfrx(:,2),eXX_frxD02_03d(:,2)/e0_frx,'--b','LineWidth',3)
semilogx(tStar_swpDfrx(:,2),eXX_frxD02_03d(:,3)/e0_frx,'--g','LineWidth',3)
semilogx(tStar_swpDfrx(:,2),eXX_frxD02_03d(:,4)/e0_frx,'--m','LineWidth',3)
semilogx(tStar_swpDfrx(:,2),eXX_frxD02_03d(:,5)/e0_frx,'--c','LineWidth',3)
semilogx(tStar_swpDfrx(:,2),eXX_frxD02_03d(:,6)/e0_frx,'--y','LineWidth',3)
semilogx(tStar_swpDfrx(:,2),eXX_frxD02_03d(:,8)/e0_frx,'--k','LineWidth',3)
% par 03 - eXX
semilogx(tStar_swpDfrx(:,3),eXX_frxD03_03d(:,1)/e0_frx,'.r','LineWidth',3)
semilogx(tStar_swpDfrx(:,3),eXX_frxD03_03d(:,2)/e0_frx,'.b','LineWidth',3)
semilogx(tStar_swpDfrx(:,3),eXX_frxD03_03d(:,3)/e0_frx,'.g','LineWidth',3)
semilogx(tStar_swpDfrx(:,3),eXX_frxD03_03d(:,4)/e0_frx,'.m','LineWidth',3)
semilogx(tStar_swpDfrx(:,3),eXX_frxD03_03d(:,5)/e0_frx,'.c','LineWidth',3)
semilogx(tStar_swpDfrx(:,3),eXX_frxD03_03d(:,6)/e0_frx,'.y','LineWidth',3)
semilogx(tStar_swpDfrx(:,3),eXX_frxD03_03d(:,8)/e0_frx,'.k','LineWidth',3);hold off;grid on;
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
print(fig,'01a_CPT_swpDfrx_eNNmag_allParVals.pdf','-dpdf','-r0')
print(fig,'01a_CPT_swpDfrx_eNNmag_allParVals.tif','-dtiff','-r0')

%% Detectable Normal Strains
% ===============================================================================================%
% PARAMETER VALUE 01: Detectable Normal Strain Magnitude - (eXX & eZZ) - Semilogx (Dimensionless)
% ===============================================================================================%
fig = figure('Name','frxD01_eNNmagDet','NumberTitle','off');
% eXX
semilogx(tStar_swpDfrx(:,1),eXX_detectable_frxD01_03d(:,1)/e0_frx,'r','LineWidth',7,'HandleVisibility','off');hold on
semilogx(tStar_swpDfrx(:,1),eXX_detectable_frxD01_03d(:,2)/e0_frx,'r','LineWidth',7,'HandleVisibility','off');
semilogx(tStar_swpDfrx(:,1),eXX_detectable_frxD01_03d(:,3)/e0_frx,'r','LineWidth',7,'HandleVisibility','off');
semilogx(tStar_swpDfrx(:,1),eXX_detectable_frxD01_03d(:,4)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpDfrx(:,1),eXX_detectable_frxD01_03d(:,5)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpDfrx(:,1),eXX_detectable_frxD01_03d(:,6)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpDfrx(:,1),eXX_detectable_frxD01_03d(:,8)/e0_frx,'r','LineWidth',7,'HandleVisibility','off');
semilogx(tStar_swpDfrx(:,1),eXX_frxD01_03d(:,1)/e0_frx,'r','LineWidth',3)
semilogx(tStar_swpDfrx(:,1),eXX_frxD01_03d(:,2)/e0_frx,'b','LineWidth',3)
semilogx(tStar_swpDfrx(:,1),eXX_frxD01_03d(:,3)/e0_frx,'g','LineWidth',3)
semilogx(tStar_swpDfrx(:,1),eXX_frxD01_03d(:,4)/e0_frx,'m','LineWidth',3)
semilogx(tStar_swpDfrx(:,1),eXX_frxD01_03d(:,5)/e0_frx,'c','LineWidth',3)
semilogx(tStar_swpDfrx(:,1),eXX_frxD01_03d(:,6)/e0_frx,'y','LineWidth',3)
semilogx(tStar_swpDfrx(:,1),eXX_frxD01_03d(:,8)/e0_frx,'k','LineWidth',3);hold on;grid on
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
print(fig,'01a_CPT_frxD01_eNNmagDet.pdf','-dpdf','-r0')
print(fig,'01a_CPT_frxD01_eNNmagDet.tif','-dtiff','-r0')

% ===============================================================================================%
% PARAMETER VALUE 02: Detectable Normal Strain Magnitude - (eXX & eZZ) - Semilogx (Dimensionless)
% ===============================================================================================%
fig = figure('Name','frxD02_eNNmagDet','NumberTitle','off');
semilogx(tStar_swpDfrx(:,2),eXX_detectable_frxD02_03d(:,1)/e0_frx,'r','LineWidth',7,'HandleVisibility','off');hold on
semilogx(tStar_swpDfrx(:,2),eXX_detectable_frxD02_03d(:,2)/e0_frx,'r','LineWidth',7,'HandleVisibility','off');
semilogx(tStar_swpDfrx(:,2),eXX_detectable_frxD02_03d(:,3)/e0_frx,'r','LineWidth',7,'HandleVisibility','off');
semilogx(tStar_swpDfrx(:,2),eXX_detectable_frxD02_03d(:,4)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpDfrx(:,2),eXX_detectable_frxD02_03d(:,5)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpDfrx(:,2),eXX_detectable_frxD02_03d(:,6)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpDfrx(:,2),eXX_detectable_frxD02_03d(:,8)/e0_frx,'r','LineWidth',7,'HandleVisibility','off');
semilogx(tStar_swpDfrx(:,2),eXX_frxD02_03d(:,1)/e0_frx,'r','LineWidth',3)
semilogx(tStar_swpDfrx(:,2),eXX_frxD02_03d(:,2)/e0_frx,'b','LineWidth',3)
semilogx(tStar_swpDfrx(:,2),eXX_frxD02_03d(:,3)/e0_frx,'g','LineWidth',3)
semilogx(tStar_swpDfrx(:,2),eXX_frxD02_03d(:,4)/e0_frx,'m','LineWidth',3)
semilogx(tStar_swpDfrx(:,2),eXX_frxD02_03d(:,5)/e0_frx,'c','LineWidth',3)
semilogx(tStar_swpDfrx(:,2),eXX_frxD02_03d(:,6)/e0_frx,'y','LineWidth',3)
semilogx(tStar_swpDfrx(:,2),eXX_frxD02_03d(:,8)/e0_frx,'k','LineWidth',3);hold off;grid on
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
print(fig,'01a_CPT_frxD02_eNNmagDet.pdf','-dpdf','-r0')
print(fig,'01a_CPT_frxD02_eNNmagDet.tif','-dtiff','-r0')

% ===============================================================================================%
% PARAMETER VALUE 03: Detectable Normal Strain Magnitude - (eXX & eZZ) - Semilogx (Dimensionless)
% ===============================================================================================%
fig = figure('Name','frxD03_eNNmagDet','NumberTitle','off');
semilogx(tStar_swpDfrx(:,3),eXX_detectable_frxD03_03d(:,1)/e0_frx,'r','LineWidth',7,'HandleVisibility','off');hold on
semilogx(tStar_swpDfrx(:,3),eXX_detectable_frxD03_03d(:,2)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpDfrx(:,3),eXX_detectable_frxD03_03d(:,3)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpDfrx(:,3),eXX_detectable_frxD03_03d(:,4)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpDfrx(:,3),eXX_detectable_frxD03_03d(:,5)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpDfrx(:,3),eXX_detectable_frxD03_03d(:,6)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpDfrx(:,3),eXX_detectable_frxD03_03d(:,8)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpDfrx(:,3),eXX_frxD03_03d(:,1)/e0_frx,'r','LineWidth',3)
semilogx(tStar_swpDfrx(:,3),eXX_frxD03_03d(:,2)/e0_frx,'b','LineWidth',3)
semilogx(tStar_swpDfrx(:,3),eXX_frxD03_03d(:,3)/e0_frx,'g','LineWidth',3)
semilogx(tStar_swpDfrx(:,3),eXX_frxD03_03d(:,4)/e0_frx,'m','LineWidth',3)
semilogx(tStar_swpDfrx(:,3),eXX_frxD03_03d(:,5)/e0_frx,'c','LineWidth',3)
semilogx(tStar_swpDfrx(:,3),eXX_frxD03_03d(:,6)/e0_frx,'y','LineWidth',3)
semilogx(tStar_swpDfrx(:,3),eXX_frxD03_03d(:,8)/e0_frx,'k','LineWidth',3);hold off;grid on
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
print(fig,'01a_CPT_frxD03_eNNmagDet.pdf','-dpdf','-r0')
print(fig,'01a_CPT_frxD03_eNNmagDet.tif','-dtiff','-r0')

% ===============================================================================================%
% PARAMETER VALUE 04: Detectable Normal Strain Magnitude - (eXX & eZZ) - Semilogx (Dimensionless)
% ===============================================================================================%
fig = figure('Name','frxD04_eNNmagDet','NumberTitle','off');
semilogx(tStar_swpDfrx(:,4),eXX_detectable_frxD04_03d(:,1)/e0_frx,'r','LineWidth',7,'HandleVisibility','off');hold on
semilogx(tStar_swpDfrx(:,4),eXX_detectable_frxD04_03d(:,2)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpDfrx(:,4),eXX_detectable_frxD04_03d(:,3)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpDfrx(:,4),eXX_detectable_frxD04_03d(:,4)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpDfrx(:,4),eXX_detectable_frxD04_03d(:,5)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpDfrx(:,4),eXX_detectable_frxD04_03d(:,6)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpDfrx(:,4),eXX_detectable_frxD04_03d(:,8)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpDfrx(:,4),eXX_frxD04_03d(:,1)/e0_frx,'r','LineWidth',3)
semilogx(tStar_swpDfrx(:,4),eXX_frxD04_03d(:,2)/e0_frx,'b','LineWidth',3)
semilogx(tStar_swpDfrx(:,4),eXX_frxD04_03d(:,3)/e0_frx,'g','LineWidth',3)
semilogx(tStar_swpDfrx(:,4),eXX_frxD04_03d(:,4)/e0_frx,'m','LineWidth',3)
semilogx(tStar_swpDfrx(:,4),eXX_frxD04_03d(:,5)/e0_frx,'c','LineWidth',3)
semilogx(tStar_swpDfrx(:,4),eXX_frxD04_03d(:,6)/e0_frx,'y','LineWidth',3)
semilogx(tStar_swpDfrx(:,4),eXX_frxD04_03d(:,8)/e0_frx,'k','LineWidth',3);hold off;grid on
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
print(fig,'01a_CPT_frxD04_eNNmagDet.pdf','-dpdf','-r0')
print(fig,'01a_CPT_frxD04_eNNmagDet.tif','-dtiff','-r0')

% ===============================================================================================%
% PARAMETER VALUE 05: Detectable Normal Strain Magnitude - (eXX & eZZ) - Semilogx (Dimensionless)
% ===============================================================================================%
fig = figure('Name','frxD05_eNNmagDet','NumberTitle','off');
semilogx(tStar_swpDfrx(:,5),eXX_detectable_frxD05_03d(:,1)/e0_frx,'r','LineWidth',7,'HandleVisibility','off');hold on
semilogx(tStar_swpDfrx(:,5),eXX_detectable_frxD05_03d(:,2)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpDfrx(:,5),eXX_detectable_frxD05_03d(:,3)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpDfrx(:,5),eXX_detectable_frxD05_03d(:,4)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpDfrx(:,5),eXX_detectable_frxD05_03d(:,5)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpDfrx(:,5),eXX_detectable_frxD05_03d(:,6)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpDfrx(:,5),eXX_detectable_frxD05_03d(:,8)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpDfrx(:,5),eXX_frxD05_03d(:,1)/e0_frx,'r','LineWidth',3)
semilogx(tStar_swpDfrx(:,5),eXX_frxD05_03d(:,2)/e0_frx,'b','LineWidth',3)
semilogx(tStar_swpDfrx(:,5),eXX_frxD05_03d(:,3)/e0_frx,'g','LineWidth',3)
semilogx(tStar_swpDfrx(:,5),eXX_frxD05_03d(:,4)/e0_frx,'m','LineWidth',3)
semilogx(tStar_swpDfrx(:,5),eXX_frxD05_03d(:,5)/e0_frx,'c','LineWidth',3)
semilogx(tStar_swpDfrx(:,5),eXX_frxD05_03d(:,6)/e0_frx,'y','LineWidth',3)
semilogx(tStar_swpDfrx(:,5),eXX_frxD05_03d(:,8)/e0_frx,'k','LineWidth',3);hold off;grid on
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
print(fig,'01a_CPT_frxD05_eNNmagDet.pdf','-dpdf','-r0')
print(fig,'01a_CPT_frxD05_eNNmagDet.tif','-dtiff','-r0')

% ===============================================================================================%
% PARAMETER VALUE 06: Detectable Normal Strain Magnitude - (eXX & eZZ) - Semilogx (Dimensionless)
% ===============================================================================================%
fig = figure('Name','frxD06_eNNmagDet','NumberTitle','off');
semilogx(tStar_swpDfrx(:,6),eXX_detectable_frxD06_03d(:,1)/e0_frx,'r','LineWidth',7,'HandleVisibility','off');hold on
semilogx(tStar_swpDfrx(:,6),eXX_detectable_frxD06_03d(:,2)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpDfrx(:,6),eXX_detectable_frxD06_03d(:,3)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpDfrx(:,6),eXX_detectable_frxD06_03d(:,4)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpDfrx(:,6),eXX_detectable_frxD06_03d(:,5)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpDfrx(:,6),eXX_detectable_frxD06_03d(:,6)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpDfrx(:,6),eXX_detectable_frxD06_03d(:,8)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpDfrx(:,6),eXX_frxD06_03d(:,1)/e0_frx,'r','LineWidth',3)
semilogx(tStar_swpDfrx(:,6),eXX_frxD06_03d(:,2)/e0_frx,'b','LineWidth',3)
semilogx(tStar_swpDfrx(:,6),eXX_frxD06_03d(:,3)/e0_frx,'g','LineWidth',3)
semilogx(tStar_swpDfrx(:,6),eXX_frxD06_03d(:,4)/e0_frx,'m','LineWidth',3)
semilogx(tStar_swpDfrx(:,6),eXX_frxD06_03d(:,5)/e0_frx,'c','LineWidth',3)
semilogx(tStar_swpDfrx(:,6),eXX_frxD06_03d(:,6)/e0_frx,'y','LineWidth',3)
semilogx(tStar_swpDfrx(:,6),eXX_frxD06_03d(:,8)/e0_frx,'k','LineWidth',3);hold off;grid on
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
print(fig,'01a_CPT_frxD06_eNNmagDet.pdf','-dpdf','-r0')
print(fig,'01a_CPT_frxD06_eNNmagDet.tif','-dtiff','-r0')

% ===============================================================================================%
% PARAMETER VALUE 07: Detectable Normal Strain Magnitude - (eXX & eZZ) - Semilogx (Dimensionless)
% ===============================================================================================%
fig = figure('Name','frxD07_eNNmagDet','NumberTitle','off');
semilogx(tStar_swpDfrx(:,7),eXX_detectable_frxD07_03d(:,1)/e0_frx,'r','LineWidth',7,'HandleVisibility','off');hold on
semilogx(tStar_swpDfrx(:,7),eXX_detectable_frxD07_03d(:,2)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpDfrx(:,7),eXX_detectable_frxD07_03d(:,3)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpDfrx(:,7),eXX_detectable_frxD07_03d(:,4)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpDfrx(:,7),eXX_detectable_frxD07_03d(:,5)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpDfrx(:,7),eXX_detectable_frxD07_03d(:,6)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpDfrx(:,7),eXX_detectable_frxD07_03d(:,8)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpDfrx(:,7),eXX_frxD07_03d(:,1)/e0_frx,'r','LineWidth',3)
semilogx(tStar_swpDfrx(:,7),eXX_frxD07_03d(:,2)/e0_frx,'b','LineWidth',3)
semilogx(tStar_swpDfrx(:,7),eXX_frxD07_03d(:,3)/e0_frx,'g','LineWidth',3)
semilogx(tStar_swpDfrx(:,7),eXX_frxD07_03d(:,4)/e0_frx,'m','LineWidth',3)
semilogx(tStar_swpDfrx(:,7),eXX_frxD07_03d(:,5)/e0_frx,'c','LineWidth',3)
semilogx(tStar_swpDfrx(:,7),eXX_frxD07_03d(:,6)/e0_frx,'y','LineWidth',3)
semilogx(tStar_swpDfrx(:,7),eXX_frxD07_03d(:,8)/e0_frx,'k','LineWidth',3);hold off;grid on
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
print(fig,'01a_CPT_frxD07_eNNmagDet.pdf','-dpdf','-r0')
print(fig,'01a_CPT_frxD07_eNNmagDet.tif','-dtiff','-r0')

% ===============================================================================================%
% PARAMETER VALUE 08: Detectable Normal Strain Magnitude - (eXX & eZZ) - Semilogx (Dimensionless)
% ===============================================================================================%
fig = figure('Name','frxD08_eNNmagDet','NumberTitle','off');
semilogx(tStar_swpDfrx(:,8),eXX_detectable_frxD08_03d(:,1)/e0_frx,'r','LineWidth',7,'HandleVisibility','off');hold on
semilogx(tStar_swpDfrx(:,8),eXX_detectable_frxD08_03d(:,2)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpDfrx(:,8),eXX_detectable_frxD08_03d(:,3)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpDfrx(:,8),eXX_detectable_frxD08_03d(:,4)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpDfrx(:,8),eXX_detectable_frxD08_03d(:,5)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpDfrx(:,8),eXX_detectable_frxD08_03d(:,6)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpDfrx(:,8),eXX_detectable_frxD08_03d(:,8)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpDfrx(:,8),eXX_frxD08_03d(:,1)/e0_frx,'r','LineWidth',3)
semilogx(tStar_swpDfrx(:,8),eXX_frxD08_03d(:,2)/e0_frx,'b','LineWidth',3)
semilogx(tStar_swpDfrx(:,8),eXX_frxD08_03d(:,3)/e0_frx,'g','LineWidth',3)
semilogx(tStar_swpDfrx(:,8),eXX_frxD08_03d(:,4)/e0_frx,'m','LineWidth',3)
semilogx(tStar_swpDfrx(:,8),eXX_frxD08_03d(:,5)/e0_frx,'c','LineWidth',3)
semilogx(tStar_swpDfrx(:,8),eXX_frxD08_03d(:,6)/e0_frx,'y','LineWidth',3)
semilogx(tStar_swpDfrx(:,8),eXX_frxD08_03d(:,8)/e0_frx,'k','LineWidth',3);hold off;grid on
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
print(fig,'01a_CPT_frxD08_eNNmagDet.pdf','-dpdf','-r0')
print(fig,'01a_CPT_frxD08_eNNmagDet.tif','-dtiff','-r0')

% ===============================================================================================%
% PARAMETER VALUE 09: Detectable Normal Strain Magnitude - (eXX & eZZ) - Semilogx (Dimensionless)
% ===============================================================================================%
fig = figure('Name','frxD09_eNNmagDet','NumberTitle','off');
semilogx(tStar_swpDfrx(:,9),eXX_detectable_frxD09_03d(:,1)/e0_frx,'r','LineWidth',7,'HandleVisibility','off');hold on
semilogx(tStar_swpDfrx(:,9),eXX_detectable_frxD09_03d(:,2)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpDfrx(:,9),eXX_detectable_frxD09_03d(:,3)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpDfrx(:,9),eXX_detectable_frxD09_03d(:,4)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpDfrx(:,9),eXX_detectable_frxD09_03d(:,5)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpDfrx(:,9),eXX_detectable_frxD09_03d(:,6)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpDfrx(:,9),eXX_detectable_frxD09_03d(:,8)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpDfrx(:,9),eXX_frxD09_03d(:,1)/e0_frx,'r','LineWidth',3)
semilogx(tStar_swpDfrx(:,9),eXX_frxD09_03d(:,2)/e0_frx,'b','LineWidth',3)
semilogx(tStar_swpDfrx(:,9),eXX_frxD09_03d(:,3)/e0_frx,'g','LineWidth',3)
semilogx(tStar_swpDfrx(:,9),eXX_frxD09_03d(:,4)/e0_frx,'m','LineWidth',3)
semilogx(tStar_swpDfrx(:,9),eXX_frxD09_03d(:,5)/e0_frx,'c','LineWidth',3)
semilogx(tStar_swpDfrx(:,9),eXX_frxD09_03d(:,6)/e0_frx,'y','LineWidth',3)
semilogx(tStar_swpDfrx(:,9),eXX_frxD09_03d(:,8)/e0_frx,'k','LineWidth',3);hold off;grid on
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
print(fig,'01a_CPT_frxD09_eNNmagDet.pdf','-dpdf','-r0')
print(fig,'01a_CPT_frxD09_eNNmagDet.tif','-dtiff','-r0')

% ===============================================================================================%
% PARAMETER VALUE 10: Detectable Normal Strain Magnitude - (eXX & eZZ) - Semilogx (Dimensionless)
% ===============================================================================================%
fig = figure('Name','frxD10_eNNmagDet','NumberTitle','off');
semilogx(tStar_swpDfrx(:,10),eXX_detectable_frxD10_03d(:,1)/e0_frx,'r','LineWidth',7,'HandleVisibility','off');hold on
semilogx(tStar_swpDfrx(:,10),eXX_detectable_frxD10_03d(:,2)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpDfrx(:,10),eXX_detectable_frxD10_03d(:,3)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpDfrx(:,10),eXX_detectable_frxD10_03d(:,4)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpDfrx(:,10),eXX_detectable_frxD10_03d(:,5)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpDfrx(:,10),eXX_detectable_frxD10_03d(:,6)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpDfrx(:,10),eXX_detectable_frxD10_03d(:,8)/e0_frx,'r','LineWidth',7,'HandleVisibility','off')
semilogx(tStar_swpDfrx(:,10),eXX_frxD10_03d(:,1)/e0_frx,'r','LineWidth',3)
semilogx(tStar_swpDfrx(:,10),eXX_frxD10_03d(:,2)/e0_frx,'b','LineWidth',3)
semilogx(tStar_swpDfrx(:,10),eXX_frxD10_03d(:,3)/e0_frx,'g','LineWidth',3)
semilogx(tStar_swpDfrx(:,10),eXX_frxD10_03d(:,4)/e0_frx,'m','LineWidth',3)
semilogx(tStar_swpDfrx(:,10),eXX_frxD10_03d(:,5)/e0_frx,'c','LineWidth',3)
semilogx(tStar_swpDfrx(:,10),eXX_frxD10_03d(:,6)/e0_frx,'y','LineWidth',3)
semilogx(tStar_swpDfrx(:,10),eXX_frxD10_03d(:,8)/e0_frx,'k','LineWidth',3);hold off;grid on
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
print(fig,'01a_CPT_frxD10_eNNmagDet.pdf','-dpdf','-r0')
print(fig,'01a_CPT_frxD10_eNNmagDet.tif','-dtiff','-r0')

%% Strain Rate
% ===============================================================================================%
% INDIVIDUAL LOCATIONS: Strain Rate (eXX) - loglog (Dimensionless)
% ===============================================================================================%
% LOCATION: PROBE 05w03d
fig = figure('Name','swpDfrx_eXXrate_05w03d','NumberTitle','off');
% par01
loglog(tStar_swpDfrx(:,1),eXXrate_frxD01_03d(:,1),'LineWidth',3);hold on
% par02
loglog(tStar_swpDfrx(:,2),eXXrate_frxD02_03d(:,1),'LineWidth',3)
% par03
loglog(tStar_swpDfrx(:,3),eXXrate_frxD03_03d(:,1),'LineWidth',3)
% par04
loglog(tStar_swpDfrx(:,4),eXXrate_frxD04_03d(:,1),'LineWidth',3)
% par05
loglog(tStar_swpDfrx(:,5),eXXrate_frxD05_03d(:,1),'LineWidth',3)
% par06
loglog(tStar_swpDfrx(:,6),eXXrate_frxD06_03d(:,1),'LineWidth',3)
% par07
loglog(tStar_swpDfrx(:,7),eXXrate_frxD07_03d(:,1),'LineWidth',3)
% par08
loglog(tStar_swpDfrx(:,8),eXXrate_frxD08_03d(:,1),'LineWidth',3)
% par09
loglog(tStar_swpDfrx(:,9),eXXrate_frxD09_03d(:,1),'LineWidth',3)
% par10
loglog(tStar_swpDfrx(:,10),eXXrate_frxD10_03d(:,1),'LineWidth',3);hold off;grid on
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
print(fig,'01a_CPT_swpDfrx_eXXrate_05w03d.pdf','-dpdf','-r0')
print(fig,'01a_CPT_swpDfrx_eXXrate_05w03d.tif','-dtiff','-r0')

% ===============================================================================================%

% LOCATION: PROBE 25w03d
fig = figure('Name','swpDfrx_eXXrate_25w03d','NumberTitle','off');
% par01
loglog(tStar_swpDfrx(:,1),eXXrate_frxD01_03d(:,2),'LineWidth',3);hold on
% par02
loglog(tStar_swpDfrx(:,2),eXXrate_frxD02_03d(:,2),'LineWidth',3)
% par03
loglog(tStar_swpDfrx(:,3),eXXrate_frxD03_03d(:,2),'LineWidth',3)
% par04
loglog(tStar_swpDfrx(:,4),eXXrate_frxD04_03d(:,2),'LineWidth',3)
% par05
loglog(tStar_swpDfrx(:,5),eXXrate_frxD05_03d(:,2),'LineWidth',3)
% par06
loglog(tStar_swpDfrx(:,6),eXXrate_frxD06_03d(:,2),'LineWidth',3)
% par07
loglog(tStar_swpDfrx(:,7),eXXrate_frxD07_03d(:,2),'LineWidth',3)
% par08
loglog(tStar_swpDfrx(:,8),eXXrate_frxD08_03d(:,2),'LineWidth',3)
% par09
loglog(tStar_swpDfrx(:,9),eXXrate_frxD09_03d(:,2),'LineWidth',3)
% par10
loglog(tStar_swpDfrx(:,10),eXXrate_frxD10_03d(:,2),'LineWidth',3);hold off;grid on
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
print(fig,'01a_CPT_swpDfrx_eXXrate_25w03d.pdf','-dpdf','-r0')
print(fig,'01a_CPT_swpDfrx_eXXrate_25w03d.tif','-dtiff','-r0')

% ===============================================================================================%

% LOCATION: PROBE 50w03d
fig = figure('Name','swpDfrx_eXXrate_50w03d','NumberTitle','off');
% par01
loglog(tStar_swpDfrx(:,1),eXXrate_frxD01_03d(:,3),'LineWidth',3);hold on
% par02
loglog(tStar_swpDfrx(:,2),eXXrate_frxD02_03d(:,3),'LineWidth',3)
% par03
loglog(tStar_swpDfrx(:,3),eXXrate_frxD03_03d(:,3),'LineWidth',3)
% par04
loglog(tStar_swpDfrx(:,4),eXXrate_frxD04_03d(:,3),'LineWidth',3)
% par05
loglog(tStar_swpDfrx(:,5),eXXrate_frxD05_03d(:,3),'LineWidth',3)
% par06
loglog(tStar_swpDfrx(:,6),eXXrate_frxD06_03d(:,3),'LineWidth',3)
% par07
loglog(tStar_swpDfrx(:,7),eXXrate_frxD07_03d(:,3),'LineWidth',3)
% par08
loglog(tStar_swpDfrx(:,8),eXXrate_frxD08_03d(:,3),'LineWidth',3)
% par09
loglog(tStar_swpDfrx(:,9),eXXrate_frxD09_03d(:,3),'LineWidth',3)
% par10
loglog(tStar_swpDfrx(:,10),eXXrate_frxD10_03d(:,3),'LineWidth',3);hold off;grid on
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
print(fig,'01a_CPT_swpDfrx_eXXrate_50w03d.pdf','-dpdf','-r0')
print(fig,'01a_CPT_swpDfrx_eXXrate_50w03d.tif','-dtiff','-r0')

% ===============================================================================================%

% LOCATION: PROBE 100W03d
fig = figure('Name','swpDfrx_eXXrate_100w03d','NumberTitle','off');
% par01
loglog(tStar_swpDfrx(:,1),eXXrate_frxD01_03d(:,4),'LineWidth',3);hold on
% par02
loglog(tStar_swpDfrx(:,2),eXXrate_frxD02_03d(:,4),'LineWidth',3)
% par03
loglog(tStar_swpDfrx(:,3),eXXrate_frxD03_03d(:,4),'LineWidth',3)
% par04
loglog(tStar_swpDfrx(:,4),eXXrate_frxD04_03d(:,4),'LineWidth',3)
% par05
loglog(tStar_swpDfrx(:,5),eXXrate_frxD05_03d(:,4),'LineWidth',3)
% par06
loglog(tStar_swpDfrx(:,6),eXXrate_frxD06_03d(:,4),'LineWidth',3)
% par07
loglog(tStar_swpDfrx(:,7),eXXrate_frxD07_03d(:,4),'LineWidth',3)
% par08
loglog(tStar_swpDfrx(:,8),eXXrate_frxD08_03d(:,4),'LineWidth',3)
% par09
loglog(tStar_swpDfrx(:,9),eXXrate_frxD09_03d(:,4),'LineWidth',3)
% par10
loglog(tStar_swpDfrx(:,10),eXXrate_frxD10_03d(:,4),'LineWidth',3);hold off;grid on
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
print(fig,'01a_CPT_swpDfrx_eXXrate_100w03d.pdf','-dpdf','-r0')
print(fig,'01a_CPT_swpDfrx_eXXrate_100w03d.tif','-dtiff','-r0')

% ===============================================================================================%

% LOCATION: PROBE 110W03d
fig = figure('Name','swpDfrx_eXXrate_110w03d','NumberTitle','off');
% par01
loglog(tStar_swpDfrx(:,1),eXXrate_frxD01_03d(:,5),'LineWidth',3);hold on
% par02
loglog(tStar_swpDfrx(:,2),eXXrate_frxD02_03d(:,5),'LineWidth',3)
% par03
loglog(tStar_swpDfrx(:,3),eXXrate_frxD03_03d(:,5),'LineWidth',3)
% par04
loglog(tStar_swpDfrx(:,4),eXXrate_frxD04_03d(:,5),'LineWidth',3)
% par05
loglog(tStar_swpDfrx(:,5),eXXrate_frxD05_03d(:,5),'LineWidth',3)
% par06
loglog(tStar_swpDfrx(:,6),eXXrate_frxD06_03d(:,5),'LineWidth',3)
% par07
loglog(tStar_swpDfrx(:,7),eXXrate_frxD07_03d(:,5),'LineWidth',3)
% par08
loglog(tStar_swpDfrx(:,8),eXXrate_frxD08_03d(:,5),'LineWidth',3)
% par09
loglog(tStar_swpDfrx(:,9),eXXrate_frxD09_03d(:,5),'LineWidth',3)
% par10
loglog(tStar_swpDfrx(:,10),eXXrate_frxD10_03d(:,5),'LineWidth',3);hold off;grid on
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
print(fig,'01a_CPT_swpDfrx_eXXrate_110w03d.pdf','-dpdf','-r0')
print(fig,'01a_CPT_swpDfrx_eXXrate_110w03d.tif','-dtiff','-r0')

% ===============================================================================================%

% LOCATION: PROBE 125W03d
fig = figure('Name','swpDfrx_eXXrate_125w03d','NumberTitle','off');
% par01
loglog(tStar_swpDfrx(:,1),eXXrate_frxD01_03d(:,6),'LineWidth',3);hold on
% par02
loglog(tStar_swpDfrx(:,2),eXXrate_frxD02_03d(:,6),'LineWidth',3)
% par03
loglog(tStar_swpDfrx(:,3),eXXrate_frxD03_03d(:,6),'LineWidth',3)
% par04
loglog(tStar_swpDfrx(:,4),eXXrate_frxD04_03d(:,6),'LineWidth',3)
% par05
loglog(tStar_swpDfrx(:,5),eXXrate_frxD05_03d(:,6),'LineWidth',3)
% par06
loglog(tStar_swpDfrx(:,6),eXXrate_frxD06_03d(:,6),'LineWidth',3)
% par07
loglog(tStar_swpDfrx(:,7),eXXrate_frxD07_03d(:,6),'LineWidth',3)
% par08
loglog(tStar_swpDfrx(:,8),eXXrate_frxD08_03d(:,6),'LineWidth',3)
% par09
loglog(tStar_swpDfrx(:,9),eXXrate_frxD09_03d(:,6),'LineWidth',3)
% par10
loglog(tStar_swpDfrx(:,10),eXXrate_frxD10_03d(:,6),'LineWidth',3);hold off;grid on
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
print(fig,'01a_CPT_swpDfrx_eXXrate_125w03d.pdf','-dpdf','-r0')
print(fig,'01a_CPT_swpDfrx_eXXrate_125w03d.tif','-dtiff','-r0')


% ===============================================================================================%

% LOCATION: PROBE 150W03d
fig = figure('Name','swpDfrx_eXXrate_150w03d','NumberTitle','off');
% par01
loglog(tStar_swpDfrx(:,1),eXXrate_frxD01_03d(:,7),'LineWidth',3);hold on
% par02
loglog(tStar_swpDfrx(:,2),eXXrate_frxD02_03d(:,7),'LineWidth',3)
% par03
loglog(tStar_swpDfrx(:,3),eXXrate_frxD03_03d(:,7),'LineWidth',3)
% par04
loglog(tStar_swpDfrx(:,4),eXXrate_frxD04_03d(:,7),'LineWidth',3)
% par05
loglog(tStar_swpDfrx(:,5),eXXrate_frxD05_03d(:,7),'LineWidth',3)
% par06
loglog(tStar_swpDfrx(:,6),eXXrate_frxD06_03d(:,7),'LineWidth',3)
% par07
loglog(tStar_swpDfrx(:,7),eXXrate_frxD07_03d(:,7),'LineWidth',3)
% par08
loglog(tStar_swpDfrx(:,8),eXXrate_frxD08_03d(:,7),'LineWidth',3)
% par09
loglog(tStar_swpDfrx(:,9),eXXrate_frxD09_03d(:,7),'LineWidth',3)
% par10
loglog(tStar_swpDfrx(:,10),eXXrate_frxD10_03d(:,7),'LineWidth',3);hold off;grid on
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
print(fig,'01a_CPT_swpDfrx_eXXrate_150w03d.pdf','-dpdf','-r0')
print(fig,'01a_CPT_swpDfrx_eXXrate_150w03d.tif','-dtiff','-r0')

% ===============================================================================================%

% LOCATION: PROBE 200W03d
fig = figure('Name','swpDfrx_eXXrate_200w03d','NumberTitle','off');
% par01
loglog(tStar_swpDfrx(:,1),eXXrate_frxD01_03d(:,8),'LineWidth',3);hold on
% par02
loglog(tStar_swpDfrx(:,2),eXXrate_frxD02_03d(:,8),'LineWidth',3)
% par03
loglog(tStar_swpDfrx(:,3),eXXrate_frxD03_03d(:,8),'LineWidth',3)
% par04
loglog(tStar_swpDfrx(:,4),eXXrate_frxD04_03d(:,8),'LineWidth',3)
% par05
loglog(tStar_swpDfrx(:,5),eXXrate_frxD05_03d(:,8),'LineWidth',3)
% par06
loglog(tStar_swpDfrx(:,6),eXXrate_frxD06_03d(:,8),'LineWidth',3)
% par07
loglog(tStar_swpDfrx(:,7),eXXrate_frxD07_03d(:,8),'LineWidth',3)
% par08
loglog(tStar_swpDfrx(:,8),eXXrate_frxD08_03d(:,8),'LineWidth',3)
% par09
loglog(tStar_swpDfrx(:,9),eXXrate_frxD09_03d(:,8),'LineWidth',3)
% par10
loglog(tStar_swpDfrx(:,10),eXXrate_frxD10_03d(:,8),'LineWidth',3);hold off;grid on
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
print(fig,'01a_CPT_swpDfrx_eXXrate_200w03d.pdf','-dpdf','-r0')
print(fig,'01a_CPT_swpDfrx_eXXrate_200w03d.tif','-dtiff','-r0')

% ===============================================================================================%
% ALL LOCATIONS: Strain Rate (eXX) - loglog (Dimensionless)
% ===============================================================================================%
fig = figure('Name','swpDfrx_eXXrate_allProbes','NumberTitle','off');
% ===============================================================================================%
% LOCATION: PROBE 05w03d
subplot(4,4,1)
% par01
loglog(tStar_swpDfrx,eXXrate_frxD01_03d(:,1)/e0_frx,'r','LineWidth',3);hold on
% par02
loglog(tStar_swpDfrx,eXXrate_frxD02_03d(:,1)/e0_frx,'--r','LineWidth',3)
% par03
loglog(tStar_swpDfrx,eXXrate_frxD03_03d(:,1)/e0_frx,'.r','LineWidth',3);hold off;grid on
pbaspect([1 1 1])
% xlim([1E-2,1.25])
% xlabel('t*','FontSize',15)
ylabel('Strain Rate (Scaled)','FontSize',12)
% ===============================================================================================%
% LOCATION: PROBE 25w03d
subplot(4,4,2)
% par01
loglog(tStar_swpDfrx,eXXrate_frxD01_03d(:,2)/e0_frx,'b','LineWidth',3);hold on
% par02
loglog(tStar_swpDfrx,eXXrate_frxD02_03d(:,2)/e0_frx,'--b','LineWidth',3)
% par03
loglog(tStar_swpDfrx,eXXrate_frxD03_03d(:,2)/e0_frx,'.b','LineWidth',3);hold off;grid on
pbaspect([1 1 1])
% xlim([1E-2,1.25])
% xlabel('t*','FontSize',15)
% ===============================================================================================%
% LOCATION: PROBE 50w03d
subplot(4,4,3)
% par01
loglog(tStar_swpDfrx,eXXrate_frxD01_03d(:,3)/e0_frx,'g','LineWidth',3);hold on
% par02
loglog(tStar_swpDfrx,eXXrate_frxD02_03d(:,3)/e0_frx,'--g','LineWidth',3)
% par03
loglog(tStar_swpDfrx,eXXrate_frxD03_03d(:,3)/e0_frx,'.g','LineWidth',3);hold off;grid on
pbaspect([1 1 1])
% xlim([1E-2,1.25])
xlabel('t*','FontSize',15)
% ylabel('Strain Rate (Scaled)','FontSize',12)
% ===============================================================================================%
% LOCATION: PROBE 100w03d
subplot(4,4,4)
% par01
loglog(tStar_swpDfrx,eXXrate_frxD01_03d(:,4)/e0_frx,'m','LineWidth',3);hold on
% par02
loglog(tStar_swpDfrx,eXXrate_frxD02_03d(:,4)/e0_frx,'--m','LineWidth',3)
% par03
loglog(tStar_swpDfrx,eXXrate_frxD03_03d(:,4)/e0_frx,'.m','LineWidth',3);hold off;grid on
pbaspect([1 1 1])
% xlim([1E-2,1.25])
xlabel('t*','FontSize',15)
% legend('D01', 'D02', 'D03','Location','SouthWest')
pbaspect([1 1 1])
% ===============================================================================================%
% LOCATION: PROBE 110w03d
subplot(4,4,5)
% par01
loglog(tStar_swpDfrx,eXXrate_frxD01_03d(:,5)/e0_frx,'c','LineWidth',3);hold on
% par02
loglog(tStar_swpDfrx,eXXrate_frxD02_03d(:,5)/e0_frx,'--c','LineWidth',3)
% par03
loglog(tStar_swpDfrx,eXXrate_frxD03_03d(:,5)/e0_frx,'.c','LineWidth',3);hold off;grid on
pbaspect([1 1 1])
% xlim([1E-2,1.25])
xlabel('t*','FontSize',15)
% legend('D01', 'D02', 'D03','Location','SouthWest')
pbaspect([1 1 1])
% ===============================================================================================%
% LOCATION: PROBE 125w03d
subplot(4,4,6)
% par01
loglog(tStar_swpDfrx,eXXrate_frxD01_03d(:,6)/e0_frx,'y','LineWidth',3);hold on
% par02
loglog(tStar_swpDfrx,eXXrate_frxD02_03d(:,6)/e0_frx,'--y','LineWidth',3)
% par03
loglog(tStar_swpDfrx,eXXrate_frxD03_03d(:,6)/e0_frx,'.y','LineWidth',3);hold off;grid on
pbaspect([1 1 1])
% xlim([1E-2,1.25])
xlabel('t*','FontSize',15)
% legend('D01', 'D02', 'D03','Location','SouthWest')
pbaspect([1 1 1])
% ===============================================================================================%
% LOCATION: PROBE 150w03d
subplot(4,4,7)
% par01
loglog(tStar_swpDfrx,eXXrate_frxD01_03d(:,7)/e0_frx,'-','LineWidth',3);hold on
% par02
loglog(tStar_swpDfrx,eXXrate_frxD02_03d(:,7)/e0_frx,'--','LineWidth',3)
% par03
loglog(tStar_swpDfrx,eXXrate_frxD03_03d(:,7)/e0_frx,'.','LineWidth',3);hold off;grid on
pbaspect([1 1 1])
% xlim([1E-2,1.25])
xlabel('t*','FontSize',15)
% legend('D01', 'D02', 'D03','Location','SouthWest')
pbaspect([1 1 1])
% ===============================================================================================%
% LOCATION: PROBE 110w03d
subplot(4,4,8)
% par01
loglog(tStar_swpDfrx,eXXrate_frxD01_03d(:,8)/e0_frx,'k','LineWidth',3);hold on
% par02
loglog(tStar_swpDfrx,eXXrate_frxD02_03d(:,8)/e0_frx,'--k','LineWidth',3)
% par03
loglog(tStar_swpDfrx,eXXrate_frxD03_03d(:,8)/e0_frx,'.k','LineWidth',3);hold off;grid on
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
print(fig,'01a_CPT_swpDfrx_eXXrate_allProbes.pdf','-dpdf','-r0')
print(fig,'01a_CPT_swpDfrx_eXXrate_allProbes.tif','-dtiff','-r0')

%%  Tilt
% ===============================================================================================%
% X-Tilt Magnitude - Semilogx (Dimensionless)
% ===============================================================================================%
fig = figure('Name','sweepDfrx_eTXmag','NumberTitle','off');
% par 01
semilogx(tStar_swpDfrx,eTX_frxD01_03d(:,1)/e0_frx,'r','LineWidth',3);hold on
semilogx(tStar_swpDfrx,eTX_frxD01_03d(:,2)/e0_frx,'b','LineWidth',3)
semilogx(tStar_swpDfrx,eTX_frxD01_03d(:,3)/e0_frx,'g','LineWidth',3)
semilogx(tStar_swpDfrx,eTX_frxD01_03d(:,4)/e0_frx,'m','LineWidth',3)
semilogx(tStar_swpDfrx,eTX_frxD01_03d(:,5)/e0_frx,'c','LineWidth',3)
semilogx(tStar_swpDfrx,eTX_frxD01_03d(:,6)/e0_frx,'y','LineWidth',3)
semilogx(tStar_swpDfrx,eTX_frxD01_03d(:,8)/e0_frx,'k','LineWidth',3)
% par 02
semilogx(tStar_swpDfrx,eTX_frxD02_03d(:,1)/e0_frx,'--r','LineWidth',3)
semilogx(tStar_swpDfrx,eTX_frxD02_03d(:,2)/e0_frx,'--b','LineWidth',3)
semilogx(tStar_swpDfrx,eTX_frxD02_03d(:,3)/e0_frx,'--g','LineWidth',3)
semilogx(tStar_swpDfrx,eTX_frxD02_03d(:,4)/e0_frx,'--m','LineWidth',3)
semilogx(tStar_swpDfrx,eTX_frxD02_03d(:,5)/e0_frx,'--c','LineWidth',3)
semilogx(tStar_swpDfrx,eTX_frxD02_03d(:,6)/e0_frx,'--y','LineWidth',3)
semilogx(tStar_swpDfrx,eTX_frxD02_03d(:,8)/e0_frx,'--k','LineWidth',3)
% par 03
semilogx(tStar_swpDfrx,eTX_frxD03_03d(:,1)/e0_frx,'.r','LineWidth',3)
semilogx(tStar_swpDfrx,eTX_frxD03_03d(:,2)/e0_frx,'.b','LineWidth',3)
semilogx(tStar_swpDfrx,eTX_frxD03_03d(:,3)/e0_frx,'.g','LineWidth',3)
semilogx(tStar_swpDfrx,eTX_frxD03_03d(:,4)/e0_frx,'.m','LineWidth',3)
semilogx(tStar_swpDfrx,eTX_frxD03_03d(:,5)/e0_frx,'.c','LineWidth',3)
semilogx(tStar_swpDfrx,eTX_frxD03_03d(:,6)/e0_frx,'.y','LineWidth',3)
semilogx(tStar_swpDfrx,eTX_frxD03_03d(:,8)/e0_frx,'.k','LineWidth',3);hold off;grid on;
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
print(fig,'01a_CPT_swpDfrx_eTXmag.pdf','-dpdf','-r0')
print(fig,'01a_CPT_swpDfrx_eTXmag.tif','-dtiff','-r0')

% ===============================================================================================%
% X-Tilt Rate - Semilogx (Dimensionless)
% ===============================================================================================%
fig = figure('Name','sweepDfrx_eTXrate','NumberTitle','off');
% par 01
semilogx(tStar_swpDfrx,eTXrate_frxD01_03d(:,1)/e0_frx,'r','LineWidth',3);hold on
semilogx(tStar_swpDfrx,eTXrate_frxD01_03d(:,2)/e0_frx,'b','LineWidth',3)
semilogx(tStar_swpDfrx,eTXrate_frxD01_03d(:,3)/e0_frx,'g','LineWidth',3)
semilogx(tStar_swpDfrx,eTXrate_frxD01_03d(:,4)/e0_frx,'m','LineWidth',3)
semilogx(tStar_swpDfrx,eTXrate_frxD01_03d(:,5)/e0_frx,'c','LineWidth',3)
semilogx(tStar_swpDfrx,eTXrate_frxD01_03d(:,6)/e0_frx,'y','LineWidth',3)
semilogx(tStar_swpDfrx,eTXrate_frxD01_03d(:,8)/e0_frx,'k','LineWidth',3)
% par 02
semilogx(tStar_swpDfrx,eTXrate_frxD02_03d(:,1)/e0_frx,'--r','LineWidth',3)
semilogx(tStar_swpDfrx,eTXrate_frxD02_03d(:,2)/e0_frx,'--b','LineWidth',3)
semilogx(tStar_swpDfrx,eTXrate_frxD02_03d(:,3)/e0_frx,'--g','LineWidth',3)
semilogx(tStar_swpDfrx,eTXrate_frxD02_03d(:,4)/e0_frx,'--m','LineWidth',3)
semilogx(tStar_swpDfrx,eTXrate_frxD02_03d(:,5)/e0_frx,'--c','LineWidth',3)
semilogx(tStar_swpDfrx,eTXrate_frxD02_03d(:,6)/e0_frx,'--y','LineWidth',3)
semilogx(tStar_swpDfrx,eTXrate_frxD02_03d(:,8)/e0_frx,'--k','LineWidth',3)
% par 03
semilogx(tStar_swpDfrx,eTXrate_frxD03_03d(:,1)/e0_frx,'.r','LineWidth',3)
semilogx(tStar_swpDfrx,eTXrate_frxD03_03d(:,2)/e0_frx,'.b','LineWidth',3)
semilogx(tStar_swpDfrx,eTXrate_frxD03_03d(:,3)/e0_frx,'.g','LineWidth',3)
semilogx(tStar_swpDfrx,eTXrate_frxD03_03d(:,4)/e0_frx,'.m','LineWidth',3)
semilogx(tStar_swpDfrx,eTXrate_frxD03_03d(:,5)/e0_frx,'.c','LineWidth',3)
semilogx(tStar_swpDfrx,eTXrate_frxD03_03d(:,6)/e0_frx,'.y','LineWidth',3)
semilogx(tStar_swpDfrx,eTXrate_frxD03_03d(:,8)/e0_frx,'.k','LineWidth',3);hold off;grid on;
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
print(fig,'01a_CPT_swpDfrx_eTXrate.pdf','-dpdf','-r0')
print(fig,'01a_CPT_swpDfrx_eTXrate.tif','-dtiff','-r0')
% ===============================================================================================%
% ===============================================================================================%