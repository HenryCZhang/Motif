close all; clear all; clc;

sensorLog  = load('sensorlog_20220704_123506.mat') % enter sensor data file path here

accelerationData = sensorLog.Acceleration
date = accelerationData.Timestamp
ts=seconds(date-date(1)); % timestamp in s
f_s = 100;   % sampling rate 
Ts= 1/f_s;
acc_x = accelerationData.X
acc_y = accelerationData.Y
acc_z = accelerationData.Z

disp(ts)

% figure;
subplot(2,3,1);
plot(ts,acc_x,'k');
ylabel(' $ X(t) $', 'Interpreter','latex','FontSize', 14, 'FontName', 'Times New Roman');
xlabel('$t$ (s)', 'Interpreter','latex','FontSize', 14, 'FontName', 'Times New Roman');

subplot(2,3,2);
plot(ts,acc_y,'k');
ylabel(' $ X(t) $', 'Interpreter','latex','FontSize', 14, 'FontName', 'Times New Roman');
xlabel('$t$ (s)', 'Interpreter','latex','FontSize', 14, 'FontName', 'Times New Roman');

subplot(2,3,3);
plot(ts,acc_z,'k');
ylabel(' $ X(t) $', 'Interpreter','latex','FontSize', 14, 'FontName', 'Times New Roman');
xlabel('$t$ (s)', 'Interpreter','latex','FontSize', 14, 'FontName', 'Times New Roman');
% xlim([0,12]);
% stop;

%  figure,
[f1 fabs1]=fftplot(Ts,acc_x);
subplot(2,3,4);
plot(f1,fabs1,'k');
xlim([0,15]);
ylabel(' $ X(f) $', 'Interpreter','latex','FontSize', 14, 'FontName', 'Times New Roman');
xlabel('$f$ (Hz)', 'Interpreter','latex','FontSize', 14, 'FontName', 'Times New Roman');

[f2 fabs2]=fftplot(Ts,acc_y);
subplot(2,3,5);
plot(f2,fabs2,'k');
xlim([0,15]);
ylabel(' $ X(f) $', 'Interpreter','latex','FontSize', 14, 'FontName', 'Times New Roman');
xlabel('$f$ (Hz)', 'Interpreter','latex','FontSize', 14, 'FontName', 'Times New Roman');

[f3 fabs3]=fftplot(Ts,acc_z);
subplot(2,3,6);
plot(f3,fabs3,'k');
xlim([0,15]);
ylabel(' $ X(f) $', 'Interpreter','latex','FontSize', 14, 'FontName', 'Times New Roman');
xlabel('$f$ (Hz)', 'Interpreter','latex','FontSize', 14, 'FontName', 'Times New Roman');


