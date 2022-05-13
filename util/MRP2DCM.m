function C = MRP2DCM(sigma)
% Translates a MRP (assumed to be a column vector) into a DCM

C = eye(3) + (8*skew_sym(sigma)^2 - ...
    4*(1 - norm(sigma)^2)*skew_sym(sigma))/(1 + norm(sigma)^2)^2;