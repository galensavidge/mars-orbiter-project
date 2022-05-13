function w_N = calc_w_Rc_N(t)

% 1 us time delta
dt = 0.000001;
C0 = calc_Rc_frame(t);
C1 = calc_Rc_frame(t+dt);

% Estimate time derivative of DCM
Cdot = (C1 - C0)/dt;

% -[w-tilde] matrix from the DCM differential kinematic equation
negwtilde = Cdot*(C0');

% Extract omega components
w1 = negwtilde(2, 3);
w2 = negwtilde(3, 1);
w3 = negwtilde(1, 2);

w_Rc = [w1; w2; w3];

% Translate to inertial frame
w_N = C0'*w_Rc;