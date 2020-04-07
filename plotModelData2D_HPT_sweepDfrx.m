%% plotModelData2D_HPT_sweepDfrx
% Author: R. Moak
% Date: 03/04/20

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
Pc      = p_inj;
X_frx   = ModelParams_sweepDfrx.X_frx;
X_conf  = ModelParams_sweepDfrx.X_conf;

% Dimensionless Scaling
e0_frx  = alpha_b*Pc*X_frx;
e0_conf = alpha_b*Pc*X_conf;

%% Magnitude Spectra Plots
% =============================================================================================== %
% PARAMETER 01: Magnitude Spectra - eXX
% =============================================================================================== %
figure('Name','sweepDfrx_eXXmagSpec','NumberTitle','off')
loglog(f_frxD01,eXXmagSpec_frxD01_03d(:,1),'r','LineWidth',3);hold on
loglog(f_frxD01,eXXmagSpec_frxD01_03d(:,2),'b','LineWidth',3)
loglog(f_frxD01,eXXmagSpec_frxD01_03d(:,3),'g','LineWidth',3)
loglog(f_frxD01,eXXmagSpec_frxD01_03d(:,4),'m','LineWidth',3);hold off; grid on
pbaspect([1 1 1])
% xlim([1E-2,1.25])
xlabel('frequency','FontSize',15)
ylabel('Magnitude','FontSize',15)
% legend('r = 5%', 'r = 25%', 'r = 50%', 'r = 100%','Location','NorthEast')
% FORMATTING
fig = gcf;
fig.PaperUnits    = paperSizeUnits;
fig.PaperSize     = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_frxD01_eXXmagSpec.pdf','-dpdf','-r0')
print(fig,'01a_HPT_frxD01_eXXmagSpec.tif','-dtiff','-r0')

% =============================================================================================== %
% PARAMETER 02: Magnitude Spectra - eXX
% =============================================================================================== %
figure('Name','sweepDfrx_eXXmagSpec','NumberTitle','off')
loglog(f_frxD02,eXXmagSpec_frxD02_03d(:,1),'r','LineWidth',3);hold on
loglog(f_frxD02,eXXmagSpec_frxD02_03d(:,2),'b','LineWidth',3)
loglog(f_frxD02,eXXmagSpec_frxD02_03d(:,3),'g','LineWidth',3)
loglog(f_frxD02,eXXmagSpec_frxD02_03d(:,4),'m','LineWidth',3);hold off; grid on
pbaspect([1 1 1])
% xlim([1E-2,1.25])
xlabel('frequency','FontSize',15)
ylabel('Magnitude','FontSize',15)
% legend('r = 5%', 'r = 25%', 'r = 50%', 'r = 100%','Location','NorthEast')
% FORMATTING
fig = gcf;
fig.PaperUnits    = paperSizeUnits;
fig.PaperSize     = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'02a_HPT_frxD02_eXXmagSpec.pdf','-dpdf','-r0')
print(fig,'02a_HPT_frxD02_eXXmagSpec.tif','-dtiff','-r0')

% =============================================================================================== %
% PARAMETER 03: Magnitude Spectra - eXX
% =============================================================================================== %
figure('Name','sweepDfrx_eXXmagSpec','NumberTitle','off')
loglog(f_frxD03,eXXmagSpec_frxD03_03d(:,1),'r','LineWidth',3);hold on
loglog(f_frxD03,eXXmagSpec_frxD03_03d(:,2),'b','LineWidth',3)
loglog(f_frxD03,eXXmagSpec_frxD03_03d(:,3),'g','LineWidth',3)
loglog(f_frxD03,eXXmagSpec_frxD03_03d(:,4),'m','LineWidth',3);hold off; grid on
pbaspect([1 1 1])
% xlim([1E-2,1.25])
xlabel('frequency','FontSize',15)
ylabel('Magnitude','FontSize',15)
% legend('r = 5%', 'r = 25%', 'r = 50%', 'r = 100%','Location','NorthEast')
% FORMATTING
fig = gcf;
fig.PaperUnits    = paperSizeUnits;
fig.PaperSize     = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'03a_HPT_frxD03_eXXmagSpec.pdf','-dpdf','-r0')
print(fig,'03a_HPT_frxD03_eXXmagSpec.tif','-dtiff','-r0')

% =============================================================================================== %
% PARAMETER 04: Magnitude Spectra - eXX
% =============================================================================================== %
figure('Name','sweepDfrx_eXXmagSpec','NumberTitle','off')
loglog(f_frxD04,eXXmagSpec_frxD04_03d(:,1),'r','LineWidth',3);hold on
loglog(f_frxD04,eXXmagSpec_frxD04_03d(:,2),'b','LineWidth',3)
loglog(f_frxD04,eXXmagSpec_frxD04_03d(:,3),'g','LineWidth',3)
loglog(f_frxD04,eXXmagSpec_frxD04_03d(:,4),'m','LineWidth',3);hold off; grid on
pbaspect([1 1 1])
% xlim([1E-2,1.25])
xlabel('frequency','FontSize',15)
ylabel('Magnitude','FontSize',15)
% legend('r = 5%', 'r = 25%', 'r = 50%', 'r = 100%','Location','NorthEast')
% FORMATTING
fig = gcf;
fig.PaperUnits    = paperSizeUnits;
fig.PaperSize     = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_frxD04_eXXmagSpec.pdf','-dpdf','-r0')
print(fig,'01a_HPT_frxD04_eXXmagSpec.tif','-dtiff','-r0')

% =============================================================================================== %
% PARAMETER 05: Magnitude Spectra - eXX
% =============================================================================================== %
figure('Name','sweepDfrx_eXXmagSpec','NumberTitle','off')
loglog(f_frxD05,eXXmagSpec_frxD05_03d(:,1),'r','LineWidth',3);hold on
loglog(f_frxD05,eXXmagSpec_frxD05_03d(:,2),'b','LineWidth',3)
loglog(f_frxD05,eXXmagSpec_frxD05_03d(:,3),'g','LineWidth',3)
loglog(f_frxD05,eXXmagSpec_frxD05_03d(:,4),'m','LineWidth',3);hold off; grid on
pbaspect([1 1 1])
% xlim([1E-2,1.25])
xlabel('frequency','FontSize',15)
ylabel('Magnitude','FontSize',15)
% legend('r = 5%', 'r = 25%', 'r = 50%', 'r = 100%','Location','NorthEast')
% FORMATTING
fig = gcf;
fig.PaperUnits    = paperSizeUnits;
fig.PaperSize     = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'02a_HPT_frxD05_eXXmagSpec.pdf','-dpdf','-r0')
print(fig,'02a_HPT_frxD05_eXXmagSpec.tif','-dtiff','-r0')

% =============================================================================================== %
% PARAMETER 06: Magnitude Spectra - eXX
% =============================================================================================== %
figure('Name','sweepDfrx_eXXmagSpec','NumberTitle','off')
loglog(f_frxD06,eXXmagSpec_frxD06_03d(:,1),'r','LineWidth',3);hold on
loglog(f_frxD06,eXXmagSpec_frxD06_03d(:,2),'b','LineWidth',3)
loglog(f_frxD06,eXXmagSpec_frxD06_03d(:,3),'g','LineWidth',3)
loglog(f_frxD06,eXXmagSpec_frxD06_03d(:,4),'m','LineWidth',3);hold off; grid on
pbaspect([1 1 1])
% xlim([1E-2,1.25])
xlabel('frequency','FontSize',15)
ylabel('Magnitude','FontSize',15)
% legend('r = 5%', 'r = 25%', 'r = 50%', 'r = 100%','Location','NorthEast')
% FORMATTING
fig = gcf;
fig.PaperUnits    = paperSizeUnits;
fig.PaperSize     = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'03a_HPT_frxD06_eXXmagSpec.pdf','-dpdf','-r0')
print(fig,'03a_HPT_frxD06_eXXmagSpec.tif','-dtiff','-r0')

% =============================================================================================== %
% PARAMETER 07: Magnitude Spectra - eXX
% =============================================================================================== %
figure('Name','sweepDfrx_eXXmagSpec','NumberTitle','off')
loglog(f_frxD07,eXXmagSpec_frxD07_03d(:,1),'r','LineWidth',3);hold on
loglog(f_frxD07,eXXmagSpec_frxD07_03d(:,2),'b','LineWidth',3)
loglog(f_frxD07,eXXmagSpec_frxD07_03d(:,3),'g','LineWidth',3)
loglog(f_frxD07,eXXmagSpec_frxD07_03d(:,4),'m','LineWidth',3);hold off; grid on
pbaspect([1 1 1])
% xlim([1E-2,1.25])
xlabel('frequency','FontSize',15)
ylabel('Magnitude','FontSize',15)
% legend('r = 5%', 'r = 25%', 'r = 50%', 'r = 100%','Location','NorthEast')
% FORMATTING
fig = gcf;
fig.PaperUnits    = paperSizeUnits;
fig.PaperSize     = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'07a_HPT_frxD07_eXXmagSpec.pdf','-dpdf','-r0')
print(fig,'07a_HPT_frxD07_eXXmagSpec.tif','-dtiff','-r0')

% =============================================================================================== %
% PARAMETER 08: Magnitude Spectra - eXX
% =============================================================================================== %
figure('Name','sweepDfrx_eXXmagSpec','NumberTitle','off')
loglog(f_frxD08,eXXmagSpec_frxD08_03d(:,1),'r','LineWidth',3);hold on
loglog(f_frxD08,eXXmagSpec_frxD08_03d(:,2),'b','LineWidth',3)
loglog(f_frxD08,eXXmagSpec_frxD08_03d(:,3),'g','LineWidth',3)
loglog(f_frxD08,eXXmagSpec_frxD08_03d(:,4),'m','LineWidth',3);hold off; grid on
pbaspect([1 1 1])
% xlim([1E-2,1.25])
xlabel('frequency','FontSize',15)
ylabel('Magnitude','FontSize',15)
% legend('r = 5%', 'r = 25%', 'r = 50%', 'r = 100%','Location','NorthEast')
% FORMATTING
fig = gcf;
fig.PaperUnits    = paperSizeUnits;
fig.PaperSize     = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'08a_HPT_frxD08_eXXmagSpec.pdf','-dpdf','-r0')
print(fig,'08a_HPT_frxD08_eXXmagSpec.tif','-dtiff','-r0')

% =============================================================================================== %
% PARAMETER 09: Magnitude Spectra - eXX
% =============================================================================================== %
figure('Name','sweepDfrx_eXXmagSpec','NumberTitle','off')
loglog(f_frxD09,eXXmagSpec_frxD09_03d(:,1),'r','LineWidth',3);hold on
loglog(f_frxD09,eXXmagSpec_frxD09_03d(:,2),'b','LineWidth',3)
loglog(f_frxD09,eXXmagSpec_frxD09_03d(:,3),'g','LineWidth',3)
loglog(f_frxD09,eXXmagSpec_frxD09_03d(:,4),'m','LineWidth',3);hold off; grid on
pbaspect([1 1 1])
% xlim([1E-2,1.25])
xlabel('frequency','FontSize',15)
ylabel('Magnitude','FontSize',15)
% legend('r = 5%', 'r = 25%', 'r = 50%', 'r = 100%','Location','NorthEast')
% FORMATTING
fig = gcf;
fig.PaperUnits    = paperSizeUnits;
fig.PaperSize     = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'03a_HPT_frxD09_eXXmagSpec.pdf','-dpdf','-r0')
print(fig,'03a_HPT_frxD09_eXXmagSpec.tif','-dtiff','-r0')

% =============================================================================================== %
% PARAMETER 10: Magnitude Spectra - eXX
% =============================================================================================== %
figure('Name','sweepDfrx_eXXmagSpec','NumberTitle','off')
loglog(f_frxD10,eXXmagSpec_frxD10_03d(:,1),'r','LineWidth',3);hold on
loglog(f_frxD10,eXXmagSpec_frxD10_03d(:,2),'b','LineWidth',3)
loglog(f_frxD10,eXXmagSpec_frxD10_03d(:,3),'g','LineWidth',3)
loglog(f_frxD10,eXXmagSpec_frxD10_03d(:,4),'m','LineWidth',3);hold off; grid on
pbaspect([1 1 1])
% xlim([1E-2,1.25])
xlabel('frequency','FontSize',15)
ylabel('Magnitude','FontSize',15)
% legend('r = 5%', 'r = 25%', 'r = 50%', 'r = 100%','Location','NorthEast')
% FORMATTING
fig = gcf;
fig.PaperUnits    = paperSizeUnits;
fig.PaperSize     = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'07a_HPT_frxD10_eXXmagSpec.pdf','-dpdf','-r0')
print(fig,'07a_HPT_frxD10_eXXmagSpec.tif','-dtiff','-r0')


%% Magnitude Spectra as function of Distance

% =============================================================================================== %
% PARAMETER 01: Magnitude Spectra - eXX
% =============================================================================================== %
figure('Name','frxD01_eXXmagSpecMaxDist','NumberTitle','off')
plot(r/x_c,eXXmagSpecMax_frxD01_03d,'xr','MarkerSize',15,'LineWidth',3);grid on;
pbaspect([1 1 1])
xlabel('x*','FontSize',15)
ylabel('Magnitude','FontSize',15)
% legend('D01','FontSize',15,'Location','SouthWest')
% FORMATTING
fig = gcf;
fig.PaperUnits    = paperSizeUnits;
fig.PaperSize     = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_frxD01_eXXmagSpecDist.pdf','-dpdf','-r0')
print(fig,'01a_HPT_frxD01_eXXmagSpecDist.tif','-dtiff','-r0')

% =============================================================================================== %
% PARAMETER 02: Magnitude Spectra - eXX
% =============================================================================================== %
figure('Name','frxD02_eXXmagSpecMaxDist','NumberTitle','off')
plot(r/x_c,eXXmagSpecMax_frxD02_03d,'xb','MarkerSize',15,'LineWidth',3);grid on;
pbaspect([1 1 1])
xlabel('x*','FontSize',15)
ylabel('Magnitude','FontSize',15)
% legend('D02','FontSize',15,'Location','SouthWest')
% FORMATTING
fig = gcf;
fig.PaperUnits    = paperSizeUnits;
fig.PaperSize     = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_frxD02_eXXmagSpecDist.pdf','-dpdf','-r0')
print(fig,'01a_HPT_frxD02_eXXmagSpecDist.tif','-dtiff','-r0')

% =============================================================================================== %
% PARAMETER 03: Magnitude Spectra - eXX
% =============================================================================================== %
figure('Name','frxD03_eXXmagSpecMaxDist','NumberTitle','off')
plot(r/x_c,eXXmagSpecMax_frxD03_03d,'xg','MarkerSize',15,'LineWidth',3);grid on;
pbaspect([1 1 1])
xlabel('x*','FontSize',15)
ylabel('Magnitude','FontSize',15)
% legend('D03','FontSize',15,'Location','SouthWest')
% FORMATTING
fig = gcf;
fig.PaperUnits    = paperSizeUnits;
fig.PaperSize     = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_frxD03_eXXmagSpecDist.pdf','-dpdf','-r0')
print(fig,'01a_HPT_frxD03_eXXmagSpecDist.tif','-dtiff','-r0')

% =============================================================================================== %
% PARAMETER 04: Magnitude Spectra - eXX
% =============================================================================================== %
figure('Name','frxD04_eXXmagSpecMaxDist','NumberTitle','off')
plot(r/x_c,eXXmagSpecMax_frxD04_03d,'xr','MarkerSize',15,'LineWidth',3);grid on;
pbaspect([1 1 1])
xlabel('x*','FontSize',15)
ylabel('Magnitude','FontSize',15)
% legend('D04','FontSize',15,'Location','SouthWest')
% FORMATTING
fig = gcf;
fig.PaperUnits    = paperSizeUnits;
fig.PaperSize     = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_frxD04_eXXmagSpecDist.pdf','-dpdf','-r0')
print(fig,'01a_HPT_frxD04_eXXmagSpecDist.tif','-dtiff','-r0')

% =============================================================================================== %
% PARAMETER 05: Magnitude Spectra - eXX
% =============================================================================================== %
figure('Name','frxD05_eXXmagSpecMaxDist','NumberTitle','off')
plot(r/x_c,eXXmagSpecMax_frxD05_03d,'xb','MarkerSize',15,'LineWidth',3);grid on;
pbaspect([1 1 1])
xlabel('x*','FontSize',15)
ylabel('Magnitude','FontSize',15)
% legend('D05','FontSize',15,'Location','SouthWest')
% FORMATTING
fig = gcf;
fig.PaperUnits    = paperSizeUnits;
fig.PaperSize     = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_frxD05_eXXmagSpecDist.pdf','-dpdf','-r0')
print(fig,'01a_HPT_frxD05_eXXmagSpecDist.tif','-dtiff','-r0')

% =============================================================================================== %
% PARAMETER 06: Magnitude Spectra - eXX
% =============================================================================================== %
figure('Name','frxD06_eXXmagSpecMaxDist','NumberTitle','off')
plot(r/x_c,eXXmagSpecMax_frxD06_03d,'xg','MarkerSize',15,'LineWidth',3);grid on;
pbaspect([1 1 1])
xlabel('x*','FontSize',15)
ylabel('Magnitude','FontSize',15)
% legend('D06','FontSize',15,'Location','SouthWest')
% FORMATTING
fig = gcf;
fig.PaperUnits    = paperSizeUnits;
fig.PaperSize     = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_frxD06_eXXmagSpecDist.pdf','-dpdf','-r0')
print(fig,'01a_HPT_frxD06_eXXmagSpecDist.tif','-dtiff','-r0')

% =============================================================================================== %
% PARAMETER 07: Magnitude Spectra - eXX
% =============================================================================================== %
figure('Name','frxD07_eXXmagSpecMaxDist','NumberTitle','off')
plot(r/x_c,eXXmagSpecMax_frxD07_03d,'xr','MarkerSize',15,'LineWidth',3);grid on;
pbaspect([1 1 1])
xlabel('x*','FontSize',15)
ylabel('Magnitude','FontSize',15)
% legend('D07','FontSize',15,'Location','SouthWest')
% FORMATTING
fig = gcf;
fig.PaperUnits    = paperSizeUnits;
fig.PaperSize     = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_frxD07_eXXmagSpecDist.pdf','-dpdf','-r0')
print(fig,'01a_HPT_frxD07_eXXmagSpecDist.tif','-dtiff','-r0')

% =============================================================================================== %
% PARAMETER 08: Magnitude Spectra - eXX
% =============================================================================================== %
figure('Name','frxD08_eXXmagSpecMaxDist','NumberTitle','off')
plot(r/x_c,eXXmagSpecMax_frxD08_03d,'xb','MarkerSize',15,'LineWidth',3);grid on;
pbaspect([1 1 1])
xlabel('x*','FontSize',15)
ylabel('Magnitude','FontSize',15)
% legend('D08','FontSize',15,'Location','SouthWest')
% FORMATTING
fig = gcf;
fig.PaperUnits    = paperSizeUnits;
fig.PaperSize     = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_frxD08_eXXmagSpecDist.pdf','-dpdf','-r0')
print(fig,'01a_HPT_frxD08_eXXmagSpecDist.tif','-dtiff','-r0')

% =============================================================================================== %
% PARAMETER 09: Magnitude Spectra - eXX
% =============================================================================================== %
figure('Name','frxD09_eXXmagSpecMaxDist','NumberTitle','off')
plot(r/x_c,eXXmagSpecMax_frxD09_03d,'xg','MarkerSize',15,'LineWidth',3);grid on;
pbaspect([1 1 1])
xlabel('x*','FontSize',15)
ylabel('Magnitude','FontSize',15)
% legend('D09','FontSize',15,'Location','SouthWest')
% FORMATTING
fig = gcf;
fig.PaperUnits    = paperSizeUnits;
fig.PaperSize     = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_frxD09_eXXmagSpecDist.pdf','-dpdf','-r0')
print(fig,'01a_HPT_frxD09_eXXmagSpecDist.tif','-dtiff','-r0')

% =============================================================================================== %
% PARAMETER 10: Magnitude Spectra - eXX
% =============================================================================================== %
figure('Name','frxD10_eXXmagSpecMaxDist','NumberTitle','off')
plot(r/x_c,eXXmagSpecMax_frxD10_03d,'xr','MarkerSize',15,'LineWidth',3);grid on;
pbaspect([1 1 1])
xlabel('x*','FontSize',15)
ylabel('Magnitude','FontSize',15)
% legend('D10','FontSize',15,'Location','SouthWest')
% FORMATTING
fig = gcf;
fig.PaperUnits    = paperSizeUnits;
fig.PaperSize     = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_frxD10_eXXmagSpecDist.pdf','-dpdf','-r0')
print(fig,'01a_HPT_frxD10_eXXmagSpecDist.tif','-dtiff','-r0')

% =============================================================================================== %
% ALL PARAMETERS: Magnitude Spectra - eXX
% =============================================================================================== %
figure('Name','sweepDfrx_eXXmagSpecMaxDist','NumberTitle','off')
plot(r/x_c,eXXmagSpecMax_frxD01_03d,'x','MarkerSize',15,'LineWidth',3);hold on;
plot(r/x_c,eXXmagSpecMax_frxD02_03d,'x','MarkerSize',15,'LineWidth',3)
plot(r/x_c,eXXmagSpecMax_frxD03_03d,'x','MarkerSize',15,'LineWidth',3)
plot(r/x_c,eXXmagSpecMax_frxD04_03d,'x','MarkerSize',15,'LineWidth',3)
plot(r/x_c,eXXmagSpecMax_frxD05_03d,'x','MarkerSize',15,'LineWidth',3)
plot(r/x_c,eXXmagSpecMax_frxD06_03d,'x','MarkerSize',15,'LineWidth',3)
plot(r/x_c,eXXmagSpecMax_frxD07_03d,'x','MarkerSize',15,'LineWidth',3)
plot(r/x_c,eXXmagSpecMax_frxD08_03d,'x','MarkerSize',15,'LineWidth',3)
plot(r/x_c,eXXmagSpecMax_frxD09_03d,'x','MarkerSize',15,'LineWidth',3)
plot(r/x_c,eXXmagSpecMax_frxD10_03d,'x','MarkerSize',15,'LineWidth',3);hold off;grid on;
pbaspect([1 1 1])
xlabel('x*','FontSize',15)
ylabel('Magnitude','FontSize',15)
% legend('D01','D02','D03','D04','D05','D06','D07','D08','D09','D10','FontSize',15)
% FORMATTING
fig = gcf;
fig.PaperUnits    = paperSizeUnits;
fig.PaperSize     = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_swpDfrx_eXXmagSpecDist.pdf','-dpdf','-r0')
print(fig,'01a_HPT_swpDfrx_eXXmagSpecDist.tif','-dtiff','-r0')

%% Magnitude Spectra as function of Fracture Diffusivity
% =============================================================================================== %
% 05w03d: Magnitude Spectra - eXX
% =============================================================================================== %
figure('Name','05w03d_sweepDfrx_eXXmagSpec','NumberTitle','off')
plot(ModelParams_sweepDfrx(1).D01_frx,eXXmagSpecMax_frxD01_03d(1),'x','MarkerSize',15,'LineWidth',3);hold on;
plot(ModelParams_sweepDfrx(1).D02_frx,eXXmagSpecMax_frxD02_03d(1),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx(1).D03_frx,eXXmagSpecMax_frxD03_03d(1),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx(1).D04_frx,eXXmagSpecMax_frxD04_03d(1),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx(1).D05_frx,eXXmagSpecMax_frxD05_03d(1),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx(1).D06_frx,eXXmagSpecMax_frxD06_03d(1),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx(1).D07_frx,eXXmagSpecMax_frxD07_03d(1),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx(1).D08_frx,eXXmagSpecMax_frxD08_03d(1),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx(1).D09_frx,eXXmagSpecMax_frxD09_03d(1),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx(1).D10_frx,eXXmagSpecMax_frxD10_03d(1),'x','MarkerSize',15,'LineWidth',3);hold off;grid on;
pbaspect([1 1 1])
xlabel('Diffusivity [m^{2}/s]','FontSize',15)
ylabel('Magnitude','FontSize',15)
% legend('D01','D02','D03','D04','D05','D06','D07','D08','D09','D10','FontSize',15,'Location','SouthEast')
% FORMATTING
fig = gcf;
fig.PaperUnits    = paperSizeUnits;
fig.PaperSize     = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_eXXmagSpec_05w03d.pdf','-dpdf','-r0')
print(fig,'01a_HPT_eXXmagSpec_05w03d.tif','-dtiff','-r0')

% =============================================================================================== %
% 25w03d: Magnitude Spectra - eXX
% =============================================================================================== %
figure('Name','25w03d_sweepDfrx_eXXmagSpec','NumberTitle','off')
plot(ModelParams_sweepDfrx(1).D01_frx,eXXmagSpecMax_frxD01_03d(2),'x','MarkerSize',15,'LineWidth',3);hold on;
plot(ModelParams_sweepDfrx(1).D02_frx,eXXmagSpecMax_frxD02_03d(2),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx(1).D03_frx,eXXmagSpecMax_frxD03_03d(2),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx(1).D04_frx,eXXmagSpecMax_frxD04_03d(2),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx(1).D05_frx,eXXmagSpecMax_frxD05_03d(2),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx(1).D06_frx,eXXmagSpecMax_frxD06_03d(2),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx(1).D07_frx,eXXmagSpecMax_frxD07_03d(2),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx(1).D08_frx,eXXmagSpecMax_frxD08_03d(2),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx(1).D09_frx,eXXmagSpecMax_frxD09_03d(2),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx(1).D10_frx,eXXmagSpecMax_frxD10_03d(2),'x','MarkerSize',15,'LineWidth',3);hold off;grid on;
pbaspect([1 1 1])
xlabel('Diffusivity [m^{2}/s]','FontSize',15)
ylabel('Magnitude','FontSize',15)
% legend('D01','D02','D03','D04','D05','D06','D07','D08','D09','D10','FontSize',15,'Location','SouthEast')
% FORMATTING
fig = gcf;
fig.PaperUnits    = paperSizeUnits;
fig.PaperSize     = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_eXXmagSpec_25w03d.pdf','-dpdf','-r0')
print(fig,'01a_HPT_eXXmagSpec_25w03d.tif','-dtiff','-r0')

% =============================================================================================== %
% 50w03d: Magnitude Spectra - eXX
% =============================================================================================== %
figure('Name','50w03d_sweepDfrx_eXXmagSpec','NumberTitle','off')
plot(ModelParams_sweepDfrx(1).D01_frx,eXXmagSpecMax_frxD01_03d(3),'x','MarkerSize',15,'LineWidth',3);hold on;
plot(ModelParams_sweepDfrx(1).D02_frx,eXXmagSpecMax_frxD02_03d(3),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx(1).D03_frx,eXXmagSpecMax_frxD03_03d(3),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx(1).D04_frx,eXXmagSpecMax_frxD04_03d(3),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx(1).D05_frx,eXXmagSpecMax_frxD05_03d(3),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx(1).D06_frx,eXXmagSpecMax_frxD06_03d(3),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx(1).D07_frx,eXXmagSpecMax_frxD07_03d(3),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx(1).D08_frx,eXXmagSpecMax_frxD08_03d(3),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx(1).D09_frx,eXXmagSpecMax_frxD09_03d(3),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx(1).D10_frx,eXXmagSpecMax_frxD10_03d(3),'x','MarkerSize',15,'LineWidth',3);hold off;grid on;
pbaspect([1 1 1])
xlabel('Diffusivity [m^{2}/s]','FontSize',15)
ylabel('Magnitude','FontSize',15)
% legend('D01','D02','D03','D04','D05','D06','D07','D08','D09','D10','FontSize',15,'Location','SouthEast')
% FORMATTING
fig = gcf;
fig.PaperUnits    = paperSizeUnits;
fig.PaperSize     = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_eXXmagSpec_50w03d.pdf','-dpdf','-r0')
print(fig,'01a_HPT_eXXmagSpec_50w03d.tif','-dtiff','-r0')

% =============================================================================================== %
% 100w03d: Magnitude Spectra - eXX
% =============================================================================================== %
figure('Name','100w03d_sweepDfrx_eXXmagSpec','NumberTitle','off')
plot(ModelParams_sweepDfrx(1).D01_frx,eXXmagSpecMax_frxD01_03d(4),'x','MarkerSize',15,'LineWidth',3);hold on;
plot(ModelParams_sweepDfrx(1).D02_frx,eXXmagSpecMax_frxD02_03d(4),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx(1).D03_frx,eXXmagSpecMax_frxD03_03d(4),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx(1).D04_frx,eXXmagSpecMax_frxD04_03d(4),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx(1).D05_frx,eXXmagSpecMax_frxD05_03d(4),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx(1).D06_frx,eXXmagSpecMax_frxD06_03d(4),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx(1).D07_frx,eXXmagSpecMax_frxD07_03d(4),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx(1).D08_frx,eXXmagSpecMax_frxD08_03d(4),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx(1).D09_frx,eXXmagSpecMax_frxD09_03d(4),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx(1).D10_frx,eXXmagSpecMax_frxD10_03d(4),'x','MarkerSize',15,'LineWidth',3);hold off;grid on;
pbaspect([1 1 1])
xlabel('Diffusivity [m^{2}/s]','FontSize',15)
ylabel('Magnitude','FontSize',15)
% legend('D01','D02','D03','D04','D05','D06','D07','D08','D09','D10','FontSize',15,'Location','SouthEast')
% FORMATTING
fig = gcf;
fig.PaperUnits    = paperSizeUnits;
fig.PaperSize     = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_eXXmagSpec_100w03d.pdf','-dpdf','-r0')
print(fig,'01a_HPT_eXXmagSpec_100w03d.tif','-dtiff','-r0')

% =============================================================================================== %
% ALL LOCATIONS: Magnitude Spectra - eXX
% =============================================================================================== %
figure('Name','allLocations_eXXmagSpec','NumberTitle','off')
subplot(2,2,1)
plot(ModelParams_sweepDfrx(1).D01_frx,eXXmagSpecMax_frxD01_03d(1),'x','MarkerSize',15,'LineWidth',3);hold on;
plot(ModelParams_sweepDfrx(1).D02_frx,eXXmagSpecMax_frxD02_03d(1),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx(1).D03_frx,eXXmagSpecMax_frxD03_03d(1),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx(1).D04_frx,eXXmagSpecMax_frxD04_03d(1),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx(1).D05_frx,eXXmagSpecMax_frxD05_03d(1),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx(1).D06_frx,eXXmagSpecMax_frxD06_03d(1),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx(1).D07_frx,eXXmagSpecMax_frxD07_03d(1),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx(1).D08_frx,eXXmagSpecMax_frxD08_03d(1),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx(1).D09_frx,eXXmagSpecMax_frxD09_03d(1),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx(1).D10_frx,eXXmagSpecMax_frxD10_03d(1),'x','MarkerSize',15,'LineWidth',3);hold off;grid on;
pbaspect([1 1 1])
xlabel('Diffusivity [m^{2}/s]','FontSize',15)
ylabel('Magnitude','FontSize',15)
title('05w03d')
subplot(2,2,2)
plot(ModelParams_sweepDfrx(1).D01_frx,eXXmagSpecMax_frxD01_03d(2),'x','MarkerSize',15,'LineWidth',3);hold on;
plot(ModelParams_sweepDfrx(1).D02_frx,eXXmagSpecMax_frxD02_03d(2),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx(1).D03_frx,eXXmagSpecMax_frxD03_03d(2),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx(1).D04_frx,eXXmagSpecMax_frxD04_03d(2),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx(1).D05_frx,eXXmagSpecMax_frxD05_03d(2),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx(1).D06_frx,eXXmagSpecMax_frxD06_03d(2),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx(1).D07_frx,eXXmagSpecMax_frxD07_03d(2),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx(1).D08_frx,eXXmagSpecMax_frxD08_03d(2),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx(1).D09_frx,eXXmagSpecMax_frxD09_03d(2),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx(1).D10_frx,eXXmagSpecMax_frxD10_03d(2),'x','MarkerSize',15,'LineWidth',3);hold off;grid on;
pbaspect([1 1 1])
xlabel('Diffusivity [m^{2}/s]','FontSize',15)
ylabel('Magnitude','FontSize',15)
title('25w03d')
subplot(2,2,3)
plot(ModelParams_sweepDfrx(1).D01_frx,eXXmagSpecMax_frxD01_03d(3),'x','MarkerSize',15,'LineWidth',3);hold on;
plot(ModelParams_sweepDfrx(1).D02_frx,eXXmagSpecMax_frxD02_03d(3),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx(1).D03_frx,eXXmagSpecMax_frxD03_03d(3),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx(1).D04_frx,eXXmagSpecMax_frxD04_03d(3),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx(1).D05_frx,eXXmagSpecMax_frxD05_03d(3),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx(1).D06_frx,eXXmagSpecMax_frxD06_03d(3),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx(1).D07_frx,eXXmagSpecMax_frxD07_03d(3),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx(1).D08_frx,eXXmagSpecMax_frxD08_03d(3),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx(1).D09_frx,eXXmagSpecMax_frxD09_03d(3),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx(1).D10_frx,eXXmagSpecMax_frxD10_03d(3),'x','MarkerSize',15,'LineWidth',3);hold off;grid on;
pbaspect([1 1 1])
xlabel('Diffusivity [m^{2}/s]','FontSize',15)
ylabel('Magnitude','FontSize',15)
title('50w03d')
subplot(2,2,4)
plot(ModelParams_sweepDfrx(1).D01_frx,eXXmagSpecMax_frxD01_03d(4),'x','MarkerSize',15,'LineWidth',3);hold on;
plot(ModelParams_sweepDfrx(1).D02_frx,eXXmagSpecMax_frxD02_03d(4),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx(1).D03_frx,eXXmagSpecMax_frxD03_03d(4),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx(1).D04_frx,eXXmagSpecMax_frxD04_03d(4),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx(1).D05_frx,eXXmagSpecMax_frxD05_03d(4),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx(1).D06_frx,eXXmagSpecMax_frxD06_03d(4),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx(1).D07_frx,eXXmagSpecMax_frxD07_03d(4),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx(1).D08_frx,eXXmagSpecMax_frxD08_03d(4),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx(1).D09_frx,eXXmagSpecMax_frxD09_03d(4),'x','MarkerSize',15,'LineWidth',3)
plot(ModelParams_sweepDfrx(1).D10_frx,eXXmagSpecMax_frxD10_03d(4),'x','MarkerSize',15,'LineWidth',3);hold off;grid on;
pbaspect([1 1 1])
xlabel('Diffusivity [m^{2}/s]','FontSize',15)
ylabel('Magnitude','FontSize',15)
title('100w03d')
% % legend('D01','D02','D03','D04','D05','D06','D07','D08','D09','D10','FontSize',15,'Location','SouthEast')
% FORMATTING
fig = gcf;
fig.PaperUnits    = paperSizeUnits;
fig.PaperSize     = [paperSizeW_2by2 paperSizeH_2by2];
fig.PaperPosition = [0 0 paperSizeW_2by2 paperSizeH_2by2];
print(fig,'01a_HPT_eXXmagSpec_allProbes.pdf','-dpdf','-r0')
print(fig,'01a_HPT_eXXmagSpec_allProbes.tif','-dtiff','-r0')

%% Detectability of Magnitude Spectra

% =============================================================================================== %
% PARAMETER 01: eXX Detectability 
% =============================================================================================== %
figure('Name','eXXmagSpecDet_D01','NumberTitle','off')
loglog(f_eXXmagSpecMax,eXXmagSpecMax_frxD01_03d(:,1),'xr','LineWidth',3);hold on
loglog(f_eXXmagSpecMax,eXXmagSpecMax_frxD01_03d(:,2),'xb','LineWidth',3)
loglog(f_eXXmagSpecMax,eXXmagSpecMax_frxD01_03d(:,3),'xg','LineWidth',3)
loglog(f_eXXmagSpecMax,eXXmagSpecMax_frxD01_03d(:,4),'xm','LineWidth',3)
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
fig.PaperUnits    = paperSizeUnits;
fig.PaperSize     = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_eXXmagSpecDet_D01.pdf','-dpdf','-r0')
print(fig,'01a_HPT_eXXmagSpecDet_D01.tif','-dtiff','-r0')

% =============================================================================================== %
% PARAMETER 02: eXX Detectability 
% =============================================================================================== %
figure('Name','eXXmagSpecDet_D02','NumberTitle','off')
loglog(f_eXXmagSpecMax,eXXmagSpecMax_frxD02_03d(:,1),'xr','LineWidth',3);hold on
loglog(f_eXXmagSpecMax,eXXmagSpecMax_frxD02_03d(:,2),'xb','LineWidth',3)
loglog(f_eXXmagSpecMax,eXXmagSpecMax_frxD02_03d(:,3),'xg','LineWidth',3)
loglog(f_eXXmagSpecMax,eXXmagSpecMax_frxD02_03d(:,4),'xm','LineWidth',3)
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
fig.PaperUnits    = paperSizeUnits;
fig.PaperSize     = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_eXXmagSpecDet_D02.pdf','-dpdf','-r0')
print(fig,'01a_HPT_eXXmagSpecDet_D02.tif','-dtiff','-r0')

% =============================================================================================== %
% PARAMETER 03: eXX Detectability 
% =============================================================================================== %
figure('Name','eXXmagSpecDet_D03','NumberTitle','off')
loglog(f_eXXmagSpecMax,eXXmagSpecMax_frxD03_03d(:,1),'xr','LineWidth',3);hold on
loglog(f_eXXmagSpecMax,eXXmagSpecMax_frxD03_03d(:,2),'xb','LineWidth',3)
loglog(f_eXXmagSpecMax,eXXmagSpecMax_frxD03_03d(:,3),'xg','LineWidth',3)
loglog(f_eXXmagSpecMax,eXXmagSpecMax_frxD03_03d(:,4),'xm','LineWidth',3)
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
fig.PaperUnits    = paperSizeUnits;
fig.PaperSize     = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_eXXmagSpecDet_D03.pdf','-dpdf','-r0')
print(fig,'01a_HPT_eXXmagSpecDet_D03.tif','-dtiff','-r0')
% =============================================================================================== %
% PARAMETER 04: eXX Detectability 
% =============================================================================================== %
figure('Name','eXXmagSpecDet_D04','NumberTitle','off')
loglog(f_eXXmagSpecMax,eXXmagSpecMax_frxD04_03d(:,1),'xr','LineWidth',3);hold on
loglog(f_eXXmagSpecMax,eXXmagSpecMax_frxD04_03d(:,2),'xb','LineWidth',3)
loglog(f_eXXmagSpecMax,eXXmagSpecMax_frxD04_03d(:,3),'xg','LineWidth',3)
loglog(f_eXXmagSpecMax,eXXmagSpecMax_frxD04_03d(:,4),'xm','LineWidth',3)
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
fig.PaperUnits    = paperSizeUnits;
fig.PaperSize     = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_eXXmagSpecDet_D04.pdf','-dpdf','-r0')
print(fig,'01a_HPT_eXXmagSpecDet_D04.tif','-dtiff','-r0')

% =============================================================================================== %
% PARAMETER 05: eXX Detectability 
% =============================================================================================== %
figure('Name','eXXmagSpecDet_D05','NumberTitle','off')
loglog(f_eXXmagSpecMax,eXXmagSpecMax_frxD05_03d(:,1),'xr','LineWidth',3);hold on
loglog(f_eXXmagSpecMax,eXXmagSpecMax_frxD05_03d(:,2),'xb','LineWidth',3)
loglog(f_eXXmagSpecMax,eXXmagSpecMax_frxD05_03d(:,3),'xg','LineWidth',3)
loglog(f_eXXmagSpecMax,eXXmagSpecMax_frxD05_03d(:,4),'xm','LineWidth',3)
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
fig.PaperUnits    = paperSizeUnits;
fig.PaperSize     = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_eXXmagSpecDet_D05.pdf','-dpdf','-r0')
print(fig,'01a_HPT_eXXmagSpecDet_D05.tif','-dtiff','-r0')

% =============================================================================================== %
% PARAMETER 06: eXX Detectability 
% =============================================================================================== %
figure('Name','eXXmagSpecDet_D06','NumberTitle','off')
loglog(f_eXXmagSpecMax,eXXmagSpecMax_frxD06_03d(:,1),'xr','LineWidth',3);hold on
loglog(f_eXXmagSpecMax,eXXmagSpecMax_frxD06_03d(:,2),'xb','LineWidth',3)
loglog(f_eXXmagSpecMax,eXXmagSpecMax_frxD06_03d(:,3),'xg','LineWidth',3)
loglog(f_eXXmagSpecMax,eXXmagSpecMax_frxD06_03d(:,4),'xm','LineWidth',3)
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
fig.PaperUnits    = paperSizeUnits;
fig.PaperSize     = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_eXXmagSpecDet_D06.pdf','-dpdf','-r0')
print(fig,'01a_HPT_eXXmagSpecDet_D06.tif','-dtiff','-r0')

% ================================================================================================= %
% ================================================================================================= %