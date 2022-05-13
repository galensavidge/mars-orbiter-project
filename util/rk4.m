function x = rk4(xdot_func, x0, t0, dt)
% Propagates x forwards in time by dt using the 4th order Runge-Kutta
% method

k1 = xdot_func(x0, t0);
k2 = xdot_func(x0 + k1*dt/2, t0 + dt/2);
k3 = xdot_func(x0 + k2*dt/2, t0 + dt/2);
k4 = xdot_func(x0 + k3*dt, t0 + dt);

x = x0 + (k1 + 2*k2 + 2*k3 + k4)*dt/6;