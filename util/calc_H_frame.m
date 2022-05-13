function C_HN = calc_H_frame(t)
% Returns the relative attitude of the Hill frame for the LMO spacecraft to
% the inertial frame as a DCM

mu = 42828.3;  % Gravitational constant of Mars [km^3/s^2]
R_mars = 3396.19;  % [km]

% Low Mars Orbit (LMO) satellite Keplerian elements
r_LMO = R_mars + 400;
raan_LMO = 20;  % [deg]
inc_LMO = 30;
true_anom_LMO_0 = 60;
% Equation for true anomaly in a circular orbit
true_anom_LMO = rad2deg(sqrt(mu/r_LMO^3)*t) + true_anom_LMO_0;

% Calculate attitude of Hill frame w.r.t. inertial frame
C_HN = euler3132DCM(raan_LMO, inc_LMO, true_anom_LMO);