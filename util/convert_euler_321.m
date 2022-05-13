clc
clear

% Angle definitions
t1 = 10;
t2 = 20;
t3 = 30;


% 3-2-1 DCM
C = euler3212DCM(t1, t2, t3)

% Inverse 3-1-3
Omega = atan2d(C(3,1), -C(3,2))
i = acosd(C(3,3))
omega = atand(C(1,3)/C(2,3))

% Inverse 3-2-1
psi = atan2d(C(1,2), C(1,1))
theta = -asind(C(1,3))
phi = atan2d(C(2,3), C(3,3))