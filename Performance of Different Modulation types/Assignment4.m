clc;
clear all;

NumBitPerSNR = 1^6;
SNR = 0:2:30;
X = randi([0,1],[1 15]);

OOK = X;
BPSK = 2.*X -1;

for n=1:14
    FSK(n) = X(n)+ 1i.*X(n+1);
end
FSK(15) = X(15)+1i;
FSK
