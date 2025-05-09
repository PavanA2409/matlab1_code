% DSB-SC Signal Generation
clear; clc; close all;

%% Parameters
fs = input('enter the sampling frequency');  % Sampling frequency (Hz)
t = 0:1/fs:1-1/fs;  % Time vector (1 second duration)
fc = input('enter the carrier signal frequency');  % Carrier frequency (Hz)
fm = input('enter the message signal frequency');  % Message signal frequency (Hz)

%% Message Signal (Can be any baseband signal)
% Option 1: Single tone (for demonstration)
message = cos(2*pi*fm*t);

% Option 2: Multi-tone signal
% message = 0.5*cos(2*pi*50*t) + 0.8*cos(2*pi*120*t);

% Option 3: Audio signal (uncomment to use)
% [message, fs] = audioread('your_audio.wav');
% message = message(1:fs)'; % Use first second
% t = 0:1/fs:(length(message)-1)/fs;

%% Carrier Signal
carrier = cos(2*pi*fc*t);

%% DSB-SC Modulation
dsb_sc = message .* carrier;

%% Plotting Results
figure;

% Time Domain Plots
subplot(3,1,1);
plot(t, message);
title('Message Signal (Time Domain)');
xlabel('Time (s)'); ylabel('Amplitude');
xlim([0 0.1]); grid on;

subplot(3,1,2);
plot(t, carrier);
title('Carrier Signal (Time Domain)');
xlabel('Time (s)'); ylabel('Amplitude');
xlim([0 0.01]); grid on;

subplot(3,1,3);
plot(t, dsb_sc);
title('DSB-SC Modulated Signal (Time Domain)');
xlabel('Time (s)'); ylabel('Amplitude');
xlim([0 0.1]); grid on;

%% Frequency Domain Analysis
N = length(message);
f = (-N/2:N/2-1)*(fs/N);

figure;
subplot(2,1,1);
plot(f, abs(fftshift(fft(message)))/N);
title('Message Signal Spectrum');
xlabel('Frequency (Hz)'); ylabel('Magnitude');
xlim([-1500 1500]); grid on;

subplot(2,1,2);
plot(f, abs(fftshift(fft(dsb_sc)))/N);
title('DSB-SC Signal Spectrum');
xlabel('Frequency (Hz)'); ylabel('Magnitude');
xlim([-1500 1500]); grid on;