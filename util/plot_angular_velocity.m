function plot_angular_velocity(t, w, w_ref)

hold on
grid on
for i=1:3
    plot(t, w(i,:))
end
xlabel('Time [sec]', Interpreter='latex')
ylabel('$^B\omega_i$ [rad/sec]', Interpreter='latex')
if isempty(w_ref)
    legend('$^B\omega_{B/N,1}$', '$^B\omega_{B/N,2}$', '$^B\omega_{B/N,3}$', ...
        'Interpreter', 'latex')
else
    for i=1:3
        plot(t, w_ref(i,:), '--')
    end
    legend('$^B\omega_{B/N,1}$', '$^B\omega_{B/N,2}$', '$^B\omega_{B/N,3}$', ...
        '$^B\omega_{R/N,1}$', '$^B\omega_{R/N,2}$', '$^B\omega_{R/N,3}$', ...
        'Interpreter', 'latex')
end
