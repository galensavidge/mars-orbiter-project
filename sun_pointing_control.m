function u = sun_pointing_control(X, t)
% Control law to align with the Sun pointing reference frame Rs

Rs = calc_Rs_frame(t);
w_Rs_N = zeros(3, 1);

u = calc_control(X, Rs, w_Rs_N);