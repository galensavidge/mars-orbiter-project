function omega_dot = eulers_equation(w, I, L)
% Euler's rotational equation of motion
% Arguments:
%   w: Angular velocity [rad/sec]
%   I: Inertia matrix [kg-m^2]
%   L: Torque around center of mass [N-m]

omega_dot = I\(L - skew_sym(w)*I*w);