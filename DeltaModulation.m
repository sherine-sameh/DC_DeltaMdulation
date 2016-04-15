clear all
clc
Fm =500;
Fs = 500;
Ts = 1/Fs;

t=0:Ts:1;

InputSin=sin(2*pi*t);
plot(InputSin,'Red')
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
stairs(mqSin)

b =1;
a =1;
DemodSin=filter (b,a,mqSin);
figure
plot(DemodSin)
SinError = (InputSin  - DemodSin).^2
figure
plot(SinError)

InputDC= ones(500);
figure
plot(InputDC,'Red')
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
stairs(mqDC)

DemodDC=filter (b,a,mqDC);
figure
plot(DemodDC)

InputSquare= rectpuls(t);
figure
plot(InputSquare,'Red')
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
stairs(mqRect)

DemodRect=filter (b,a,mqRect);
figure
plot(DemodRect)
