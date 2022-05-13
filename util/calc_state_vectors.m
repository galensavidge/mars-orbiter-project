function [r_vec, rdot_vec] = calc_state_vectors(r_mag, RAAN, inc, true_anom, mu)
% Angle arguments are in degrees.
% Returns orbit position and velocity vectors evaluated in the inertial
% frame.

% Calculate attitude of Hill frame w.r.t. inertial frame
C_ON = euler3132DCM(RAAN, inc, true_anom);

r_vec_O = [r_mag; 0; 0];  % Position vector in the Hill frame
% Translate position vector to inertial frame
r_vec = C_ON'*r_vec_O;

% Calculate rdot in the Hill frame
rdot_mag = sqrt(mu/r_mag);
rdot_vec_O = [0; rdot_mag; 0];
% Translate velocity vector to inertial frame
rdot_vec = C_ON'*rdot_vec_O;