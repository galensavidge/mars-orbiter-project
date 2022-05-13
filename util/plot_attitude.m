function plot_attitude(t, sigma, sigma_ref)

hold on
grid on
for i=1:3
    plot(t, sigma(i,:))
end

xlabel('Time [sec]', Interpreter='latex')
ylabel('$\sigma_i$', Interpreter='latex')
if isempty(sigma_ref)
    lg = legend('$\sigma_{B/N,1}$', '$\sigma_{B/N,2}$', '$\sigma_{B/N,3}$', 'Interpreter', 'latex');
else
    for i=1:3
        plot(t, sigma_ref(i,:), '--')
    end
    lg = legend('$\sigma_{B/N,1}$', '$\sigma_{B/N,2}$', '$\sigma_{B/N,3}$', ...
        '$\sigma_{R/N,1}$', '$\sigma_{R/N,2}$', '$\sigma_{R/N,3}$', ...
        'Interpreter', 'latex');
end