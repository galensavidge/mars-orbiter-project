clear
clc
close all

format long g

mu = 42828.3;  % Gravitational constant of Mars [km^3/s^2]

R_mars = 3396.19;  % [km]

r_LMO = R_mars + 400;
raan_LMO = 20;  % [deg]
inc_LMO = 30;
true_anom_0_LMO = 60;
mean_motion_LMO = sqrt(mu/r_LMO^3);

r_GMO = 20424.2;  % [km]
raan_GMO = 0;
inc_GMO = 0;
true_anom_0_GMO = 250;
mean_motion_GMO = sqrt(mu/r_GMO^3);

t1 = 450;  % [sec]
t2 = 1150;  % [sec]

% Time 1
true_anom_1_LMO = true_anom_0_LMO + rad2deg(mean_motion_LMO*t1);

[r_vec_1_LMO, rdot_vec_1_LMO] = calc_state_vectors(r_LMO, raan_LMO, ...
    inc_LMO, true_anom_1_LMO, mu)

% Time 2
true_anom_2_GMO = true_anom_0_GMO + rad2deg(mean_motion_GMO*t2);

[r_vec_2_GMO, rdot_vec_2_GMO] = calc_state_vectors(r_GMO, raan_GMO, ...
    inc_GMO, true_anom_2_GMO, mu)