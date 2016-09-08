%=========================================================================
% result_visualizer.m
%
% Visualizes simulation results in the form of a playback video
%
% Dependencies:
%	toolbox/plot_gui.m
%	functions/drawFcn.m
%	results/[RESULT_FILE] => generated by ode_simulation.m
%=========================================================================
close all;
clear all;
clc;
%======================================
% Setup
%======================================
[filename,pathname] = uigetfile('*.mat', 'Choose result file');
if pathname == 0
	error('Error: Please choose a file.');
end

%======================================
% Initialization
%======================================
% Add library path (plot_gui)
addpath('toolbox');

% Add function path (drawFcn)
addpath('functions');

% Load result file
load(fullfile(pathname,filename));
if exist('result') ~= 1
	error('Error: The selected file is not a result file generated by ode_simulation.m');
end

%======================================
% Plot
%======================================
v = version('-release');
v_year = str2num(v(1:4));
if (v_year < 2014) || ( v(5) == 'a' && v_year == 2014 )
	plot_gui_old(result, @drawFcn);
else
	plot_gui(result, @drawFcn);
end