clc;
clear all;
close all;
n=0:49;
m=0:(50*3)-1;
x=sin(2*pi*0.031*m);
y=x([1:3:length(x)]);
subplot(211)
stem(n,x(1:50))
axis([0,50,-1.2,1.2]);
title('input sequence');
xlabel('time');
ylabel('amplitude');
subplot(212)
stem(n,y)
axis([0,50,-1.2,1.2]);
title('downsampling sequence');
xlabel('time');
ylabel('amplitude');