function Bdot = quaternion_diff_eq(B, w)
% Quaternion kinematic differential equation

Bdot = 0.5*[0    -w(1) -w(2) -w(3);
            w(1)  0     w(3) -w(2);
            w(2) -w(3)  0     w(1);
            w(3)  w(2) -w(1)  0]*B;