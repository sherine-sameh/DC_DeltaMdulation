clear all
clc
Fm =500;
Fs = 100;
Ts = 1/Fs;

b =1;
a =1;

t=0:Ts:1;

InputSin=sin(2*pi*t);
subplot(2,1,1);
plot(InputSin,'green')
hold on
delta=2*pi*Ts;
for n=1:length(InputSin)
    if n==1
        e(n) = InputSin(n);
        eq(n) = delta*sign(n);
        mqSin(n) = eq(n);
    else 
        e(n) = InputSin(n)-mqSin(n-1);
        eq(n) = delta*sign(e(n));
        mqSin(n) = mqSin(n-1)+eq(n);
    end

end
stairs(mqSin,'red')

DemodSin=filter (b,a,mqSin);
hold on
plot(DemodSin,'blue')
legend('Original Signal','Modulated Signal','Demodulated Signal')

SinError = (InputSin  - DemodSin).^2;
subplot(2,1,2);
plot(SinError)
legend('Error')

figure

InputDC= ones(size(t));
subplot(2,1,1);
plot(InputDC,'green')
hold on
for n=1:length(InputDC)
    if n==1
        e(n) = InputDC(n);
        eq(n) = delta*sign(n);
        mqDC(n) = eq(n);
    else 
        e(n) = InputDC(n)-mqDC(n-1);
        eq(n) = delta*sign(e(n));
        mqDC(n) = mqDC(n-1)+eq(n);
    end

end
stairs(mqDC,'red')

DemodDC=filter (b,a,mqDC);
hold on
plot(DemodDC,'blue')

legend('Original Signal','Modulated Signal','Demodulated Signal')

DCError = (InputDC - DemodDC).^2;
subplot(2,1,2);
plot(DCError)
legend('Error')

figure

InputSquare= rectpuls(t);
subplot(2,1,1);
plot(InputSquare,'green')
hold on
for n=1:length(InputSquare)
    if n==1
        e(n) = InputSquare(n);
        eq(n) = delta*sign(n);
        mqRect(n) = eq(n);
    else 
        e(n) = InputSquare(n)-mqRect(n-1);
        eq(n) = delta*sign(e(n));
        mqRect(n) = mqRect(n-1)+eq(n);
    end

end
stairs(mqRect,'red')

DemodSquare=filter (b,a,mqRect);
hold on
plot(DemodSquare,'blue')
legend('Original Signal','Modulated Signal','Demodulated Signal')

SquareError = (InputSquare  - DemodSquare).^2;
subplot(2,1,2);
plot(SquareError)
legend('Error')
