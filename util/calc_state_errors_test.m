clear
clc
close all
format long g

% Initial state and time
t0 = 0;
mrp_BN_0 = [0.3; -0.4; 0.5];
w_BN_B_0 = [1.00; 1.75; -2.20]*pi/180;
X0 = [mrp_BN_0; w_BN_B_0];

% Sun-pointing reference frame
C_RsN = calc_Rs_frame(t0);
w_RsN_N = [0; 0; 0];
[mrp_BRs, w_BRs_B] = calc_state_errors(X0, C_RsN, w_RsN_N)

% Nadir-pointing reference frame
C_RnN = calc_Rn_frame(t0);
w_RnN_N = calc_w_Rn_N(t0);
[mrp_BRn, w_BRn_B] = calc_state_errors(X0, C_RnN, w_RnN_N)

% GMO-spacecraft-pointing reference frame
C_RcN = calc_Rc_frame(t0);
w_RcN_N = calc_w_Rc_N(t0);
[mrp_BRc, w_BRc_B] = calc_state_errors(X0, C_RcN, w_RcN_N)