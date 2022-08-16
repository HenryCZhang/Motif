close all; clear all; clc;

HEADERLINES = 9;
File='2022-07-28_13-40-33.csv'; % Enter your sensor data csv file name here
data = importdata(File).data;
f_s = 200; % sampling rate (needs to be modified depending on the sampling rate used in each test)
Ts= 1/f_s;
t= data(1:end,1);
t = t-t(1,1);
u1= data(1:end,2); % acceleration X data
u2= data(1:end,3); % acceleration Y data
u3= data(1:end,4); % acceleration Z data


% figure;
subplot(2,3,1);
plot(t,u1,'k');
ylabel(' $ X(t) $', 'Interpreter','latex','FontSize', 14, 'FontName', 'Times New Roman');
xlabel('$t$ (s)', 'Interpreter','latex','FontSize', 14, 'FontName', 'Times New Roman');

subplot(2,3,2);
plot(t,u2,'k');
ylabel(' $ X(t) $', 'Interpreter','latex','FontSize', 14, 'FontName', 'Times New Roman');
xlabel('$t$ (s)', 'Interpreter','latex','FontSize', 14, 'FontName', 'Times New Roman');

subplot(2,3,3);
plot(t,u3,'k');
ylabel(' $ X(t) $', 'Interpreter','latex','FontSize', 14, 'FontName', 'Times New Roman');
xlabel('$t$ (s)', 'Interpreter','latex','FontSize', 14, 'FontName', 'Times New Roman');
% xlim([0,12]);
% stop;
 
%  figure,
[f1 fabs1]=fftplot(Ts,u1);
subplot(2,3,4);
plot(f1,fabs1,'k');
xlim([0,15]);
ylabel(' $ X(f) $', 'Interpreter','latex','FontSize', 14, 'FontName', 'Times New Roman');
xlabel('$f$ (Hz)', 'Interpreter','latex','FontSize', 14, 'FontName', 'Times New Roman');

[f2 fabs2]=fftplot(Ts,u2);
subplot(2,3,5);
plot(f2,fabs2,'k');
xlim([0,15]);
ylabel(' $ X(f) $', 'Interpreter','latex','FontSize', 14, 'FontName', 'Times New Roman');
xlabel('$f$ (Hz)', 'Interpreter','latex','FontSize', 14, 'FontName', 'Times New Roman');

[f3 fabs3]=fftplot(Ts,u3);
subplot(2,3,6);
plot(f3,fabs3,'k');
xlim([0,15]);
ylabel(' $ X(f) $', 'Interpreter','latex','FontSize', 14, 'FontName', 'Times New Roman');
xlabel('$f$ (Hz)', 'Interpreter','latex','FontSize', 14, 'FontName', 'Times New Roman');