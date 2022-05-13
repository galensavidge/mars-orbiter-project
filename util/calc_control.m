function u = calc_control(X, C_RN, w_RN_N)
% Returns control torque in body frame

% Control gains
P = 1/6;
K = 1/180;

% Find state errors
[mrp_BR, w_BR_B] = calc_state_errors(X, C_RN, w_RN_N);

% Calculate control torque from the PD control law
u = -K*mrp_BR - P*w_BR_B;