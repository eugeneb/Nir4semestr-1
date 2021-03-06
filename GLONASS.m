clear;

fd = 10e6;                % ������� �������������
Td = 1/fd;                % �������� �������������

T = 1e-3;                 % ������������ ������������� ������� �������
Nd = fix(T/Td);           % ���������� ��������
 
fi = 1e6;                 % ������� �������
phi = 2*pi*rand(1, 1);     % ��������� ��������� ���� �������
A = 1; % ��������� 

TPSP = 1e-3;              % ������ ������������� ����
PNSize = 511;             % ���������� �������� ������������� ���� �� 1 ������
PN = sign(randn(1,511));  % ������������ ���
Tpn = TPSP/PNSize;        % ������������ ������ ������� ���


t = Td*(0:Nd-1);          % ������, ���������� ������� ������� [0  1*Td  2*Td ... ]

Ind = mod(fix(t/Tpn),PNSize)+1; % ������ ��������
PSP = PN(Ind);            % ���������� ������������������    

ref = cos(2*pi*t*fi);      % ������� ���������

s = A * PSP .* ref;       % �������������� ������

S = abs(fftshift(fft(s))); % ������ ������� �������


figure(1);
f = fd/2*((0:Nd-1)-Nd/2)/(Nd/2); % �������
plot(f/1e6, 20*log10(S/max(S)));

grid on
xlim([-5 +5])
xlabel('Frequency, MHz')    
ylabel('S, dB')







