function u = nadir_pointing_control(X, t)
% Control law to align with the nadir pointing reference frame Rn

Rn = calc_Rn_frame(t);
w_Rn_N = calc_w_Rn_N(t);

u = calc_control(X, Rn, w_Rn_N);