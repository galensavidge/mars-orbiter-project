function prv = DCM2PRV(C)
% Returns a vector of [e_1, e_2, e_3, phi] with phi expressed in radians.

phi = acos(0.5*(C(1,1) + C(2,2) + C(3,3) - 1));
e = [C(2,3)-C(3,2); C(3,1)-C(1,3);C(1,2)-C(2,1)]/(2*sin(phi));

prv = [e; phi];