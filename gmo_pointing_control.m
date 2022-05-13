function u = gmo_pointing_control(X, t)
% Control law to align with the GMO-pointing reference frame Rc

Rc = calc_Rc_frame(t);
w_Rc_N = calc_w_Rc_N(t);

u = calc_control(X, Rc, w_Rc_N);