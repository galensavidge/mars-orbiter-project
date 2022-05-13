function [R_ref, w_ref, mode] = determine_pointing_mode(t)

mu = 42828.3;  % Gravitational constant of Mars [km^3/s^2]
R_mars = 3396.19;  % [km]

% Low Mars Orbit (LMO) satellite Keplerian elements
r_LMO = R_mars + 400;
raan_LMO = 20;  % [deg]
inc_LMO = 30;  % [deg]
true_anom_LMO_0 = 60;  % [deg]
% Equation for true anomaly in a circular orbit
true_anom_LMO = rad2deg(sqrt(mu/r_LMO^3)*t) + true_anom_LMO_0;

% LMO spacecraft position
r_LMO_H = [r_LMO; 0; 0];
C_HN = euler3132DCM(raan_LMO, inc_LMO, true_anom_LMO);
r_LMO_N = C_HN'*r_LMO_H;

% Geostationary Mars Orbit (GMO) satellite Keplerian elements
r_GMO = R_mars + 17028.01;
raan_GMO = 0;
inc_GMO = 0;
true_anom_GMO_0 = 250;  % [deg]\
true_anom_GMO = rad2deg(sqrt(mu/r_GMO^3)*t) + true_anom_GMO_0;

% GMO spacecraft position
r_GMO_O = [r_GMO; 0; 0];
C_ON = euler3132DCM(raan_GMO, inc_GMO, true_anom_GMO);
r_GMO_N = C_ON'*r_GMO_O;

% Calculate angle between LMO and GMO spacecraft inertial position vectors
r_LMO_GMO_angle = acosd(dot(r_LMO_N, r_GMO_N)/(r_LMO*r_GMO));

% Determine which control law to use
% Light side of Mars -> Sun point (mode 0)
if r_LMO_N(2) > 0
    R_ref = calc_Rs_frame(t);
    w_ref = zeros(3, 1);
    mode = 0;
% Angle to GMO < 35 degrees -> GMO point (mode 1)
elseif r_LMO_GMO_angle < 35
    R_ref = calc_Rc_frame(t);
    w_ref = calc_w_Rc_N(t);
    mode = 1;
% Otherwise, nadir point (mode 2)
else
    R_ref = calc_Rn_frame(t);
    w_ref = calc_w_Rn_N(t);
    mode = 2;
end