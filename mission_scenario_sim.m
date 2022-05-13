clear
clc
close all
format long g

addpath('util\')

% Initial state and time
t0 = 0;
mrp_BN_0 = [0.3; -0.4; 0.5];
w_BN_B_0 = [1.00; 1.75; -2.20]*pi/180;
% Inertia
I = diag([10 5 7.5]);

% Set up simulation
dt = 1;
t1 = 6500;
ref_func = @determine_pointing_mode;

% Run propagation
[time, sigma, w, sigma_ref, w_ref, mode] = ...
    rigid_body_integrator(mrp_BN_0, w_BN_B_0, I, ref_func, t0, dt, t1);

% Outputs
sigma300 = sigma(:,300/dt+1);
sigma_file = fopen("Task 11/sigma300.txt",'w');
fprintf(sigma_file, '%.12f %.12f %.12f', sigma300);
sigma2100 = sigma(:,2100/dt+1);
sigma_file = fopen("Task 11/sigma2100.txt",'w');
fprintf(sigma_file, '%.12f %.12f %.12f', sigma2100);
sigma3400 = sigma(:,3400/dt+1);
sigma_file = fopen("Task 11/sigma3400.txt",'w');
fprintf(sigma_file, '%.12f %.12f %.12f', sigma3400);
sigma4400 = sigma(:,4400/dt+1);
sigma_file = fopen("Task 11/sigma4400.txt",'w');
fprintf(sigma_file, '%.12f %.12f %.12f', sigma4400);
sigma5600 = sigma(:,5600/dt+1);
sigma_file = fopen("Task 11/sigma5600.txt",'w');
fprintf(sigma_file, '%.12f %.12f %.12f', sigma5600);

f = figure();
f.Position = [100, 100, 800, 900];
subplot(3, 1, 1)
plot_attitude(time, sigma, sigma_ref);
subplot(3, 1, 2)
plot_angular_velocity(time, w, w_ref);
subplot(3, 1, 3)
plot_mode(time, mode)
saveas(gcf, 'Task 11/combined_plot.png')