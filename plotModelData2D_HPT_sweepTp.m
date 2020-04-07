%% plotModelData2D_HPT_swpTp
% Author: R. Moak
% Date: 03/04/20

%% Set Path to Output Folder
cd 'X:\Clemson\Thesis\Models\COMSOL\00_Simulations\LeakDetection\01_ConceptualModels\01a_LD_WDp2D_fS_XPTf\OutputPlots'
addpath('X:\Clemson\Thesis\Models\COMSOL\00_Simulations\LeakDetection\Analyses_All');

%% Load Plot Formatting Variables
plotFormatting;

%% Scaling Parameters
% Define Parameters
alpha_b = 1;
Pc = p_inj;
X_frx = MaterialProps_sweepTp.X_frx;
X_conf = MaterialProps_sweepTp.X_conf;

% Dimensionless Scaling
e0_frx = alpha_b*Pc*X_frx;
e0_conf = alpha_b*Pc*X_conf;

%% Magnitude Spectra Plots
% ===============================================================================================%
% PARAMETER 01: Magnitude Spectra - eXX
% ===============================================================================================%
figure('Name','Tp01_eXXmagSpec','NumberTitle','off')
loglog(F_Tp01,eXXmagSpec_Tp01_03d(:,1),'r','LineWidth',3);hold on
loglog(F_Tp01,eXXmagSpec_Tp01_03d(:,2),'b','LineWidth',3)
loglog(F_Tp01,eXXmagSpec_Tp01_03d(:,3),'g','LineWidth',3)
loglog(F_Tp01,eXXmagSpec_Tp01_03d(:,4),'m','LineWidth',3);hold off; grid on
pbaspect([1 1 1])
% xlim([1E-2,1.25])
xlabel('frequency','FontSize',15)
ylabel('Dimensionless Tilt Rablnte','FontSize',15)
% legend('r = 5%', 'r = 25%', 'r = 50%', 'r = 100%','Location','NorthEast')
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_Tp01_eXXmagSpec.pdf','-dpdf','-r0')
print(fig,'01a_HPT_Tp01_eXXmagSpec.tif','-dtiff','-r0')

% ===============================================================================================%
% PARAMETER 02: Magnitude Spectra - eXX
% ===============================================================================================%
figure('Name','Tp02_eXXmagSpec','NumberTitle','off')
loglog(F_Tp02,eXXmagSpec_Tp02_03d(:,1),'r','LineWidth',3);hold on
loglog(F_Tp02,eXXmagSpec_Tp02_03d(:,2),'b','LineWidth',3)
loglog(F_Tp02,eXXmagSpec_Tp02_03d(:,3),'g','LineWidth',3)
loglog(F_Tp02,eXXmagSpec_Tp02_03d(:,4),'m','LineWidth',3);hold off; grid on
pbaspect([1 1 1])
% xlim([1E-2,1.25])
xlabel('frequency','FontSize',15)
ylabel('Dimensionless Tilt Rablnte','FontSize',15)
% legend('r = 5%', 'r = 25%', 'r = 50%', 'r = 100%','Location','NorthEast')
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_Tp02_eXXmagSpec.pdf','-dpdf','-r0')
print(fig,'01a_HPT_Tp02_eXXmagSpec.tif','-dtiff','-r0')

% ===============================================================================================%
% PARAMETER 03: Magnitude Spectra - eXX
% ===============================================================================================%
figure('Name','Tp03_eXXmagSpec','NumberTitle','off')
loglog(F_Tp03,eXXmagSpec_Tp03_03d(:,1),'r','LineWidth',3);hold on
loglog(F_Tp03,eXXmagSpec_Tp03_03d(:,2),'b','LineWidth',3)
loglog(F_Tp03,eXXmagSpec_Tp03_03d(:,3),'g','LineWidth',3)
loglog(F_Tp03,eXXmagSpec_Tp03_03d(:,4),'m','LineWidth',3);hold off; grid on
pbaspect([1 1 1])
% xlim([1E-2,1.25])
xlabel('frequency','FontSize',15)
ylabel('Dimensionless Tilt Rablnte','FontSize',15)
% legend('r = 5%', 'r = 25%', 'r = 50%', 'r = 100%','Location','NorthEast')
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_Tp03_eXXmagSpec.pdf','-dpdf','-r0')
print(fig,'01a_HPT_Tp03_eXXmagSpec.tif','-dtiff','-r0')

% ===============================================================================================%
% PARAMETER 04: Magnitude Spectra - eXX
% ===============================================================================================%
figure('Name','Tp04_eXXmagSpec','NumberTitle','off')
loglog(F_Tp04,eXXmagSpec_Tp04_03d(:,1),'r','LineWidth',3);hold on
loglog(F_Tp04,eXXmagSpec_Tp04_03d(:,2),'b','LineWidth',3)
loglog(F_Tp04,eXXmagSpec_Tp04_03d(:,3),'g','LineWidth',3)
loglog(F_Tp04,eXXmagSpec_Tp04_03d(:,4),'m','LineWidth',3);hold off; grid on
pbaspect([1 1 1])
% xlim([1E-2,1.25])
xlabel('frequency','FontSize',15)
ylabel('Dimensionless Tilt Rablnte','FontSize',15)
% legend('r = 5%', 'r = 25%', 'r = 50%', 'r = 100%','Location','NorthEast')
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_Tp04_eXXmagSpec.pdf','-dpdf','-r0')
print(fig,'01a_HPT_Tp04_eXXmagSpec.tif','-dtiff','-r0')

% ===============================================================================================%
% PARAMETER 05: Magnitude Spectra - eXX
% ===============================================================================================%
figure('Name','Tp05_eXXmagSpec','NumberTitle','off')
loglog(F_Tp05,eXXmagSpec_Tp05_03d(:,1),'r','LineWidth',3);hold on
loglog(F_Tp05,eXXmagSpec_Tp05_03d(:,2),'b','LineWidth',3)
loglog(F_Tp05,eXXmagSpec_Tp05_03d(:,3),'g','LineWidth',3)
loglog(F_Tp05,eXXmagSpec_Tp05_03d(:,4),'m','LineWidth',3);hold off; grid on
pbaspect([1 1 1])
% xlim([1E-2,1.25])
xlabel('frequency','FontSize',15)
ylabel('Dimensionless Tilt Rablnte','FontSize',15)
% legend('r = 5%', 'r = 25%', 'r = 50%', 'r = 100%','Location','NorthEast')
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_Tp05_eXXmagSpec.pdf','-dpdf','-r0')
print(fig,'01a_HPT_Tp05_eXXmagSpec.tif','-dtiff','-r0')

%% Magnitude Spectra as function of Distance

% ===============================================================================================%
% PARAMETER 01: Magnitude Spectra - eXX
% ===============================================================================================%
figure('Name','Tp01_eXXmagSpecMaxDist','NumberTitle','off')
plot(r/x_c,eXXmagSpecMax_Tp01_03d,'xr','MarkerSize',15,'LineWidth',3);grid on;
pbaspect([1 1 1])
xlabel('x*','FontSize',15)
ylabel('Magnitude','FontSize',15)
legend('Tp01','FontSize',15,'Location','SouthWest')
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_swpTp_eXXmagSpecDist_Tp01.pdf','-dpdf','-r0')
print(fig,'01a_HPT_swpTp_eXXmagSpecDist_Tp01.tif','-dtiff','-r0')

% ===============================================================================================%
% PARAMETER 02: Magnitude Spectra - eXX
% ===============================================================================================%
figure('Name','Tp02_eXXmagSpecMaxDist','NumberTitle','off')
plot(r/x_c,eXXmagSpecMax_Tp02_03d,'xr','MarkerSize',15,'LineWidth',3);grid on;
pbaspect([1 1 1])
xlabel('x*','FontSize',15)
ylabel('Magnitude','FontSize',15)
legend('Tp02','FontSize',15,'Location','SouthWest')
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_swpTp_eXXmagSpecDist_Tp02.pdf','-dpdf','-r0')
print(fig,'01a_HPT_swpTp_eXXmagSpecDist_Tp02.tif','-dtiff','-r0')
% ===============================================================================================%
% PARAMETER 03: Magnitude Spectra - eXX
% ===============================================================================================%
figure('Name','Tp03_eXXmagSpecMaxDist','NumberTitle','off')
plot(r/x_c,eXXmagSpecMax_Tp03_03d,'xr','MarkerSize',15,'LineWidth',3);grid on;
pbaspect([1 1 1])
xlabel('x*','FontSize',15)
ylabel('Magnitude','FontSize',15)
legend('Tp03','FontSize',15,'Location','SouthWest')% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_swpTp_eXXmagSpecDist_Tp03.pdf','-dpdf','-r0')
print(fig,'01a_HPT_swpTp_eXXmagSpecDist_Tp03.tif','-dtiff','-r0')

% ===============================================================================================%
% PARAMETER 04: Magnitude Spectra - eXX
% ===============================================================================================%
figure('Name','Tp04_eXXmagSpecMaxDist','NumberTitle','off')
plot(r/x_c,eXXmagSpecMax_Tp04_03d,'xr','MarkerSize',15,'LineWidth',3);grid on;
pbaspect([1 1 1])
xlabel('x*','FontSize',15)
ylabel('Magnitude','FontSize',15)
legend('Tp04','FontSize',15,'Location','SouthWest')% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_swpTp_eXXmagSpecDist_Tp04.pdf','-dpdf','-r0')
print(fig,'01a_HPT_swpTp_eXXmagSpecDist_Tp04.tif','-dtiff','-r0')

% ===============================================================================================%
% PARAMETER 05: Magnitude Spectra - eXX
% ===============================================================================================%
figure('Name','Tp05_eXXmagSpecMaxDist','NumberTitle','off')
plot(r/x_c,eXXmagSpecMax_Tp05_03d,'xr','MarkerSize',15,'LineWidth',3);grid on;
pbaspect([1 1 1])
xlabel('x*','FontSize',15)
ylabel('Magnitude','FontSize',15)
legend('Tp05','FontSize',15,'Location','SouthWest')% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_swpTp_eXXmagSpecDist_Tp05.pdf','-dpdf','-r0')
print(fig,'01a_HPT_swpTp_eXXmagSpecDist_Tp05.tif','-dtiff','-r0')

% ===============================================================================================%
% ALL PARAMETERS: Magnitude Spectra - eXX
% ===============================================================================================%
figure('Name','sweepTp_eXXmagSpecMaxDist','NumberTitle','off')
plot(r/x_c,eXXmagSpecMax_Tp01_03d,'xr','MarkerSize',15,'LineWidth',3);hold on;
plot(r/x_c,eXXmagSpecMax_Tp02_03d,'xb','MarkerSize',15,'LineWidth',3)
plot(r/x_c,eXXmagSpecMax_Tp03_03d,'xg','MarkerSize',15,'LineWidth',3)
plot(r/x_c,eXXmagSpecMax_Tp04_03d,'xm','MarkerSize',15,'LineWidth',3)
plot(r/x_c,eXXmagSpecMax_Tp05_03d,'xk','MarkerSize',15,'LineWidth',3);hold off;;grid on;
pbaspect([1 1 1])
xlabel('x*','FontSize',15)
ylabel('Magnitude','FontSize',15)
legend('Tp01','Tp02','Tp03','Tp04','Tp05','FontSize',15)
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_swpTp_eXXmagSpecDist.pdf','-dpdf','-r0')
print(fig,'01a_HPT_swpTp_eXXmagSpecDist.tif','-dtiff','-r0')

%% Magnitude Spectra as function of Fracture Diffusivity
% ===============================================================================================%
% 05w03d: Magnitude Spectra - eXX
% ===============================================================================================%
figure('Name','05w03d_sweepTponf_eXXmagSpec','NumberTitle','off')
plot(Tp_hr(1),eXXmagSpecMax_Tp01_03d(1),'rx','MarkerSize',15,'LineWidth',3);hold on;
plot(Tp_hr(2),eXXmagSpecMax_Tp02_03d(1),'bx','MarkerSize',15,'LineWidth',3)
plot(Tp_hr(3),eXXmagSpecMax_Tp03_03d(1),'gx','MarkerSize',15,'LineWidth',3)
plot(Tp_hr(4),eXXmagSpecMax_Tp04_03d(1),'mx','MarkerSize',15,'LineWidth',3)
plot(Tp_hr(5),eXXmagSpecMax_Tp05_03d(1),'kx','MarkerSize',15,'LineWidth',3);hold off;grid on;
pbaspect([1 1 1])
xlabel('Tp [hr]','FontSize',15)
ylabel('Magnitude','FontSize',15)
% legend('Tp01','Tp02','Tp03','Tp04','Tp05','FontSize',15,'Location','SouthEast')
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_swpTp_eXXmagSpec_05w03d.pdf','-dpdf','-r0')
print(fig,'01a_HPT_swpTp_eXXmagSpec_05w03d.tif','-dtiff','-r0')

% ===============================================================================================%
% 25w03d: Magnitude Spectra - eXX
% ===============================================================================================%
figure('Name','25w03d_sweepTponf_eXXmagSpec','NumberTitle','off')
plot(Tp_hr(1),eXXmagSpecMax_Tp01_03d(2),'rx','MarkerSize',15,'LineWidth',3);hold on;
plot(Tp_hr(2),eXXmagSpecMax_Tp02_03d(2),'bx','MarkerSize',15,'LineWidth',3)
plot(Tp_hr(3),eXXmagSpecMax_Tp03_03d(2),'gx','MarkerSize',15,'LineWidth',3)
plot(Tp_hr(4),eXXmagSpecMax_Tp04_03d(2),'mx','MarkerSize',15,'LineWidth',3)
plot(Tp_hr(5),eXXmagSpecMax_Tp05_03d(2),'kx','MarkerSize',15,'LineWidth',3);hold off;grid on;
pbaspect([1 1 1])
xlabel('Tp [hr]','FontSize',15)
ylabel('Magnitude','FontSize',15)
% legend('Tp01','Tp02','Tp03','Tp04','Tp05','FontSize',15,'Location','SouthEast')
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_swpTp_eXXmagSpec_25w03d.pdf','-dpdf','-r0')
print(fig,'01a_HPT_swpTp_eXXmagSpec_25w03d.tif','-dtiff','-r0')

% ===============================================================================================%
% 50w03d: Magnitude Spectra - eXX
% ===============================================================================================%
figure('Name','50w03d_sweepTponf_eXXmagSpec','NumberTitle','off')
plot(Tp_hr(1),eXXmagSpecMax_Tp01_03d(3),'rx','MarkerSize',15,'LineWidth',3);hold on;
plot(Tp_hr(2),eXXmagSpecMax_Tp02_03d(3),'bx','MarkerSize',15,'LineWidth',3)
plot(Tp_hr(3),eXXmagSpecMax_Tp03_03d(3),'gx','MarkerSize',15,'LineWidth',3)
plot(Tp_hr(4),eXXmagSpecMax_Tp04_03d(3),'mx','MarkerSize',15,'LineWidth',3)
plot(Tp_hr(5),eXXmagSpecMax_Tp05_03d(3),'kx','MarkerSize',15,'LineWidth',3);hold off;grid on;
pbaspect([1 1 1])
xlabel('Tp [hr]','FontSize',15)
ylabel('Magnitude','FontSize',15)
% legend('Tp01','Tp02','Tp03','Tp04','Tp05','FontSize',15,'Location','SouthEast')
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_swpTp_eXXmagSpec_50w03d.pdf','-dpdf','-r0')
print(fig,'01a_HPT_swpTp_eXXmagSpec_50w03d.tif','-dtiff','-r0')

% ===============================================================================================%
% 100w03d: Magnitude Spectra - eXX
% ===============================================================================================%
figure('Name','100w03d_sweepTponf_eXXmagSpec','NumberTitle','off')
plot(Tp_hr(1),eXXmagSpecMax_Tp01_03d(4),'rx','MarkerSize',15,'LineWidth',3);hold on;
plot(Tp_hr(2),eXXmagSpecMax_Tp02_03d(4),'bx','MarkerSize',15,'LineWidth',3)
plot(Tp_hr(3),eXXmagSpecMax_Tp03_03d(4),'gx','MarkerSize',15,'LineWidth',3)
plot(Tp_hr(4),eXXmagSpecMax_Tp04_03d(4),'mx','MarkerSize',15,'LineWidth',3)
plot(Tp_hr(5),eXXmagSpecMax_Tp05_03d(4),'kx','MarkerSize',15,'LineWidth',3);hold off;grid on;
pbaspect([1 1 1])
xlabel('Tp [hr]','FontSize',15)
ylabel('Magnitude','FontSize',15)
% legend('Tp01','Tp02','Tp03','Tp04','Tp05','FontSize',15,'Location','SouthEast')
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_swpTp_eXXmagSpec_100w03d.pdf','-dpdf','-r0')
print(fig,'01a_HPT_swpTp_eXXmagSpec_100w03d.tif','-dtiff','-r0')

% ===============================================================================================%
% ALL LOCATIONS: Magnitude Spectra - eXX
% ===============================================================================================%
figure('Name','allLocations_eXXmagSpec','NumberTitle','off')
subplot(2,2,1)
plot(Tp_hr(1),eXXmagSpecMax_Tp01_03d(1),'rx','MarkerSize',15,'LineWidth',3);hold on;
plot(Tp_hr(2),eXXmagSpecMax_Tp02_03d(1),'bx','MarkerSize',15,'LineWidth',3)
plot(Tp_hr(3),eXXmagSpecMax_Tp03_03d(1),'gx','MarkerSize',15,'LineWidth',3)
plot(Tp_hr(4),eXXmagSpecMax_Tp04_03d(1),'mx','MarkerSize',15,'LineWidth',3)
plot(Tp_hr(5),eXXmagSpecMax_Tp05_03d(1),'kx','MarkerSize',15,'LineWidth',3);hold off;grid on;
pbaspect([1 1 1])
xlabel('Tp [hr]','FontSize',15)
ylabel('Magnitude','FontSize',15)
title('05w03d')
subplot(2,2,2)
plot(Tp_hr(1),eXXmagSpecMax_Tp01_03d(2),'rx','MarkerSize',15,'LineWidth',3);hold on;
plot(Tp_hr(2),eXXmagSpecMax_Tp02_03d(2),'bx','MarkerSize',15,'LineWidth',3)
plot(Tp_hr(3),eXXmagSpecMax_Tp03_03d(2),'gx','MarkerSize',15,'LineWidth',3)
plot(Tp_hr(4),eXXmagSpecMax_Tp04_03d(2),'mx','MarkerSize',15,'LineWidth',3)
plot(Tp_hr(5),eXXmagSpecMax_Tp05_03d(2),'kx','MarkerSize',15,'LineWidth',3);hold off;grid on;
pbaspect([1 1 1])
xlabel('Tp [hr]','FontSize',15)
ylabel('Magnitude','FontSize',15)
title('25w03d')
subplot(2,2,3)
plot(Tp_hr(1),eXXmagSpecMax_Tp01_03d(3),'rx','MarkerSize',15,'LineWidth',3);hold on;
plot(Tp_hr(2),eXXmagSpecMax_Tp02_03d(3),'bx','MarkerSize',15,'LineWidth',3)
plot(Tp_hr(3),eXXmagSpecMax_Tp03_03d(3),'gx','MarkerSize',15,'LineWidth',3)
plot(Tp_hr(4),eXXmagSpecMax_Tp04_03d(3),'mx','MarkerSize',15,'LineWidth',3)
plot(Tp_hr(5),eXXmagSpecMax_Tp05_03d(3),'kx','MarkerSize',15,'LineWidth',3);hold off;grid on;
pbaspect([1 1 1])
xlabel('Tp [hr]','FontSize',15)
ylabel('Magnitude','FontSize',15)
title('50w03d')
subplot(2,2,4)
plot(Tp_hr(1),eXXmagSpecMax_Tp01_03d(4),'rx','MarkerSize',15,'LineWidth',3);hold on;
plot(Tp_hr(2),eXXmagSpecMax_Tp02_03d(4),'bx','MarkerSize',15,'LineWidth',3)
plot(Tp_hr(3),eXXmagSpecMax_Tp03_03d(4),'gx','MarkerSize',15,'LineWidth',3)
plot(Tp_hr(4),eXXmagSpecMax_Tp04_03d(4),'mx','MarkerSize',15,'LineWidth',3)
plot(Tp_hr(5),eXXmagSpecMax_Tp05_03d(4),'kx','MarkerSize',15,'LineWidth',3);hold off;grid on;
pbaspect([1 1 1])
xlabel('Tp [hr]','FontSize',15)
ylabel('Magnitude','FontSize',15)
title('100w03d')
% legend('Tp01','Tp02','Tp03','Tp04','Tp05','FontSize',15,'Location','SouthEast')
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_2by2 paperSizeH_2by2];
fig.PaperPosition = [0 0 paperSizeW_2by2 paperSizeH_2by2];
print(fig,'01a_HPT_swpTp_eXXmagSpec_allLoc.pdf','-dpdf','-r0')
print(fig,'01a_HPT_swpTp_eXXmagSpec_allLoc.tif','-dtiff','-r0')

% ===============================================================================================%
% ===============================================================================================%

% %% Magnitude: Normal Strains (eXX & eZZ)
% % ===============================================================================================%
% % Strain Magnitude - plot (Dimensionless)
% % ===============================================================================================%
% fig = figure('Name','sweepTp_eNNmag','NumberTitle','off');
% % Parameter 01 - eXX
% plot(t/tc_frx_Tp01,eXX_Tp01_03d(:,1)/e0_frx,'r','LineWidth',3);hold on
% plot(t/tc_frx_Tp01,eXX_Tp01_03d(:,2)/e0_frx,'b','LineWidth',3)
% plot(t/tc_frx_Tp01,eXX_Tp01_03d(:,3)/e0_frx,'g','LineWidth',3)
% plot(t/tc_frx_Tp01,eXX_Tp01_03d(:,4)/e0_frx,'m','LineWidth',3)
% % Parameter 02 - eXX
% plot(t/tc_frx_Tp02,eXX_Tp02_03d(:,1)/e0_frx,'--r','LineWidth',3)
% plot(t/tc_frx_Tp02,eXX_Tp02_03d(:,2)/e0_frx,'--b','LineWidth',3)
% plot(t/tc_frx_Tp02,eXX_Tp02_03d(:,3)/e0_frx,'--g','LineWidth',3)
% plot(t/tc_frx_Tp02,eXX_Tp02_03d(:,4)/e0_frx,'--m','LineWidth',3)
% % Parameter 03 - eXX
% plot(t/tc_frx_Tp03,eXX_Tp03_03d(:,1)/e0_frx,'.r','LineWidth',3)
% plot(t/tc_frx_Tp03,eXX_Tp03_03d(:,2)/e0_frx,'.b','LineWidth',3)
% plot(t/tc_frx_Tp03,eXX_Tp03_03d(:,3)/e0_frx,'.g','LineWidth',3)
% plot(t/tc_frx_Tp03,eXX_Tp03_03d(:,4)/e0_frx,'.m','LineWidth',3);hold off;grid on;
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
% print(fig,'01a_HPT_swpTp_eNNmag_allParVals.pdf','-dpdf','-r0')
% print(fig,'01a_HPT_swpTp_eNNmag_allParVals.tif','-dtiff','-r0')
% 
% %% Detectable Normal Strains
% % ===============================================================================================%
% % PARAMETER VALUE 01: Detectable Normal Strain Magnitude - (eXX & eZZ) - Semilogx (Dimensionless)
% % ===============================================================================================%
% fig = figure('Name','Tp01_eNNmagDet','NumberTitle','off');
% % eXX
% plot(t/tc_frx_Tp01,eXX_detectable_Tp01_03d(:,1)/e0_frx,'r','LineWidth',7,'HandleVisibility','off');hold on
% plot(t/tc_frx_Tp01,eXX_detectable_Tp01_03d(:,2)/e0_frx,'r','LineWidth',7,'HandleVisibility','off');
% plot(t/tc_frx_Tp01,eXX_detectable_Tp01_03d(:,3)/e0_frx,'r','LineWidth',7,'HandleVisibility','off');
% plot(t/tc_frx_Tp01,eXX_detectable_Tp01_03d(:,4)/e0_frx,'r','LineWidth',7,'HandleVisibility','off');
% plot(t/tc_frx_Tp01,eXX_Tp01_03d(:,1)/e0_frx,'r','LineWidth',3)
% plot(t/tc_frx_Tp01,eXX_Tp01_03d(:,2)/e0_frx,'b','LineWidth',3)
% plot(t/tc_frx_Tp01,eXX_Tp01_03d(:,3)/e0_frx,'g','LineWidth',3)
% plot(t/tc_frx_Tp01,eXX_Tp01_03d(:,4)/e0_frx,'m','LineWidth',3);hold on;grid on
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
% print(fig,'01a_HPT_Tp01_eNNmagDet.pdf','-dpdf','-r0')
% print(fig,'01a_HPT_Tp01_eNNmagDet.tif','-dtiff','-r0')
% 
% % ===============================================================================================%
% % PARAMETER VALUE 02: Detectable Normal Strain Magnitude - (eXX & eZZ) - Semilogx (Dimensionless)
% % ===============================================================================================%
% fig = figure('Name','Tp02_eNNmagDet','NumberTitle','off');
% plot(t/tc_frx_Tp02,eXX_detectable_Tp02_03d(:,1)/e0_frx,'r','LineWidth',7,'HandleVisibility','off');hold on
% plot(t/tc_frx_Tp02,eXX_detectable_Tp02_03d(:,2)/e0_frx,'r','LineWidth',7,'HandleVisibility','off');
% plot(t/tc_frx_Tp02,eXX_detectable_Tp02_03d(:,3)/e0_frx,'r','LineWidth',7,'HandleVisibility','off');
% plot(t/tc_frx_Tp02,eXX_detectable_Tp02_03d(:,4)/e0_frx,'r','LineWidth',7,'HandleVisibility','off');
% plot(t/tc_frx_Tp02,eXX_Tp02_03d(:,1)/e0_frx,'r','LineWidth',3)
% plot(t/tc_frx_Tp02,eXX_Tp02_03d(:,2)/e0_frx,'b','LineWidth',3)
% plot(t/tc_frx_Tp02,eXX_Tp02_03d(:,3)/e0_frx,'g','LineWidth',3)
% plot(t/tc_frx_Tp02,eXX_Tp02_03d(:,4)/e0_frx,'m','LineWidth',3);hold off;grid on
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
% print(fig,'01a_HPT_Tp02_eNNmagDet.pdf','-dpdf','-r0')
% print(fig,'01a_HPT_Tp02_eNNmagDet.tif','-dtiff','-r0')
% 
% % ===============================================================================================%
% % PARAMETER VALUE 03: Detectable Normal Strain Magnitude - (eXX & eZZ) - Semilogx (Dimensionless)
% % ===============================================================================================%
% fig = figure('Name','Tp03_eNNmagDet','NumberTitle','off');
% plot(t/tc_frx_Tp03,eXX_detectable_Tp03_03d(:,1)/e0_frx,'r','LineWidth',7,'HandleVisibility','off');hold on
% plot(t/tc_frx_Tp03,eXX_detectable_Tp03_03d(:,2)/e0_frx,'r','LineWidth',7,'HandleVisibility','off');
% plot(t/tc_frx_Tp03,eXX_detectable_Tp03_03d(:,3)/e0_frx,'r','LineWidth',7,'HandleVisibility','off');
% plot(t/tc_frx_Tp03,eXX_detectable_Tp03_03d(:,4)/e0_frx,'r','LineWidth',7,'HandleVisibility','off');
% plot(t/tc_frx_Tp03,eXX_Tp03_03d(:,1)/e0_frx,'r','LineWidth',3)
% plot(t/tc_frx_Tp03,eXX_Tp03_03d(:,2)/e0_frx,'b','LineWidth',3)
% plot(t/tc_frx_Tp03,eXX_Tp03_03d(:,3)/e0_frx,'g','LineWidth',3)
% plot(t/tc_frx_Tp03,eXX_Tp03_03d(:,4)/e0_frx,'m','LineWidth',3);hold off;grid on
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
% print(fig,'01a_HPT_Tp03_eNNmagDet.pdf','-dpdf','-r0')
% print(fig,'01a_HPT_Tp03_eNNmagDet.tif','-dtiff','-r0')
% 
% %% Strain Rate
% % ===============================================================================================%
% % INDIVIDUAL LOCATIONS: Strain Rate (eXX) - plot (Dimensionless)
% % ===============================================================================================%
% % LOCATION: PROBE 05w03d
% fig = figure('Name','swpTp_eXXrate_05w03d','NumberTitle','off');
% % Parameter 01
% plot(t/tc_frx_Tp01,eXXrate_Tp01_03d(:,1),'r','LineWidth',3);hold on
% % Parameter 02
% plot(t/tc_frx_Tp02,eXXrate_Tp02_03d(:,1),'--r','LineWidth',3)
% % Parameter 03
% plot(t/tc_frx_Tp03,eXXrate_Tp03_03d(:,1),'.r','LineWidth',3);hold off;grid on
% pbaspect([1 1 1])
% % xlim([1E-2,1.25])
% xlabel('t*','FontSize',15)
% ylabel('Dimensionless Strain Rate','FontSize',15)
% % legend('Tp01', 'Tp02', 'Tp03','Location','SouthWest')
% pbaspect([1 1 1])
% % FORMATTING
% fig = gcf;
% fig.PaperUnits = paperSizeUnits;
% fig.PaperSize = [paperSizeW_single paperSizeH_single];
% fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
% print(fig,'01a_HPT_swpTp_eXXrate_05w03d.pdf','-dpdf','-r0')
% print(fig,'01a_HPT_swpTp_eXXrate_05w03d.tif','-dtiff','-r0')
% 
% % ===============================================================================================%
% 
% % LOCATION: PROBE 25w03d
% fig = figure('Name','swpTp_eXXrate_25w03d','NumberTitle','off');
% % Parameter 01
% plot(t/tc_frx_Tp01,eXXrate_Tp01_03d(:,2)/e0_frx,'b','LineWidth',3);hold on
% % Parameter 02
% plot(t/tc_frx_Tp02,eXXrate_Tp02_03d(:,2)/e0_frx,'--b','LineWidth',3)
% % Parameter 03
% plot(t/tc_frx_Tp03,eXXrate_Tp03_03d(:,2)/e0_frx,'.b','LineWidth',3);hold off;grid on
% pbaspect([1 1 1])
% % xlim([1E-2,1.25])
% xlabel('t*','FontSize',15)
% ylabel('Dimensionless Strain Rate','FontSize',15)
% % legend('Tp01', 'Tp02', 'Tp03','Location','SouthWest')
% pbaspect([1 1 1])
% % FORMATTING
% fig = gcf;
% fig.PaperUnits = paperSizeUnits;
% fig.PaperSize = [paperSizeW_single paperSizeH_single];
% fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
% print(fig,'01a_HPT_swpTp_eXXrate_25w03d.pdf','-dpdf','-r0')
% print(fig,'01a_HPT_swpTp_eXXrate_25w03d.tif','-dtiff','-r0')
% 
% % ===============================================================================================%
% 
% % LOCATION: PROBE 50w03d
% fig = figure('Name','swpTp_eXXrate_50w03d','NumberTitle','off');
% % Parameter 01
% plot(t/tc_frx_Tp01,eXXrate_Tp01_03d(:,3)/e0_frx,'g','LineWidth',3);hold on
% % Parameter 02
% plot(t/tc_frx_Tp02,eXXrate_Tp02_03d(:,3)/e0_frx,'--g','LineWidth',3)
% % Parameter 03
% plot(t/tc_frx_Tp03,eXXrate_Tp03_03d(:,3)/e0_frx,'.g','LineWidth',3);hold off;grid on
% pbaspect([1 1 1])
% % xlim([1E-2,1.25])
% xlabel('t*','FontSize',15)
% ylabel('Dimensionless Strain Rate','FontSize',15)
% % legend('Tp01', 'Tp02', 'Tp03','Location','SouthWest')
% pbaspect([1 1 1])
% % FORMATTING
% fig = gcf;
% fig.PaperUnits = paperSizeUnits;
% fig.PaperSize = [paperSizeW_single paperSizeH_single];
% fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
% print(fig,'01a_HPT_swpTp_eXXrate_50w03d.pdf','-dpdf','-r0')
% print(fig,'01a_HPT_swpTp_eXXrate_50w03d.tif','-dtiff','-r0')
% 
% % ===============================================================================================%
% 
% % LOCATION: PROBE 100W03d
% fig = figure('Name','swpTp_eXXrate_100w03d','NumberTitle','off');
% % Parameter 01
% plot(t/tc_frx_Tp01,eXXrate_Tp01_03d(:,4)/e0_frx,'m','LineWidth',3);hold on
% % Parameter 02
% plot(t/tc_frx_Tp02,eXXrate_Tp02_03d(:,4)/e0_frx,'--m','LineWidth',3)
% % Parameter 03
% plot(t/tc_frx_Tp03,eXXrate_Tp03_03d(:,4)/e0_frx,'.m','LineWidth',3);hold off;grid on
% pbaspect([1 1 1])
% % xlim([1E-2,1.25])
% xlabel('t*','FontSize',15)
% ylabel('Dimensionless Strain Rate','FontSize',15)
% % legend('Tp01', 'Tp02', 'Tp03','Location','SouthWest')
% pbaspect([1 1 1])
% % FORMATTING
% fig = gcf;
% fig.PaperUnits = paperSizeUnits;
% fig.PaperSize = [paperSizeW_single paperSizeH_single];
% fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
% print(fig,'01a_HPT_swpTp_eXXrate_100w03d.pdf','-dpdf','-r0')
% print(fig,'01a_HPT_swpTp_eXXrate_100w03d.tif','-dtiff','-r0')
% 
% % ===============================================================================================%
% % ALL LOCATIONS: Strain Rate (eXX) - plot (Dimensionless)
% % ===============================================================================================%
% fig = figure('Name','swpTp_eXXrate_05w03d','NumberTitle','off');
% % ===============================================================================================%
% % LOCATION: PROBE 05w03d
% subplot(2,2,1)
% % Parameter 01
% plot(t/tc_frx_Tp01,eXXrate_Tp01_03d(:,1)/e0_frx,'r','LineWidth',3);hold on
% % Parameter 02
% plot(t/tc_frx_Tp02,eXXrate_Tp02_03d(:,1)/e0_frx,'--r','LineWidth',3)
% % Parameter 03
% plot(t/tc_frx_Tp03,eXXrate_Tp03_03d(:,1)/e0_frx,'.r','LineWidth',3);hold off;grid on
% pbaspect([1 1 1])
% % xlim([1E-2,1.25])
% % xlabel('t*','FontSize',15)
% ylabel('Strain Rate (Scaled)','FontSize',12)
% % ===============================================================================================%
% % LOCATION: PROBE 25w03d
% subplot(2,2,2)
% % Parameter 01
% plot(t/tc_frx_Tp01,eXXrate_Tp01_03d(:,2)/e0_frx,'b','LineWidth',3);hold on
% % Parameter 02
% plot(t/tc_frx_Tp02,eXXrate_Tp02_03d(:,2)/e0_frx,'--b','LineWidth',3)
% % Parameter 03
% plot(t/tc_frx_Tp03,eXXrate_Tp03_03d(:,2)/e0_frx,'.b','LineWidth',3);hold off;grid on
% pbaspect([1 1 1])
% % xlim([1E-2,1.25])
% % xlabel('t*','FontSize',15)
% % ===============================================================================================%
% % LOCATION: PROBE 50w03d
% subplot(2,2,3)
% % Parameter 01
% plot(t/tc_frx_Tp01,eXXrate_Tp01_03d(:,3)/e0_frx,'g','LineWidth',3);hold on
% % Parameter 02
% plot(t/tc_frx_Tp02,eXXrate_Tp02_03d(:,3)/e0_frx,'--g','LineWidth',3)
% % Parameter 03
% plot(t/tc_frx_Tp03,eXXrate_Tp03_03d(:,3)/e0_frx,'.g','LineWidth',3);hold off;grid on
% pbaspect([1 1 1])
% % xlim([1E-2,1.25])
% xlabel('t*','FontSize',15)
% ylabel('Strain Rate (Scaled)','FontSize',12)
% % ===============================================================================================%
% % LOCATION: PROBE 100w03d
% subplot(2,2,4)
% % Parameter 01
% plot(t/tc_frx_Tp01,eXXrate_Tp01_03d(:,4)/e0_frx,'m','LineWidth',3);hold on
% % Parameter 02
% plot(t/tc_frx_Tp02,eXXrate_Tp02_03d(:,4)/e0_frx,'--m','LineWidth',3)
% % Parameter 03
% plot(t/tc_frx_Tp03,eXXrate_Tp03_03d(:,4)/e0_frx,'.m','LineWidth',3);hold off;grid on
% pbaspect([1 1 1])
% % xlim([1E-2,1.25])
% xlabel('t*','FontSize',15)
% % legend('Tp01', 'Tp02', 'Tp03','Location','SouthWest')
% pbaspect([1 1 1])
% % ===============================================================================================%
% % FORMATTING
% fig = gcf;
% fig.PaperUnits = paperSizeUnits;
% fig.PaperSize = [paperSizeW_2by2 paperSizeH_2by2];
% fig.PaperPosition = [0 0 paperSizeW_2by2 paperSizeH_2by2];
% print(fig,'01a_HPT_swpTp_eXXrate_allProbes.pdf','-dpdf','-r0')
% print(fig,'01a_HPT_swpTp_eXXrate_allProbes.tif','-dtiff','-r0')
% 
% %%  Tilt
% % ===============================================================================================%
% % X-Tilt Magnitude - Semilogx (Dimensionless)
% % ===============================================================================================%
% fig = figure('Name','sweepTp_eTXmag','NumberTitle','off');
% % Parameter 01
% plot(t/tc_frx_Tp01,eTX_Tp01_03d(:,1)/e0_frx,'r','LineWidth',3);hold on
% plot(t/tc_frx_Tp01,eTX_Tp01_03d(:,2)/e0_frx,'b','LineWidth',3)
% plot(t/tc_frx_Tp01,eTX_Tp01_03d(:,3)/e0_frx,'g','LineWidth',3)
% plot(t/tc_frx_Tp01,eTX_Tp01_03d(:,4)/e0_frx,'m','LineWidth',3)
% % Parameter 02
% plot(t/tc_frx_Tp02,eTX_Tp02_03d(:,1)/e0_frx,'--r','LineWidth',3)
% plot(t/tc_frx_Tp02,eTX_Tp02_03d(:,2)/e0_frx,'--b','LineWidth',3)
% plot(t/tc_frx_Tp02,eTX_Tp02_03d(:,3)/e0_frx,'--g','LineWidth',3)
% plot(t/tc_frx_Tp02,eTX_Tp02_03d(:,4)/e0_frx,'--m','LineWidth',3)
% % Parameter 03
% plot(t/tc_frx_Tp03,eTX_Tp02_03d(:,1)/e0_frx,'.r','LineWidth',3)
% plot(t/tc_frx_Tp03,eTX_Tp02_03d(:,2)/e0_frx,'.b','LineWidth',3)
% plot(t/tc_frx_Tp03,eTX_Tp02_03d(:,3)/e0_frx,'.g','LineWidth',3)
% plot(t/tc_frx_Tp03,eTX_Tp02_03d(:,4)/e0_frx,'.m','LineWidth',3);hold off;grid on;
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
% print(fig,'01a_HPT_swpTp_eTXmag.pdf','-dpdf','-r0')
% print(fig,'01a_HPT_swpTp_eTXmag.tif','-dtiff','-r0')
% 
% % ===============================================================================================%
% % X-Tilt Rate - Semilogx (Dimensionless)
% % ===============================================================================================%
% fig = figure('Name','sweepTp_eTXrate','NumberTitle','off');
% % Parameter 01
% plot(t/tc_frx_Tp01,eTXrate_Tp01_03d(:,1)/e0_frx,'r','LineWidth',3);hold on
% plot(t/tc_frx_Tp01,eTXrate_Tp01_03d(:,2)/e0_frx,'b','LineWidth',3)
% plot(t/tc_frx_Tp01,eTXrate_Tp01_03d(:,3)/e0_frx,'g','LineWidth',3)
% plot(t/tc_frx_Tp01,eTXrate_Tp01_03d(:,4)/e0_frx,'m','LineWidth',3)
% % Parameter 02
% plot(t/tc_frx_Tp02,eTXrate_Tp02_03d(:,1)/e0_frx,'--r','LineWidth',3)
% plot(t/tc_frx_Tp02,eTXrate_Tp02_03d(:,2)/e0_frx,'--b','LineWidth',3)
% plot(t/tc_frx_Tp02,eTXrate_Tp02_03d(:,3)/e0_frx,'--g','LineWidth',3)
% plot(t/tc_frx_Tp02,eTXrate_Tp02_03d(:,4)/e0_frx,'--m','LineWidth',3)
% % Parameter 03
% plot(t/tc_frx_Tp03,eTXrate_Tp02_03d(:,1)/e0_frx,'.r','LineWidth',3)
% plot(t/tc_frx_Tp03,eTXrate_Tp02_03d(:,2)/e0_frx,'.b','LineWidth',3)
% plot(t/tc_frx_Tp03,eTXrate_Tp02_03d(:,3)/e0_frx,'.g','LineWidth',3)
% plot(t/tc_frx_Tp03,eTXrate_Tp02_03d(:,4)/e0_frx,'.m','LineWidth',3);hold off;grid on;
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
% print(fig,'01a_HPT_swpTp_eTXrate.pdf','-dpdf','-r0')
% print(fig,'01a_HPT_swpTp_eTXrate.tif','-dtiff','-r0')

% ===============================================================================================%
% ===============================================================================================%
