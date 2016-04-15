clear all
clc
Fm =500;
Fs = 50;
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


InputDC= ones(50);
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
