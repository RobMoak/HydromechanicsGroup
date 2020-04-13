function [frxSurf_CPT_bln] = loadModel_CPT_bln(modelName)
%% loadModel_CPT_bln
% Author: R. Moak
% Date: 04/07/2020

% Model Objective:          Leak Detection (LD)
% Gov Eqn Form:             With Dimensions (WD)
% Leak Geometry:            Primitive (p)
% Dimensions:               2D
% Leak Conceptual Model:    Fracture to Surface - 2D Plane Strain (frxSurf)
% Stress Type/Location:     Constant Pressure Test at Frx Base (CPTf)
% Study:                    Baseline Parameters (bln)

%% Define Key File Paths
addpath('X:\Clemson\Thesis\Models\COMSOL\00_Simulations\LeakDetection\Analyses_All\loadModel')

%% Load Support Files
modelFilePaths;  % contains file paths of all models
modelNames;      % contains names of all model files
modelProbes;     % contains names of all model probes

%% Define Model File Directory
cd(modelFilePath_01a_fS_XPTf)

%% Load Model Variable & Define Data Sets

% Load Model
% modelName = modelName_01a_fS_CPTf_bln;
frxSurf_CPT_bln = mphopen(modelName);

% Define Data Sets
dset01 = 'dset1';

%% Load Key Variables
% Time Variable
t = mphglobal(frxSurf_CPT_bln,'t','dataset',dset01);

n_tSteps = length(t);
n_probes = length(ppbW_eXX_01d);

%% Load Pressure Data

% frxBot
p_frxBot_bln = mphglobal(frxSurf_CPT_bln,{'ppb_frxBot_p'},'dataset',dset01); 

%% Load Horizontal Strain Probe Data (eXX)

% ====================================================================================================== %
% PROBES: WEST
% ====================================================================================================== %

eXX_bln_01d     = zeros(n_tSteps,length(ppbW_eXX_01d));
eXXrate_bln_01d = zeros(n_tSteps,length(ppbW_eXX_01d));
eXX_bln_03d     = zeros(n_tSteps,length(ppbW_eXX_03d));
eXXrate_bln_03d = zeros(n_tSteps,length(ppbW_eXX_03d));
eXX_bln_05d     = zeros(n_tSteps,length(ppbW_eXX_05d));
eXXrate_bln_05d = zeros(n_tSteps,length(ppbW_eXX_05d));
eXX_bln_10d     = zeros(n_tSteps,length(ppbW_eXX_10d));
eXXrate_bln_10d = zeros(n_tSteps,length(ppbW_eXX_10d));
eXX_bln_50d     = zeros(n_tSteps,length(ppbW_eXX_50d));
eXXrate_bln_50d = zeros(n_tSteps,length(ppbW_eXX_50d));

for i = 1:n_probes
    % Depth 1%
    eXX_bln_01d(:,i)     = mphglobal(frxSurf_CPT_bln,ppbW_eXX_01d(i),'dataset',dset01);
    eXXrate_bln_01d(:,i) = mphglobal(frxSurf_CPT_bln,ppbW_eXXrate_01d(i),'dataset',dset01);
    % Depth 3%
    eXX_bln_03d(:,i)     = mphglobal(frxSurf_CPT_bln,ppbW_eXX_03d(i),'dataset',dset01);
    eXXrate_bln_03d(:,i) = mphglobal(frxSurf_CPT_bln,ppbW_eXXrate_03d(i),'dataset',dset01);
    % Depth 5%
    eXX_bln_05d(:,i)     = mphglobal(frxSurf_CPT_bln,ppbW_eXX_05d(i),'dataset',dset01);
    eXXrate_bln_05d(:,i) = mphglobal(frxSurf_CPT_bln,ppbW_eXXrate_05d(i),'dataset',dset01);
    % Depth 10%
    eXX_bln_10d(:,i)     = mphglobal(frxSurf_CPT_bln,ppbW_eXX_10d(i),'dataset',dset01);
    eXXrate_bln_10d(:,i) = mphglobal(frxSurf_CPT_bln,ppbW_eXXrate_10d(i),'dataset',dset01);
    % Depth 50%
    eXX_bln_50d(:,i)     = mphglobal(frxSurf_CPT_bln,ppbW_eXX_50d(i),'dataset',dset01);
    eXXrate_bln_50d(:,i) = mphglobal(frxSurf_CPT_bln,ppbW_eXXrate_50d(i),'dataset',dset01);
end

%% Load Vertical Strain Probe Data (eZZ)

% ====================================================================================================== %
% PROBES: WEST
% ====================================================================================================== %

eZZ_bln_01d     = zeros(n_tSteps,length(ppbW_eZZ_01d));
eZZrate_bln_01d = zeros(n_tSteps,length(ppbW_eZZ_01d));
eZZ_bln_03d     = zeros(n_tSteps,length(ppbW_eZZ_03d));
eZZrate_bln_03d = zeros(n_tSteps,length(ppbW_eZZ_03d));
eZZ_bln_05d     = zeros(n_tSteps,length(ppbW_eZZ_05d));
eZZrate_bln_05d = zeros(n_tSteps,length(ppbW_eZZ_05d));
eZZ_bln_10d     = zeros(n_tSteps,length(ppbW_eZZ_10d));
eZZrate_bln_10d = zeros(n_tSteps,length(ppbW_eZZ_10d));
eZZ_bln_50d     = zeros(n_tSteps,length(ppbW_eZZ_50d));
eZZrate_bln_50d = zeros(n_tSteps,length(ppbW_eZZ_50d));

for i = 1:n_probes
    % Depth 1%
    eZZ_bln_01d(:,i)     = mphglobal(frxSurf_CPT_bln,ppbW_eZZ_01d(i),'dataset',dset01);
    eZZrate_bln_01d(:,i) = mphglobal(frxSurf_CPT_bln,ppbW_eZZrate_01d(i),'dataset',dset01);
    % Depth 3%
    eZZ_bln_03d(:,i)     = mphglobal(frxSurf_CPT_bln,ppbW_eZZ_03d(i),'dataset',dset01);
    eZZrate_bln_03d(:,i) = mphglobal(frxSurf_CPT_bln,ppbW_eZZrate_03d(i),'dataset',dset01);
    % Depth 5%
    eZZ_bln_05d(:,i)     = mphglobal(frxSurf_CPT_bln,ppbW_eZZ_05d(i),'dataset',dset01);
    eZZrate_bln_05d(:,i) = mphglobal(frxSurf_CPT_bln,ppbW_eZZrate_05d(i),'dataset',dset01);
    % Depth 10%
    eZZ_bln_10d(:,i)     = mphglobal(frxSurf_CPT_bln,ppbW_eZZ_10d(i),'dataset',dset01);
    eZZrate_bln_10d(:,i) = mphglobal(frxSurf_CPT_bln,ppbW_eZZrate_10d(i),'dataset',dset01);
    % Depth 50%
    eZZ_bln_50d(:,i)     = mphglobal(frxSurf_CPT_bln,ppbW_eZZ_50d(i),'dataset',dset01);
    eZZrate_bln_50d(:,i) = mphglobal(frxSurf_CPT_bln,ppbW_eZZrate_50d(i),'dataset',dset01);
end

%% Load X-Direction Tilt Data (eTX)

% ====================================================================================================== %
% PROBES: WEST
% ====================================================================================================== %

eTX_bln_01d     = zeros(n_tSteps,length(ppbW_eTX_01d));
eTXrate_bln_01d = zeros(n_tSteps,length(ppbW_eTX_01d));
eTX_bln_03d     = zeros(n_tSteps,length(ppbW_eTX_03d));
eTXrate_bln_03d = zeros(n_tSteps,length(ppbW_eTX_03d));
eTX_bln_05d     = zeros(n_tSteps,length(ppbW_eTX_05d));
eTXrate_bln_05d = zeros(n_tSteps,length(ppbW_eTX_05d));
eTX_bln_10d     = zeros(n_tSteps,length(ppbW_eTX_10d));
eTXrate_bln_10d = zeros(n_tSteps,length(ppbW_eTX_10d));
eTX_bln_50d     = zeros(n_tSteps,length(ppbW_eTX_50d));
eTXrate_bln_50d = zeros(n_tSteps,length(ppbW_eTX_50d));

for i = 1:n_probes
    % Depth 1%
    eTX_bln_01d(:,i)     = mphglobal(frxSurf_CPT_bln,ppbW_eTX_01d(i),'dataset',dset01);
    eTXrate_bln_01d(:,i) = mphglobal(frxSurf_CPT_bln,ppbW_eTXrate_01d(i),'dataset',dset01);
    % Depth 3%
    eTX_bln_03d(:,i)     = mphglobal(frxSurf_CPT_bln,ppbW_eTX_03d(i),'dataset',dset01);
    eTXrate_bln_03d(:,i) = mphglobal(frxSurf_CPT_bln,ppbW_eTXrate_03d(i),'dataset',dset01);
    % Depth 5%
    eTX_bln_05d(:,i)     = mphglobal(frxSurf_CPT_bln,ppbW_eTX_05d(i),'dataset',dset01);
    eTXrate_bln_05d(:,i) = mphglobal(frxSurf_CPT_bln,ppbW_eTXrate_05d(i),'dataset',dset01);
    % Depth 10%
    eTX_bln_10d(:,i)     = mphglobal(frxSurf_CPT_bln,ppbW_eTX_10d(i),'dataset',dset01);
    eTXrate_bln_10d(:,i) = mphglobal(frxSurf_CPT_bln,ppbW_eTXrate_10d(i),'dataset',dset01);
    % Depth 50%
    eTX_bln_50d(:,i)     = mphglobal(frxSurf_CPT_bln,ppbW_eTX_50d(i),'dataset',dset01);
    eTXrate_bln_50d(:,i) = mphglobal(frxSurf_CPT_bln,ppbW_eTXrate_50d(i),'dataset',dset01);
end

%% Load Model Parameters Used
tc_bln      = mphevaluate(frxSurf_CPT_bln,'t_c');
xc_bln      = mphevaluate(frxSurf_CPT_bln,'x_c');
p_inj       = mphevaluate(frxSurf_CPT_bln,'p_inj');
alpha_b     = mphevaluate(frxSurf_CPT_bln,'alpha_b');
mu_bln      = mphevaluate(frxSurf_CPT_bln,'mu');
rhoW_bln    = mphevaluate(frxSurf_CPT_bln,'rho_w');
g_const     = mphevaluate(frxSurf_CPT_bln,'g_const');
% conf properties
k_conf_bln  = mphglobal(frxSurf_CPT_bln,{'conf_dom_k'},'dataset',dset01);
K_conf_bln  = mphevaluate(frxSurf_CPT_bln,'K_conf');
E_conf_bln  = mphglobal(frxSurf_CPT_bln,{'conf_dom_E'},'dataset',dset01);
nu_conf_bln = mphglobal(frxSurf_CPT_bln,{'conf_dom_nu'},'dataset',dset01);
X_conf_bln  = (3*(1-2*nu_conf_bln(1)))/E_conf_bln(1);
D_conf_bln  = k_conf_bln(1)/(mu_bln(1)*X_conf_bln(1));
% frx properties
k_frx_bln   = mphglobal(frxSurf_CPT_bln,{'frx_dom_k'},'dataset',dset01);
K_frx_bln   = k_frx_bln(1)*((rhoW_bln(1)*g_const)/mu_bln(1));
E_frx_bln   = mphglobal(frxSurf_CPT_bln,{'frx_dom_E'},'dataset',dset01);
nu_frx_bln  = mphglobal(frxSurf_CPT_bln,{'frx_dom_nu'},'dataset',dset01);
X_frx_bln   = (3*(1-2*nu_frx_bln(1)))/E_frx_bln(1);
D_frx_bln   = k_frx_bln(1)/(mu_bln(1)*X_frx_bln(1));

clear ModelParams_bln
ModelParams_bln(1).modelName = modelName;
ModelParams_bln(1).t_c       = tc_bln;
ModelParams_bln(1).x_c       = xc_bln;
ModelParams_bln(1).p_inj     = p_inj;
ModelParams_bln(1).alpha_b   = alpha_b;
ModelParams_bln(1).mu        = mu_bln;
ModelParams_bln(1).rho_w     = rhoW_bln;
ModelParams_bln(1).g_const   = g_const;
% conf properties
ModelParams_bln(1).k_conf    = k_conf_bln(1);
ModelParams_bln(1).K_conf    = K_conf_bln;
ModelParams_bln(1).D_conf    = D_conf_bln;
ModelParams_bln(1).E_conf    = E_conf_bln(1);
ModelParams_bln(1).nu_conf   = nu_conf_bln(1);
ModelParams_bln(1).X_conf    = X_conf_bln;
% frx properties
ModelParams_bln(1).k_frx     = k_frx_bln(1);
ModelParams_bln(1).K_frx     = K_frx_bln;
ModelParams_bln(1).D_frx     = D_frx_bln;
ModelParams_bln(1).E_frx     = E_frx_bln(1);
ModelParams_bln(1).nu_frx    = nu_frx_bln(1);
ModelParams_bln(1).X_frx     = X_frx_bln;

clear modelName
clear tc_bln     xc_bln      p_inj
clear tStep
clear alpha_b    mu_bln      rhoW_bln    g_const
clear k_conf_bln K_conf_bln  E_conf_bln nu_conf_bln X_conf_bln D_conf_bln
clear k_res_bln  K_res_bln   E_res_bln  nu_res_bln  X_res_bln  D_res_bln
clear k_frx_bln  K_frx_bln   E_frx_bln  nu_frx_bln  X_frx_bln  D_frx_bln
clear dset01 i
clearModelFilePaths;
clearModelNames;
clearModelProbes;