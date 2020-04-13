%% plotModelData2D_HPT_sweepcTpMult
% Author: R. Moak
% Date: 03/04/20

%% Set Path to Output Folder
cd 'X:\Clemson\Thesis\Models\COMSOL\00_Simulations\LeakDetection\01_ConceptualModels\01a_LD_WDp2D_fS_XPTf\OutputPlots'
addpath('X:\Clemson\Thesis\Models\COMSOL\00_Simulations\LeakDetection\Analyses_All\plotModelData');
addpath('X:\Clemson\Thesis\Data\02_Avant\00_Example')

%% Load Plot Data and Formatting Variables
plotFormatting;
load('areal_strain_magspec');
load('sz_strain_magspec');

%% Scaling Parameters
% Define Parameters
alpha_b = 1;
Pc      = ModelParams_sweepcTpMult.p_inj;
X_frx   = ModelParams_sweepcTpMult.X_frx;
X_conf  = ModelParams_sweepcTpMult.X_conf;

% Dimensionless Scaling
e0_frx  = alpha_b*Pc*X_frx;
e0_conf = alpha_b*Pc*X_conf;

%% Injection Periods

cTp01 = ModelParams_sweepcTpMult.cTp01_inj;
cTp02 = ModelParams_sweepcTpMult.cTp02_inj;
cTp03 = ModelParams_sweepcTpMult.cTp03_inj;
cTp04 = ModelParams_sweepcTpMult.cTp04_inj;
cTp05 = ModelParams_sweepcTpMult.cTp05_inj;
cTp06 = ModelParams_sweepcTpMult.cTp06_inj;
cTp07 = ModelParams_sweepcTpMult.cTp07_inj;
cTp08 = ModelParams_sweepcTpMult.cTp08_inj;

%% Magnitude Spectra Plots
% =============================================================================================== %
% PARAMETER 01: Magnitude Spectra - eXX
% =============================================================================================== %
figure('Name','eXXmagSpec_cTp01','NumberTitle','off')
loglog(f_cTpMult01,eXXmagSpec_cTpMult01_03d(:,1),'r','LineWidth',3);hold on
loglog(f_cTpMult01,eXXmagSpec_cTpMult01_03d(:,2),'b','LineWidth',3)
loglog(f_cTpMult01,eXXmagSpec_cTpMult01_03d(:,3),'g','LineWidth',3)
loglog(f_cTpMult01,eXXmagSpec_cTpMult01_03d(:,4),'m','LineWidth',3);hold off; grid on
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
print(fig,'01a_HPT_cTpMult01_eXXmagSpec.pdf','-dpdf','-r0')
print(fig,'01a_HPT_cTpMult01_eXXmagSpec.tif','-dtiff','-r0')

% =============================================================================================== %
% PARAMETER 02: Magnitude Spectra - eXX
% =============================================================================================== %
figure('Name','eXXmagSpec_cTp02','NumberTitle','off')
loglog(1/cTp02,eXXmagSpec_cTpMult02_03d(:,1),'r','LineWidth',3);hold on
loglog(1/cTp02,eXXmagSpec_cTpMult02_03d(:,2),'b','LineWidth',3)
loglog(1/cTp02,eXXmagSpec_cTpMult02_03d(:,3),'g','LineWidth',3)
loglog(1/cTp02,eXXmagSpec_cTpMult02_03d(:,4),'m','LineWidth',3);hold off; grid on
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
print(fig,'01a_HPT_cTpMult02_eXXmagSpec.pdf','-dpdf','-r0')
print(fig,'01a_HPT_cTpMult02_eXXmagSpec.tif','-dtiff','-r0')

% =============================================================================================== %
% PARAMETER 03: Magnitude Spectra - eXX
% =============================================================================================== %
figure('Name','eXXmagSpec_cTp03','NumberTitle','off')
loglog(1/cTp03,eXXmagSpec_cTpMult03_03d(:,1),'r','LineWidth',3);hold on
loglog(1/cTp03,eXXmagSpec_cTpMult03_03d(:,2),'b','LineWidth',3)
loglog(1/cTp03,eXXmagSpec_cTpMult03_03d(:,3),'g','LineWidth',3)
loglog(1/cTp03,eXXmagSpec_cTpMult03_03d(:,4),'m','LineWidth',3);hold off; grid on
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
print(fig,'01a_HPT_cTpMult03_eXXmagSpec.pdf','-dpdf','-r0')
print(fig,'01a_HPT_cTpMult03_eXXmagSpec.tif','-dtiff','-r0')

% =============================================================================================== %
% PARAMETER 04: Magnitude Spectra - eXX
% =============================================================================================== %
figure('Name','eXXmagSpec_cTp04','NumberTitle','off')
loglog(1/cTp04,eXXmagSpec_cTpMult04_03d(:,1),'r','LineWidth',3);hold on
loglog(1/cTp04,eXXmagSpec_cTpMult04_03d(:,2),'b','LineWidth',3)
loglog(1/cTp04,eXXmagSpec_cTpMult04_03d(:,3),'g','LineWidth',3)
loglog(1/cTp04,eXXmagSpec_cTpMult04_03d(:,4),'m','LineWidth',3);hold off; grid on
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
print(fig,'01a_HPT_cTpMult04_eXXmagSpec.pdf','-dpdf','-r0')
print(fig,'01a_HPT_cTpMult04_eXXmagSpec.tif','-dtiff','-r0')

% =============================================================================================== %
% PARAMETER 05: Magnitude Spectra - eXX
% =============================================================================================== %
figure('Name','eXXmagSpec_cTp05','NumberTitle','off')
loglog(1/cTp05,eXXmagSpec_cTpMult05_03d(:,1),'r','LineWidth',3);hold on
loglog(1/cTp05,eXXmagSpec_cTpMult05_03d(:,2),'b','LineWidth',3)
loglog(1/cTp05,eXXmagSpec_cTpMult05_03d(:,3),'g','LineWidth',3)
loglog(1/cTp05,eXXmagSpec_cTpMult05_03d(:,4),'m','LineWidth',3);hold off; grid on
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
print(fig,'01a_HPT_cTpMult05_eXXmagSpec.pdf','-dpdf','-r0')
print(fig,'01a_HPT_cTpMult05_eXXmagSpec.tif','-dtiff','-r0')

% =============================================================================================== %
% PARAMETER 06: Magnitude Spectra - eXX
% =============================================================================================== %
figure('Name','eXXmagSpec_cTp06','NumberTitle','off')
loglog(1/cTp06,eXXmagSpec_cTpMult06_03d(:,1),'r','LineWidth',3);hold on
loglog(1/cTp06,eXXmagSpec_cTpMult06_03d(:,2),'b','LineWidth',3)
loglog(1/cTp06,eXXmagSpec_cTpMult06_03d(:,3),'g','LineWidth',3)
loglog(1/cTp06,eXXmagSpec_cTpMult06_03d(:,4),'m','LineWidth',3);hold off; grid on
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
print(fig,'01a_HPT_cTpMult06_eXXmagSpec.pdf','-dpdf','-r0')
print(fig,'01a_HPT_cTpMult06_eXXmagSpec.tif','-dtiff','-r0')

% =============================================================================================== %
% PARAMETER 07: Magnitude Spectra - eXX
% =============================================================================================== %
figure('Name','eXXmagSpec_cTp07','NumberTitle','off')
loglog(1/cTp07,eXXmagSpec_cTpMult07_03d(:,1),'r','LineWidth',3);hold on
loglog(1/cTp07,eXXmagSpec_cTpMult07_03d(:,2),'b','LineWidth',3)
loglog(1/cTp07,eXXmagSpec_cTpMult07_03d(:,3),'g','LineWidth',3)
loglog(1/cTp07,eXXmagSpec_cTpMult07_03d(:,4),'m','LineWidth',3);hold off; grid on
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
print(fig,'01a_HPT_cTpMult07_eXXmagSpec.pdf','-dpdf','-r0')
print(fig,'01a_HPT_cTpMult07_eXXmagSpec.tif','-dtiff','-r0')

% =============================================================================================== %
% PARAMETER 08: Magnitude Spectra - eXX
% =============================================================================================== %
figure('Name','eXXmagSpec_cTp08','NumberTitle','off')
loglog(1/cTp08,eXXmagSpec_cTpMult08_03d(:,1),'r','LineWidth',3);hold on
loglog(1/cTp08,eXXmagSpec_cTpMult08_03d(:,2),'b','LineWidth',3)
loglog(1/cTp08,eXXmagSpec_cTpMult08_03d(:,3),'g','LineWidth',3)
loglog(1/cTp08,eXXmagSpec_cTpMult08_03d(:,4),'m','LineWidth',3);hold off; grid on
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
print(fig,'01a_HPT_cTpMult08_eXXmagSpec.pdf','-dpdf','-r0')
print(fig,'01a_HPT_cTpMult08_eXXmagSpec.tif','-dtiff','-r0')


%% Magnitude Spectra as function of Distance

% =============================================================================================== %
% PARAMETER 01: Magnitude Spectra - eXX
% =============================================================================================== %
figure('Name','cTpMult01_eXXmagSpecMaxDist','NumberTitle','off')
plot(r/x_c,eXXmagSpecMax_cTpMult01_03d,'xr','MarkerSize',15,'LineWidth',3);grid on;
pbaspect([1 1 1])
xlabel('x*','FontSize',15)
ylabel('Magnitude','FontSize',15)
% legend('D01','FontSize',15,'Location','SouthWest')
% FORMATTING
fig = gcf;
fig.PaperUnits    = paperSizeUnits;
fig.PaperSize     = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_cTpMult01_eXXmagSpecDist.pdf','-dpdf','-r0')
print(fig,'01a_HPT_cTpMult01_eXXmagSpecDist.tif','-dtiff','-r0')

% =============================================================================================== %
% PARAMETER 02: Magnitude Spectra - eXX
% =============================================================================================== %
figure('Name','eXXmagSpecMaxDist_cTpMult02','NumberTitle','off')
plot(r/x_c,eXXmagSpecMax_cTpMult02_03d,'xb','MarkerSize',15,'LineWidth',3);grid on;
pbaspect([1 1 1])
xlabel('x*','FontSize',15)
ylabel('Magnitude','FontSize',15)
% legend('D0','FontSize',15,'Location','SouthWest')
% FORMATTING
fig = gcf;
fig.PaperUnits    = paperSizeUnits;
fig.PaperSize     = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_cTpMult02_eXXmagSpecDist.pdf','-dpdf','-r0')
print(fig,'01a_HPT_cTpMult02_eXXmagSpecDist.tif','-dtiff','-r0')

% =============================================================================================== %
% PARAMETER 03: Magnitude Spectra - eXX
% =============================================================================================== %
figure('Name','eXXmagSpecMaxDist_cTpMult03','NumberTitle','off')
plot(r/x_c,eXXmagSpecMax_cTpMult03_03d,'xg','MarkerSize',15,'LineWidth',3);grid on;
pbaspect([1 1 1])
xlabel('x*','FontSize',15)
ylabel('Magnitude','FontSize',15)
% legend('D03','FontSize',15,'Location','SouthWest')
% FORMATTING
fig = gcf;
fig.PaperUnits    = paperSizeUnits;
fig.PaperSize     = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_cTpMult03_eXXmagSpecDist.pdf','-dpdf','-r0')
print(fig,'01a_HPT_cTpMult03_eXXmagSpecDist.tif','-dtiff','-r0')

% =============================================================================================== %
% PARAMETER 04: Magnitude Spectra - eXX
% =============================================================================================== %
figure('Name','eXXmagSpecMaxDist_cTpMult04','NumberTitle','off')
plot(r/x_c,eXXmagSpecMax_cTpMult04_03d,'xr','MarkerSize',15,'LineWidth',3);grid on;
pbaspect([1 1 1])
xlabel('x*','FontSize',15)
ylabel('Magnitude','FontSize',15)
% legend('D0','FontSize',15,'Location','SouthWest')
% FORMATTING
fig = gcf;
fig.PaperUnits    = paperSizeUnits;
fig.PaperSize     = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_cTpMult04_eXXmagSpecDist.pdf','-dpdf','-r0')
print(fig,'01a_HPT_cTpMult04_eXXmagSpecDist.tif','-dtiff','-r0')

% =============================================================================================== %
% PARAMETER 05: Magnitude Spectra - eXX
% =============================================================================================== %
figure('Name','eXXmagSpecMaxDist_cTpMult05','NumberTitle','off')
plot(r/x_c,eXXmagSpecMax_cTpMult05_03d,'xb','MarkerSize',15,'LineWidth',3);grid on;
pbaspect([1 1 1])
xlabel('x*','FontSize',15)
ylabel('Magnitude','FontSize',15)
% legend('D0','FontSize',15,'Location','SouthWest')
% FORMATTING
fig = gcf;
fig.PaperUnits    = paperSizeUnits;
fig.PaperSize     = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_cTpMult05_eXXmagSpecDist.pdf','-dpdf','-r0')
print(fig,'01a_HPT_cTpMult05_eXXmagSpecDist.tif','-dtiff','-r0')

% =============================================================================================== %
% PARAMETER 06: Magnitude Spectra - eXX
% =============================================================================================== %
figure('Name','eXXmagSpecMaxDist_cTpMult06','NumberTitle','off')
plot(r/x_c,eXXmagSpecMax_cTpMult06_03d,'xg','MarkerSize',15,'LineWidth',3);grid on;
pbaspect([1 1 1])
xlabel('x*','FontSize',15)
ylabel('Magnitude','FontSize',15)
% legend('D0','FontSize',15,'Location','SouthWest')
% FORMATTING
fig = gcf;
fig.PaperUnits    = paperSizeUnits;
fig.PaperSize     = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_cTpMult06_eXXmagSpecDist.pdf','-dpdf','-r0')
print(fig,'01a_HPT_cTpMult06_eXXmagSpecDist.tif','-dtiff','-r0')

% =============================================================================================== %
% PARAMETER 07: Magnitude Spectra - eXX
% =============================================================================================== %
figure('Name','eXXmagSpecMaxDist_cTpMult07','NumberTitle','off')
plot(r/x_c,eXXmagSpecMax_cTpMult07_03d,'xr','MarkerSize',15,'LineWidth',3);grid on;
pbaspect([1 1 1])
xlabel('x*','FontSize',15)
ylabel('Magnitude','FontSize',15)
% legend('D0','FontSize',15,'Location','SouthWest')
% FORMATTING
fig = gcf;
fig.PaperUnits    = paperSizeUnits;
fig.PaperSize     = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_cTpMult07_eXXmagSpecDist.pdf','-dpdf','-r0')
print(fig,'01a_HPT_cTpMult07_eXXmagSpecDist.tif','-dtiff','-r0')

% =============================================================================================== %
% PARAMETER 08: Magnitude Spectra - eXX
% =============================================================================================== %
figure('Name','eXXmagSpecMaxDist_cTpMult08','NumberTitle','off')
plot(r/x_c,eXXmagSpecMax_cTpMult08_03d,'xb','MarkerSize',15,'LineWidth',3);grid on;
pbaspect([1 1 1])
xlabel('x*','FontSize',15)
ylabel('Magnitude','FontSize',15)
% legend('D0','FontSize',15,'Location','SouthWest')
% FORMATTING
fig = gcf;
fig.PaperUnits    = paperSizeUnits;
fig.PaperSize     = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_cTpMult08_eXXmagSpecDist.pdf','-dpdf','-r0')
print(fig,'01a_HPT_cTpMult08_eXXmagSpecDist.tif','-dtiff','-r0')

% =============================================================================================== %
% ALL PARAMETERS: Magnitude Spectra - eXX
% =============================================================================================== %
figure('Name','sweepcTpMult_eXXmagSpecMaxDist','NumberTitle','off')
plot(r/x_c,eXXmagSpecMax_cTpMult01_03d,'x','MarkerSize',15,'LineWidth',3);hold on;
plot(r/x_c,eXXmagSpecMax_cTpMult02_03d,'x','MarkerSize',15,'LineWidth',3)
plot(r/x_c,eXXmagSpecMax_cTpMult03_03d,'x','MarkerSize',15,'LineWidth',3)
plot(r/x_c,eXXmagSpecMax_cTpMult04_03d,'x','MarkerSize',15,'LineWidth',3)
plot(r/x_c,eXXmagSpecMax_cTpMult05_03d,'x','MarkerSize',15,'LineWidth',3)
plot(r/x_c,eXXmagSpecMax_cTpMult06_03d,'x','MarkerSize',15,'LineWidth',3)
plot(r/x_c,eXXmagSpecMax_cTpMult07_03d,'x','MarkerSize',15,'LineWidth',3)
plot(r/x_c,eXXmagSpecMax_cTpMult08_03d,'x','MarkerSize',15,'LineWidth',3);hold off;grid on;
pbaspect([1 1 1])
xlabel('x*','FontSize',15)
ylabel('Magnitude','FontSize',15)
% legend('cTp01','cTp02','cTp03','cTp04','cTp05','cTp06','cTp07','cTp08','FontSize',15)
% FORMATTING
fig = gcf;
fig.PaperUnits    = paperSizeUnits;
fig.PaperSize     = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_swpcTpMult_eXXmagSpecDist.pdf','-dpdf','-r0')
print(fig,'01a_HPT_swpcTpMult_eXXmagSpecDist.tif','-dtiff','-r0')

%% Magnitude Spectra as function of Injection Period
% =============================================================================================== %
% 05w03d: Magnitude Spectra - eXX
% =============================================================================================== %
figure('Name','05w03d_sweepcTpMult_eXXmagSpec','NumberTitle','off')
plot(cTp01,eXXmagSpecMax_cTpMult01_03d(1),'x','MarkerSize',15,'LineWidth',3);hold on;
plot(cTp02,eXXmagSpecMax_cTpMult02_03d(1),'x','MarkerSize',15,'LineWidth',3)
plot(cTp03,eXXmagSpecMax_cTpMult03_03d(1),'x','MarkerSize',15,'LineWidth',3)
plot(cTp04,eXXmagSpecMax_cTpMult04_03d(1),'x','MarkerSize',15,'LineWidth',3)
plot(cTp05,eXXmagSpecMax_cTpMult05_03d(1),'x','MarkerSize',15,'LineWidth',3)
plot(cTp06,eXXmagSpecMax_cTpMult06_03d(1),'x','MarkerSize',15,'LineWidth',3)
plot(cTp07,eXXmagSpecMax_cTpMult07_03d(1),'x','MarkerSize',15,'LineWidth',3)
plot(cTp08,eXXmagSpecMax_cTpMult08_03d(1),'x','MarkerSize',15,'LineWidth',3);hold off;grid on;
pbaspect([1 1 1])
xlabel('Injection Period [s]','FontSize',15)
ylabel('Magnitude','FontSize',15)
% legend('cTp01','cTp02','cTp03','cTp04','cTp05','cTp06','cTp07','cTp08','FontSize',15,'Location','SouthEast')
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
figure('Name','25w03d_sweepcTpMult_eXXmagSpec','NumberTitle','off')
plot(cTp01,eXXmagSpecMax_cTpMult01_03d(2),'x','MarkerSize',15,'LineWidth',3);hold on;
plot(cTp02,eXXmagSpecMax_cTpMult02_03d(2),'x','MarkerSize',15,'LineWidth',3)
plot(cTp03,eXXmagSpecMax_cTpMult03_03d(2),'x','MarkerSize',15,'LineWidth',3)
plot(cTp04,eXXmagSpecMax_cTpMult04_03d(2),'x','MarkerSize',15,'LineWidth',3)
plot(cTp05,eXXmagSpecMax_cTpMult05_03d(2),'x','MarkerSize',15,'LineWidth',3)
plot(cTp06,eXXmagSpecMax_cTpMult06_03d(2),'x','MarkerSize',15,'LineWidth',3)
plot(cTp07,eXXmagSpecMax_cTpMult07_03d(2),'x','MarkerSize',15,'LineWidth',3)
plot(cTp08,eXXmagSpecMax_cTpMult08_03d(2),'x','MarkerSize',15,'LineWidth',3);hold off;grid on;
pbaspect([1 1 1])
xlabel('Injection Period [s]','FontSize',15)
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
figure('Name','50w03d_sweepcTpMult_eXXmagSpec','NumberTitle','off')
plot(cTp01,eXXmagSpecMax_cTpMult01_03d(3),'x','MarkerSize',15,'LineWidth',3);hold on;
plot(cTp02,eXXmagSpecMax_cTpMult02_03d(3),'x','MarkerSize',15,'LineWidth',3)
plot(cTp03,eXXmagSpecMax_cTpMult03_03d(3),'x','MarkerSize',15,'LineWidth',3)
plot(cTp04,eXXmagSpecMax_cTpMult04_03d(3),'x','MarkerSize',15,'LineWidth',3)
plot(cTp05,eXXmagSpecMax_cTpMult05_03d(3),'x','MarkerSize',15,'LineWidth',3)
plot(cTp06,eXXmagSpecMax_cTpMult06_03d(3),'x','MarkerSize',15,'LineWidth',3)
plot(cTp07,eXXmagSpecMax_cTpMult07_03d(3),'x','MarkerSize',15,'LineWidth',3)
plot(cTp08,eXXmagSpecMax_cTpMult08_03d(3),'x','MarkerSize',15,'LineWidth',3);hold off;grid on;
pbaspect([1 1 1])
xlabel('Injection Period [s]','FontSize',15)
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
figure('Name','100w03d_sweepcTpMult_eXXmagSpec','NumberTitle','off')
plot(cTp01,eXXmagSpecMax_cTpMult01_03d(4),'x','MarkerSize',15,'LineWidth',3);hold on;
plot(cTp02,eXXmagSpecMax_cTpMult02_03d(4),'x','MarkerSize',15,'LineWidth',3)
plot(cTp03,eXXmagSpecMax_cTpMult03_03d(4),'x','MarkerSize',15,'LineWidth',3)
plot(cTp04,eXXmagSpecMax_cTpMult04_03d(4),'x','MarkerSize',15,'LineWidth',3)
plot(cTp05,eXXmagSpecMax_cTpMult05_03d(4),'x','MarkerSize',15,'LineWidth',3)
plot(cTp06,eXXmagSpecMax_cTpMult06_03d(4),'x','MarkerSize',15,'LineWidth',3)
plot(cTp07,eXXmagSpecMax_cTpMult07_03d(4),'x','MarkerSize',15,'LineWidth',3)
plot(cTp08,eXXmagSpecMax_cTpMult08_03d(4),'x','MarkerSize',15,'LineWidth',3);hold off;grid on;
pbaspect([1 1 1])
xlabel('Injection Period [s]','FontSize',15)
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
% 110w03d: Magnitude Spectra - eXX
% =============================================================================================== %
figure('Name','110w03d_sweepcTpMult_eXXmagSpec','NumberTitle','off')
plot(cTp01,eXXmagSpecMax_cTpMult01_03d(5),'x','MarkerSize',15,'LineWidth',3);hold on;
plot(cTp02,eXXmagSpecMax_cTpMult02_03d(5),'x','MarkerSize',15,'LineWidth',3)
plot(cTp03,eXXmagSpecMax_cTpMult03_03d(5),'x','MarkerSize',15,'LineWidth',3)
plot(cTp04,eXXmagSpecMax_cTpMult04_03d(5),'x','MarkerSize',15,'LineWidth',3)
plot(cTp05,eXXmagSpecMax_cTpMult05_03d(5),'x','MarkerSize',15,'LineWidth',3)
plot(cTp06,eXXmagSpecMax_cTpMult06_03d(5),'x','MarkerSize',15,'LineWidth',3)
plot(cTp07,eXXmagSpecMax_cTpMult07_03d(5),'x','MarkerSize',15,'LineWidth',3)
plot(cTp08,eXXmagSpecMax_cTpMult08_03d(5),'x','MarkerSize',15,'LineWidth',3);hold off;grid on;
pbaspect([1 1 1])
xlabel('Injection Period [s]','FontSize',15)
ylabel('Magnitude','FontSize',15)
% legend('D01','D02','D03','D04','D05','D06','D07','D08','D09','D10','FontSize',15,'Location','SouthEast')
% FORMATTING
fig = gcf;
fig.PaperUnits    = paperSizeUnits;
fig.PaperSize     = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_eXXmagSpec_110w03d.pdf','-dpdf','-r0')
print(fig,'01a_HPT_eXXmagSpec_110w03d.tif','-dtiff','-r0')

% =============================================================================================== %
% 125w03d: Magnitude Spectra - eXX
% =============================================================================================== %
figure('Name','125w03d_sweepcTpMult_eXXmagSpec','NumberTitle','off')
plot(cTp01,eXXmagSpecMax_cTpMult01_03d(6),'x','MarkerSize',15,'LineWidth',3);hold on;
plot(cTp02,eXXmagSpecMax_cTpMult02_03d(6),'x','MarkerSize',15,'LineWidth',3)
plot(cTp03,eXXmagSpecMax_cTpMult03_03d(6),'x','MarkerSize',15,'LineWidth',3)
plot(cTp04,eXXmagSpecMax_cTpMult04_03d(6),'x','MarkerSize',15,'LineWidth',3)
plot(cTp05,eXXmagSpecMax_cTpMult05_03d(6),'x','MarkerSize',15,'LineWidth',3)
plot(cTp06,eXXmagSpecMax_cTpMult06_03d(6),'x','MarkerSize',15,'LineWidth',3)
plot(cTp07,eXXmagSpecMax_cTpMult07_03d(6),'x','MarkerSize',15,'LineWidth',3)
plot(cTp08,eXXmagSpecMax_cTpMult08_03d(6),'x','MarkerSize',15,'LineWidth',3);hold off;grid on;
pbaspect([1 1 1])
xlabel('Injection Period [s]','FontSize',15)
ylabel('Magnitude','FontSize',15)
% legend('D01','D02','D03','D04','D05','D06','D07','D08','D09','D10','FontSize',15,'Location','SouthEast')
% FORMATTING
fig = gcf;
fig.PaperUnits    = paperSizeUnits;
fig.PaperSize     = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_eXXmagSpec_125w03d.pdf','-dpdf','-r0')
print(fig,'01a_HPT_eXXmagSpec_125w03d.tif','-dtiff','-r0')


% =============================================================================================== %
% ALL LOCATIONS: Magnitude Spectra - eXX
% =============================================================================================== %
figure('Name','allLocations_eXXmagSpec','NumberTitle','off')
subplot(3,3,1)
plot(cTp01,eXXmagSpecMax_cTpMult01_03d(1),'x','MarkerSize',15,'LineWidth',3);hold on;
plot(cTp02,eXXmagSpecMax_cTpMult02_03d(1),'x','MarkerSize',15,'LineWidth',3)
plot(cTp03,eXXmagSpecMax_cTpMult03_03d(1),'x','MarkerSize',15,'LineWidth',3)
plot(cTp04,eXXmagSpecMax_cTpMult04_03d(1),'x','MarkerSize',15,'LineWidth',3)
plot(cTp05,eXXmagSpecMax_cTpMult05_03d(1),'x','MarkerSize',15,'LineWidth',3)
plot(cTp06,eXXmagSpecMax_cTpMult06_03d(1),'x','MarkerSize',15,'LineWidth',3)
plot(cTp07,eXXmagSpecMax_cTpMult07_03d(1),'x','MarkerSize',15,'LineWidth',3)
plot(cTp08,eXXmagSpecMax_cTpMult08_03d(1),'x','MarkerSize',15,'LineWidth',3);hold off;grid on;
pbaspect([1 1 1])
xlabel('Injection Period [s]','FontSize',15)
ylabel('Magnitude','FontSize',15)
title('05w03d')
subplot(3,3,2)
plot(cTp01,eXXmagSpecMax_cTpMult01_03d(2),'x','MarkerSize',15,'LineWidth',3);hold on;
plot(cTp02,eXXmagSpecMax_cTpMult02_03d(2),'x','MarkerSize',15,'LineWidth',3)
plot(cTp03,eXXmagSpecMax_cTpMult03_03d(2),'x','MarkerSize',15,'LineWidth',3)
plot(cTp04,eXXmagSpecMax_cTpMult04_03d(2),'x','MarkerSize',15,'LineWidth',3)
plot(cTp05,eXXmagSpecMax_cTpMult05_03d(2),'x','MarkerSize',15,'LineWidth',3)
plot(cTp06,eXXmagSpecMax_cTpMult06_03d(2),'x','MarkerSize',15,'LineWidth',3)
plot(cTp07,eXXmagSpecMax_cTpMult07_03d(2),'x','MarkerSize',15,'LineWidth',3)
plot(cTp08,eXXmagSpecMax_cTpMult08_03d(2),'x','MarkerSize',15,'LineWidth',3);hold off;grid on;
pbaspect([1 1 1])
xlabel('Diffusivity [m^{2}/s]','FontSize',15)
ylabel('Magnitude','FontSize',15)
title('25w03d')
subplot(3,3,3)
plot(cTp01,eXXmagSpecMax_cTpMult01_03d(3),'x','MarkerSize',15,'LineWidth',3);hold on;
plot(cTp02,eXXmagSpecMax_cTpMult02_03d(3),'x','MarkerSize',15,'LineWidth',3)
plot(cTp03,eXXmagSpecMax_cTpMult03_03d(3),'x','MarkerSize',15,'LineWidth',3)
plot(cTp04,eXXmagSpecMax_cTpMult04_03d(3),'x','MarkerSize',15,'LineWidth',3)
plot(cTp05,eXXmagSpecMax_cTpMult05_03d(3),'x','MarkerSize',15,'LineWidth',3)
plot(cTp06,eXXmagSpecMax_cTpMult06_03d(3),'x','MarkerSize',15,'LineWidth',3)
plot(cTp07,eXXmagSpecMax_cTpMult07_03d(3),'x','MarkerSize',15,'LineWidth',3)
plot(cTp08,eXXmagSpecMax_cTpMult08_03d(3),'x','MarkerSize',15,'LineWidth',3);hold off;grid on;
pbaspect([1 1 1])
xlabel('Injection Period [s]','FontSize',15)
ylabel('Magnitude','FontSize',15)
title('50w03d')
subplot(3,3,4)
plot(cTp01,eXXmagSpecMax_cTpMult01_03d(4),'x','MarkerSize',15,'LineWidth',3);hold on;
plot(cTp02,eXXmagSpecMax_cTpMult02_03d(4),'x','MarkerSize',15,'LineWidth',3)
plot(cTp03,eXXmagSpecMax_cTpMult03_03d(4),'x','MarkerSize',15,'LineWidth',3)
plot(cTp04,eXXmagSpecMax_cTpMult04_03d(4),'x','MarkerSize',15,'LineWidth',3)
plot(cTp05,eXXmagSpecMax_cTpMult05_03d(4),'x','MarkerSize',15,'LineWidth',3)
plot(cTp06,eXXmagSpecMax_cTpMult06_03d(4),'x','MarkerSize',15,'LineWidth',3)
plot(cTp07,eXXmagSpecMax_cTpMult07_03d(4),'x','MarkerSize',15,'LineWidth',3)
plot(cTp08,eXXmagSpecMax_cTpMult08_03d(4),'x','MarkerSize',15,'LineWidth',3);hold off;grid on;
pbaspect([1 1 1])
xlabel('Injection Period [s]','FontSize',15)
ylabel('Magnitude','FontSize',15)
title('100w03d')
subplot(3,3,5)
plot(cTp01,eXXmagSpecMax_cTpMult01_03d(5),'x','MarkerSize',15,'LineWidth',3);hold on;
plot(cTp02,eXXmagSpecMax_cTpMult02_03d(5),'x','MarkerSize',15,'LineWidth',3)
plot(cTp03,eXXmagSpecMax_cTpMult03_03d(5),'x','MarkerSize',15,'LineWidth',3)
plot(cTp04,eXXmagSpecMax_cTpMult04_03d(5),'x','MarkerSize',15,'LineWidth',3)
plot(cTp05,eXXmagSpecMax_cTpMult05_03d(5),'x','MarkerSize',15,'LineWidth',3)
plot(cTp06,eXXmagSpecMax_cTpMult06_03d(5),'x','MarkerSize',15,'LineWidth',3)
plot(cTp07,eXXmagSpecMax_cTpMult07_03d(5),'x','MarkerSize',15,'LineWidth',3)
plot(cTp08,eXXmagSpecMax_cTpMult08_03d(5),'x','MarkerSize',15,'LineWidth',3);hold off;grid on;
pbaspect([1 1 1])
xlabel('Injection Period [s]','FontSize',15)
ylabel('Magnitude','FontSize',15)
title('110w03d')
subplot(3,3,6)
plot(cTp01,eXXmagSpecMax_cTpMult01_03d(6),'x','MarkerSize',15,'LineWidth',3);hold on;
plot(cTp02,eXXmagSpecMax_cTpMult02_03d(6),'x','MarkerSize',15,'LineWidth',3)
plot(cTp03,eXXmagSpecMax_cTpMult03_03d(6),'x','MarkerSize',15,'LineWidth',3)
plot(cTp04,eXXmagSpecMax_cTpMult04_03d(6),'x','MarkerSize',15,'LineWidth',3)
plot(cTp05,eXXmagSpecMax_cTpMult05_03d(6),'x','MarkerSize',15,'LineWidth',3)
plot(cTp06,eXXmagSpecMax_cTpMult06_03d(6),'x','MarkerSize',15,'LineWidth',3)
plot(cTp07,eXXmagSpecMax_cTpMult07_03d(6),'x','MarkerSize',15,'LineWidth',3)
plot(cTp08,eXXmagSpecMax_cTpMult08_03d(6),'x','MarkerSize',15,'LineWidth',3);hold off;grid on;
pbaspect([1 1 1])
xlabel('Injection Period [s]','FontSize',15)
ylabel('Magnitude','FontSize',15)
title('125w03d')
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
loglog(1/cTp01,eXXmagSpecMax_cTpMult01_03d(:,1),'xr','LineWidth',3);hold on
loglog(1/cTp01,eXXmagSpecMax_cTpMult01_03d(:,2),'xb','LineWidth',3)
loglog(1/cTp01,eXXmagSpecMax_cTpMult01_03d(:,3),'xg','LineWidth',3)
loglog(1/cTp01,eXXmagSpecMax_cTpMult01_03d(:,4),'xm','LineWidth',3)
loglog(1/cTp01,eXXmagSpecMax_cTpMult01_03d(:,5),'xc','LineWidth',3)
loglog(1/cTp01,eXXmagSpecMax_cTpMult01_03d(:,6),'xk','LineWidth',3)
loglog(f,ofsa)
loglog(f,gtsv);hold off; grid on 
pbaspect([1 1 1])
% xlim([1E-8,1E-3])
% ylim([1E-14,1E-8])
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
loglog(1/cTp02,eXXmagSpecMax_cTpMult02_03d(:,1),'xr','LineWidth',3);hold on
loglog(1/cTp02,eXXmagSpecMax_cTpMult02_03d(:,2),'xb','LineWidth',3)
loglog(1/cTp02,eXXmagSpecMax_cTpMult02_03d(:,3),'xg','LineWidth',3)
loglog(1/cTp02,eXXmagSpecMax_cTpMult02_03d(:,4),'xm','LineWidth',3)
loglog(1/cTp02,eXXmagSpecMax_cTpMult02_03d(:,5),'xc','LineWidth',3)
loglog(1/cTp02,eXXmagSpecMax_cTpMult02_03d(:,6),'xk','LineWidth',3)
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
loglog(1/cTp03,eXXmagSpecMax_cTpMult03_03d(:,1),'xr','LineWidth',3);hold on
loglog(1/cTp03,eXXmagSpecMax_cTpMult03_03d(:,2),'xb','LineWidth',3)
loglog(1/cTp03,eXXmagSpecMax_cTpMult03_03d(:,3),'xg','LineWidth',3)
loglog(1/cTp03,eXXmagSpecMax_cTpMult03_03d(:,4),'xm','LineWidth',3)
loglog(1/cTp03,eXXmagSpecMax_cTpMult03_03d(:,5),'xc','LineWidth',3)
loglog(1/cTp03,eXXmagSpecMax_cTpMult03_03d(:,6),'xk','LineWidth',3)
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
loglog(1/cTp04,eXXmagSpecMax_cTpMult04_03d(:,1),'xr','LineWidth',3);hold on
loglog(1/cTp04,eXXmagSpecMax_cTpMult04_03d(:,2),'xb','LineWidth',3)
loglog(1/cTp04,eXXmagSpecMax_cTpMult04_03d(:,3),'xg','LineWidth',3)
loglog(1/cTp04,eXXmagSpecMax_cTpMult04_03d(:,4),'xm','LineWidth',3)
loglog(1/cTp04,eXXmagSpecMax_cTpMult04_03d(:,5),'xc','LineWidth',3)
loglog(1/cTp04,eXXmagSpecMax_cTpMult04_03d(:,6),'xk','LineWidth',3)
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
loglog(1/cTp05,eXXmagSpecMax_cTpMult05_03d(:,1),'xr','LineWidth',3);hold on
loglog(1/cTp05,eXXmagSpecMax_cTpMult05_03d(:,2),'xb','LineWidth',3)
loglog(1/cTp05,eXXmagSpecMax_cTpMult05_03d(:,3),'xg','LineWidth',3)
loglog(1/cTp05,eXXmagSpecMax_cTpMult05_03d(:,4),'xm','LineWidth',3)
loglog(1/cTp05,eXXmagSpecMax_cTpMult05_03d(:,5),'xc','LineWidth',3)
loglog(1/cTp05,eXXmagSpecMax_cTpMult05_03d(:,6),'xk','LineWidth',3)
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
loglog(1/cTp06,eXXmagSpecMax_cTpMult06_03d(:,1),'xr','LineWidth',3);hold on
loglog(1/cTp06,eXXmagSpecMax_cTpMult06_03d(:,2),'xb','LineWidth',3)
loglog(1/cTp06,eXXmagSpecMax_cTpMult06_03d(:,3),'xg','LineWidth',3)
loglog(1/cTp06,eXXmagSpecMax_cTpMult06_03d(:,4),'xm','LineWidth',3)
loglog(1/cTp06,eXXmagSpecMax_cTpMult06_03d(:,5),'xc','LineWidth',3)
loglog(1/cTp06,eXXmagSpecMax_cTpMult06_03d(:,6),'xk','LineWidth',3)
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

% =============================================================================================== %
% PARAMETER 07: eXX Detectability 
% =============================================================================================== %
figure('Name','eXXmagSpecDet_D07','NumberTitle','off')
loglog(1/cTp07,eXXmagSpecMax_cTpMult07_03d(:,1),'xr','LineWidth',3);hold on
loglog(1/cTp07,eXXmagSpecMax_cTpMult07_03d(:,2),'xb','LineWidth',3)
loglog(1/cTp07,eXXmagSpecMax_cTpMult07_03d(:,3),'xg','LineWidth',3)
loglog(1/cTp07,eXXmagSpecMax_cTpMult07_03d(:,4),'xm','LineWidth',3)
loglog(1/cTp07,eXXmagSpecMax_cTpMult07_03d(:,5),'xc','LineWidth',3)
loglog(1/cTp07,eXXmagSpecMax_cTpMult07_03d(:,6),'xk','LineWidth',3)
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
print(fig,'01a_HPT_eXXmagSpecDet_D07.pdf','-dpdf','-r0')
print(fig,'01a_HPT_eXXmagSpecDet_D07.tif','-dtiff','-r0')

% =============================================================================================== %
% PARAMETER 08: eXX Detectability 
% =============================================================================================== %
figure('Name','eXXmagSpecDet_D08','NumberTitle','off')
loglog(1/cTp08,eXXmagSpecMax_cTpMult08_03d(:,1),'xr','LineWidth',3);hold on
loglog(1/cTp08,eXXmagSpecMax_cTpMult08_03d(:,2),'xb','LineWidth',3)
loglog(1/cTp08,eXXmagSpecMax_cTpMult08_03d(:,3),'xg','LineWidth',3)
loglog(1/cTp08,eXXmagSpecMax_cTpMult08_03d(:,4),'xm','LineWidth',3)
loglog(1/cTp08,eXXmagSpecMax_cTpMult08_03d(:,5),'xc','LineWidth',3)
loglog(1/cTp08,eXXmagSpecMax_cTpMult08_03d(:,6),'xk','LineWidth',3)
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
print(fig,'01a_HPT_eXXmagSpecDet_D08.pdf','-dpdf','-r0')
print(fig,'01a_HPT_eXXmagSpecDet_D08.tif','-dtiff','-r0')

% =============================================================================================== %
% ALL PARAMETERS: eXX Detectability 
% =============================================================================================== %

figure('Name','eXXmagSpecDet_swpcTpMult_allParams','NumberTitle','off')
% parameter 01
loglog(1/cTp01,eXXmagSpecMax_cTpMult01_03d(:,1),'xr','LineWidth',3);hold on
loglog(1/cTp01,eXXmagSpecMax_cTpMult01_03d(:,2),'xb','LineWidth',3)
loglog(1/cTp01,eXXmagSpecMax_cTpMult01_03d(:,3),'xg','LineWidth',3)
loglog(1/cTp01,eXXmagSpecMax_cTpMult01_03d(:,4),'xm','LineWidth',3)
loglog(1/cTp01,eXXmagSpecMax_cTpMult01_03d(:,5),'xc','LineWidth',3)
loglog(1/cTp01,eXXmagSpecMax_cTpMult01_03d(:,6),'xk','LineWidth',3)
% parameter 02
loglog(1/cTp02,eXXmagSpecMax_cTpMult02_03d(:,1),'xr','LineWidth',3)
loglog(1/cTp02,eXXmagSpecMax_cTpMult02_03d(:,2),'xb','LineWidth',3)
loglog(1/cTp02,eXXmagSpecMax_cTpMult02_03d(:,3),'xg','LineWidth',3)
loglog(1/cTp02,eXXmagSpecMax_cTpMult02_03d(:,4),'xm','LineWidth',3)
loglog(1/cTp02,eXXmagSpecMax_cTpMult02_03d(:,5),'xc','LineWidth',3)
loglog(1/cTp02,eXXmagSpecMax_cTpMult02_03d(:,6),'xk','LineWidth',3)
% parameter 03
loglog(1/cTp03,eXXmagSpecMax_cTpMult03_03d(:,1),'xr','LineWidth',3)
loglog(1/cTp03,eXXmagSpecMax_cTpMult03_03d(:,2),'xb','LineWidth',3)
loglog(1/cTp03,eXXmagSpecMax_cTpMult03_03d(:,3),'xg','LineWidth',3)
loglog(1/cTp03,eXXmagSpecMax_cTpMult03_03d(:,4),'xm','LineWidth',3)
loglog(1/cTp03,eXXmagSpecMax_cTpMult03_03d(:,5),'xc','LineWidth',3)
loglog(1/cTp03,eXXmagSpecMax_cTpMult03_03d(:,6),'xk','LineWidth',3)
% parameter 04
loglog(1/cTp04,eXXmagSpecMax_cTpMult04_03d(:,1),'xr','LineWidth',3)
loglog(1/cTp04,eXXmagSpecMax_cTpMult04_03d(:,2),'xb','LineWidth',3)
loglog(1/cTp04,eXXmagSpecMax_cTpMult04_03d(:,3),'xg','LineWidth',3)
loglog(1/cTp04,eXXmagSpecMax_cTpMult04_03d(:,4),'xm','LineWidth',3)
loglog(1/cTp04,eXXmagSpecMax_cTpMult04_03d(:,5),'xc','LineWidth',3)
loglog(1/cTp04,eXXmagSpecMax_cTpMult04_03d(:,6),'xk','LineWidth',3)
% parameter 05
loglog(1/cTp05,eXXmagSpecMax_cTpMult05_03d(:,1),'xr','LineWidth',3)
loglog(1/cTp05,eXXmagSpecMax_cTpMult05_03d(:,2),'xb','LineWidth',3)
loglog(1/cTp05,eXXmagSpecMax_cTpMult05_03d(:,3),'xg','LineWidth',3)
loglog(1/cTp05,eXXmagSpecMax_cTpMult05_03d(:,4),'xm','LineWidth',3)
loglog(1/cTp05,eXXmagSpecMax_cTpMult05_03d(:,5),'xc','LineWidth',3)
loglog(1/cTp05,eXXmagSpecMax_cTpMult05_03d(:,6),'xk','LineWidth',3)
% parameter 06
loglog(1/cTp06,eXXmagSpecMax_cTpMult06_03d(:,1),'xr','LineWidth',3)
loglog(1/cTp06,eXXmagSpecMax_cTpMult06_03d(:,2),'xb','LineWidth',3)
loglog(1/cTp06,eXXmagSpecMax_cTpMult06_03d(:,3),'xg','LineWidth',3)
loglog(1/cTp06,eXXmagSpecMax_cTpMult06_03d(:,4),'xm','LineWidth',3)
loglog(1/cTp06,eXXmagSpecMax_cTpMult06_03d(:,5),'xc','LineWidth',3)
loglog(1/cTp06,eXXmagSpecMax_cTpMult06_03d(:,6),'xk','LineWidth',3)
% parameter 07
loglog(1/cTp07,eXXmagSpecMax_cTpMult07_03d(:,1),'xr','LineWidth',3)
loglog(1/cTp07,eXXmagSpecMax_cTpMult07_03d(:,2),'xb','LineWidth',3)
loglog(1/cTp07,eXXmagSpecMax_cTpMult07_03d(:,3),'xg','LineWidth',3)
loglog(1/cTp07,eXXmagSpecMax_cTpMult07_03d(:,4),'xm','LineWidth',3)
loglog(1/cTp07,eXXmagSpecMax_cTpMult07_03d(:,5),'xc','LineWidth',3)
loglog(1/cTp07,eXXmagSpecMax_cTpMult07_03d(:,6),'xk','LineWidth',3)
% parameter 08
loglog(1/cTp08,eXXmagSpecMax_cTpMult08_03d(:,1),'xr','LineWidth',3)
loglog(1/cTp08,eXXmagSpecMax_cTpMult08_03d(:,2),'xb','LineWidth',3)
loglog(1/cTp08,eXXmagSpecMax_cTpMult08_03d(:,3),'xg','LineWidth',3)
loglog(1/cTp08,eXXmagSpecMax_cTpMult08_03d(:,4),'xm','LineWidth',3)
loglog(1/cTp08,eXXmagSpecMax_cTpMult08_03d(:,5),'xc','LineWidth',3)
loglog(1/cTp08,eXXmagSpecMax_cTpMult08_03d(:,6),'xk','LineWidth',3)
loglog(f,ofsa)
loglog(f,gtsv);hold off; grid on 
pbaspect([1 1 1])
% xlim([1E-8,1E-3])
% ylim([1E-14,1E-8])
xlabel('frequency','FontSize',15)
ylabel('Magnitude','FontSize',15)
% legend('5%','25%','50%','100%','FontSize',15,'Location','SouthWest')
% FORMATTING
fig = gcf;
fig.PaperUnits    = paperSizeUnits;
fig.PaperSize     = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_swpcTpMult_eXXmagSpecDet_allParams.pdf','-dpdf','-r0')
print(fig,'01a_HPT_swpcTpMult_eXXmagSpecDet_allParams.tif','-dtiff','-r0')

% ================================================================================================= %
% END
% ================================================================================================= %