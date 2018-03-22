%% PA March 22 

%task 1 and 2
R=50; %randomly chosen as a realisitc resistor value
V = linspace(-1.95, 0.7, 200);

A = 0.01e-12;
B = 0.1;
C = 0.1e-12;
D = 1.3;

x = V; 

I = A.*(exp(1.2*x/25e-3)-1)+B.*x - C*(exp(1.2*(-(x+D))/25e-3)-1);

%achieve 20% randome variaion
variation = rand(1, length(I))*0.2-0.1;

I2 = I + I.*variation;

% figure
% plot (V, I, '.b')
% hold on 
% P1 = polyfit(V, I, 4)
% func1 =@(x) P1(1)*x^4 + P1(2)*x^3 + P1(3)*x^2 + P1(4)*x;
% fplot(func1)
% hold on
% P2 = polyfit(V, I, 8)
% func2 =@(x) P2(1)*x^8 + P2(2)*x^7 + P2(3)*x^6 + P2(4)*x^5 + P2(5)*x^4 + P2(6)*x^3 + P2(7)*x^2 + P2(8)*x;
% fplot(func2)
% title('V vs I linear axis')
% 
% figure
% semilogy(V, abs(I), '.k')
% hold on 
% P1 = polyfit(V, I, 4)
% func1 =@(x) P1(1)*x^4 + P1(2)*x^3 + P1(3)*x^2 + P1(4)*x;
% fplot(func1)
% hold on
% P2 = polyfit(V, I, 8)
% func2 =@(x) P2(1)*x^8 + P2(2)*x^7 + P2(3)*x^6 + P2(4)*x^5 + P2(5)*x^4 + P2(6)*x^3 + P2(7)*x^2 + P2(8)*x;
% fplot(func2)
% title('V vs I seilog axis')


figure
plot (V, I2, '.b')
hold on 
P1 = polyfit(V, I2, 4);
func1 =@(x) P1(1)*x^4 + P1(2)*x^3 + P1(3)*x^2 + P1(4)*x;
fplot(func1)
hold on
P2 = polyfit(V, I2, 8);
func2 =@(x) P2(1)*x^8 + P2(2)*x^7 + P2(3)*x^6 + P2(4)*x^5 + P2(5)*x^4 + P2(6)*x^3 + P2(7)*x^2 + P2(8)*x;
fplot(func2)
% axis(-5, 1, -0.06, 0.02)
title('V vs I2 linear axis')


figure
semilogy(V, abs(I2), '.k')
hold on
P1 = polyfit(V, I2, 4);
func1 =@(x) P1(1)*x^4 + P1(2)*x^3 + P1(3)*x^2 + P1(4)*x;
fplot(func1)
hold on
P2 = polyfit(V, I2, 8);
func2 =@(x) P2(1)*x^8 + P2(2)*x^7 + P2(3)*x^6 + P2(4)*x^5 + P2(5)*x^4 + P2(6)*x^3 + P2(7)*x^2 + P2(8)*x;
fplot(func2)
title('V vs I2 semilog axis')

%Task 3

%curve 1
% B = 0.1;
% D = 1.3;

f0a = fittype('A.*(exp(1.2*x/25e-3)-1)+0.1.*x - C*(exp(1.2*(-(x+1.3))/25e-3)-1)');
fitI2a = fit(V', I2', f0a);
Ifa = fitI2a(V');


%curve 2
% D = 1.3;

f0b = fittype('A.*(exp(1.2*x/25e-3)-1)+B.*x - C*(exp(1.2*(-(x+1.3))/25e-3)-1)');
fitI2b = fit(V', I2', f0b);
Ifb = fitI2b(V');


%curve 3

f0c = fittype('A.*(exp(1.2*x/25e-3)-1)+B.*x - C*(exp(1.2*(-(x+D))/25e-3)-1)');
fitI2c = fit(V', I2', f0c);
Ifc = fitI2c(V');


figure
plot(V', abs(I2'), '.k')
hold on 
plot(V', Ifa)
hold on 
plot(V', Ifb)
hold on
plot(V', Ifc)
legend('data', 'fit A and C', 'fit A, B, C', 'fit all')
title('V vs I2 with 3 fit curves')

%task 4
inputs = V;
targets = I;
hiddenLayerSize = 10;
net = fitnet(hiddenLayerSize);
net.divideParam.trainRatio = 70/100;
net.divideParam.valRatio = 15/100;
net.divideParam.testRatio = 15/100;
%train the network
[net,tr] = train(net,inputs,targets);
outputs = net(inputs);
errors = gsubtract(outputs,targets);
performance = perform(net,targets,outputs)
view(net)
Inn = outputs

%task 4
inputs = V;
targets = I2;
hiddenLayerSize = 10;
net = fitnet(hiddenLayerSize);
net.divideParam.trainRatio = 70/100;
net.divideParam.valRatio = 15/100;
net.divideParam.testRatio = 15/100;
%train the network
[net,tr] = train(net,inputs,targets);
outputs = net(inputs);
errors = gsubtract(outputs,targets);
performance = perform(net,targets,outputs)
view(net)
Inn = outputs


