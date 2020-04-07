%% plotModelData2D_HPT_swpDfrx_cTp
% Author: R. Moak
% Date: 03/25/20

%% Set Path to Output Folder
cd 'X:\Clemson\Thesis\Models\COMSOL\00_Simulations\LeakDetection\01_ConceptualModels\01a_LD_WDp2D_fS_XPTf\OutputPlots'
addpath('X:\Clemson\Thesis\Models\COMSOL\00_Simulations\LeakDetection\Analyses_All');
addpath('X:\Clemson\Thesis\Data\02_Avant\00_Example')

%% Load Plot Data and Formatting Variables
plotFormatting;
load('areal_strain_magspec');
load('sz_strain_magspec');

%% Scaling Parameters
% Define Parameters
alpha_b = 1;
p_inj = 1E5;
Pc = p_inj;
X_frx = ModelParams_sweepDfrx_cTp.X_frx;
X_conf = ModelParams_sweepDfrx_cTp.X_conf;

% Dimensionless Scaling
e0_frx = alpha_b*Pc*X_frx;
e0_conf = alpha_b*Pc*X_conf;

%% Magnitude Spectra Plots
% =============================================================================================== %
% PARAMETER 01: Magnitude Spectra - eXX
% =============================================================================================== %
figure('Name','sweepDfrx_eXXmagSpec','NumberTitle','off')
loglog(f_frxD01,eXXmagSpec_frxD01cTp_03d(:,1),'r','LineWidth',3);hold on
loglog(f_frxD01,eXXmagSpec_frxD01cTp_03d(:,2),'b','LineWidth',3)
loglog(f_frxD01,eXXmagSpec_frxD01cTp_03d(:,3),'g','LineWidth',3)
loglog(f_frxD01,eXXmagSpec_frxD01cTp_03d(:,4),'m','LineWidth',3)
loglog(f_frxD01,eXXmagSpec_frxD01cTp_03d(:,5),'c','LineWidth',3)
loglog(f_frxD01,eXXmagSpec_frxD01cTp_03d(:,6),'k','LineWidth',3);hold off; grid on
pbaspect([1 1 1])
% xlim([1E-2,1.25])
xlabel('frequency','FontSize',15)
ylabel('Magnitude','FontSize',15)
% legend('r = 5%', 'r = 25%', 'r = 50%', 'r = 100%','Location','NorthEast')
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_cTp_frxD01cTp_eXXmagSpec.pdf','-dpdf','-r0')
print(fig,'01a_HPT_cTp_frxD01cTp_eXXmagSpec.tif','-dtiff','-r0')

% =============================================================================================== %
% PARAMETER 02: Magnitude Spectra - eXX
% =============================================================================================== %
figure('Name','sweepDfrx_eXXmagSpec','NumberTitle','off')
loglog(f_frxD02,eXXmagSpec_frxD02cTp_03d(:,1),'r','LineWidth',3);hold on
loglog(f_frxD02,eXXmagSpec_frxD02cTp_03d(:,2),'b','LineWidth',3)
loglog(f_frxD02,eXXmagSpec_frxD02cTp_03d(:,3),'g','LineWidth',3)
loglog(f_frxD02,eXXmagSpec_frxD02cTp_03d(:,4),'m','LineWidth',3)
loglog(f_frxD02,eXXmagSpec_frxD02cTp_03d(:,5),'c','LineWidth',3)
loglog(f_frxD02,eXXmagSpec_frxD02cTp_03d(:,6),'k','LineWidth',3);hold off; grid on
pbaspect([1 1 1])
% xlim([1E-2,1.25])
xlabel('frequency','FontSize',15)
ylabel('Magnitude','FontSize',15)
% legend('r = 5%', 'r = 25%', 'r = 50%', 'r = 100%','Location','NorthEast')
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_cTp_frxD02cTp_eXXmagSpec.pdf','-dpdf','-r0')
print(fig,'01a_HPT_cTp_frxD02cTp_eXXmagSpec.tif','-dtiff','-r0')

% =============================================================================================== %
% PARAMETER 03: Magnitude Spectra - eXX
% =============================================================================================== %
figure('Name','sweepDfrx_eXXmagSpec','NumberTitle','off')
loglog(f_frxD03,eXXmagSpec_frxD03cTp_03d(:,1),'r','LineWidth',3);hold on
loglog(f_frxD03,eXXmagSpec_frxD03cTp_03d(:,2),'b','LineWidth',3)
loglog(f_frxD03,eXXmagSpec_frxD03cTp_03d(:,3),'g','LineWidth',3)
loglog(f_frxD03,eXXmagSpec_frxD03cTp_03d(:,4),'m','LineWidth',3)
loglog(f_frxD03,eXXmagSpec_frxD03cTp_03d(:,5),'c','LineWidth',3)
loglog(f_frxD03,eXXmagSpec_frxD03cTp_03d(:,6),'k','LineWidth',3);hold off; grid on
pbaspect([1 1 1])
% xlim([1E-2,1.25])
xlabel('frequency','FontSize',15)
ylabel('Magnitude','FontSize',15)
% legend('r = 5%', 'r = 25%', 'r = 50%', 'r = 100%','Location','NorthEast')
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_cTp_frxD03cTp_eXXmagSpec.pdf','-dpdf','-r0')
print(fig,'01a_HPT_cTp_frxD03cTp_eXXmagSpec.tif','-dtiff','-r0')

% =============================================================================================== %
% PARAMETER 04: Magnitude Spectra - eXX
% =============================================================================================== %
figure('Name','sweepDfrx_eXXmagSpec','NumberTitle','off')
loglog(f_frxD04,eXXmagSpec_frxD04cTp_03d(:,1),'r','LineWidth',3);hold on
loglog(f_frxD04,eXXmagSpec_frxD04cTp_03d(:,2),'b','LineWidth',3)
loglog(f_frxD04,eXXmagSpec_frxD04cTp_03d(:,3),'g','LineWidth',3)
loglog(f_frxD04,eXXmagSpec_frxD04cTp_03d(:,4),'m','LineWidth',3)
loglog(f_frxD04,eXXmagSpec_frxD04cTp_03d(:,5),'c','LineWidth',3)
loglog(f_frxD04,eXXmagSpec_frxD04cTp_03d(:,6),'k','LineWidth',3);hold off; grid on
pbaspect([1 1 1])
% xlim([1E-2,1.25])
xlabel('frequency','FontSize',15)
ylabel('Magnitude','FontSize',15)
% legend('r = 5%', 'r = 25%', 'r = 50%', 'r = 100%','Location','NorthEast')
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_cTp_frxD04cTp_eXXmagSpec.pdf','-dpdf','-r0')
print(fig,'01a_HPT_cTp_frxD04cTp_eXXmagSpec.tif','-dtiff','-r0')

% =============================================================================================== %
% PARAMETER 05: Magnitude Spectra - eXX
% =============================================================================================== %
figure('Name','sweepDfrx_eXXmagSpec','NumberTitle','off')
loglog(f_frxD05,eXXmagSpec_frxD05cTp_03d(:,1),'r','LineWidth',3);hold on
loglog(f_frxD05,eXXmagSpec_frxD05cTp_03d(:,2),'b','LineWidth',3)
loglog(f_frxD05,eXXmagSpec_frxD05cTp_03d(:,3),'g','LineWidth',3)
loglog(f_frxD05,eXXmagSpec_frxD05cTp_03d(:,4),'m','LineWidth',3)
loglog(f_frxD05,eXXmagSpec_frxD05cTp_03d(:,5),'c','LineWidth',3)
loglog(f_frxD05,eXXmagSpec_frxD05cTp_03d(:,6),'k','LineWidth',3);hold off; grid on
pbaspect([1 1 1])
% xlim([1E-2,1.25])
xlabel('frequency','FontSize',15)
ylabel('Magnitude','FontSize',15)
% legend('r = 5%', 'r = 25%', 'r = 50%', 'r = 100%','Location','NorthEast')
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_cTp_frxD05cTp_eXXmagSpec.pdf','-dpdf','-r0')
print(fig,'01a_HPT_cTp_frxD05cTp_eXXmagSpec.tif','-dtiff','-r0')

% =============================================================================================== %
% PARAMETER 06: Magnitude Spectra - eXX
% =============================================================================================== %
figure('Name','sweepDfrx_eXXmagSpec','NumberTitle','off')
loglog(f_frxD06,eXXmagSpec_frxD06cTp_03d(:,1),'r','LineWidth',3);hold on
loglog(f_frxD06,eXXmagSpec_frxD06cTp_03d(:,2),'b','LineWidth',3)
loglog(f_frxD06,eXXmagSpec_frxD06cTp_03d(:,3),'g','LineWidth',3)
loglog(f_frxD06,eXXmagSpec_frxD06cTp_03d(:,4),'m','LineWidth',3)
loglog(f_frxD06,eXXmagSpec_frxD06cTp_03d(:,5),'c','LineWidth',3)
loglog(f_frxD06,eXXmagSpec_frxD06cTp_03d(:,6),'k','LineWidth',3);hold off; grid on
pbaspect([1 1 1])
% xlim([1E-2,1.25])
xlabel('frequency','FontSize',15)
ylabel('Magnitude','FontSize',15)
% legend('r = 5%', 'r = 25%', 'r = 50%', 'r = 100%','Location','NorthEast')
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_cTp_frxD06cTp_eXXmagSpec.pdf','-dpdf','-r0')
print(fig,'01a_HPT_cTp_frxD06cTp_eXXmagSpec.tif','-dtiff','-r0')

% =============================================================================================== %
% PARAMETER 07: Magnitude Spectra - eXX
% =============================================================================================== %
figure('Name','sweepDfrx_eXXmagSpec','NumberTitle','off')
loglog(f_frxD07,eXXmagSpec_frxD07cTp_03d(:,1),'r','LineWidth',3);hold on
loglog(f_frxD07,eXXmagSpec_frxD07cTp_03d(:,2),'b','LineWidth',3)
loglog(f_frxD07,eXXmagSpec_frxD07cTp_03d(:,3),'g','LineWidth',3)
loglog(f_frxD07,eXXmagSpec_frxD07cTp_03d(:,4),'m','LineWidth',3)
loglog(f_frxD07,eXXmagSpec_frxD07cTp_03d(:,5),'c','LineWidth',3)
loglog(f_frxD07,eXXmagSpec_frxD07cTp_03d(:,6),'k','LineWidth',3);hold off; grid on
pbaspect([1 1 1])
% xlim([1E-2,1.25])
xlabel('frequency','FontSize',15)
ylabel('Magnitude','FontSize',15)
% legend('r = 5%', 'r = 25%', 'r = 50%', 'r = 100%','Location','NorthEast')
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_frxD07cTp_eXXmagSpec.pdf','-dpdf','-r0')
print(fig,'01a_HPT_frxD07cTp_eXXmagSpec.tif','-dtiff','-r0')

% =============================================================================================== %
% PARAMETER 08: Magnitude Spectra - eXX
% =============================================================================================== %
figure('Name','sweepDfrx_eXXmagSpec','NumberTitle','off')
loglog(f_frxD08,eXXmagSpec_frxD08cTp_03d(:,1),'r','LineWidth',3);hold on
loglog(f_frxD08,eXXmagSpec_frxD08cTp_03d(:,2),'b','LineWidth',3)
loglog(f_frxD08,eXXmagSpec_frxD08cTp_03d(:,3),'g','LineWidth',3)
loglog(f_frxD08,eXXmagSpec_frxD08cTp_03d(:,4),'m','LineWidth',3)
loglog(f_frxD08,eXXmagSpec_frxD08cTp_03d(:,5),'c','LineWidth',3)
loglog(f_frxD08,eXXmagSpec_frxD08cTp_03d(:,6),'k','LineWidth',3);hold off; grid on
pbaspect([1 1 1])
% xlim([1E-2,1.25])
xlabel('frequency','FontSize',15)
ylabel('Magnitude','FontSize',15)
% legend('r = 5%', 'r = 25%', 'r = 50%', 'r = 100%','Location','NorthEast')
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_frxD08cTp_eXXmagSpec.pdf','-dpdf','-r0')
print(fig,'01a_HPT_frxD08cTp_eXXmagSpec.tif','-dtiff','-r0')

% =============================================================================================== %
% PARAMETER 09: Magnitude Spectra - eXX
% =============================================================================================== %
figure('Name','sweepDfrx_eXXmagSpec','NumberTitle','off')
loglog(f_frxD09,eXXmagSpec_frxD09cTp_03d(:,1),'r','LineWidth',3);hold on
loglog(f_frxD09,eXXmagSpec_frxD09cTp_03d(:,2),'b','LineWidth',3)
loglog(f_frxD09,eXXmagSpec_frxD09cTp_03d(:,3),'g','LineWidth',3)
loglog(f_frxD09,eXXmagSpec_frxD09cTp_03d(:,4),'m','LineWidth',3)
loglog(f_frxD09,eXXmagSpec_frxD09cTp_03d(:,5),'c','LineWidth',3)
loglog(f_frxD09,eXXmagSpec_frxD09cTp_03d(:,6),'k','LineWidth',3);hold off; grid on
pbaspect([1 1 1])
% xlim([1E-2,1.25])
xlabel('frequency','FontSize',15)
ylabel('Magnitude','FontSize',15)
% legend('r = 5%', 'r = 25%', 'r = 50%', 'r = 100%','Location','NorthEast')
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_cTp_frxD09cTp_eXXmagSpec.pdf','-dpdf','-r0')
print(fig,'01a_HPT_cTp_frxD09cTp_eXXmagSpec.tif','-dtiff','-r0')

% =============================================================================================== %
% PARAMETER 10: Magnitude Spectra - eXX
% =============================================================================================== %
figure('Name','sweepDfrx_eXXmagSpec','NumberTitle','off')
loglog(f_frxD10,eXXmagSpec_frxD10cTp_03d(:,1),'r','LineWidth',3);hold on
loglog(f_frxD10,eXXmagSpec_frxD10cTp_03d(:,2),'b','LineWidth',3)
loglog(f_frxD10,eXXmagSpec_frxD10cTp_03d(:,3),'g','LineWidth',3)
loglog(f_frxD10,eXXmagSpec_frxD10cTp_03d(:,4),'m','LineWidth',3)
loglog(f_frxD10,eXXmagSpec_frxD10cTp_03d(:,5),'c','LineWidth',3)
loglog(f_frxD10,eXXmagSpec_frxD10cTp_03d(:,6),'k','LineWidth',3);hold off; grid on
pbaspect([1 1 1])
% xlim([1E-2,1.25])
xlabel('frequency','FontSize',15)
ylabel('Magnitude','FontSize',15)
% legend('r = 5%', 'r = 25%', 'r = 50%', 'r = 100%','Location','NorthEast')
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_frxD10cTp_eXXmagSpec.pdf','-dpdf','-r0')
print(fig,'01a_HPT_frxD10cTp_eXXmagSpec.tif','-dtiff','-r0')


%% Magnitude Spectra as function of Distance

% =============================================================================================== %
% PARAMETER 01: Magnitude Spectra - eXX
% =============================================================================================== %
figure('Name','frxD01_eXXmagSpecMaxDist','NumberTitle','off')
plot(r/x_c,eXXmagSpecMax_frxD01cTp_03d,'xr','MarkerSize',15,'LineWidth',3);grid on;
pbaspect([1 1 1])
xlabel('x*','FontSize',15)
ylabel('Magnitude','FontSize',15)
% legend('D01','FontSize',15,'Location','SouthWest')
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_cTp_frxD01cTp_eXXmagSpecDist.pdf','-dpdf','-r0')
print(fig,'01a_HPT_cTp_frxD01cTp_eXXmagSpecDist.tif','-dtiff','-r0')

% =============================================================================================== %
% PARAMETER 02: Magnitude Spectra - eXX
% =============================================================================================== %
figure('Name','frxD02_eXXmagSpecMaxDist','NumberTitle','off')
plot(r/x_c,eXXmagSpecMax_frxD02cTp_03d,'xb','MarkerSize',15,'LineWidth',3);grid on;
pbaspect([1 1 1])
xlabel('x*','FontSize',15)
ylabel('Magnitude','FontSize',15)
% legend('D02','FontSize',15,'Location','SouthWest')
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_cTp_frxD02cTp_eXXmagSpecDist.pdf','-dpdf','-r0')
print(fig,'01a_HPT_cTp_frxD02cTp_eXXmagSpecDist.tif','-dtiff','-r0')

% =============================================================================================== %
% PARAMETER 03: Magnitude Spectra - eXX
% =============================================================================================== %
figure('Name','frxD03_eXXmagSpecMaxDist','NumberTitle','off')
plot(r/x_c,eXXmagSpecMax_frxD03cTp_03d,'xg','MarkerSize',15,'LineWidth',3);grid on;
pbaspect([1 1 1])
xlabel('x*','FontSize',15)
ylabel('Magnitude','FontSize',15)
% legend('D03','FontSize',15,'Location','SouthWest')
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_cTp_frxD03cTp_eXXmagSpecDist.pdf','-dpdf','-r0')
print(fig,'01a_HPT_cTp_frxD03cTp_eXXmagSpecDist.tif','-dtiff','-r0')

% =============================================================================================== %
% PARAMETER 04: Magnitude Spectra - eXX
% =============================================================================================== %
figure('Name','frxD04_eXXmagSpecMaxDist','NumberTitle','off')
plot(r/x_c,eXXmagSpecMax_frxD04cTp_03d,'xm','MarkerSize',15,'LineWidth',3);grid on;
pbaspect([1 1 1])
xlabel('x*','FontSize',15)
ylabel('Magnitude','FontSize',15)
% legend('D04','FontSize',15,'Location','SouthWest')
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_cTp_frxD04cTp_eXXmagSpecDist.pdf','-dpdf','-r0')
print(fig,'01a_HPT_cTp_frxD04cTp_eXXmagSpecDist.tif','-dtiff','-r0')

% =============================================================================================== %
% PARAMETER 05: Magnitude Spectra - eXX
% =============================================================================================== %
figure('Name','frxD05_eXXmagSpecMaxDist','NumberTitle','off')
plot(r/x_c,eXXmagSpecMax_frxD05cTp_03d,'xc','MarkerSize',15,'LineWidth',3);grid on;
pbaspect([1 1 1])
xlabel('x*','FontSize',15)
ylabel('Magnitude','FontSize',15)
% legend('D05','FontSize',15,'Location','SouthWest')
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_cTp_frxD05cTp_eXXmagSpecDist.pdf','-dpdf','-r0')
print(fig,'01a_HPT_cTp_frxD05cTp_eXXmagSpecDist.tif','-dtiff','-r0')

% =============================================================================================== %
% PARAMETER 06: Magnitude Spectra - eXX
% =============================================================================================== %
figure('Name','frxD06_eXXmagSpecMaxDist','NumberTitle','off')
plot(r/x_c,eXXmagSpecMax_frxD06cTp_03d,'xk','MarkerSize',15,'LineWidth',3);grid on;
pbaspect([1 1 1])
xlabel('x*','FontSize',15)
ylabel('Magnitude','FontSize',15)
% legend('D06','FontSize',15,'Location','SouthWest')
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_cTp_frxD06cTp_eXXmagSpecDist.pdf','-dpdf','-r0')
print(fig,'01a_HPT_cTp_frxD06cTp_eXXmagSpecDist.tif','-dtiff','-r0')

% =============================================================================================== %
% PARAMETER 07: Magnitude Spectra - eXX
% =============================================================================================== %
figure('Name','frxD07_eXXmagSpecMaxDist','NumberTitle','off')
plot(r/x_c,eXXmagSpecMax_frxD07cTp_03d,'xr','MarkerSize',15,'LineWidth',3);grid on;
pbaspect([1 1 1])
xlabel('x*','FontSize',15)
ylabel('Magnitude','FontSize',15)
% legend('D07','FontSize',15,'Location','SouthWest')
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_cTp_frxD07cTp_eXXmagSpecDist.pdf','-dpdf','-r0')
print(fig,'01a_HPT_cTp_frxD07cTp_eXXmagSpecDist.tif','-dtiff','-r0')

% =============================================================================================== %
% PARAMETER 08: Magnitude Spectra - eXX
% =============================================================================================== %
figure('Name','frxD08_eXXmagSpecMaxDist','NumberTitle','off')
plot(r/x_c,eXXmagSpecMax_frxD08cTp_03d,'xb','MarkerSize',15,'LineWidth',3);grid on;
pbaspect([1 1 1])
xlabel('x*','FontSize',15)
ylabel('Magnitude','FontSize',15)
% legend('D08','FontSize',15,'Location','SouthWest')
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_cTp_frxD08cTp_eXXmagSpecDist.pdf','-dpdf','-r0')
print(fig,'01a_HPT_cTp_frxD08cTp_eXXmagSpecDist.tif','-dtiff','-r0')

% =============================================================================================== %
% PARAMETER 09: Magnitude Spectra - eXX
% =============================================================================================== %
figure('Name','frxD09_eXXmagSpecMaxDist','NumberTitle','off')
plot(r/x_c,eXXmagSpecMax_frxD09cTp_03d,'xg','MarkerSize',15,'LineWidth',3);grid on;
pbaspect([1 1 1])
xlabel('x*','FontSize',15)
ylabel('Magnitude','FontSize',15)
% legend('D09','FontSize',15,'Location','SouthWest')
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_cTp_frxD09cTp_eXXmagSpecDist.pdf','-dpdf','-r0')
print(fig,'01a_HPT_cTp_frxD09cTp_eXXmagSpecDist.tif','-dtiff','-r0')

% =============================================================================================== %
% PARAMETER 10: Magnitude Spectra - eXX
% =============================================================================================== %
figure('Name','frxD10_eXXmagSpecMaxDist','NumberTitle','off')
plot(r/x_c,eXXmagSpecMax_frxD10cTp_03d,'xm','MarkerSize',15,'LineWidth',3);grid on;
pbaspect([1 1 1])
xlabel('x*','FontSize',15)
ylabel('Magnitude','FontSize',15)
% legend('D10','FontSize',15,'Location','SouthWest')
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_cTp_frxD10cTp_eXXmagSpecDist.pdf','-dpdf','-r0')
print(fig,'01a_HPT_cTp_frxD10cTp_eXXmagSpecDist.tif','-dtiff','-r0')

% =============================================================================================== %
% ALL PARAMETERS: Magnitude Spectra - eXX
% =============================================================================================== %
figure('Name','sweepDfrx_eXXmagSpecMaxDist','NumberTitle','off')
plot(r/x_c,eXXmagSpecMax_frxD01cTp_03d,'x','MarkerSize',15,'LineWidth',3);hold on;
plot(r/x_c,eXXmagSpecMax_frxD02cTp_03d,'x','MarkerSize',15,'LineWidth',3)
plot(r/x_c,eXXmagSpecMax_frxD03cTp_03d,'x','MarkerSize',15,'LineWidth',3)
plot(r/x_c,eXXmagSpecMax_frxD04cTp_03d,'x','MarkerSize',15,'LineWidth',3)
plot(r/x_c,eXXmagSpecMax_frxD05cTp_03d,'x','MarkerSize',15,'LineWidth',3)
plot(r/x_c,eXXmagSpecMax_frxD06cTp_03d,'x','MarkerSize',15,'LineWidth',3)
plot(r/x_c,eXXmagSpecMax_frxD07cTp_03d,'x','MarkerSize',15,'LineWidth',3)
plot(r/x_c,eXXmagSpecMax_frxD08cTp_03d,'x','MarkerSize',15,'LineWidth',3)
plot(r/x_c,eXXmagSpecMax_frxD09cTp_03d,'x','MarkerSize',15,'LineWidth',3)
plot(r/x_c,eXXmagSpecMax_frxD10cTp_03d,'x','MarkerSize',15,'LineWidth',3);hold off;grid on;
pbaspect([1 1 1])
xlabel('x*','FontSize',15)
ylabel('Magnitude','FontSize',15)
% legend('D01','D02','D03','D04','D05','D06','D07','D08','D09','D10','FontSize',15)
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_cTp_swpDfrx_eXXmagSpecDist.pdf','-dpdf','-r0')
print(fig,'01a_HPT_cTp_swpDfrx_eXXmagSpecDist.tif','-dtiff','-r0')

%% Magnitude Spectra as function of Fracture Diffusivity
% =============================================================================================== %
% 05w03d: Magnitude Spectra - eXX
% =============================================================================================== %
figure('Name','05w03d_sweepDfrx_eXXmagSpec','NumberTitle','off')
plot(ModelParams_sweepDfrx_cTp(1).D01_frx,eXXmagSpecMax_frxD01cTp_03d(1),'x','MarkerSize',15,'LineWidth',3);hold on;
plot(ModelParams_sweepDfrx_cTp(1).D02_frx,eXXmagSpecMax_frxD02cTp_03d(1),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx_cTp(1).D03_frx,eXXmagSpecMax_frxD03cTp_03d(1),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx_cTp(1).D04_frx,eXXmagSpecMax_frxD04cTp_03d(1),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx_cTp(1).D05_frx,eXXmagSpecMax_frxD05cTp_03d(1),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx_cTp(1).D06_frx,eXXmagSpecMax_frxD06cTp_03d(1),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx_cTp(1).D07_frx,eXXmagSpecMax_frxD07cTp_03d(1),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx_cTp(1).D08_frx,eXXmagSpecMax_frxD08cTp_03d(1),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx_cTp(1).D09_frx,eXXmagSpecMax_frxD09cTp_03d(1),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx_cTp(1).D10_frx,eXXmagSpecMax_frxD10cTp_03d(1),'x','MarkerSize',15,'LineWidth',3);hold off;grid on;
pbaspect([1 1 1])
xlabel('Diffusivity [m^{2}/s]','FontSize',15)
ylabel('Magnitude','FontSize',15)
% legend('D01','D02','D03','D04','D05','D06','D07','D08','D09','D10','FontSize',15,'Location','SouthEast')
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_cTp_eXXmagSpec_05w03d.pdf','-dpdf','-r0')
print(fig,'01a_HPT_cTp_eXXmagSpec_05w03d.tif','-dtiff','-r0')

% =============================================================================================== %
% 25w03d: Magnitude Spectra - eXX
% =============================================================================================== %
figure('Name','25w03d_sweepDfrx_eXXmagSpec','NumberTitle','off')
plot(ModelParams_sweepDfrx_cTp(1).D01_frx,eXXmagSpecMax_frxD01cTp_03d(2),'x','MarkerSize',15,'LineWidth',3);hold on;
plot(ModelParams_sweepDfrx_cTp(1).D02_frx,eXXmagSpecMax_frxD02cTp_03d(2),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx_cTp(1).D03_frx,eXXmagSpecMax_frxD03cTp_03d(2),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx_cTp(1).D04_frx,eXXmagSpecMax_frxD04cTp_03d(2),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx_cTp(1).D05_frx,eXXmagSpecMax_frxD05cTp_03d(2),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx_cTp(1).D06_frx,eXXmagSpecMax_frxD06cTp_03d(2),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx_cTp(1).D07_frx,eXXmagSpecMax_frxD07cTp_03d(2),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx_cTp(1).D08_frx,eXXmagSpecMax_frxD08cTp_03d(2),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx_cTp(1).D09_frx,eXXmagSpecMax_frxD09cTp_03d(2),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx_cTp(1).D10_frx,eXXmagSpecMax_frxD10cTp_03d(2),'x','MarkerSize',15,'LineWidth',3);hold off;grid on;
pbaspect([1 1 1])
xlabel('Diffusivity [m^{2}/s]','FontSize',15)
ylabel('Magnitude','FontSize',15)
% legend('D01','D02','D03','D04','D05','D06','D07','D08','D09','D10','FontSize',15,'Location','SouthEast')
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_cTp_eXXmagSpec_25w03d.pdf','-dpdf','-r0')
print(fig,'01a_HPT_cTp_eXXmagSpec_25w03d.tif','-dtiff','-r0')

% =============================================================================================== %
% 50w03d: Magnitude Spectra - eXX
% =============================================================================================== %
figure('Name','50w03d_sweepDfrx_eXXmagSpec','NumberTitle','off')
plot(ModelParams_sweepDfrx_cTp(1).D01_frx,eXXmagSpecMax_frxD01cTp_03d(3),'x','MarkerSize',15,'LineWidth',3);hold on;
plot(ModelParams_sweepDfrx_cTp(1).D02_frx,eXXmagSpecMax_frxD02cTp_03d(3),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx_cTp(1).D03_frx,eXXmagSpecMax_frxD03cTp_03d(3),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx_cTp(1).D04_frx,eXXmagSpecMax_frxD04cTp_03d(3),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx_cTp(1).D05_frx,eXXmagSpecMax_frxD05cTp_03d(3),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx_cTp(1).D06_frx,eXXmagSpecMax_frxD06cTp_03d(3),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx_cTp(1).D07_frx,eXXmagSpecMax_frxD07cTp_03d(3),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx_cTp(1).D08_frx,eXXmagSpecMax_frxD08cTp_03d(3),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx_cTp(1).D09_frx,eXXmagSpecMax_frxD09cTp_03d(3),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx_cTp(1).D10_frx,eXXmagSpecMax_frxD10cTp_03d(3),'x','MarkerSize',15,'LineWidth',3);hold off;grid on;
pbaspect([1 1 1])
xlabel('Diffusivity [m^{2}/s]','FontSize',15)
ylabel('Magnitude','FontSize',15)
% legend('D01','D02','D03','D04','D05','D06','D07','D08','D09','D10','FontSize',15,'Location','SouthEast')
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_cTp_eXXmagSpec_50w03d.pdf','-dpdf','-r0')
print(fig,'01a_HPT_cTp_eXXmagSpec_50w03d.tif','-dtiff','-r0')

% =============================================================================================== %
% 100w03d: Magnitude Spectra - eXX
% =============================================================================================== %
figure('Name','100w03d_sweepDfrx_eXXmagSpec','NumberTitle','off')
plot(ModelParams_sweepDfrx_cTp(1).D01_frx,eXXmagSpecMax_frxD01cTp_03d(4),'x','MarkerSize',15,'LineWidth',3);hold on;
plot(ModelParams_sweepDfrx_cTp(1).D02_frx,eXXmagSpecMax_frxD02cTp_03d(4),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx_cTp(1).D03_frx,eXXmagSpecMax_frxD03cTp_03d(4),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx_cTp(1).D04_frx,eXXmagSpecMax_frxD04cTp_03d(4),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx_cTp(1).D05_frx,eXXmagSpecMax_frxD05cTp_03d(4),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx_cTp(1).D06_frx,eXXmagSpecMax_frxD06cTp_03d(4),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx_cTp(1).D07_frx,eXXmagSpecMax_frxD07cTp_03d(4),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx_cTp(1).D08_frx,eXXmagSpecMax_frxD08cTp_03d(4),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx_cTp(1).D09_frx,eXXmagSpecMax_frxD09cTp_03d(4),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx_cTp(1).D10_frx,eXXmagSpecMax_frxD10cTp_03d(4),'x','MarkerSize',15,'LineWidth',3);hold off;grid on;
pbaspect([1 1 1])
xlabel('Diffusivity [m^{2}/s]','FontSize',15)
ylabel('Magnitude','FontSize',15)
% legend('D01','D02','D03','D04','D05','D06','D07','D08','D09','D10','FontSize',15,'Location','SouthEast')
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_cTp_eXXmagSpec_100w03d.pdf','-dpdf','-r0')
print(fig,'01a_HPT_cTp_eXXmagSpec_100w03d.tif','-dtiff','-r0')

% =============================================================================================== %
% ALL LOCATIONS: Magnitude Spectra - eXX
% =============================================================================================== %
figure('Name','allLocations_eXXmagSpec','NumberTitle','off')
subplot(2,2,1)
plot(ModelParams_sweepDfrx_cTp(1).D01_frx,eXXmagSpecMax_frxD01cTp_03d(1),'x','MarkerSize',15,'LineWidth',3);hold on;
plot(ModelParams_sweepDfrx_cTp(1).D02_frx,eXXmagSpecMax_frxD02cTp_03d(1),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx_cTp(1).D03_frx,eXXmagSpecMax_frxD03cTp_03d(1),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx_cTp(1).D04_frx,eXXmagSpecMax_frxD04cTp_03d(1),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx_cTp(1).D05_frx,eXXmagSpecMax_frxD05cTp_03d(1),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx_cTp(1).D06_frx,eXXmagSpecMax_frxD06cTp_03d(1),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx_cTp(1).D07_frx,eXXmagSpecMax_frxD07cTp_03d(1),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx_cTp(1).D08_frx,eXXmagSpecMax_frxD08cTp_03d(1),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx_cTp(1).D09_frx,eXXmagSpecMax_frxD09cTp_03d(1),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx_cTp(1).D10_frx,eXXmagSpecMax_frxD10cTp_03d(1),'x','MarkerSize',15,'LineWidth',3);hold off;grid on;
pbaspect([1 1 1])
xlabel('Diffusivity [m^{2}/s]','FontSize',15)
ylabel('Magnitude','FontSize',15)
title('05w03d')
subplot(2,2,2)
plot(ModelParams_sweepDfrx_cTp(1).D01_frx,eXXmagSpecMax_frxD01cTp_03d(2),'x','MarkerSize',15,'LineWidth',3);hold on;
plot(ModelParams_sweepDfrx_cTp(1).D02_frx,eXXmagSpecMax_frxD02cTp_03d(2),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx_cTp(1).D03_frx,eXXmagSpecMax_frxD03cTp_03d(2),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx_cTp(1).D04_frx,eXXmagSpecMax_frxD04cTp_03d(2),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx_cTp(1).D05_frx,eXXmagSpecMax_frxD05cTp_03d(2),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx_cTp(1).D06_frx,eXXmagSpecMax_frxD06cTp_03d(2),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx_cTp(1).D07_frx,eXXmagSpecMax_frxD07cTp_03d(2),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx_cTp(1).D08_frx,eXXmagSpecMax_frxD08cTp_03d(2),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx_cTp(1).D09_frx,eXXmagSpecMax_frxD09cTp_03d(2),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx_cTp(1).D10_frx,eXXmagSpecMax_frxD10cTp_03d(2),'x','MarkerSize',15,'LineWidth',3);hold off;grid on;
pbaspect([1 1 1])
xlabel('Diffusivity [m^{2}/s]','FontSize',15)
ylabel('Magnitude','FontSize',15)
title('25w03d')
subplot(2,2,3)
plot(ModelParams_sweepDfrx_cTp(1).D01_frx,eXXmagSpecMax_frxD01cTp_03d(3),'x','MarkerSize',15,'LineWidth',3);hold on;
plot(ModelParams_sweepDfrx_cTp(1).D02_frx,eXXmagSpecMax_frxD02cTp_03d(3),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx_cTp(1).D03_frx,eXXmagSpecMax_frxD03cTp_03d(3),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx_cTp(1).D04_frx,eXXmagSpecMax_frxD04cTp_03d(3),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx_cTp(1).D05_frx,eXXmagSpecMax_frxD05cTp_03d(3),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx_cTp(1).D06_frx,eXXmagSpecMax_frxD06cTp_03d(3),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx_cTp(1).D07_frx,eXXmagSpecMax_frxD07cTp_03d(3),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx_cTp(1).D08_frx,eXXmagSpecMax_frxD08cTp_03d(3),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx_cTp(1).D09_frx,eXXmagSpecMax_frxD09cTp_03d(3),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx_cTp(1).D10_frx,eXXmagSpecMax_frxD10cTp_03d(3),'x','MarkerSize',15,'LineWidth',3);hold off;grid on;
pbaspect([1 1 1])
xlabel('Diffusivity [m^{2}/s]','FontSize',15)
ylabel('Magnitude','FontSize',15)
title('50w03d')
subplot(2,2,4)
plot(ModelParams_sweepDfrx_cTp(1).D01_frx,eXXmagSpecMax_frxD01cTp_03d(4),'x','MarkerSize',15,'LineWidth',3);hold on;
plot(ModelParams_sweepDfrx_cTp(1).D02_frx,eXXmagSpecMax_frxD02cTp_03d(4),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx_cTp(1).D03_frx,eXXmagSpecMax_frxD03cTp_03d(4),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx_cTp(1).D04_frx,eXXmagSpecMax_frxD04cTp_03d(4),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx_cTp(1).D05_frx,eXXmagSpecMax_frxD05cTp_03d(4),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx_cTp(1).D06_frx,eXXmagSpecMax_frxD06cTp_03d(4),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx_cTp(1).D07_frx,eXXmagSpecMax_frxD07cTp_03d(4),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx_cTp(1).D08_frx,eXXmagSpecMax_frxD08cTp_03d(4),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx_cTp(1).D09_frx,eXXmagSpecMax_frxD09cTp_03d(4),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx_cTp(1).D10_frx,eXXmagSpecMax_frxD10cTp_03d(4),'x','MarkerSize',15,'LineWidth',3);hold off;grid on;
pbaspect([1 1 1])
xlabel('Diffusivity [m^{2}/s]','FontSize',15)
ylabel('Magnitude','FontSize',15)
title('100w03d')
% % legend('D01','D02','D03','D04','D05','D06','D07','D08','D09','D10','FontSize',15,'Location','SouthEast')
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_2by2 paperSizeH_2by2];
fig.PaperPosition = [0 0 paperSizeW_2by2 paperSizeH_2by2];
print(fig,'01a_HPT_cTp_eXXmagSpec_allProbes.pdf','-dpdf','-r0')
print(fig,'01a_HPT_cTp_eXXmagSpec_allProbes.tif','-dtiff','-r0')

%% Detectability of Magnitude Spectra

% =============================================================================================== %
% PARAMETER 01: eXX Detectability 
% =============================================================================================== %
figure('Name','eXXmagSpecDet_D01','NumberTitle','off')
loglog(1/cTp_frxD01,eXXmagSpecMax_frxD01cTp_03d(:,1),'x','LineWidth',3);hold on
loglog(1/cTp_frxD01,eXXmagSpecMax_frxD01cTp_03d(:,2),'x','LineWidth',3)
loglog(1/cTp_frxD01,eXXmagSpecMax_frxD01cTp_03d(:,3),'x','LineWidth',3)
loglog(1/cTp_frxD01,eXXmagSpecMax_frxD01cTp_03d(:,4),'x','LineWidth',3)
loglog(1/cTp_frxD01,eXXmagSpecMax_frxD01cTp_03d(:,5),'x','LineWidth',3)
loglog(1/cTp_frxD01,eXXmagSpecMax_frxD01cTp_03d(:,6),'x','LineWidth',3)
loglog(f,ofsa)
loglog(f,gtsv);hold off; grid on 
pbaspect([1 1 1])
xlim([1E-8,1E-3])
ylim([1E-14,1E-8])
xlabel('frequency','FontSize',15)
ylabel('Magnitude','FontSize',15)
% legend('5%','25%','50%','100%','FontSize',15,'Location','SouthWest')
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_cTp_eXXmagSpecDet_D01.pdf','-dpdf','-r0')
print(fig,'01a_HPT_cTp_eXXmagSpecDet_D01.tif','-dtiff','-r0')

% =============================================================================================== %
% PARAMETER 02: eXX Detectability 
% =============================================================================================== %
figure('Name','eXXmagSpecDet_D02','NumberTitle','off')
loglog(1/cTp_frxD02,eXXmagSpecMax_frxD02cTp_03d(:,1),'x','LineWidth',3);hold on
loglog(1/cTp_frxD02,eXXmagSpecMax_frxD02cTp_03d(:,2),'x','LineWidth',3)
loglog(1/cTp_frxD02,eXXmagSpecMax_frxD02cTp_03d(:,3),'x','LineWidth',3)
loglog(1/cTp_frxD02,eXXmagSpecMax_frxD02cTp_03d(:,4),'x','LineWidth',3)
loglog(1/cTp_frxD02,eXXmagSpecMax_frxD02cTp_03d(:,5),'x','LineWidth',3)
loglog(1/cTp_frxD02,eXXmagSpecMax_frxD02cTp_03d(:,6),'x','LineWidth',3)
loglog(f,ofsa)
loglog(f,gtsv);hold off; grid on 
pbaspect([1 1 1])
xlim([1E-8,1E-3])
ylim([1E-14,1E-8])
xlabel('frequency','FontSize',15)
ylabel('Magnitude','FontSize',15)
% legend('5%','25%','50%','100%','FontSize',15,'Location','SouthWest')
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_cTp_eXXmagSpecDet_D02.pdf','-dpdf','-r0')
print(fig,'01a_HPT_cTp_eXXmagSpecDet_D02.tif','-dtiff','-r0')

% =============================================================================================== %
% PARAMETER 03: eXX Detectability 
% =============================================================================================== %
figure('Name','eXXmagSpecDet_D03','NumberTitle','off')
loglog(1/cTp_frxD03,eXXmagSpecMax_frxD03cTp_03d(:,1),'x','LineWidth',3);hold on
loglog(1/cTp_frxD03,eXXmagSpecMax_frxD03cTp_03d(:,2),'x','LineWidth',3)
loglog(1/cTp_frxD03,eXXmagSpecMax_frxD03cTp_03d(:,3),'x','LineWidth',3)
loglog(1/cTp_frxD03,eXXmagSpecMax_frxD03cTp_03d(:,4),'x','LineWidth',3)
loglog(1/cTp_frxD03,eXXmagSpecMax_frxD03cTp_03d(:,5),'x','LineWidth',3)
loglog(1/cTp_frxD03,eXXmagSpecMax_frxD03cTp_03d(:,6),'x','LineWidth',3)
loglog(f,ofsa)
loglog(f,gtsv);hold off; grid on 
pbaspect([1 1 1])
xlim([1E-8,1E-3])
ylim([1E-14,1E-8])
xlabel('frequency','FontSize',15)
ylabel('Magnitude','FontSize',15)
% legend('5%','25%','50%','100%','FontSize',15,'Location','SouthWest')
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_cTp_eXXmagSpecDet_D03.pdf','-dpdf','-r0')
print(fig,'01a_HPT_cTp_eXXmagSpecDet_D03.tif','-dtiff','-r0')
% =============================================================================================== %
% PARAMETER 04: eXX Detectability 
% =============================================================================================== %
figure('Name','eXXmagSpecDet_D04','NumberTitle','off')
loglog(1/cTp_frxD04,eXXmagSpecMax_frxD04cTp_03d(:,1),'x','LineWidth',3);hold on
loglog(1/cTp_frxD04,eXXmagSpecMax_frxD04cTp_03d(:,2),'x','LineWidth',3)
loglog(1/cTp_frxD04,eXXmagSpecMax_frxD04cTp_03d(:,3),'x','LineWidth',3)
loglog(1/cTp_frxD04,eXXmagSpecMax_frxD04cTp_03d(:,4),'x','LineWidth',3)
loglog(1/cTp_frxD04,eXXmagSpecMax_frxD04cTp_03d(:,5),'x','LineWidth',3)
loglog(1/cTp_frxD04,eXXmagSpecMax_frxD04cTp_03d(:,6),'x','LineWidth',3)
loglog(f,ofsa)
loglog(f,gtsv);hold off; grid on 
pbaspect([1 1 1])
xlim([1E-8,1E-3])
ylim([1E-14,1E-8])
xlabel('frequency','FontSize',15)
ylabel('Magnitude','FontSize',15)
% legend('5%','25%','50%','100%','FontSize',15,'Location','SouthWest')
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_cTp_eXXmagSpecDet_D04.pdf','-dpdf','-r0')
print(fig,'01a_HPT_cTp_eXXmagSpecDet_D04.tif','-dtiff','-r0')

% =============================================================================================== %
% PARAMETER 05: eXX Detectability 
% =============================================================================================== %
figure('Name','eXXmagSpecDet_D05','NumberTitle','off')
loglog(1/cTp_frxD05,eXXmagSpecMax_frxD05cTp_03d(:,1),'x','LineWidth',3);hold on
loglog(1/cTp_frxD05,eXXmagSpecMax_frxD05cTp_03d(:,2),'x','LineWidth',3)
loglog(1/cTp_frxD05,eXXmagSpecMax_frxD05cTp_03d(:,3),'x','LineWidth',3)
loglog(1/cTp_frxD05,eXXmagSpecMax_frxD05cTp_03d(:,4),'x','LineWidth',3)
loglog(1/cTp_frxD05,eXXmagSpecMax_frxD05cTp_03d(:,5),'x','LineWidth',3)
loglog(1/cTp_frxD05,eXXmagSpecMax_frxD05cTp_03d(:,6),'x','LineWidth',3)
loglog(f,ofsa)
loglog(f,gtsv);hold off; grid on 
pbaspect([1 1 1])
xlim([1E-8,1E-3])
ylim([1E-14,1E-8])
xlabel('frequency','FontSize',15)
ylabel('Magnitude','FontSize',15)
% legend('5%','25%','50%','100%','FontSize',15,'Location','SouthWest')
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_cTp_eXXmagSpecDet_D05.pdf','-dpdf','-r0')
print(fig,'01a_HPT_cTp_eXXmagSpecDet_D05.tif','-dtiff','-r0')
% =============================================================================================== %
% PARAMETER 06: eXX Detectability 
% =============================================================================================== %
figure('Name','eXXmagSpecDet_D06','NumberTitle','off')
loglog(1/cTp_frxD06,eXXmagSpecMax_frxD06cTp_03d(:,1),'x','LineWidth',3);hold on
loglog(1/cTp_frxD06,eXXmagSpecMax_frxD06cTp_03d(:,2),'x','LineWidth',3)
loglog(1/cTp_frxD06,eXXmagSpecMax_frxD06cTp_03d(:,3),'x','LineWidth',3)
loglog(1/cTp_frxD06,eXXmagSpecMax_frxD06cTp_03d(:,4),'x','LineWidth',3)
loglog(1/cTp_frxD06,eXXmagSpecMax_frxD06cTp_03d(:,5),'x','LineWidth',3)
loglog(1/cTp_frxD06,eXXmagSpecMax_frxD06cTp_03d(:,6),'x','LineWidth',3)
loglog(f,ofsa)
loglog(f,gtsv);hold off; grid on 
pbaspect([1 1 1])
xlim([1E-8,1E-3])
ylim([1E-14,1E-8])
xlabel('frequency','FontSize',15)
ylabel('Magnitude','FontSize',15)
% legend('5%','25%','50%','100%','FontSize',15,'Location','SouthWest')
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_cTp_eXXmagSpecDet_D06.pdf','-dpdf','-r0')
print(fig,'01a_HPT_cTp_eXXmagSpecDet_D06.tif','-dtiff','-r0')

% =============================================================================================== %
% PARAMETER 07: eXX Detectability 
% =============================================================================================== %
figure('Name','eXXmagSpecDet_D07','NumberTitle','off')
loglog(1/cTp_frxD07,eXXmagSpecMax_frxD07cTp_03d(:,1),'x','LineWidth',3);hold on
loglog(1/cTp_frxD07,eXXmagSpecMax_frxD07cTp_03d(:,2),'x','LineWidth',3)
loglog(1/cTp_frxD07,eXXmagSpecMax_frxD07cTp_03d(:,3),'x','LineWidth',3)
loglog(1/cTp_frxD07,eXXmagSpecMax_frxD07cTp_03d(:,4),'x','LineWidth',3)
loglog(1/cTp_frxD07,eXXmagSpecMax_frxD07cTp_03d(:,5),'x','LineWidth',3)
loglog(1/cTp_frxD07,eXXmagSpecMax_frxD07cTp_03d(:,6),'x','LineWidth',3)
loglog(f,ofsa)
loglog(f,gtsv);hold off; grid on 
pbaspect([1 1 1])
xlim([1E-8,1E-3])
ylim([1E-14,1E-8])
xlabel('frequency','FontSize',15)
ylabel('Magnitude','FontSize',15)
% legend('5%','25%','50%','100%','FontSize',15,'Location','SouthWest')
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_cTp_eXXmagSpecDet_D07.pdf','-dpdf','-r0')
print(fig,'01a_HPT_cTp_eXXmagSpecDet_D07.tif','-dtiff','-r0')

% =============================================================================================== %
% PARAMETER 08: eXX Detectability 
% =============================================================================================== %
figure('Name','eXXmagSpecDet_D08','NumberTitle','off')
loglog(1/cTp_frxD08,eXXmagSpecMax_frxD08cTp_03d(:,1),'x','LineWidth',3);hold on
loglog(1/cTp_frxD08,eXXmagSpecMax_frxD08cTp_03d(:,2),'x','LineWidth',3)
loglog(1/cTp_frxD08,eXXmagSpecMax_frxD08cTp_03d(:,3),'x','LineWidth',3)
loglog(1/cTp_frxD08,eXXmagSpecMax_frxD08cTp_03d(:,4),'x','LineWidth',3)
loglog(1/cTp_frxD08,eXXmagSpecMax_frxD08cTp_03d(:,5),'x','LineWidth',3)
loglog(1/cTp_frxD08,eXXmagSpecMax_frxD08cTp_03d(:,6),'x','LineWidth',3)
loglog(f,ofsa)
loglog(f,gtsv);hold off; grid on 
pbaspect([1 1 1])
xlim([1E-8,1E-3])
ylim([1E-14,1E-8])
xlabel('frequency','FontSize',15)
ylabel('Magnitude','FontSize',15)
% legend('5%','25%','50%','100%','FontSize',15,'Location','SouthWest')
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_cTp_eXXmagSpecDet_D08.pdf','-dpdf','-r0')
print(fig,'01a_HPT_cTp_eXXmagSpecDet_D08.tif','-dtiff','-r0')

% =============================================================================================== %
% PARAMETER 09: eXX Detectability 
% =============================================================================================== %
figure('Name','eXXmagSpecDet_D09','NumberTitle','off')
loglog(1/cTp_frxD09,eXXmagSpecMax_frxD09cTp_03d(:,1),'x','LineWidth',3);hold on
loglog(1/cTp_frxD09,eXXmagSpecMax_frxD09cTp_03d(:,2),'x','LineWidth',3)
loglog(1/cTp_frxD09,eXXmagSpecMax_frxD09cTp_03d(:,3),'x','LineWidth',3)
loglog(1/cTp_frxD09,eXXmagSpecMax_frxD09cTp_03d(:,4),'x','LineWidth',3)
loglog(1/cTp_frxD09,eXXmagSpecMax_frxD09cTp_03d(:,5),'x','LineWidth',3)
loglog(1/cTp_frxD09,eXXmagSpecMax_frxD09cTp_03d(:,6),'x','LineWidth',3)
loglog(f,ofsa)
loglog(f,gtsv);hold off; grid on 
pbaspect([1 1 1])
xlim([1E-8,1E-3])
ylim([1E-14,1E-8])
xlabel('frequency','FontSize',15)
ylabel('Magnitude','FontSize',15)
% legend('5%','25%','50%','100%','FontSize',15,'Location','SouthWest')
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_cTp_eXXmagSpecDet_D09.pdf','-dpdf','-r0')
print(fig,'01a_HPT_cTp_eXXmagSpecDet_D09.tif','-dtiff','-r0')

% =============================================================================================== %
% PARAMETER 10: eXX Detectability 
% =============================================================================================== %
figure('Name','eXXmagSpecDet_D10','NumberTitle','off')
loglog(1/cTp_frxD10,eXXmagSpecMax_frxD10cTp_03d(:,1),'x','LineWidth',3);hold on
loglog(1/cTp_frxD10,eXXmagSpecMax_frxD10cTp_03d(:,2),'x','LineWidth',3)
loglog(1/cTp_frxD10,eXXmagSpecMax_frxD10cTp_03d(:,3),'x','LineWidth',3)
loglog(1/cTp_frxD10,eXXmagSpecMax_frxD10cTp_03d(:,4),'x','LineWidth',3)
loglog(1/cTp_frxD10,eXXmagSpecMax_frxD10cTp_03d(:,5),'x','LineWidth',3)
loglog(1/cTp_frxD10,eXXmagSpecMax_frxD10cTp_03d(:,6),'x','LineWidth',3)
loglog(f,ofsa)
loglog(f,gtsv);hold off; grid on 
pbaspect([1 1 1])
xlim([1E-8,1E-3])
ylim([1E-14,1E-8])
xlabel('frequency','FontSize',15)
ylabel('Magnitude','FontSize',15)
% legend('5%','25%','50%','100%','FontSize',15,'Location','SouthWest')
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_cTp_eXXmagSpecDet_D10.pdf','-dpdf','-r0')
print(fig,'01a_HPT_cTp_eXXmagSpecDet_D10.tif','-dtiff','-r0')

% =============================================================================================== %
% ALL PARAMETERS: eXX Detectability 
% =============================================================================================== %
figure('Name','eXXmagSpecDet_AllParams','NumberTitle','off')
% parameter 01
loglog(1/cTp_frxD01,eXXmagSpecMax_frxD01cTp_03d(:,1),'x','LineWidth',3);hold on
loglog(1/cTp_frxD01,eXXmagSpecMax_frxD01cTp_03d(:,2),'x','LineWidth',3)
loglog(1/cTp_frxD01,eXXmagSpecMax_frxD01cTp_03d(:,3),'x','LineWidth',3)
loglog(1/cTp_frxD01,eXXmagSpecMax_frxD01cTp_03d(:,4),'x','LineWidth',3)
loglog(1/cTp_frxD01,eXXmagSpecMax_frxD01cTp_03d(:,5),'x','LineWidth',3)
loglog(1/cTp_frxD01,eXXmagSpecMax_frxD01cTp_03d(:,6),'x','LineWidth',3)
% parameter 02
loglog(1/cTp_frxD02,eXXmagSpecMax_frxD02cTp_03d(:,1),'x','LineWidth',3)
loglog(1/cTp_frxD02,eXXmagSpecMax_frxD02cTp_03d(:,2),'x','LineWidth',3)
loglog(1/cTp_frxD02,eXXmagSpecMax_frxD02cTp_03d(:,3),'x','LineWidth',3)
loglog(1/cTp_frxD02,eXXmagSpecMax_frxD02cTp_03d(:,4),'x','LineWidth',3)
loglog(1/cTp_frxD02,eXXmagSpecMax_frxD02cTp_03d(:,5),'x','LineWidth',3)
loglog(1/cTp_frxD02,eXXmagSpecMax_frxD02cTp_03d(:,6),'x','LineWidth',3)
% parameter 03
loglog(1/cTp_frxD02,eXXmagSpecMax_frxD02cTp_03d(:,1),'x','LineWidth',3)
loglog(1/cTp_frxD02,eXXmagSpecMax_frxD02cTp_03d(:,2),'x','LineWidth',3)
loglog(1/cTp_frxD02,eXXmagSpecMax_frxD02cTp_03d(:,3),'x','LineWidth',3)
loglog(1/cTp_frxD02,eXXmagSpecMax_frxD02cTp_03d(:,4),'x','LineWidth',3)
loglog(1/cTp_frxD02,eXXmagSpecMax_frxD02cTp_03d(:,5),'x','LineWidth',3)
loglog(1/cTp_frxD02,eXXmagSpecMax_frxD02cTp_03d(:,6),'x','LineWidth',3)
% parameter 04
loglog(1/cTp_frxD04,eXXmagSpecMax_frxD04cTp_03d(:,1),'x','LineWidth',3)
loglog(1/cTp_frxD04,eXXmagSpecMax_frxD04cTp_03d(:,2),'x','LineWidth',3)
loglog(1/cTp_frxD04,eXXmagSpecMax_frxD04cTp_03d(:,3),'x','LineWidth',3)
loglog(1/cTp_frxD04,eXXmagSpecMax_frxD04cTp_03d(:,4),'x','LineWidth',3)
loglog(1/cTp_frxD04,eXXmagSpecMax_frxD04cTp_03d(:,5),'x','LineWidth',3)
loglog(1/cTp_frxD04,eXXmagSpecMax_frxD04cTp_03d(:,6),'x','LineWidth',3)
% parameter 05
loglog(1/cTp_frxD05,eXXmagSpecMax_frxD05cTp_03d(:,1),'x','LineWidth',3)
loglog(1/cTp_frxD05,eXXmagSpecMax_frxD05cTp_03d(:,2),'x','LineWidth',3)
loglog(1/cTp_frxD05,eXXmagSpecMax_frxD05cTp_03d(:,3),'x','LineWidth',3)
loglog(1/cTp_frxD05,eXXmagSpecMax_frxD05cTp_03d(:,4),'x','LineWidth',3)
loglog(1/cTp_frxD05,eXXmagSpecMax_frxD05cTp_03d(:,5),'x','LineWidth',3)
loglog(1/cTp_frxD05,eXXmagSpecMax_frxD05cTp_03d(:,6),'x','LineWidth',3)
% parameter 06
loglog(1/cTp_frxD06,eXXmagSpecMax_frxD06cTp_03d(:,1),'x','LineWidth',3)
loglog(1/cTp_frxD06,eXXmagSpecMax_frxD06cTp_03d(:,2),'x','LineWidth',3)
loglog(1/cTp_frxD06,eXXmagSpecMax_frxD06cTp_03d(:,3),'x','LineWidth',3)
loglog(1/cTp_frxD06,eXXmagSpecMax_frxD06cTp_03d(:,4),'x','LineWidth',3)
loglog(1/cTp_frxD06,eXXmagSpecMax_frxD06cTp_03d(:,5),'x','LineWidth',3)
loglog(1/cTp_frxD06,eXXmagSpecMax_frxD06cTp_03d(:,6),'x','LineWidth',3)
% parameter 07
loglog(1/cTp_frxD07,eXXmagSpecMax_frxD07cTp_03d(:,1),'x','LineWidth',3)
loglog(1/cTp_frxD07,eXXmagSpecMax_frxD07cTp_03d(:,2),'x','LineWidth',3)
loglog(1/cTp_frxD07,eXXmagSpecMax_frxD07cTp_03d(:,3),'x','LineWidth',3)
loglog(1/cTp_frxD07,eXXmagSpecMax_frxD07cTp_03d(:,4),'x','LineWidth',3)
loglog(1/cTp_frxD07,eXXmagSpecMax_frxD07cTp_03d(:,5),'x','LineWidth',3)
loglog(1/cTp_frxD07,eXXmagSpecMax_frxD07cTp_03d(:,6),'x','LineWidth',3)
% parameter 08
loglog(1/cTp_frxD08,eXXmagSpecMax_frxD08cTp_03d(:,1),'x','LineWidth',3)
loglog(1/cTp_frxD08,eXXmagSpecMax_frxD08cTp_03d(:,2),'x','LineWidth',3)
loglog(1/cTp_frxD08,eXXmagSpecMax_frxD08cTp_03d(:,3),'x','LineWidth',3)
loglog(1/cTp_frxD08,eXXmagSpecMax_frxD08cTp_03d(:,4),'x','LineWidth',3)
loglog(1/cTp_frxD08,eXXmagSpecMax_frxD08cTp_03d(:,5),'x','LineWidth',3)
loglog(1/cTp_frxD08,eXXmagSpecMax_frxD08cTp_03d(:,6),'x','LineWidth',3)
% parameter 09
loglog(1/cTp_frxD09,eXXmagSpecMax_frxD09cTp_03d(:,1),'x','LineWidth',3)
loglog(1/cTp_frxD09,eXXmagSpecMax_frxD09cTp_03d(:,2),'x','LineWidth',3)
loglog(1/cTp_frxD09,eXXmagSpecMax_frxD09cTp_03d(:,3),'x','LineWidth',3)
loglog(1/cTp_frxD09,eXXmagSpecMax_frxD09cTp_03d(:,4),'x','LineWidth',3)
loglog(1/cTp_frxD09,eXXmagSpecMax_frxD09cTp_03d(:,5),'x','LineWidth',3)
loglog(1/cTp_frxD09,eXXmagSpecMax_frxD09cTp_03d(:,6),'x','LineWidth',3)
% parameter 10
loglog(1/cTp_frxD10,eXXmagSpecMax_frxD10cTp_03d(:,1),'x','LineWidth',3)
loglog(1/cTp_frxD10,eXXmagSpecMax_frxD10cTp_03d(:,2),'x','LineWidth',3)
loglog(1/cTp_frxD10,eXXmagSpecMax_frxD10cTp_03d(:,3),'x','LineWidth',3)
loglog(1/cTp_frxD10,eXXmagSpecMax_frxD10cTp_03d(:,4),'x','LineWidth',3)
loglog(1/cTp_frxD10,eXXmagSpecMax_frxD10cTp_03d(:,5),'x','LineWidth',3)
loglog(1/cTp_frxD10,eXXmagSpecMax_frxD10cTp_03d(:,6),'x','LineWidth',3)
loglog(f,ofsa)
loglog(f,gtsv);hold off; grid on 
pbaspect([1 1 1])
xlim([1E-8,1E-3])
ylim([1E-14,1E-8])
xlabel('frequency','FontSize',15)
ylabel('Magnitude','FontSize',15)
% legend('5%','25%','50%','100%','FontSize',15,'Location','SouthWest')
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_cTp_eXXmagSpecDet_AllParams.pdf','-dpdf','-r0')
print(fig,'01a_HPT_cTp_eXXmagSpecDet_AllParams.tif','-dtiff','-r0')

% ================================================================================================= %
% ================================================================================================= %

% %% Magnitude: Normal Strains (eXX & eZZ)
% % =============================================================================================== %
% % Strain Magnitude - plot (Dimensionless)
% % =============================================================================================== %
% fig = figure('Name','sweepDfrx_eNNmag','NumberTitle','off');
% % Parameter 01 - eXX
% plot(t/tc_frx_frxD01,eXX_frxD01cTp_03d(:,1)/e0_frx,'r','LineWidth',3);hold on
% plot(t/tc_frx_frxD01,eXX_frxD01cTp_03d(:,2)/e0_frx,'b','LineWidth',3)
% plot(t/tc_frx_frxD01,eXX_frxD01cTp_03d(:,3)/e0_frx,'g','LineWidth',3)
% plot(t/tc_frx_frxD01,eXX_frxD01cTp_03d(:,4)/e0_frx,'m','LineWidth',3)
% % Parameter 02 - eXX
% plot(t/tc_frx_frxD02,eXX_frxD02cTp_03d(:,1)/e0_frx,'--r','LineWidth',3)
% plot(t/tc_frx_frxD02,eXX_frxD02cTp_03d(:,2)/e0_frx,'--b','LineWidth',3)
% plot(t/tc_frx_frxD02,eXX_frxD02cTp_03d(:,3)/e0_frx,'--g','LineWidth',3)
% plot(t/tc_frx_frxD02,eXX_frxD02cTp_03d(:,4)/e0_frx,'--m','LineWidth',3)
% % Parameter 03 - eXX
% plot(t/tc_frx_frxD03,eXX_frxD03cTp_03d(:,1)/e0_frx,'.r','LineWidth',3)
% plot(t/tc_frx_frxD03,eXX_frxD03cTp_03d(:,2)/e0_frx,'.b','LineWidth',3)
% plot(t/tc_frx_frxD03,eXX_frxD03cTp_03d(:,3)/e0_frx,'.g','LineWidth',3)
% plot(t/tc_frx_frxD03,eXX_frxD03cTp_03d(:,4)/e0_frx,'.m','LineWidth',3);hold off;grid on;
% pbaspect([1 1 1])
% % xlim([3E-3,1.25])
% xlabel('t*','FontSize',15)
% ylabel('Dimensionless Strain','FontSize',15)
% % legend('r = 5%', 'r = 25%', 'r = 50%', 'r = 100%','Location','NorthWest')
% pbaspect([1 1 1])
% % FORMATTING
% fig = gcf;
% fig.PaperUnits = paperSizeUnits;
% fig.PaperSize = [paperSizeW_single paperSizeH_single];
% fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
% print(fig,'01a_HPT_cTp_swpDfrx_eNNmag_allParVals.pdf','-dpdf','-r0')
% print(fig,'01a_HPT_cTp_swpDfrx_eNNmag_allParVals.tif','-dtiff','-r0')
% 
% %% Detectable Normal Strains
% % =============================================================================================== %
% % PARAMETER VALUE 01: Detectable Normal Strain Magnitude - (eXX & eZZ) - Semilogx (Dimensionless)
% % =============================================================================================== %
% fig = figure('Name','frxD01_eNNmagDet','NumberTitle','off');
% % eXX
% plot(t/tc_frx_frxD01,eXX_detectable_frxD01cTp_03d(:,1)/e0_frx,'r','LineWidth',7,'HandleVisibility','off');hold on
% plot(t/tc_frx_frxD01,eXX_detectable_frxD01cTp_03d(:,2)/e0_frx,'r','LineWidth',7,'HandleVisibility','off');
% plot(t/tc_frx_frxD01,eXX_detectable_frxD01cTp_03d(:,3)/e0_frx,'r','LineWidth',7,'HandleVisibility','off');
% plot(t/tc_frx_frxD01,eXX_detectable_frxD01cTp_03d(:,4)/e0_frx,'r','LineWidth',7,'HandleVisibility','off');
% plot(t/tc_frx_frxD01,eXX_frxD01cTp_03d(:,1)/e0_frx,'r','LineWidth',3)
% plot(t/tc_frx_frxD01,eXX_frxD01cTp_03d(:,2)/e0_frx,'b','LineWidth',3)
% plot(t/tc_frx_frxD01,eXX_frxD01cTp_03d(:,3)/e0_frx,'g','LineWidth',3)
% plot(t/tc_frx_frxD01,eXX_frxD01cTp_03d(:,4)/e0_frx,'m','LineWidth',3);hold on;grid on
% pbaspect([1 1 1])
% % xlim([1E-2,1.25])
% xlabel('t*','FontSize',15)
% ylabel('Dimensionless Strain','FontSize',15)
% % legend('r = 5%', 'r = 25%', 'r = 50%', 'r = 100%','Location','NorthWest')
% pbaspect([1 1 1])
% % FORMATTING
% fig = gcf;
% fig.PaperUnits = paperSizeUnits;
% fig.PaperSize = [paperSizeW_single paperSizeH_single];
% fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
% print(fig,'01a_HPT_cTp_frxD01cTp_eNNmagDet.pdf','-dpdf','-r0')
% print(fig,'01a_HPT_cTp_frxD01cTp_eNNmagDet.tif','-dtiff','-r0')
% 
% % =============================================================================================== %
% % PARAMETER VALUE 02: Detectable Normal Strain Magnitude - (eXX & eZZ) - Semilogx (Dimensionless)
% % =============================================================================================== %
% fig = figure('Name','frxD02_eNNmagDet','NumberTitle','off');
% plot(t/tc_frx_frxD02,eXX_detectable_frxD02cTp_03d(:,1)/e0_frx,'r','LineWidth',7,'HandleVisibility','off');hold on
% plot(t/tc_frx_frxD02,eXX_detectable_frxD02cTp_03d(:,2)/e0_frx,'r','LineWidth',7,'HandleVisibility','off');
% plot(t/tc_frx_frxD02,eXX_detectable_frxD02cTp_03d(:,3)/e0_frx,'r','LineWidth',7,'HandleVisibility','off');
% plot(t/tc_frx_frxD02,eXX_detectable_frxD02cTp_03d(:,4)/e0_frx,'r','LineWidth',7,'HandleVisibility','off');
% plot(t/tc_frx_frxD02,eXX_frxD02cTp_03d(:,1)/e0_frx,'r','LineWidth',3)
% plot(t/tc_frx_frxD02,eXX_frxD02cTp_03d(:,2)/e0_frx,'b','LineWidth',3)
% plot(t/tc_frx_frxD02,eXX_frxD02cTp_03d(:,3)/e0_frx,'g','LineWidth',3)
% plot(t/tc_frx_frxD02,eXX_frxD02cTp_03d(:,4)/e0_frx,'m','LineWidth',3);hold off;grid on
% pbaspect([1 1 1])
% % xlim([1E-2,1.25])
% xlabel('t*','FontSize',15)
% ylabel('Dimensionless Strain','FontSize',15)
% % legend('r = 5%', 'r = 25%', 'r = 50%', 'r = 100%','Location','NorthWest')
% pbaspect([1 1 1])
% % FORMATTING
% fig = gcf;
% fig.PaperUnits = paperSizeUnits;
% fig.PaperSize = [paperSizeW_single paperSizeH_single];
% fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
% print(fig,'01a_HPT_cTp_frxD02cTp_eNNmagDet.pdf','-dpdf','-r0')
% print(fig,'01a_HPT_cTp_frxD02cTp_eNNmagDet.tif','-dtiff','-r0')
% 
% % =============================================================================================== %
% % PARAMETER VALUE 03: Detectable Normal Strain Magnitude - (eXX & eZZ) - Semilogx (Dimensionless)
% % =============================================================================================== %
% fig = figure('Name','frxD03_eNNmagDet','NumberTitle','off');
% plot(t/tc_frx_frxD03,eXX_detectable_frxD03cTp_03d(:,1)/e0_frx,'r','LineWidth',7,'HandleVisibility','off');hold on
% plot(t/tc_frx_frxD03,eXX_detectable_frxD03cTp_03d(:,2)/e0_frx,'r','LineWidth',7,'HandleVisibility','off');
% plot(t/tc_frx_frxD03,eXX_detectable_frxD03cTp_03d(:,3)/e0_frx,'r','LineWidth',7,'HandleVisibility','off');
% plot(t/tc_frx_frxD03,eXX_detectable_frxD03cTp_03d(:,4)/e0_frx,'r','LineWidth',7,'HandleVisibility','off');
% plot(t/tc_frx_frxD03,eXX_frxD03cTp_03d(:,1)/e0_frx,'r','LineWidth',3)
% plot(t/tc_frx_frxD03,eXX_frxD03cTp_03d(:,2)/e0_frx,'b','LineWidth',3)
% plot(t/tc_frx_frxD03,eXX_frxD03cTp_03d(:,3)/e0_frx,'g','LineWidth',3)
% plot(t/tc_frx_frxD03,eXX_frxD03cTp_03d(:,4)/e0_frx,'m','LineWidth',3);hold off;grid on
% pbaspect([1 1 1])
% % xlim([1E-2,1.25])
% xlabel('t*','FontSize',15)
% ylabel('Dimensionless Strain','FontSize',15)
% % legend('r = 5%', 'r = 25%', 'r = 50%', 'r = 100%','Location','NorthWest')
% pbaspect([1 1 1])
% % FORMATTING
% fig = gcf;
% fig.PaperUnits = paperSizeUnits;
% fig.PaperSize = [paperSizeW_single paperSizeH_single];
% fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
% print(fig,'01a_HPT_cTp_frxD03cTp_eNNmagDet.pdf','-dpdf','-r0')
% print(fig,'01a_HPT_cTp_frxD03cTp_eNNmagDet.tif','-dtiff','-r0')
% 
% %% Strain Rate
% % =============================================================================================== %
% % INDIVIDUAL LOCATIONS: Strain Rate (eXX) - plot (Dimensionless)
% % =============================================================================================== %
% % LOCATION: PROBE 05w03d
% fig = figure('Name','swpDfrx_eXXrate_05w03d','NumberTitle','off');
% % Parameter 01
% plot(t/tc_frx_frxD01,eXXrate_frxD01cTp_03d(:,1),'r','LineWidth',3);hold on
% % Parameter 02
% plot(t/tc_frx_frxD02,eXXrate_frxD02cTp_03d(:,1),'--r','LineWidth',3)
% % Parameter 03
% plot(t/tc_frx_frxD03,eXXrate_frxD03cTp_03d(:,1),'.r','LineWidth',3);hold off;grid on
% pbaspect([1 1 1])
% % xlim([1E-2,1.25])
% xlabel('t*','FontSize',15)
% ylabel('Dimensionless Strain Rate','FontSize',15)
% % legend('D01', 'D02', 'D03','Location','SouthWest')
% pbaspect([1 1 1])
% % FORMATTING
% fig = gcf;
% fig.PaperUnits = paperSizeUnits;
% fig.PaperSize = [paperSizeW_single paperSizeH_single];
% fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
% print(fig,'01a_HPT_cTp_swpDfrx_eXXrate_05w03d.pdf','-dpdf','-r0')
% print(fig,'01a_HPT_cTp_swpDfrx_eXXrate_05w03d.tif','-dtiff','-r0')
% 
% % =============================================================================================== %
% 
% % LOCATION: PROBE 25w03d
% fig = figure('Name','swpDfrx_eXXrate_25w03d','NumberTitle','off');
% % Parameter 01
% plot(t/tc_frx_frxD01,eXXrate_frxD01cTp_03d(:,2)/e0_frx,'b','LineWidth',3);hold on
% % Parameter 02
% plot(t/tc_frx_frxD02,eXXrate_frxD02cTp_03d(:,2)/e0_frx,'--b','LineWidth',3)
% % Parameter 03
% plot(t/tc_frx_frxD03,eXXrate_frxD03cTp_03d(:,2)/e0_frx,'.b','LineWidth',3);hold off;grid on
% pbaspect([1 1 1])
% % xlim([1E-2,1.25])
% xlabel('t*','FontSize',15)
% ylabel('Dimensionless Strain Rate','FontSize',15)
% % legend('D01', 'D02', 'D03','Location','SouthWest')
% pbaspect([1 1 1])
% % FORMATTING
% fig = gcf;
% fig.PaperUnits = paperSizeUnits;
% fig.PaperSize = [paperSizeW_single paperSizeH_single];
% fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
% print(fig,'01a_HPT_cTp_swpDfrx_eXXrate_25w03d.pdf','-dpdf','-r0')
% print(fig,'01a_HPT_cTp_swpDfrx_eXXrate_25w03d.tif','-dtiff','-r0')
% 
% % =============================================================================================== %
% 
% % LOCATION: PROBE 50w03d
% fig = figure('Name','swpDfrx_eXXrate_50w03d','NumberTitle','off');
% % Parameter 01
% plot(t/tc_frx_frxD01,eXXrate_frxD01cTp_03d(:,3)/e0_frx,'g','LineWidth',3);hold on
% % Parameter 02
% plot(t/tc_frx_frxD02,eXXrate_frxD02cTp_03d(:,3)/e0_frx,'--g','LineWidth',3)
% % Parameter 03
% plot(t/tc_frx_frxD03,eXXrate_frxD03cTp_03d(:,3)/e0_frx,'.g','LineWidth',3);hold off;grid on
% pbaspect([1 1 1])
% % xlim([1E-2,1.25])
% xlabel('t*','FontSize',15)
% ylabel('Dimensionless Strain Rate','FontSize',15)
% % legend('D01', 'D02', 'D03','Location','SouthWest')
% pbaspect([1 1 1])
% % FORMATTING
% fig = gcf;
% fig.PaperUnits = paperSizeUnits;
% fig.PaperSize = [paperSizeW_single paperSizeH_single];
% fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
% print(fig,'01a_HPT_cTp_swpDfrx_eXXrate_50w03d.pdf','-dpdf','-r0')
% print(fig,'01a_HPT_cTp_swpDfrx_eXXrate_50w03d.tif','-dtiff','-r0')
% 
% % =============================================================================================== %
% 
% % LOCATION: PROBE 100W03d
% fig = figure('Name','swpDfrx_eXXrate_100w03d','NumberTitle','off');
% % Parameter 01
% plot(t/tc_frx_frxD01,eXXrate_frxD01cTp_03d(:,4)/e0_frx,'m','LineWidth',3);hold on
% % Parameter 02
% plot(t/tc_frx_frxD02,eXXrate_frxD02cTp_03d(:,4)/e0_frx,'--m','LineWidth',3)
% % Parameter 03
% plot(t/tc_frx_frxD03,eXXrate_frxD03cTp_03d(:,4)/e0_frx,'.m','LineWidth',3);hold off;grid on
% pbaspect([1 1 1])
% % xlim([1E-2,1.25])
% xlabel('t*','FontSize',15)
% ylabel('Dimensionless Strain Rate','FontSize',15)
% % legend('D01', 'D02', 'D03','Location','SouthWest')
% pbaspect([1 1 1])
% % FORMATTING
% fig = gcf;
% fig.PaperUnits = paperSizeUnits;
% fig.PaperSize = [paperSizeW_single paperSizeH_single];
% fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
% print(fig,'01a_HPT_cTp_swpDfrx_eXXrate_100w03d.pdf','-dpdf','-r0')
% print(fig,'01a_HPT_cTp_swpDfrx_eXXrate_100w03d.tif','-dtiff','-r0')
% 
% % =============================================================================================== %
% % ALL LOCATIONS: Strain Rate (eXX) - plot (Dimensionless)
% % =============================================================================================== %
% fig = figure('Name','swpDfrx_eXXrate_05w03d','NumberTitle','off');
% % =============================================================================================== %
% % LOCATION: PROBE 05w03d
% subplot(2,2,1)
% % Parameter 01
% plot(t/tc_frx_frxD01,eXXrate_frxD01cTp_03d(:,1)/e0_frx,'r','LineWidth',3);hold on
% % Parameter 02
% plot(t/tc_frx_frxD02,eXXrate_frxD02cTp_03d(:,1)/e0_frx,'--r','LineWidth',3)
% % Parameter 03
% plot(t/tc_frx_frxD03,eXXrate_frxD03cTp_03d(:,1)/e0_frx,'.r','LineWidth',3);hold off;grid on
% pbaspect([1 1 1])
% % xlim([1E-2,1.25])
% % xlabel('t*','FontSize',15)
% ylabel('Strain Rate (Scaled)','FontSize',12)
% % =============================================================================================== %
% % LOCATION: PROBE 25w03d
% subplot(2,2,2)
% % Parameter 01
% plot(t/tc_frx_frxD01,eXXrate_frxD01cTp_03d(:,2)/e0_frx,'b','LineWidth',3);hold on
% % Parameter 02
% plot(t/tc_frx_frxD02,eXXrate_frxD02cTp_03d(:,2)/e0_frx,'--b','LineWidth',3)
% % Parameter 03
% plot(t/tc_frx_frxD03,eXXrate_frxD03cTp_03d(:,2)/e0_frx,'.b','LineWidth',3);hold off;grid on
% pbaspect([1 1 1])
% % xlim([1E-2,1.25])
% % xlabel('t*','FontSize',15)
% % =============================================================================================== %
% % LOCATION: PROBE 50w03d
% subplot(2,2,3)
% % Parameter 01
% plot(t/tc_frx_frxD01,eXXrate_frxD01cTp_03d(:,3)/e0_frx,'g','LineWidth',3);hold on
% % Parameter 02
% plot(t/tc_frx_frxD02,eXXrate_frxD02cTp_03d(:,3)/e0_frx,'--g','LineWidth',3)
% % Parameter 03
% plot(t/tc_frx_frxD03,eXXrate_frxD03cTp_03d(:,3)/e0_frx,'.g','LineWidth',3);hold off;grid on
% pbaspect([1 1 1])
% % xlim([1E-2,1.25])
% xlabel('t*','FontSize',15)
% ylabel('Strain Rate (Scaled)','FontSize',12)
% % =============================================================================================== %
% % LOCATION: PROBE 100w03d
% subplot(2,2,4)
% % Parameter 01
% plot(t/tc_frx_frxD01,eXXrate_frxD01cTp_03d(:,4)/e0_frx,'m','LineWidth',3);hold on
% % Parameter 02
% plot(t/tc_frx_frxD02,eXXrate_frxD02cTp_03d(:,4)/e0_frx,'--m','LineWidth',3)
% % Parameter 03
% plot(t/tc_frx_frxD03,eXXrate_frxD03cTp_03d(:,4)/e0_frx,'.m','LineWidth',3);hold off;grid on
% pbaspect([1 1 1])
% % xlim([1E-2,1.25])
% xlabel('t*','FontSize',15)
% % legend('D01', 'D02', 'D03','Location','SouthWest')
% pbaspect([1 1 1])
% % =============================================================================================== %
% % FORMATTING
% fig = gcf;
% fig.PaperUnits = paperSizeUnits;
% fig.PaperSize = [paperSizeW_2by2 paperSizeH_2by2];
% fig.PaperPosition = [0 0 paperSizeW_2by2 paperSizeH_2by2];
% print(fig,'01a_HPT_cTp_swpDfrx_eXXrate_allProbes.pdf','-dpdf','-r0')
% print(fig,'01a_HPT_cTp_swpDfrx_eXXrate_allProbes.tif','-dtiff','-r0')
% 
% %%  Tilt
% % =============================================================================================== %
% % X-Tilt Magnitude - Semilogx (Dimensionless)
% % =============================================================================================== %
% fig = figure('Name','sweepDfrx_eTXmag','NumberTitle','off');
% % Parameter 01
% plot(t/tc_frx_frxD01,eTX_frxD01cTp_03d(:,1)/e0_frx,'r','LineWidth',3);hold on
% plot(t/tc_frx_frxD01,eTX_frxD01cTp_03d(:,2)/e0_frx,'b','LineWidth',3)
% plot(t/tc_frx_frxD01,eTX_frxD01cTp_03d(:,3)/e0_frx,'g','LineWidth',3)
% plot(t/tc_frx_frxD01,eTX_frxD01cTp_03d(:,4)/e0_frx,'m','LineWidth',3)
% % Parameter 02
% plot(t/tc_frx_frxD02,eTX_frxD02cTp_03d(:,1)/e0_frx,'--r','LineWidth',3)
% plot(t/tc_frx_frxD02,eTX_frxD02cTp_03d(:,2)/e0_frx,'--b','LineWidth',3)
% plot(t/tc_frx_frxD02,eTX_frxD02cTp_03d(:,3)/e0_frx,'--g','LineWidth',3)
% plot(t/tc_frx_frxD02,eTX_frxD02cTp_03d(:,4)/e0_frx,'--m','LineWidth',3)
% % Parameter 03
% plot(t/tc_frx_frxD03,eTX_frxD02cTp_03d(:,1)/e0_frx,'.r','LineWidth',3)
% plot(t/tc_frx_frxD03,eTX_frxD02cTp_03d(:,2)/e0_frx,'.b','LineWidth',3)
% plot(t/tc_frx_frxD03,eTX_frxD02cTp_03d(:,3)/e0_frx,'.g','LineWidth',3)
% plot(t/tc_frx_frxD03,eTX_frxD02cTp_03d(:,4)/e0_frx,'.m','LineWidth',3);hold off;grid on;
% pbaspect([1 1 1])
% % xlim([1E-2,1.25])
% xlabel('t*','FontSize',15)
% ylabel('Dimensionless Tilt','FontSize',15)
% % legend('r = 5%', 'r = 25%', 'r = 50%', 'r = 100%','Location','NorthWest')
% pbaspect([1 1 1])
% % FORMATTING
% fig = gcf;
% fig.PaperUnits = paperSizeUnits;
% fig.PaperSize = [paperSizeW_single paperSizeH_single];
% fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
% print(fig,'01a_HPT_cTp_swpDfrx_eTXmag.pdf','-dpdf','-r0')
% print(fig,'01a_HPT_cTp_swpDfrx_eTXmag.tif','-dtiff','-r0')
% 
% % =============================================================================================== %
% % X-Tilt Rate - Semilogx (Dimensionless)
% % =============================================================================================== %
% fig = figure('Name','sweepDfrx_eTXrate','NumberTitle','off');
% % Parameter 01
% plot(t/tc_frx_frxD01,eTXrate_frxD01cTp_03d(:,1)/e0_frx,'r','LineWidth',3);hold on
% plot(t/tc_frx_frxD01,eTXrate_frxD01cTp_03d(:,2)/e0_frx,'b','LineWidth',3)
% plot(t/tc_frx_frxD01,eTXrate_frxD01cTp_03d(:,3)/e0_frx,'g','LineWidth',3)
% plot(t/tc_frx_frxD01,eTXrate_frxD01cTp_03d(:,4)/e0_frx,'m','LineWidth',3)
% % Parameter 02
% plot(t/tc_frx_frxD02,eTXrate_frxD02cTp_03d(:,1)/e0_frx,'--r','LineWidth',3)
% plot(t/tc_frx_frxD02,eTXrate_frxD02cTp_03d(:,2)/e0_frx,'--b','LineWidth',3)
% plot(t/tc_frx_frxD02,eTXrate_frxD02cTp_03d(:,3)/e0_frx,'--g','LineWidth',3)
% plot(t/tc_frx_frxD02,eTXrate_frxD02cTp_03d(:,4)/e0_frx,'--m','LineWidth',3)
% % Parameter 03
% plot(t/tc_frx_frxD03,eTXrate_frxD02cTp_03d(:,1)/e0_frx,'.r','LineWidth',3)
% plot(t/tc_frx_frxD03,eTXrate_frxD02cTp_03d(:,2)/e0_frx,'.b','LineWidth',3)
% plot(t/tc_frx_frxD03,eTXrate_frxD02cTp_03d(:,3)/e0_frx,'.g','LineWidth',3)
% plot(t/tc_frx_frxD03,eTXrate_frxD02cTp_03d(:,4)/e0_frx,'.m','LineWidth',3);hold off;grid on;
% pbaspect([1 1 1])
% xlim([5E-7,3E-4])
% xlabel('t*','FontSize',15)
% ylabel('Dimensionless Tilt','FontSize',15)
% % legend('r = 5%', 'r = 25%', 'r = 50%', 'r = 100%','Location','NorthWest')
% pbaspect([1 1 1])
% % FORMATTING
% fig = gcf;
% fig.PaperUnits = paperSizeUnits;
% fig.PaperSize = [paperSizeW_single paperSizeH_single];
% fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
% print(fig,'01a_HPT_cTp_swpDfrx_eTXrate.pdf','-dpdf','-r0')
% print(fig,'01a_HPT_cTp_swpDfrx_eTXrate.tif','-dtiff','-r0')

% =============================================================================================== %
% =============================================================================================== %
