

theta = [40; 30; 80]; % deg

dt = 0.001; % sec

for t = 0:dt:42
    w = [sin(0.1*t); 0.01; cos(0.1*t)]*20; % deg/s
    theta = theta + dt*euler_EOM_321(theta, w);
end

theta_norm = norm(deg2rad(theta))