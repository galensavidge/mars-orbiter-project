function C = CRP2DCM(q)
% Transforms a CRP into a DCM. Assumes q is a column vector.

C = 1/(1 + dot(q, q))*((1 - dot(q, q))*eye(3) + 2*(q*q') - 2*skew_sym(q));