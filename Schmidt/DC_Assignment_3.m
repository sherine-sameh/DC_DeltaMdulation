clc
clear all

t= 0 : 1 : 119;
T=120;
S1_1 = ones(1,T/3);
S1_2 = zeros(1,T-(T/3));
S1 = [S1_1 S1_2];

S2_1 = ones(1,2*T/3);
S2_2 = zeros(1,T-(2*T/3));
S2 = [S2_1 S2_2];

S3_1 = zeros(1,T/3);
S3_2 = ones(1,T-(T/3));
S3 = [S3_1 S3_2];

S4 = ones(1,T);

S = [S1;S2;S3;S4];
A1 = transpose(S);
[q, r] = Schmidt(A1);
stem(q);
figure;
stem(r);

figure
X = r(1 ,:);
Y = r(2 ,:);
Z = r(3 ,:);
scatter3(X,Y,Z)

S = [S2;S1;S3;S4];
A2 = transpose(S);
[q, r] = Schmidt(A2);
figure;
stem(q);
figure;
stem(r);

figure
X = r(1 ,:);
Y = r(2 ,:);
Z = r(3 ,:);
scatter3(X,Y,Z)