%% plotModelData2D_HPT_bln
% Author: R. Moak
% Date: 03/04/20

%% Set Path to Output Folder
cd 'X:\Clemson\Thesis\Models\COMSOL\00_Simulations\LeakDetection\01_ConceptualModels\01a_LD_WDp2D_fS_XPTf\OutputPlots'
addpath('X:\Clemson\Thesis\Models\COMSOL\00_Simulations\LeakDetection\Analyses_All\plotModelData');

%% Load Plot Formatting Variables
plotFormatting;

%% Scaling Parameters
% Define Parameters
alpha_b = 1;
Pc = p_inj;
X_frx = MaterialProps_bln.X_frx;
X_conf = MaterialProps_bln.X_conf;

% Dimensionless Scaling
e0_frx = alpha_b*Pc*X_frx;
e0_conf = alpha_b*Pc*X_conf;

%% Magnitude Spectra Plots
% ===============================================================================================%
% Magnitude Spectra - eXX
% ===============================================================================================%
figure('Name','bln_eXXmagSpec','NumberTitle','off')
loglog(F_bln,eXXmagSpec_bln_03d(:,1),'r','LineWidth',3);hold on
loglog(F_bln,eXXmagSpec_bln_03d(:,2),'b','LineWidth',3)
loglog(F_bln,eXXmagSpec_bln_03d(:,3),'g','LineWidth',3)
loglog(F_bln,eXXmagSpec_bln_03d(:,4),'m','LineWidth',3);hold off; grid on
pbaspect([1 1 1])
% xlim([1E-2,1.25])
xlabel('frequency','FontSize',15)
ylabel('Magnitude','FontSize',15)
legend('r = 5%', 'r = 25%', 'r = 50%', 'r = 100%','Location','NorthEast')
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_bln_eXXmagSpec.pdf','-dpdf','-r0')
print(fig,'01a_HPT_bln_eXXmagSpec.tif','-dtiff','-r0')

%% Magnitude Spectra as function of Distance
figure('Name','bln_eXXmagSpecMaxDist','NumberTitle','off')
plot(r/x_c,eXXmagSpecMax_bln_03d,'xr','MarkerSize',15,'LineWidth',3);grid on;
pbaspect([1 1 1])
xlabel('x*','FontSize',15)
ylabel('Magnitude','FontSize',15)
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_bln_eXXmagSpecDist.pdf','-dpdf','-r0')
print(fig,'01a_HPT_bln_eXXmagSpecDist.tif','-dtiff','-r0')

%% Detectability of Magnitude Spectra
figure('Name','bln_eXXmagSpecDet','NumberTitle','off');
loglog(f,ofsa);hold on;
loglog(f,gtsa)
loglog(f_inj,eXXmagSpecMax_bln_03d(1),'xr','LineWidth',3)
loglog(f_inj,eXXmagSpecMax_bln_03d(2),'xb','LineWidth',3)
loglog(f_inj,eXXmagSpecMax_bln_03d(3),'xg','LineWidth',3)
loglog(f_inj,eXXmagSpecMax_bln_03d(4),'xm','LineWidth',3);hold off;grid on;
pbaspect([1 1 1])
xlim([1E-8,1E-3])
ylim([1E-14,1E-8])
xlabel('frequency','FontSize',15)
ylabel('Magnitude','FontSize',15)
legend('ofsa','gtsa','5%','25%','50%','100%','FontSize',15,'Location','SouthWest')
% FORMATTING
fig = gcf;
fig.PaperUnits = paperSizeUnits;
fig.PaperSize = [paperSizeW_single paperSizeH_single];
fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
print(fig,'01a_HPT_bln_eXXmagSpecDet.pdf','-dpdf','-r0')
print(fig,'01a_HPT_bln_eXXmagSpecDet.tif','-dtiff','-r0')

% ===============================================================================================%
% ===============================================================================================%

% %% Normal Strains (eXX & eZZ)
% % ===============================================================================================%
% % Strain Magnitude - Semilogx (Dimensionless)
% % ===============================================================================================%
% fig = figure('Name','bln_eNNmag','NumberTitle','off');
% plot(t/tc_frx_bln,eXX_bln_03d(:,1)/e0_frx,'r','LineWidth',3);hold on
% plot(t/tc_frx_bln,eXX_bln_03d(:,2)/e0_frx,'b','LineWidth',3)
% plot(t/tc_frx_bln,eXX_bln_03d(:,3)/e0_frx,'g','LineWidth',3)
% plot(t/tc_frx_bln,eXX_bln_03d(:,4)/e0_frx,'m','LineWidth',3)
% plot(t/tc_frx_bln,eZZ_bln_03d(:,1)/e0_frx,'--r','LineWidth',3)
% plot(t/tc_frx_bln,eZZ_bln_03d(:,2)/e0_frx,'--b','LineWidth',3)
% plot(t/tc_frx_bln,eZZ_bln_03d(:,3)/e0_frx,'--g','LineWidth',3)
% plot(t/tc_frx_bln,eZZ_bln_03d(:,4)/e0_frx,'--m','LineWidth',3);hold off;grid on;
% pbaspect([1 1 1])
% % xlim([1E-2,1.25])
% xlabel('t*','FontSize',15)
% ylabel('Dimensionless Strain','FontSize',15)
% legend('r = 5%', 'r = 25%', 'r = 50%', 'r = 100%','Location','SouthWest')
% pbaspect([1 1 1])
% % FORMATTING
% fig = gcf;
% fig.PaperUnits = paperSizeUnits;
% fig.PaperSize = [paperSizeW_single paperSizeH_single];
% fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
% print(fig,'01a_HPT_bln_eNNmag.pdf','-dpdf','-r0')
% print(fig,'01a_HPT_bln_eNNmag.tif','-dtiff','-r0')
% 
% % ===============================================================================================%
% % Strain Rate - eXX - Semilogx (Dimensionless)
% % ===============================================================================================%
% fig = figure('Name','bln_eNNrate','NumberTitle','off');
% plot(t/tc_frx_bln,eXXrate_bln_03d(:,1)/e0_frx,'r','LineWidth',3);hold on
% plot(t/tc_frx_bln,eXXrate_bln_03d(:,2)/e0_frx,'b','LineWidth',3)
% plot(t/tc_frx_bln,eXXrate_bln_03d(:,3)/e0_frx,'g','LineWidth',3)
% plot(t/tc_frx_bln,eXXrate_bln_03d(:,4)/e0_frx,'m','LineWidth',3);hold off;grid on;
% pbaspect([1 1 1])
% % xlim([1E-2,1.25])
% xlabel('t*','FontSize',15)
% ylabel('Dimensionless Strain Rate','FontSize',15)
% legend('r = 5%', 'r = 25%', 'r = 50%', 'r = 100%','Location','NorthEast')
% pbaspect([1 1 1])
% % FORMATTING
% fig = gcf;
% fig.PaperUnits = paperSizeUnits;
% fig.PaperSize = [paperSizeW_single paperSizeH_single];
% fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
% print(fig,'01a_HPT_bln_eNNrate.pdf','-dpdf','-r0')
% print(fig,'01a_HPT_bln_eNNrate.tif','-dtiff','-r0')
% 
% % ===============================================================================================%
% % Detectable Normal Strain Magnitude - (eXX & eZZ) - Semilogx (Dimensionless)
% % ===============================================================================================%
% 
% fig = figure('Name','bln_eNNmagDet','NumberTitle','off');
% plot(t/tc_frx_bln,eXX_detectable_bln_03d(:,1)/e0_frx,'r','LineWidth',7,'HandleVisibility','off');hold on
% plot(t/tc_frx_bln,eXX_detectable_bln_03d(:,2)/e0_frx,'r','LineWidth',7,'HandleVisibility','off');
% plot(t/tc_frx_bln,eXX_detectable_bln_03d(:,3)/e0_frx,'r','LineWidth',7,'HandleVisibility','off');
% plot(t/tc_frx_bln,eXX_detectable_bln_03d(:,4)/e0_frx,'r','LineWidth',7,'HandleVisibility','off');
% plot(t/tc_frx_bln,eXX_bln_03d(:,1)/e0_frx,'r','LineWidth',3)
% plot(t/tc_frx_bln,eXX_bln_03d(:,2)/e0_frx,'b','LineWidth',3)
% plot(t/tc_frx_bln,eXX_bln_03d(:,3)/e0_frx,'g','LineWidth',3)
% plot(t/tc_frx_bln,eXX_bln_03d(:,4)/e0_frx,'m','LineWidth',3)
% plot(t/tc_frx_bln,eZZ_detectable_bln_03d(:,1)/e0_frx,'r','LineWidth',7)
% plot(t/tc_frx_bln,eZZ_detectable_bln_03d(:,2)/e0_frx,'r','LineWidth',7)
% plot(t/tc_frx_bln,eZZ_detectable_bln_03d(:,3)/e0_frx,'r','LineWidth',7)
% plot(t/tc_frx_bln,eZZ_detectable_bln_03d(:,4)/e0_frx,'r','LineWidth',7)
% plot(t/tc_frx_bln,eZZ_bln_03d(:,1)/e0_frx,'--r','LineWidth',3)
% plot(t/tc_frx_bln,eZZ_bln_03d(:,2)/e0_frx,'--b','LineWidth',3)
% plot(t/tc_frx_bln,eZZ_bln_03d(:,3)/e0_frx,'--g','LineWidth',3)
% plot(t/tc_frx_bln,eZZ_bln_03d(:,4)/e0_frx,'--m','LineWidth',3);hold off;grid on;
% pbaspect([1 1 1])
% % xlim([1E-2,1.25])
% xlabel('t*','FontSize',15)
% ylabel('Dimensionless Strain','FontSize',15)
% legend('r = 5%', 'r = 25%', 'r = 50%', 'r = 100%','Location','SouthWest')
% pbaspect([1 1 1])
% % FORMATTING
% % FORMATTING
% fig = gcf;
% fig.PaperUnits = paperSizeUnits;
% fig.PaperSize = [paperSizeW_single paperSizeH_single];
% fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
% print(fig,'01a_HPT_bln_eNNmagDet.pdf','-dpdf','-r0')
% print(fig,'01a_HPT_bln_eNNmagDet.tif','-dtiff','-r0')
% % ===============================================================================================%
% 
% %% Tilt
% % ===============================================================================================%
% % X-Tilt Magnitude - Semilogx (Dimensionless)
% % ===============================================================================================%
% fig = figure('Name','bln_eTXmag','NumberTitle','off');
% plot(t/tc_frx_bln,eTX_bln_03d(:,1)/e0_frx,'r','LineWidth',3);hold on
% plot(t/tc_frx_bln,eTX_bln_03d(:,2)/e0_frx,'b','LineWidth',3)
% plot(t/tc_frx_bln,eTX_bln_03d(:,3)/e0_frx,'g','LineWidth',3)
% plot(t/tc_frx_bln,eTX_bln_03d(:,4)/e0_frx,'m','LineWidth',3);hold off;grid on;
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
% print(fig,'01a_HPT_bln_eTXmag.pdf','-dpdf','-r0')
% print(fig,'01a_HPT_bln_eTXmag.tif','-dtiff','-r0')
% 
% % ===============================================================================================%
% % X-Tilt Rate - Semilogx (Dimensionless)
% % ===============================================================================================%
% fig = figure('Name','bln_eTXrate','NumberTitle','off');
% plot(t/tc_frx_bln,eTXrate_bln_03d(:,1)/e0_frx,'r','LineWidth',3);hold on
% plot(t/tc_frx_bln,eTXrate_bln_03d(:,2)/e0_frx,'b','LineWidth',3)
% plot(t/tc_frx_bln,eTXrate_bln_03d(:,3)/e0_frx,'g','LineWidth',3)
% plot(t/tc_frx_bln,eTXrate_bln_03d(:,4)/e0_frx,'m','LineWidth',3);hold off;grid on;
% pbaspect([1 1 1])
% % xlim([1E-2,1.25])
% xlabel('t*','FontSize',15)
% ylabel('Dimensionless Tilt Rate','FontSize',15)
% legend('r = 5%', 'r = 25%', 'r = 50%', 'r = 100%','Location','NorthEast')
% pbaspect([1 1 1])
% % FORMATTING
% fig = gcf;
% fig.PaperUnits = paperSizeUnits;
% fig.PaperSize = [paperSizeW_single paperSizeH_single];
% fig.PaperPosition = [0 0 paperSizeW_single paperSizeH_single];
% print(fig,'01a_HPT_bln_eTXrate.pdf','-dpdf','-r0')
% print(fig,'01a_HPT_bln_eTXrate.tif','-dtiff','-r0')



% ===============================================================================================%
% ===============================================================================================%

