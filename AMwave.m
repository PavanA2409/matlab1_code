clc;
clear all;
close all;

% User Input
fm = input('Enter the message signal frequency: ');
fc = input('Enter the carrier signal frequency: ');
am = input('Enter the amplitude of message signal: ');
ac = input('Enter the amplitude of carrier signal: ');

% Modulation Index
m = am / ac;

% Sampling
fs = 20 * fc;  
t = 0:1/fs:100/fc;  

% Message and Carrier Signals
y1 = am * cos(2 * pi * fm * t);  
y2 = ac * cos(2 * pi * fc * t);  

% AM Signal
y = ac .* (1 + m .* cos(2 * pi * fm * t)) .* cos(2 * pi * fc * t);  

% FFT Computation
N = length(y);
yf = fft(y, N);  
yk = fftshift(yf);  
y_m = abs(yk) / N;  % Normalize FFT output

% Frequency Vector
w = linspace(-fs/2, fs/2, N);  

% Plot Signals and Spectrum
figure;
subplot(4,1,1);
plot(t, y1);
title('Input Message Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

subplot(4,1,2);
plot(t, y2);
title('Input Carrier Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

subplot(4,1,3);
plot(t, y);
title('AM Wave');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

subplot(4,1,4);
plot(w, y_m);
title('Frequency Spectrum of AM Signal');
xlabel('Frequency (Hz)');  % Corrected
ylabel('Magnitude');
grid on;

% Display Modulation Condition
if m < 1
    disp('Undermodulated AM Signal (m < 1)');
elseif m == 1
    disp('Critical Modulation (m = 1, 100% Modulation)');
else
    disp('Overmodulated Signal (m > 1) - Causes Distortion!');
end