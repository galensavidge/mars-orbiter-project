function plot_mode(t, mode_history)

hold on
grid on
plot(t, mode_history)

xlabel('Time [sec]', Interpreter='latex')
ylabel('Pointing Mode', Interpreter='latex')
yticks([0, 1, 2])
yticklabels({'Sun', 'GMO', 'Nadir'})
