clc;
clear all;
close all;
n=0:50;
x=sin(2*pi*0.031*n);
y=zeros(1,3*length(x));
y([1:3:length(y)])=x;
subplot(211)
stem(n,x)
title('input sequence');
xlabel('time');
ylabel('amplitude');
subplot(212)
stem(n,y(1:length(x)))
title('upsampling of sequence');
xlabel('time');
ylabel('amplitude');