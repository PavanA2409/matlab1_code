
% Parameters
fc = input('enter the carrier frequency');  % Carrier frequency
fm = input('enter the modulating frequency');   % Modulating frequency
fs = input('enter the sampling frequency'); % Sampling frequency
%inputs as fc=100,fm=10,fs=1000
t = 0:1/fs:1; % Time vector

% Modulating signal
m = sin(2*pi*fm*t);

% Carrier signal
c = cos(2*pi*fc*t);

% Amplitude modulation (DSB)
dsb = (1 + m).*c;

% VSB filtering (simplified example)
% We'll use a basic filter to remove part of one sideband
[b, a] = butter(4, 0.2, 'high');
vsb = filter(b, a, dsb);

% Plotting
figure;
subplot(3,1,1);
plot(t, m);
title('Modulating Signal');

subplot(3,1,2);
plot(t, dsb);
title('DSB Signal');

subplot(3,1,3);
plot(t, vsb);
title('VSB Signal');


