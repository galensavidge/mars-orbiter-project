clear
clc
close all
format long g

% Initial state and time
t0 = 0;
mrp_BN_0 = [0.3; -0.4; 0.5];
w_BN_B_0 = [1.00; 1.75; -2.20]*pi/180;
% Inertia
I = diag([10 5 7.5]);

% First sim: no torque for 500 seconds
dt = 0.01;
t1 = 500;
u_func = @(x, t)zeros(3,1);

[time, sigma, w] = rigid_body_integrator(mrp_BN_0, w_BN_B_0, I, u_func, t0, dt, t1);

w1 = w(:,end)
H1 = I*w1
T1 = 0.5*w1'*I*w1
sigma1 = sigma(:,end)

C_BN_1 = MRP2DCM(sigma1);
H1_N = C_BN_1'*H1

fig1 = plot_attitude(time, sigma);
fig2 = plot_angular_velocity(time, w);

% Second sim: constant torque for 100 seconds
u_func = @(x, t)[0.01; -0.01; 0.02];  % N-m, body frame
t2 = 100;

[time, sigma, w] = rigid_body_integrator(mrp_BN_0, w_BN_B_0, I, u_func, t0, dt, t2);

sigma2 = sigma(:,end)

fig3 = plot_attitude(time, sigma);
fig4 = plot_angular_velocity(time, w);
