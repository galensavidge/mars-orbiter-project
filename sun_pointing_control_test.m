clear
clc
close all
format long g

addpath('..')

% Initial state and time
t0 = 0;
mrp_BN_0 = [0.3; -0.4; 0.5];
w_BN_B_0 = [1.00; 1.75; -2.20]*pi/180;
% Inertia
I = diag([10 5 7.5]);

% Set up simulation
dt = 1;
t1 = 400;

% Run propagation
[time, sigma, w, sigma_ref, w_ref, mode] = ...
    rigid_body_integrator(mrp_BN_0, w_BN_B_0, I, @sun_pointing_reference, t0, dt, t1);

% Outputs
sigma15 = sigma(:,15/dt+1);
sigma_file = fopen("Task 8/sigma15.txt",'w');
fprintf(sigma_file, '%.12f %.12f %.12f', sigma15);
sigma100 = sigma(:,100/dt+1);
sigma_file = fopen("Task 8/sigma100.txt",'w');
fprintf(sigma_file, '%.12f %.12f %.12f', sigma100);
sigma200 = sigma(:,200/dt+1);
sigma_file = fopen("Task 8/sigma200.txt",'w');
fprintf(sigma_file, '%.12f %.12f %.12f', sigma200);
sigma400 = sigma(:,400/dt+1);
sigma_file = fopen("Task 8/sigma400.txt",'w');
fprintf(sigma_file, '%.12f %.12f %.12f', sigma400);

f = figure();
f.Position = [100, 100, 800, 600];
subplot(2, 1, 1)
plot_attitude(time, sigma, sigma_ref);
subplot(2, 1, 2)
plot_angular_velocity(time, w, w_ref);
saveas(gcf, 'Task 8/combined_plot.png')

function[Rn, w, mode] = sun_pointing_reference(t)
    Rn = calc_Rs_frame(t);
    w = zeros(3, 1);
    mode = 0;
end