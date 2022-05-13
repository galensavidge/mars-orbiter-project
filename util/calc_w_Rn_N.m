function w_N = calc_w_Rn_N(t)

mu = 42828.3;  % Gravitational constant of Mars [km^3/s^2]
R_mars = 3396.19;  % [km]
r_LMO = R_mars + 400;

% Angular velocity of the orbit frane with respect to the inertial frame,
% expressed in the orbit frame
w_H = [0; 0; sqrt(mu/r_LMO^3)];

% Express in inertial frame
w_N = calc_H_frame(t)'*w_H;