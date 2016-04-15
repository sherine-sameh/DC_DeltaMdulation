clear all
clc
Fm =500;
Fs = 50;
Ts = 1/Fs;

t=0:Ts:1;
Input=sin(2*pi*t);
%Input = rectpuls(t);
%Input= ones(50);
plot(Input)
hold on

delta=2*pi*Ts;

for n=1:length(Input)
    if n==1
        e(n) = Input(n);
        eq(n) = delta*sign(n);
        mq(n) = eq(n);
    else 
        e(n) = Input(n)-mq(n-1);
        eq(n) = delta*sign(e(n));
        mq(n) = mq(n-1)+eq(n);
    end

end
stairs(mq)

for m=1:length(Input)
    
end

figure
plot(DM)