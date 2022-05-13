function RcN = calc_Rc_frame(t)
% Returns the attitude of the GMO-pointing reference frame

% Calculate delta-r vector
mu = 42828.3;  % Gravitational constant of Mars [km^3/s^2]

R_mars = 3396.19;  % [km]

r_LMO = R_mars + 400;
raan_LMO = 20;  % [deg]
inc_LMO = 30;
true_anom_0_LMO = 60;
mean_motion_LMO = sqrt(mu/r_LMO^3);
true_anom_LMO = true_anom_0_LMO + rad2deg(mean_motion_LMO*t);

r_GMO = 20424.2;  % [km]
raan_GMO = 0;
inc_GMO = 0;
true_anom_0_GMO = 250;
mean_motion_GMO = sqrt(mu/r_GMO^3);
true_anom_GMO = true_anom_0_GMO + rad2deg(mean_motion_GMO*t);

[r_LMO, ~] = calc_state_vectors(r_LMO, raan_LMO, inc_LMO, true_anom_LMO, mu);
[r_GMO, ~] = calc_state_vectors(r_GMO, raan_GMO, inc_GMO, true_anom_GMO, mu);

delta_r = r_GMO - r_LMO;

% Find Rc unit vectors expressed in the inertial frame
dr_hat = delta_r/norm(delta_r);
r1 = -dr_hat;
n3 = [0; 0; 1];
r2 = cross(dr_hat, n3);
r2 = r2/norm(r2);
r3 = cross(r1, r2);
r3 = r3/norm(r3);

% Assemble DCM from unit vectors
RcN = [r1'; r2'; r3'];