function [f fabs]=fftplot(Ts,Input)
% close all
% f=freq
% ft=FFT
% fr= Real part of FFT
% fi= Imag part of FFT
% fabs = Abs part of FFT
L=length(Input);
Fs=1/Ts; % sampling frequency
% NFFT = 2^nextpow2(L); % Next power of 2 from length of y
NFFT=L-1;
UT = fft(Input,NFFT)/L;
f = Fs/2*linspace(0,1,NFFT/2);
% % Plot single-sided amplitude spectrum.
ft=UT(1:NFFT/2);
% fr=real(ft); fi=imag(ft);
fabs=2*abs(ft);
% fphase=phase(ft);
% figure, plot(f,fabs);
% set(gca,'FontSize',8,'XLim',[0 15],'XTick',[1:15]);
% xlim([0,200])
% title('Single-Sided Absolute Amplitude Spectrum ');xlabel('Frequency (Hz)'); ylabel('|Y(f)|')

% figure, plot(f,fr);
% set(gca,'FontSize',8);
% title('Real Amplitude Spectrum ');xlabel('Frequency (Hz)'); ylabel('Real (Y(f))')
% 
% figure, plot(f,fi);
% set(gca,'FontSize',8);
% title('Real Amplitude Spectrum ');xlabel('Frequency (Hz)'); ylabel('Imag (Y(f))')
