clc;
clear all;
close all;
freq=[0 0.45 0.5 1];
mag=[0 1 0 0];
l=input('enter the down sampling factor:');
x=fir2(99,freq,mag);
[xz w]=freqz(x,1,512);
subplot(211)
plot(w/pi,abs(xz));
xlabel('frequency');
ylabel('magnitude');
title('input spectrum');
grid on
y=zeros(1,l*length(x));
y=x([1:l:length(x)]);
[yz w]=freqz(y,1,512);
subplot(212)
plot(w/pi,abs(yz));
xlabel('frequency');
ylabel('magnitude');
title('output spectrum Of downsamling(decimation)');
grid on