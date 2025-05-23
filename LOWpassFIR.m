clc;
clear all;
close all;
fc=input('enter the cut off frequency');
N=input('enter the length of filter');
Fs=10*fc;
wc=2*(fc/Fs);
h1=fir1(N,wc,'low',boxcar(N+1));
h2=fir1(N,wc,'low',bartlett(N+1));
h3=fir1(N,wc,'low',hamming(N+1));
h4=fir1(N,wc,'low',hann(N+1));
h5=fir1(N,wc,'low',blackman(N+1));
[H1,w]=freqz(h1,1);
[H2,w]=freqz(h2,1);
[H3,w]=freqz(h3,1);
[H4,w]=freqz(h4,1);
[H5,w]=freqz(h5,1);
H1mag=abs(H1);
H2mag=abs(H2);
H3mag=abs(H3);
H4mag=abs(H4);
H5mag=abs(H5);
plot((w*Fs)/(2*pi),20*log10(H1mag),'r',(w*Fs)/(2*pi),20*log10(H2mag),'g',(w*Fs)/(2*pi),20*log10(H3mag),'b',(w*Fs)/(2*pi),20*log10(H4mag),'k',(w*Fs)/(2*pi),20*log10(H5mag),'m');
legend('rectangle','triangle','hamming','hanning','blackman');
xlabel('frequency(hz)');
ylabel('magnitude(db)');
title('low pass  FIR filter ');