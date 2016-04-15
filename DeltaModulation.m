clear all;

Fs = 100; %sampling frequency
Ts = 1/Fs; %sampling time
delta=2*pi*Ts; 
t=0:Ts:1; %signal duration

%filter parameters
b =1;
a =1;

%Sin wave
InputSin=sin(2*pi*t); % generate sin input signal
subplot(2,1,1);
plot(InputSin,'green') %ploting original signal
hold on
mqSin = modulation(InputSin,delta); %construct modulate signal using modultion function
stairs(mqSin,'red')  %ploting the modulated signal using 'stairs' command

DemodSin=filter (b,a,mqSin); %reconstruct the original signal using simple low pass filter
hold on
plot(DemodSin,'blue') %ploting the demodulated signal
legend('Original Signal','Modulated Signal','Demodulated Signal')

SinError = (InputSin  - DemodSin).^2; %calculate the error between the original signal and the reconstructed signal  
subplot(2,1,2);
plot(SinError) %plotting the error 
legend('Error')

figure
plot(Output)

%DC voltage signal
figure
InputDC= ones(size(t));
subplot(2,1,1);
plot(InputDC,'green')
hold on
mqDC = modulation(InputDC,delta);
stairs(mqDC,'red')

DemodDC=filter (b,a,mqDC);
hold on
plot(DemodDC,'blue')

legend('Original Signal','Modulated Signal','Demodulated Signal')

DCError = (InputDC - DemodDC).^2;
subplot(2,1,2);
plot(DCError)
legend('Error')

%Square wave signal
figure
InputSquare= rectpuls(t);
subplot(2,1,1);
plot(InputSquare,'green')
hold on
mqRect = modulation(InputSquare,delta);
stairs(mqRect,'red')

DemodSquare=filter (b,a,mqRect);
hold on
plot(DemodSquare,'blue')
legend('Original Signal','Modulated Signal','Demodulated Signal')

SquareError = (InputSquare  - DemodSquare).^2;
subplot(2,1,2);
plot(SquareError)
legend('Error')

figure
plot(Output)

%changing Ts - newTs = 0.1*oldTs
NewTs = 0.1*1/Fs;
t1=0:NewTs:1;

figure
InputSin1=sin(2*pi*t1);
subplot(2,1,1);
plot(InputSin1,'green')
hold on
mqSin1 = modulation(InputSin1,delta);
stairs(mqSin1,'red')

DemodSin1=filter (b,a,mqSin1);
hold on
plot(DemodSin1,'blue')
legend('Original Signal','Modulated Signal','Demodulated Signal')

SinError1 = (InputSin1  - DemodSin1).^2;
subplot(2,1,2);
plot(SinError1)
legend('Error')

figure

InputDC1= ones(size(t1));
subplot(2,1,1);
plot(InputDC1,'green')
hold on
mqDC1 = modulation(InputDC1,delta);
stairs(mqDC1,'red')

DemodDC1=filter (b,a,mqDC1);
hold on
plot(DemodDC1,'blue')

legend('Original Signal','Modulated Signal','Demodulated Signal')

DCError1 = (InputDC1 - DemodDC1).^2;
subplot(2,1,2);
plot(DCError1)
legend('Error')


figure

InputSquare1= rectpuls(t1);
subplot(2,1,1);
plot(InputSquare1,'green')
hold on
mqRect1 = modulation(InputSquare1,delta);
stairs(mqRect1,'red')

DemodSquare1=filter (b,a,mqRect1);
hold on
plot(DemodSquare1,'blue')
legend('Original Signal','Modulated Signal','Demodulated Signal')

SquareError1 = (InputSquare1  - DemodSquare1).^2;
subplot(2,1,2);
plot(SquareError1)
legend('Error')

figure
plot(Output)

%changing delta - newDelta = 0.1* oldDelta
delta1=0.1*delta;
InputSin2=sin(2*pi*t);
figure
subplot(2,1,1);
plot(InputSin2,'green')
hold on
mqSin2 = modulation(InputSin2,delta1);
stairs(mqSin2,'red')

DemodSin2=filter (b,a,mqSin2);
hold on
plot(DemodSin2,'blue')
legend('Original Signal','Modulated Signal','Demodulated Signal')

SinError2 = (InputSin2  - DemodSin2).^2;
subplot(2,1,2);
plot(SinError2)
legend('Error')

figure
plot(Output)

figure

InputDC2= ones(size(t));
subplot(2,1,1);
plot(InputDC2,'green')
hold on
mqDC2 = modulation(InputDC2,delta1);
stairs(mqDC2,'red')

DemodDC2=filter (b,a,mqDC2);
hold on
plot(DemodDC2,'blue')

legend('Original Signal','Modulated Signal','Demodulated Signal')

DCError2 = (InputDC2 - DemodDC2).^2;
subplot(2,1,2);
plot(DCError2)
legend('Error')

figure
plot(Output)

figure

InputSquare2= rectpuls(t);
subplot(2,1,1);
plot(InputSquare2,'green')
hold on
mqRect2 = modulation(InputSquare2,delta1);
stairs(mqRect2,'red')

DemodSquare2=filter (b,a,mqRect2);
hold on
plot(DemodSquare2,'blue')
legend('Original Signal','Modulated Signal','Demodulated Signal')

SquareError2 = (InputSquare2  - DemodSquare2).^2;
subplot(2,1,2);
plot(SquareError2)
legend('Error')

figure
plot(Output)
