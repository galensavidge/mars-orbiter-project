function [mrp_BR, w_BR_B] = calc_state_errors(X, C_RN, w_RN_N)

% Extract attitude and anguar velocity from the state vector
mrp_BN = X(1:3);
w_BN_B = X(4:6);

% Translate atttiude into a DCM
C_BN = MRP2DCM(mrp_BN);
% Find rotation from reference frame to body as a DCM
C_BR = C_BN*C_RN';
% Convert back into a MRP
mrp_BR = DCM2MRP(C_BR);

% Translate R/N angular velocity into body frame components
w_RN_B = C_BN*w_RN_N;
% Find B/R angular velocity from vector subtraction
w_BR_B = w_BN_B - w_RN_B;