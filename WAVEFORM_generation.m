% Parameters
fs = 1000;          % Sampling frequency (Hz)
t = 0:1/fs:1;       % Time vector (1 second duration)
f = 5;              % Frequency of the waveform (Hz)
A = 1.2;            % Amplitude of the waveform (slightly increased for visibility)

% Generate waveforms
sine_wave = A * sin(2 * pi * f * t);                % Sine Wave
square_wave = A * square(2 * pi * f * t);           % Square Wave
triangle_wave = A * sawtooth(2 * pi * f * t, 0.5);  % Triangle Wave
sawtooth_wave = A * sawtooth(2 * pi * f * t);       % Sawtooth Wave

% Create figure with custom styling
figure('Name', 'Creative Waveform Visualization', 'Color', [0.95 0.95 0.95]);

% Sine Wave
subplot(4, 1, 1);
plot(t, sine_wave, 'b-', 'LineWidth', 1.5);
title('Sine Wave - Smooth Oscillation', 'FontSize', 12, 'FontWeight', 'bold', 'Color', [0 0.4 0.7]);
xlabel('Time (s)', 'FontSize', 10);
ylabel('Amplitude', 'FontSize', 10);
grid on;
set(gca, 'GridLineStyle', '--', 'GridColor', [0.5 0.5 0.5], 'GridAlpha', 0.3);
% Add annotation
text(0.1, A*0.8, 'Smooth, continuous curve', 'FontSize', 8, 'Color', [0 0.4 0.7]);

% Square Wave
subplot(4, 1, 2);
plot(t, square_wave, 'r-', 'LineWidth', 1.5);
title('Square Wave - Sharp Transitions', 'FontSize', 12, 'FontWeight', 'bold', 'Color', [0.7 0 0]);
xlabel('Time (s)', 'FontSize', 10);
ylabel('Amplitude', 'FontSize', 10);
grid on;
set(gca, 'GridLineStyle', '--', 'GridColor', [0.5 0.5 0.5], 'GridAlpha', 0.3);
% Add annotation
text(0.1, A*0.8, 'Abrupt high/low switches', 'FontSize', 8, 'Color', [0.7 0 0]);

% Triangle Wave
subplot(4, 1, 3);
plot(t, triangle_wave, 'g-', 'LineWidth', 1.5);
title('Triangle Wave - Linear Slopes', 'FontSize', 12, 'FontWeight', 'bold', 'Color', [0 0.5 0]);
xlabel('Time (s)', 'FontSize', 10);
ylabel('Amplitude', 'FontSize', 10);
grid on;
set(gca, 'GridLineStyle', '--', 'GridColor', [0.5 0.5 0.5], 'GridAlpha', 0.3);
% Add annotation
text(0.1, A*0.8, 'Linear rise and fall', 'FontSize', 8, 'Color', [0 0.5 0]);

% Sawtooth Wave
subplot(4, 1, 4);
plot(t, sawtooth_wave, 'm-', 'LineWidth', 1.5);
title('Sawtooth Wave - Gradual Rise, Sharp Drop', 'FontSize', 12, 'FontWeight', 'bold', 'Color', [0.6 0 0.6]);
xlabel('Time (s)', 'FontSize', 10);
ylabel('Amplitude', 'FontSize', 10);
grid on;
set(gca, 'GridLineStyle', '--', 'GridColor', [0.5 0.5 0.5], 'GridAlpha', 0.3);
% Add annotation
text(0.1, A*0.8, 'Steady rise, sudden drop', 'FontSize', 8, 'Color', [0.6 0 0.6]);

% Add a super title for the figure
sgtitle('Exploring Periodic Waveforms at 5 Hz', 'FontSize', 14, 'FontWeight', 'bold', 'Color', [0.2 0.2 0.2]);

% Adjust layout for better spacing
set(gcf, 'Position', [100, 100, 800, 600]); % Set figure size
