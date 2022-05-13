function [t_values, sigma_history, w_history, sigma_ref_history, w_ref_history, mode_history] = ...
    rigid_body_integrator(sigma0, w0, I, ref_func, t0, dt, tf)
% Simulates rigid body motion over some period of time using the specified 
% initial conditions and control function

x = [sigma0; w0];
t_values = t0:dt:tf;
sigma_history = zeros(3, length(t_values));
w_history = zeros(3, length(t_values));
sigma_ref_history = zeros(3, length(t_values));
w_ref_history = zeros(3, length(t_values));
mode_history = zeros(1, length(t_values));

for i = 1:length(t_values)
    % Save state to time history
    sigma_history(:,i) = x(1:3);
    w_history(:,i) = x(4:6);
    
    % Calculate reference attitude and angular velocity
    [R_ref, w_ref, mode_history(i)] = ref_func(t_values(i));
    w_ref_history(:,i) = w_ref;
    sigma_ref_history(:,i) = DCM2MRP(R_ref);
    
    % Calculate control
    u = calc_control(x, R_ref, w_ref);

    % Integrate using RK4
    xdot_func = @(x, t)(calc_xdot(x, I, u));
    x = rk4(xdot_func, x, t_values(i), dt);

    % Check for MRP shadow set
    if norm(x(1:3)) > 1
        x(1:3) = -x(1:3) / norm(x(1:3))^2;
    end
end
end

function xdot = calc_xdot(x, I, L)
    % Calculates state dynamics x_dot = f(x) for x = [sigma; w]
    sigma = x(1:3);
    w = x(4:6);
    sigma_dot = mrp_diff_eq(sigma, w);
    wdot = eulers_equation(w, I, L);
    xdot = [sigma_dot; wdot];
end
