%% probeInfo
% Author: R. Moak
% Date: 04/10/20

%% Leak Detection Simulation Probe Information
addpath('X:\Clemson\Thesis\Models\COMSOL\00_Simulations\LeakDetection\Analyses_All');
addpath('X:\Clemson\Thesis\Models\COMSOL\00_Simulations\LeakDetection\Analyses_All\loadModel');

% Radial distances of probe locations [m]
r     = [x_c*0.05; x_c*0.25; x_c*0.50; x_c; x_c*1.1; x_c*1.25; x_c*1.5; x_c*2.0; x_c*2.5];
% rPlot = [x_c*0.05; x_c*0.25; x_c*0.50; x_c; x_c*1.1; x_c*1.25; x_c*2.0; x_c*2.5];

% Number of Probes
n_probes = length(r);

% Depth of probe locations [m]
d = [x_c*0.01; x_c*0.03; x_c*0.05; x_c*0.1; x_c*0.50];
