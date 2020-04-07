%% plotModelData2D_HPT_swpEconf
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
X_frx = MaterialProps_sweepEc.X_frx;
X01_conf = MaterialProps_sweepEc.X01_conf;
X02_conf = MaterialProps_sweepEc.X02_conf;
X03_conf = MaterialProps_sweepEc.X03_conf;

% Dimensionless Scaling
e0_frx = alpha_b*Pc*X_frx;
e0_conf = alpha_b*Pc*X_conf;

%% Magnitude Spectra Plots
% ===============================================================================================%
% PARAMETER 01: Magnitude Spectra - eXX
% ===============================================================================================%
figure('Name','Ec01_eXXmagSpec','NumberTitle','off')
loglog(F_Ec01,eXXmagSpec_Ec01_03d(:,1),'r','LineWidth',3);hold on
loglog(F_Ec01,eXXmagSpec_Ec01_03d(:,2),'b','LineWidth',3)
loglog(F_Ec01,eXXmagSpec_Ec01_03d(:,3),'g','LineWidth',3)
loglog(F_Ec01,eXXmagSpec_Ec01_03d(:,4),'m','LineWidth',3);hold off; grid on
pbaspect([1 1 1])
% xlim([1E-2,1.25])
xlabel('frequency','FontSize',15)
ylabel('Dimensionless Tilt Rablnte','FontSize',15)
legend('r = 5%', 'r = 25%', 'r = 50%', 'r = 100%','Location','NorthEast')
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_Ec01_eXXmagSpec.pdf','-dpdf','-r0')
print(fig,'01a_HPT_Ec01_eXXmagSpec.tif','-dtiff','-r0')

% ===============================================================================================%
% PARAMETER 02: Magnitude Spectra - eXX
% ===============================================================================================%
figure('Name','Ec02_eXXmagSpec','NumberTitle','off')
loglog(F_Ec02,eXXmagSpec_Ec02_03d(:,1),'r','LineWidth',3);hold on
loglog(F_Ec02,eXXmagSpec_Ec02_03d(:,2),'b','LineWidth',3)
loglog(F_Ec02,eXXmagSpec_Ec02_03d(:,3),'g','LineWidth',3)
loglog(F_Ec02,eXXmagSpec_Ec02_03d(:,4),'m','LineWidth',3);hold off; grid on
pbaspect([1 1 1])
% xlim([1E-2,1.25])
xlabel('frequency','FontSize',15)
ylabel('Dimensionless Tilt Rablnte','FontSize',15)
legend('r = 5%', 'r = 25%', 'r = 50%', 'r = 100%','Location','NorthEast')
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_Ec02_eXXmagSpec.pdf','-dpdf','-r0')
print(fig,'01a_HPT_Ec02_eXXmagSpec.tif','-dtiff','-r0')

% ===============================================================================================%
% PARAMETER 03: Magnitude Spectra - eXX
% ===============================================================================================%
figure('Name','Ec03_eXXmagSpec','NumberTitle','off')
loglog(F_Ec03,eXXmagSpec_Ec03_03d(:,1),'r','LineWidth',3);hold on
loglog(F_Ec03,eXXmagSpec_Ec03_03d(:,2),'b','LineWidth',3)
loglog(F_Ec03,eXXmagSpec_Ec03_03d(:,3),'g','LineWidth',3)
loglog(F_Ec03,eXXmagSpec_Ec03_03d(:,4),'m','LineWidth',3);hold off; grid on
pbaspect([1 1 1])
% xlim([1E-2,1.25])
xlabel('frequency','FontSize',15)
ylabel('Dimensionless Tilt Rablnte','FontSize',15)
legend('r = 5%', 'r = 25%', 'r = 50%', 'r = 100%','Location','NorthEast')
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_Ec03_eXXmagSpec.pdf','-dpdf','-r0')
print(fig,'01a_HPT_Ec03_eXXmagSpec.tif','-dtiff','-r0')

%% Magnitude Spectra as function of Distance

% ===============================================================================================%
% PARAMETER 01: Magnitude Spectra - eXX
% ===============================================================================================%
figure('Name','Ec01_eXXmagSpecMaxDist','NumberTitle','off')
plot(r,eXXmagSpecMax_Ec01_03d,'xr','MarkerSize',15,'LineWidth',3);grid on;
pbaspect([1 1 1])
xlabel('x*','FontSize',15)
ylabel('Magnitude','FontSize',15)
legend('Ec01','FontSize',15,'Location','SouthWest')
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_Ec01_eXXmagSpecDist.pdf','-dpdf','-r0')
print(fig,'01a_HPT_Ec01_eXXmagSpecDist.tif','-dtiff','-r0')

% ===============================================================================================%
% PARAMETER 02: Magnitude Spectra - eXX
% ===============================================================================================%
figure('Name','Ec02_eXXmagSpecMaxDist','NumberTitle','off')
plot(r,eXXmagSpecMax_Ec02_03d,'xr','MarkerSize',15,'LineWidth',3);grid on;
pbaspect([1 1 1])
xlabel('x*','FontSize',15)
ylabel('Magnitude','FontSize',15)
legend('Ec02','FontSize',15,'Location','SouthWest')
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_Ec02_eXXmagSpecDist.pdf','-dpdf','-r0')
print(fig,'01a_HPT_Ec02_eXXmagSpecDist.tif','-dtiff','-r0')

% ===============================================================================================%
% PARAMETER 03: Magnitude Spectra - eXX
% ===============================================================================================%
figure('Name','Ec03_eXXmagSpecMaxDist','NumberTitle','off')
plot(r,eXXmagSpecMax_Ec03_03d,'xr','MarkerSize',15,'LineWidth',3);grid on;
pbaspect([1 1 1])
xlabel('x*','FontSize',15)
ylabel('Magnitude','FontSize',15)
legend('Ec03','FontSize',15,'Location','SouthWest')
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_Ec03_eXXmagSpecDist.pdf','-dpdf','-r0')
print(fig,'01a_HPT_Ec03_eXXmagSpecDist.tif','-dtiff','-r0')

% ===============================================================================================%
% ALL PARAMETERS: Magnitude Spectra - eXX
% ===============================================================================================%
figure('Name','sweepEconf_eXXmagSpecMaxDist','NumberTitle','off')
plot(r,eXXmagSpecMax_Ec01_03d,'xr','MarkerSize',15,'LineWidth',3);hold on;
plot(r,eXXmagSpecMax_Ec02_03d,'xb','MarkerSize',15,'LineWidth',3)
plot(r,eXXmagSpecMax_Ec03_03d,'xg','MarkerSize',15,'LineWidth',3);hold off;;grid on;
pbaspect([1 1 1])
xlabel('x*','FontSize',15)
ylabel('Magnitude','FontSize',15)
legend('Ec01','Ec02','Ec03','FontSize',15)
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_swpEconf_eXXmagSpecDist.pdf','-dpdf','-r0')
print(fig,'01a_HPT_swpEconf_eXXmagSpecDist.tif','-dtiff','-r0')

%% Magnitude Spectra as function of Confining Unit Young's Modulus
% ===============================================================================================%
% 05w03d: Magnitude Spectra - eXX
% ===============================================================================================%
figure('Name','05w03d_sweepEconf_eXXmagSpec','NumberTitle','off')
plot(MaterialProps_sweepEc(1).Ec01,eXXmagSpecMax_Ec01_03d(1),'rx','MarkerSize',15,'LineWidth',3);hold on;
plot(MaterialProps_sweepEc(1).Ec02,eXXmagSpecMax_Ec02_03d(1),'bx','MarkerSize',15,'LineWidth',3)
plot(MaterialProps_sweepEc(1).Ec03,eXXmagSpecMax_Ec03_03d(1),'gx','MarkerSize',15,'LineWidth',3);hold off;grid on;
pbaspect([1 1 1])
xlabel('Young''s Modulus [GPa]','FontSize',15)
ylabel('Magnitude','FontSize',15)
legend('Ec01','Ec02','Ec03','FontSize',15,'Location','SouthWest')
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_swpEconfeXXmagSpecMax_05w03d.pdf','-dpdf','-r0')
print(fig,'01a_HPT_swpEconfeXXmagSpecMax_05w03d.tif','-dtiff','-r0')

% ===============================================================================================%
% 25w03d: Magnitude Spectra - eXX
% ===============================================================================================%
figure('Name','25w03d_sweepEconf_eXXmagSpec','NumberTitle','off')
plot(MaterialProps_sweepEc(1).Ec01,eXXmagSpecMax_Ec01_03d(2),'rx','MarkerSize',15,'LineWidth',3);hold on;
plot(MaterialProps_sweepEc(1).Ec02,eXXmagSpecMax_Ec02_03d(2),'bx','MarkerSize',15,'LineWidth',3)
plot(MaterialProps_sweepEc(1).Ec03,eXXmagSpecMax_Ec03_03d(2),'gx','MarkerSize',15,'LineWidth',3);hold off;grid on;
pbaspect([1 1 1])
xlabel('Young''s Modulus [GPa]','FontSize',15)
ylabel('Magnitude','FontSize',15)
legend('Ec01','Ec02','Ec03','FontSize',15,'Location','SouthWest')
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_swpEconfeXXmagSpecMax_25w03d.pdf','-dpdf','-r0')
print(fig,'01a_HPT_swpEconfeXXmagSpecMax_25w03d.tif','-dtiff','-r0')

% ===============================================================================================%
% 50w03d: Magnitude Spectra - eXX
% ===============================================================================================%
figure('Name','50w03d_sweepEconf_eXXmagSpec','NumberTitle','off')
plot(MaterialProps_sweepEc(1).Ec01,eXXmagSpecMax_Ec01_03d(3),'rx','MarkerSize',15,'LineWidth',3);hold on;
plot(MaterialProps_sweepEc(1).Ec02,eXXmagSpecMax_Ec02_03d(3),'bx','MarkerSize',15,'LineWidth',3)
plot(MaterialProps_sweepEc(1).Ec03,eXXmagSpecMax_Ec03_03d(3),'gx','MarkerSize',15,'LineWidth',3);hold off;grid on;
pbaspect([1 1 1])
xlabel('Young''s Modulus [GPa]','FontSize',15)
ylabel('Magnitude','FontSize',15)
legend('Ec01','Ec02','Ec03','FontSize',15,'Location','SouthWest')
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_swpEconfeXXmagSpecMax_50w03d.pdf','-dpdf','-r0')
print(fig,'01a_HPT_swpEconfeXXmagSpecMax_50w03d.tif','-dtiff','-r0')

% ===============================================================================================%
% 100w03d: Magnitude Spectra - eXX
% ===============================================================================================%
figure('Name','100w03d_sweepEconf_eXXmagSpec','NumberTitle','off')
plot(MaterialProps_sweepEc(1).Ec01,eXXmagSpecMax_Ec01_03d(4),'rx','MarkerSize',15,'LineWidth',3);hold on;
plot(MaterialProps_sweepEc(1).Ec02,eXXmagSpecMax_Ec02_03d(4),'bx','MarkerSize',15,'LineWidth',3)
plot(MaterialProps_sweepEc(1).Ec03,eXXmagSpecMax_Ec03_03d(4),'gx','MarkerSize',15,'LineWidth',3);hold off;grid on;
pbaspect([1 1 1])
xlabel('Young''s Modulus [GPa]','FontSize',15)
ylabel('Magnitude','FontSize',15)
legend('Ec01','Ec02','Ec03','FontSize',15,'Location','SouthEast')
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_swpEconfeXXmagSpecMax_100w03d.pdf','-dpdf','-r0')
print(fig,'01a_HPT_swpEconfeXXmagSpecMax_100w03d.tif','-dtiff','-r0')

% ===============================================================================================%
% ALL LOCATIONS: Magnitude Spectra - eXX
% ===============================================================================================%
figure('Name','allLocations_eXXmagSpec','NumberTitle','off')
subplot(2,2,1)
plot(MaterialProps_sweepEc(1).Ec01,eXXmagSpecMax_Ec01_03d(1),'rx','MarkerSize',15,'LineWidth',3);hold on;
plot(MaterialProps_sweepEc(1).Ec02,eXXmagSpecMax_Ec02_03d(1),'bx','MarkerSize',15,'LineWidth',3)
plot(MaterialProps_sweepEc(1).Ec03,eXXmagSpecMax_Ec03_03d(1),'gx','MarkerSize',15,'LineWidth',3);hold off;grid on;
pbaspect([1 1 1])
xlabel('Young''s Modulus [GPa]','FontSize',15)
ylabel('Magnitude','FontSize',15)
title('05w03d')
subplot(2,2,2)
plot(MaterialProps_sweepEc(1).Ec01,eXXmagSpecMax_Ec01_03d(2),'rx','MarkerSize',15,'LineWidth',3);hold on;
plot(MaterialProps_sweepEc(1).Ec02,eXXmagSpecMax_Ec02_03d(2),'bx','MarkerSize',15,'LineWidth',3)
plot(MaterialProps_sweepEc(1).Ec03,eXXmagSpecMax_Ec03_03d(2),'gx','MarkerSize',15,'LineWidth',3);hold off;grid on;
pbaspect([1 1 1])
xlabel('Young''s Modulus [GPa]','FontSize',15)
ylabel('Magnitude','FontSize',15)
title('25w03d')
subplot(2,2,3)
plot(MaterialProps_sweepEc(1).Ec01,eXXmagSpecMax_Ec01_03d(3),'rx','MarkerSize',15,'LineWidth',3);hold on;
plot(MaterialProps_sweepEc(1).Ec02,eXXmagSpecMax_Ec02_03d(3),'bx','MarkerSize',15,'LineWidth',3)
plot(MaterialProps_sweepEc(1).Ec03,eXXmagSpecMax_Ec03_03d(3),'gx','MarkerSize',15,'LineWidth',3);hold off;grid on;
pbaspect([1 1 1])
xlabel('Young''s Modulus [GPa]','FontSize',15)
ylabel('Magnitude','FontSize',15)
title('50w03d')
subplot(2,2,4)
plot(MaterialProps_sweepEc(1).Ec01,eXXmagSpecMax_Ec01_03d(4),'rx','MarkerSize',15,'LineWidth',3);hold on;
plot(MaterialProps_sweepEc(1).Ec02,eXXmagSpecMax_Ec02_03d(4),'bx','MarkerSize',15,'LineWidth',3)
plot(MaterialProps_sweepEc(1).Ec03,eXXmagSpecMax_Ec03_03d(4),'gx','MarkerSize',15,'LineWidth',3);hold off;grid on;
pbaspect([1 1 1])
xlabel('Young''s Modulus [GPa]','FontSize',15)
ylabel('Magnitude','FontSize',15)
title('100w03d')
legend('Ec01','Ec02','Ec03','FontSize',15,'Location','SouthEast')
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_2by2 paperSizeH_2by2];
fig.PaperPosition = [0 0 paperSizeW_2by2 paperSizeH_2by2];
print(fig,'01a_HPT_swpEconfeXXmagSpecMax_allLoc.pdf','-dpdf','-r0')
print(fig,'01a_HPT_swpEconfeXXmagSpecMax_allLoc.tif','-dtiff','-r0')

%% Detectability of Magnitude Spectra

% =============================================================================================== %
% PARAMETER 01: eXX Detectability 
% =============================================================================================== %
figure('Name','eXXmagSpecDet_Ec01','NumberTitle','off')
loglog(f_eXXmagSpecMax,eXXmagSpecMax_Ec01_03d(:,1),'xr','LineWidth',3);hold on
loglog(f_eXXmagSpecMax,eXXmagSpecMax_Ec01_03d(:,2),'xb','LineWidth',3)
loglog(f_eXXmagSpecMax,eXXmagSpecMax_Ec01_03d(:,3),'xg','LineWidth',3)
loglog(f_eXXmagSpecMax,eXXmagSpecMax_Ec01_03d(:,4),'xm','LineWidth',3)
loglog(f,ofsa)
loglog(f,gtsv);hold off; grid on 
pbaspect([1 1 1])
xlim([1E-8,1E-3])
ylim([1E-14,1E-8])
xlabel('frequency','FontSize',15)
ylabel('Magnitude','FontSize',15)
legend('5%','25%','50%','100%','FontSize',15,'Location','SouthWest')
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_swpEconfeXXmagSpecDet_Ec01.pdf','-dpdf','-r0')
print(fig,'01a_HPT_swpEconfeXXmagSpecDet_Ec01.tif','-dtiff','-r0')

% =============================================================================================== %
% PARAMETER 02: eXX Detectability 
% =============================================================================================== %
figure('Name','eXXmagSpecDet_Ec02','NumberTitle','off')
loglog(f_eXXmagSpecMax,eXXmagSpecMax_Ec02_03d(:,1),'xr','LineWidth',3);hold on
loglog(f_eXXmagSpecMax,eXXmagSpecMax_Ec02_03d(:,2),'xb','LineWidth',3)
loglog(f_eXXmagSpecMax,eXXmagSpecMax_Ec02_03d(:,3),'xg','LineWidth',3)
loglog(f_eXXmagSpecMax,eXXmagSpecMax_Ec02_03d(:,4),'xm','LineWidth',3)
loglog(f,ofsa)
loglog(f,gtsv);hold off; grid on 
pbaspect([1 1 1])
xlim([1E-8,1E-3])
ylim([1E-14,1E-8])
xlabel('frequency','FontSize',15)
ylabel('Magnitude','FontSize',15)
legend('5%','25%','50%','100%','FontSize',15,'Location','SouthWest')
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_swpEconfeXXmagSpecDet_Ec02.pdf','-dpdf','-r0')
print(fig,'01a_HPT_swpEconfeXXmagSpecDet_Ec02.tif','-dtiff','-r0')

% =============================================================================================== %
% PARAMETER 03: eXX Detectability 
% =============================================================================================== %
figure('Name','eXXmagSpecDet_Ec03','NumberTitle','off')
loglog(f_eXXmagSpecMax,eXXmagSpecMax_Ec03_03d(:,1),'xr','LineWidth',3);hold on
loglog(f_eXXmagSpecMax,eXXmagSpecMax_Ec03_03d(:,2),'xb','LineWidth',3)
loglog(f_eXXmagSpecMax,eXXmagSpecMax_Ec03_03d(:,3),'xg','LineWidth',3)
loglog(f_eXXmagSpecMax,eXXmagSpecMax_Ec03_03d(:,4),'xm','LineWidth',3)
loglog(f,ofsa)
loglog(f,gtsv);hold off; grid on 
pbaspect([1 1 1])
xlim([1E-8,1E-3])
ylim([1E-14,1E-8])
xlabel('frequency','FontSize',15)
ylabel('Magnitude','FontSize',15)
legend('5%','25%','50%','100%','FontSize',15,'Location','SouthWest')
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_swpEconfeXXmagSpecDet_Ec03.pdf','-dpdf','-r0')
print(fig,'01a_HPT_swpEconfeXXmagSpecDet_Ec03.tif','-dtiff','-r0')

% ===============================================================================================%
% ===============================================================================================%

% %% Magnitude: Normal Strains (eXX & eZZ)
% % ===============================================================================================%
% % Strain Magnitude - plot (Dimensionless)
% % ===============================================================================================%
% fig = figure('Name','sweepEconf_eNNmag','NumberTitle','off');
% % Parameter 01 - eXX
% plot(t/tc_frx_Ec01,eXX_Ec01_03d(:,1)/e0_frx,'r','LineWidth',3);hold on
% plot(t/tc_frx_Ec01,eXX_Ec01_03d(:,2)/e0_frx,'b','LineWidth',3)
% plot(t/tc_frx_Ec01,eXX_Ec01_03d(:,3)/e0_frx,'g','LineWidth',3)
% plot(t/tc_frx_Ec01,eXX_Ec01_03d(:,4)/e0_frx,'m','LineWidth',3)
% % Parameter 02 - eXX
% plot(t/tc_frx_Ec02,eXX_Ec02_03d(:,1)/e0_frx,'--r','LineWidth',3)
% plot(t/tc_frx_Ec02,eXX_Ec02_03d(:,2)/e0_frx,'--b','LineWidth',3)
% plot(t/tc_frx_Ec02,eXX_Ec02_03d(:,3)/e0_frx,'--g','LineWidth',3)
% plot(t/tc_frx_Ec02,eXX_Ec02_03d(:,4)/e0_frx,'--m','LineWidth',3)
% % Parameter 03 - eXX
% plot(t/tc_frx_Ec03,eXX_Ec03_03d(:,1)/e0_frx,'.r','LineWidth',3)
% plot(t/tc_frx_Ec03,eXX_Ec03_03d(:,2)/e0_frx,'.b','LineWidth',3)
% plot(t/tc_frx_Ec03,eXX_Ec03_03d(:,3)/e0_frx,'.g','LineWidth',3)
% plot(t/tc_frx_Ec03,eXX_Ec03_03d(:,4)/e0_frx,'.m','LineWidth',3);hold off;grid on;
% pbaspect([1 1 1])
% % xlim([3E-3,1.25])
% xlabel('t*','FontSize',15)
% ylabel('Dimensionless Strain','FontSize',15)
% legend('r = 5%', 'r = 25%', 'r = 50%', 'r = 100%','Location','NorthWest')
% pbaspect([1 1 1])
% % FORMATTING
% fig = gcf;
% fig.PaperUnits = paperSizeUnits;
% fig.PaperSize = [paperSizeW_single paperSizeH_single];
% fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
% print(fig,'01a_HPT_swpEconf_eNNmag_allParVals.pdf','-dpdf','-r0')
% print(fig,'01a_HPT_swpEconf_eNNmag_allParVals.tif','-dtiff','-r0')
% 
% %% Detectable Normal Strains
% % ===============================================================================================%
% % PARAMETER VALUE 01: Detectable Normal Strain Magnitude - (eXX & eZZ) - Semilogx (Dimensionless)
% % ===============================================================================================%
% fig = figure('Name','Ec01_eNNmagDet','NumberTitle','off');
% % eXX
% plot(t/tc_frx_Ec01,eXX_detectable_Ec01_03d(:,1)/e0_frx,'r','LineWidth',7,'HandleVisibility','off');hold on
% plot(t/tc_frx_Ec01,eXX_detectable_Ec01_03d(:,2)/e0_frx,'r','LineWidth',7,'HandleVisibility','off');
% plot(t/tc_frx_Ec01,eXX_detectable_Ec01_03d(:,3)/e0_frx,'r','LineWidth',7,'HandleVisibility','off');
% plot(t/tc_frx_Ec01,eXX_detectable_Ec01_03d(:,4)/e0_frx,'r','LineWidth',7,'HandleVisibility','off');
% plot(t/tc_frx_Ec01,eXX_Ec01_03d(:,1)/e0_frx,'r','LineWidth',3)
% plot(t/tc_frx_Ec01,eXX_Ec01_03d(:,2)/e0_frx,'b','LineWidth',3)
% plot(t/tc_frx_Ec01,eXX_Ec01_03d(:,3)/e0_frx,'g','LineWidth',3)
% plot(t/tc_frx_Ec01,eXX_Ec01_03d(:,4)/e0_frx,'m','LineWidth',3);hold on;grid on
% pbaspect([1 1 1])
% % xlim([1E-2,1.25])
% xlabel('t*','FontSize',15)
% ylabel('Dimensionless Strain','FontSize',15)
% legend('r = 5%', 'r = 25%', 'r = 50%', 'r = 100%','Location','NorthWest')
% pbaspect([1 1 1])
% % FORMATTING
% fig = gcf;
% fig.PaperUnits = paperSizeUnits;
% fig.PaperSize = [paperSizeW_single paperSizeH_single];
% fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
% print(fig,'01a_HPT_Ec01_eNNmagDet.pdf','-dpdf','-r0')
% print(fig,'01a_HPT_Ec01_eNNmagDet.tif','-dtiff','-r0')
% 
% % ===============================================================================================%
% % PARAMETER VALUE 02: Detectable Normal Strain Magnitude - (eXX & eZZ) - Semilogx (Dimensionless)
% % ===============================================================================================%
% fig = figure('Name','Ec02_eNNmagDet','NumberTitle','off');
% plot(t/tc_frx_Ec02,eXX_detectable_Ec02_03d(:,1)/e0_frx,'r','LineWidth',7,'HandleVisibility','off');hold on
% plot(t/tc_frx_Ec02,eXX_detectable_Ec02_03d(:,2)/e0_frx,'r','LineWidth',7,'HandleVisibility','off');
% plot(t/tc_frx_Ec02,eXX_detectable_Ec02_03d(:,3)/e0_frx,'r','LineWidth',7,'HandleVisibility','off');
% plot(t/tc_frx_Ec02,eXX_detectable_Ec02_03d(:,4)/e0_frx,'r','LineWidth',7,'HandleVisibility','off');
% plot(t/tc_frx_Ec02,eXX_Ec02_03d(:,1)/e0_frx,'r','LineWidth',3)
% plot(t/tc_frx_Ec02,eXX_Ec02_03d(:,2)/e0_frx,'b','LineWidth',3)
% plot(t/tc_frx_Ec02,eXX_Ec02_03d(:,3)/e0_frx,'g','LineWidth',3)
% plot(t/tc_frx_Ec02,eXX_Ec02_03d(:,4)/e0_frx,'m','LineWidth',3);hold off;grid on
% pbaspect([1 1 1])
% % xlim([1E-2,1.25])
% xlabel('t*','FontSize',15)
% ylabel('Dimensionless Strain','FontSize',15)
% legend('r = 5%', 'r = 25%', 'r = 50%', 'r = 100%','Location','NorthWest')
% pbaspect([1 1 1])
% % FORMATTING
% fig = gcf;
% fig.PaperUnits = paperSizeUnits;
% fig.PaperSize = [paperSizeW_single paperSizeH_single];
% fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
% print(fig,'01a_HPT_Ec02_eNNmagDet.pdf','-dpdf','-r0')
% print(fig,'01a_HPT_Ec02_eNNmagDet.tif','-dtiff','-r0')
% 
% % ===============================================================================================%
% % PARAMETER VALUE 03: Detectable Normal Strain Magnitude - (eXX & eZZ) - Semilogx (Dimensionless)
% % ===============================================================================================%
% fig = figure('Name','Ec03_eNNmagDet','NumberTitle','off');
% plot(t/tc_frx_Ec03,eXX_detectable_Ec03_03d(:,1)/e0_frx,'r','LineWidth',7,'HandleVisibility','off');hold on
% plot(t/tc_frx_Ec03,eXX_detectable_Ec03_03d(:,2)/e0_frx,'r','LineWidth',7,'HandleVisibility','off');
% plot(t/tc_frx_Ec03,eXX_detectable_Ec03_03d(:,3)/e0_frx,'r','LineWidth',7,'HandleVisibility','off');
% plot(t/tc_frx_Ec03,eXX_detectable_Ec03_03d(:,4)/e0_frx,'r','LineWidth',7,'HandleVisibility','off');
% plot(t/tc_frx_Ec03,eXX_Ec03_03d(:,1)/e0_frx,'r','LineWidth',3)
% plot(t/tc_frx_Ec03,eXX_Ec03_03d(:,2)/e0_frx,'b','LineWidth',3)
% plot(t/tc_frx_Ec03,eXX_Ec03_03d(:,3)/e0_frx,'g','LineWidth',3)
% plot(t/tc_frx_Ec03,eXX_Ec03_03d(:,4)/e0_frx,'m','LineWidth',3);hold off;grid on
% pbaspect([1 1 1])
% % xlim([1E-2,1.25])
% xlabel('t*','FontSize',15)
% ylabel('Dimensionless Strain','FontSize',15)
% legend('r = 5%', 'r = 25%', 'r = 50%', 'r = 100%','Location','NorthWest')
% pbaspect([1 1 1])
% % FORMATTING
% fig = gcf;
% fig.PaperUnits = paperSizeUnits;
% fig.PaperSize = [paperSizeW_single paperSizeH_single];
% fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
% print(fig,'01a_HPT_Ec03_eNNmagDet.pdf','-dpdf','-r0')
% print(fig,'01a_HPT_Ec03_eNNmagDet.tif','-dtiff','-r0')
% 
% %% Strain Rate
% % ===============================================================================================%
% % INDIVIDUAL LOCATIONS: Strain Rate (eXX) - plot (Dimensionless)
% % ===============================================================================================%
% % LOCATION: PROBE 05w03d
% fig = figure('Name','swpEconf_eXXrate_05w03d','NumberTitle','off');
% % Parameter 01
% plot(t/tc_frx_Ec01,eXXrate_Ec01_03d(:,1),'r','LineWidth',3);hold on
% % Parameter 02
% plot(t/tc_frx_Ec02,eXXrate_Ec02_03d(:,1),'--r','LineWidth',3)
% % Parameter 03
% plot(t/tc_frx_Ec03,eXXrate_Ec03_03d(:,1),'.r','LineWidth',3);hold off;grid on
% pbaspect([1 1 1])
% % xlim([1E-2,1.25])
% xlabel('t*','FontSize',15)
% ylabel('Dimensionless Strain Rate','FontSize',15)
% legend('Ec01', 'Ec02', 'Ec03','Location','SouthWest')
% pbaspect([1 1 1])
% % FORMATTING
% fig = gcf;
% fig.PaperUnits = paperSizeUnits;
% fig.PaperSize = [paperSizeW_single paperSizeH_single];
% fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
% print(fig,'01a_HPT_swpEconf_eXXrate_05w03d.pdf','-dpdf','-r0')
% print(fig,'01a_HPT_swpEconf_eXXrate_05w03d.tif','-dtiff','-r0')
% 
% % ===============================================================================================%
% 
% % LOCATION: PROBE 25w03d
% fig = figure('Name','swpEconf_eXXrate_25w03d','NumberTitle','off');
% % Parameter 01
% plot(t/tc_frx_Ec01,eXXrate_Ec01_03d(:,2)/e0_frx,'b','LineWidth',3);hold on
% % Parameter 02
% plot(t/tc_frx_Ec02,eXXrate_Ec02_03d(:,2)/e0_frx,'--b','LineWidth',3)
% % Parameter 03
% plot(t/tc_frx_Ec03,eXXrate_Ec03_03d(:,2)/e0_frx,'.b','LineWidth',3);hold off;grid on
% pbaspect([1 1 1])
% % xlim([1E-2,1.25])
% xlabel('t*','FontSize',15)
% ylabel('Dimensionless Strain Rate','FontSize',15)
% legend('Ec01', 'Ec02', 'Ec03','Location','SouthWest')
% pbaspect([1 1 1])
% % FORMATTING
% fig = gcf;
% fig.PaperUnits = paperSizeUnits;
% fig.PaperSize = [paperSizeW_single paperSizeH_single];
% fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
% print(fig,'01a_HPT_swpEconf_eXXrate_25w03d.pdf','-dpdf','-r0')
% print(fig,'01a_HPT_swpEconf_eXXrate_25w03d.tif','-dtiff','-r0')
% 
% % ===============================================================================================%
% 
% % LOCATION: PROBE 50w03d
% fig = figure('Name','swpEconf_eXXrate_50w03d','NumberTitle','off');
% % Parameter 01
% plot(t/tc_frx_Ec01,eXXrate_Ec01_03d(:,3)/e0_frx,'g','LineWidth',3);hold on
% % Parameter 02
% plot(t/tc_frx_Ec02,eXXrate_Ec02_03d(:,3)/e0_frx,'--g','LineWidth',3)
% % Parameter 03
% plot(t/tc_frx_Ec03,eXXrate_Ec03_03d(:,3)/e0_frx,'.g','LineWidth',3);hold off;grid on
% pbaspect([1 1 1])
% % xlim([1E-2,1.25])
% xlabel('t*','FontSize',15)
% ylabel('Dimensionless Strain Rate','FontSize',15)
% legend('Ec01', 'Ec02', 'Ec03','Location','SouthWest')
% pbaspect([1 1 1])
% % FORMATTING
% fig = gcf;
% fig.PaperUnits = paperSizeUnits;
% fig.PaperSize = [paperSizeW_single paperSizeH_single];
% fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
% print(fig,'01a_HPT_swpEconf_eXXrate_50w03d.pdf','-dpdf','-r0')
% print(fig,'01a_HPT_swpEconf_eXXrate_50w03d.tif','-dtiff','-r0')
% 
% % ===============================================================================================%
% 
% % LOCATION: PROBE 100W03d
% fig = figure('Name','swpEconf_eXXrate_100w03d','NumberTitle','off');
% % Parameter 01
% plot(t/tc_frx_Ec01,eXXrate_Ec01_03d(:,4)/e0_frx,'m','LineWidth',3);hold on
% % Parameter 02
% plot(t/tc_frx_Ec02,eXXrate_Ec02_03d(:,4)/e0_frx,'--m','LineWidth',3)
% % Parameter 03
% plot(t/tc_frx_Ec03,eXXrate_Ec03_03d(:,4)/e0_frx,'.m','LineWidth',3);hold off;grid on
% pbaspect([1 1 1])
% % xlim([1E-2,1.25])
% xlabel('t*','FontSize',15)
% ylabel('Dimensionless Strain Rate','FontSize',15)
% legend('Ec01', 'Ec02', 'Ec03','Location','SouthWest')
% pbaspect([1 1 1])
% % FORMATTING
% fig = gcf;
% fig.PaperUnits = paperSizeUnits;
% fig.PaperSize = [paperSizeW_single paperSizeH_single];
% fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
% print(fig,'01a_HPT_swpEconf_eXXrate_100w03d.pdf','-dpdf','-r0')
% print(fig,'01a_HPT_swpEconf_eXXrate_100w03d.tif','-dtiff','-r0')
% 
% % ===============================================================================================%
% % ALL LOCATIONS: Strain Rate (eXX) - plot (Dimensionless)
% % ===============================================================================================%
% fig = figure('Name','swpEconf_eXXrate_05w03d','NumberTitle','off');
% % ===============================================================================================%
% % LOCATION: PROBE 05w03d
% subplot(2,2,1)
% % Parameter 01
% plot(t/tc_frx_Ec01,eXXrate_Ec01_03d(:,1)/e0_frx,'r','LineWidth',3);hold on
% % Parameter 02
% plot(t/tc_frx_Ec02,eXXrate_Ec02_03d(:,1)/e0_frx,'--r','LineWidth',3)
% % Parameter 03
% plot(t/tc_frx_Ec03,eXXrate_Ec03_03d(:,1)/e0_frx,'.r','LineWidth',3);hold off;grid on
% pbaspect([1 1 1])
% % xlim([1E-2,1.25])
% % xlabel('t*','FontSize',15)
% ylabel('Strain Rate (Scaled)','FontSize',12)
% % ===============================================================================================%
% % LOCATION: PROBE 25w03d
% subplot(2,2,2)
% % Parameter 01
% plot(t/tc_frx_Ec01,eXXrate_Ec01_03d(:,2)/e0_frx,'b','LineWidth',3);hold on
% % Parameter 02
% plot(t/tc_frx_Ec02,eXXrate_Ec02_03d(:,2)/e0_frx,'--b','LineWidth',3)
% % Parameter 03
% plot(t/tc_frx_Ec03,eXXrate_Ec03_03d(:,2)/e0_frx,'.b','LineWidth',3);hold off;grid on
% pbaspect([1 1 1])
% % xlim([1E-2,1.25])
% % xlabel('t*','FontSize',15)
% % ===============================================================================================%
% % LOCATION: PROBE 50w03d
% subplot(2,2,3)
% % Parameter 01
% plot(t/tc_frx_Ec01,eXXrate_Ec01_03d(:,3)/e0_frx,'g','LineWidth',3);hold on
% % Parameter 02
% plot(t/tc_frx_Ec02,eXXrate_Ec02_03d(:,3)/e0_frx,'--g','LineWidth',3)
% % Parameter 03
% plot(t/tc_frx_Ec03,eXXrate_Ec03_03d(:,3)/e0_frx,'.g','LineWidth',3);hold off;grid on
% pbaspect([1 1 1])
% % xlim([1E-2,1.25])
% xlabel('t*','FontSize',15)
% ylabel('Strain Rate (Scaled)','FontSize',12)
% % ===============================================================================================%
% % LOCATION: PROBE 100w03d
% subplot(2,2,4)
% % Parameter 01
% plot(t/tc_frx_Ec01,eXXrate_Ec01_03d(:,4)/e0_frx,'m','LineWidth',3);hold on
% % Parameter 02
% plot(t/tc_frx_Ec02,eXXrate_Ec02_03d(:,4)/e0_frx,'--m','LineWidth',3)
% % Parameter 03
% plot(t/tc_frx_Ec03,eXXrate_Ec03_03d(:,4)/e0_frx,'.m','LineWidth',3);hold off;grid on
% pbaspect([1 1 1])
% % xlim([1E-2,1.25])
% xlabel('t*','FontSize',15)
% legend('Ec01', 'Ec02', 'Ec03','Location','SouthWest')
% pbaspect([1 1 1])
% % ===============================================================================================%
% % FORMATTING
% fig = gcf;
% fig.PaperUnits = paperSizeUnits;
% fig.PaperSize = [paperSizeW_2by2 paperSizeH_2by2];
% fig.PaperPosition = [0 0 paperSizeW_2by2 paperSizeH_2by2];
% print(fig,'01a_HPT_swpEconf_eXXrate_allProbes.pdf','-dpdf','-r0')
% print(fig,'01a_HPT_swpEconf_eXXrate_allProbes.tif','-dtiff','-r0')
% 
% %%  Tilt
% % ===============================================================================================%
% % X-Tilt Magnitude - Semilogx (Dimensionless)
% % ===============================================================================================%
% fig = figure('Name','sweepEconf_eTXmag','NumberTitle','off');
% % Parameter 01
% plot(t/tc_frx_Ec01,eTX_Ec01_03d(:,1)/e0_frx,'r','LineWidth',3);hold on
% plot(t/tc_frx_Ec01,eTX_Ec01_03d(:,2)/e0_frx,'b','LineWidth',3)
% plot(t/tc_frx_Ec01,eTX_Ec01_03d(:,3)/e0_frx,'g','LineWidth',3)
% plot(t/tc_frx_Ec01,eTX_Ec01_03d(:,4)/e0_frx,'m','LineWidth',3)
% % Parameter 02
% plot(t/tc_frx_Ec02,eTX_Ec02_03d(:,1)/e0_frx,'--r','LineWidth',3)
% plot(t/tc_frx_Ec02,eTX_Ec02_03d(:,2)/e0_frx,'--b','LineWidth',3)
% plot(t/tc_frx_Ec02,eTX_Ec02_03d(:,3)/e0_frx,'--g','LineWidth',3)
% plot(t/tc_frx_Ec02,eTX_Ec02_03d(:,4)/e0_frx,'--m','LineWidth',3)
% % Parameter 03
% plot(t/tc_frx_Ec03,eTX_Ec02_03d(:,1)/e0_frx,'.r','LineWidth',3)
% plot(t/tc_frx_Ec03,eTX_Ec02_03d(:,2)/e0_frx,'.b','LineWidth',3)
% plot(t/tc_frx_Ec03,eTX_Ec02_03d(:,3)/e0_frx,'.g','LineWidth',3)
% plot(t/tc_frx_Ec03,eTX_Ec02_03d(:,4)/e0_frx,'.m','LineWidth',3);hold off;grid on;
% pbaspect([1 1 1])
% % xlim([1E-2,1.25])
% xlabel('t*','FontSize',15)
% ylabel('Dimensionless Tilt','FontSize',15)
% legend('r = 5%', 'r = 25%', 'r = 50%', 'r = 100%','Location','NorthWest')
% pbaspect([1 1 1])
% % FORMATTING
% fig = gcf;
% fig.PaperUnits = paperSizeUnits;
% fig.PaperSize = [paperSizeW_single paperSizeH_single];
% fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
% print(fig,'01a_HPT_swpEconf_eTXmag.pdf','-dpdf','-r0')
% print(fig,'01a_HPT_swpEconf_eTXmag.tif','-dtiff','-r0')
% 
% % ===============================================================================================%
% % X-Tilt Rate - Semilogx (Dimensionless)
% % ===============================================================================================%
% fig = figure('Name','sweepEconf_eTXrate','NumberTitle','off');
% % Parameter 01
% plot(t/tc_frx_Ec01,eTXrate_Ec01_03d(:,1)/e0_frx,'r','LineWidth',3);hold on
% plot(t/tc_frx_Ec01,eTXrate_Ec01_03d(:,2)/e0_frx,'b','LineWidth',3)
% plot(t/tc_frx_Ec01,eTXrate_Ec01_03d(:,3)/e0_frx,'g','LineWidth',3)
% plot(t/tc_frx_Ec01,eTXrate_Ec01_03d(:,4)/e0_frx,'m','LineWidth',3)
% % Parameter 02
% plot(t/tc_frx_Ec02,eTXrate_Ec02_03d(:,1)/e0_frx,'--r','LineWidth',3)
% plot(t/tc_frx_Ec02,eTXrate_Ec02_03d(:,2)/e0_frx,'--b','LineWidth',3)
% plot(t/tc_frx_Ec02,eTXrate_Ec02_03d(:,3)/e0_frx,'--g','LineWidth',3)
% plot(t/tc_frx_Ec02,eTXrate_Ec02_03d(:,4)/e0_frx,'--m','LineWidth',3)
% % Parameter 03
% plot(t/tc_frx_Ec03,eTXrate_Ec02_03d(:,1)/e0_frx,'.r','LineWidth',3)
% plot(t/tc_frx_Ec03,eTXrate_Ec02_03d(:,2)/e0_frx,'.b','LineWidth',3)
% plot(t/tc_frx_Ec03,eTXrate_Ec02_03d(:,3)/e0_frx,'.g','LineWidth',3)
% plot(t/tc_frx_Ec03,eTXrate_Ec02_03d(:,4)/e0_frx,'.m','LineWidth',3);hold off;grid on;
% pbaspect([1 1 1])
% xlim([5E-7,3E-4])
% xlabel('t*','FontSize',15)
% ylabel('Dimensionless Tilt','FontSize',15)
% legend('r = 5%', 'r = 25%', 'r = 50%', 'r = 100%','Location','NorthWest')
% pbaspect([1 1 1])
% % FORMATTING
% fig = gcf;
% fig.PaperUnits = paperSizeUnits;
% fig.PaperSize = [paperSizeW_single paperSizeH_single];
% fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
% print(fig,'01a_HPT_swpEconf_eTXrate.pdf','-dpdf','-r0')
% print(fig,'01a_HPT_swpEconf_eTXrate.tif','-dtiff','-r0')

% ===============================================================================================%
% ===============================================================================================%
