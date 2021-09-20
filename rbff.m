clc
x=input;
x=x';
itr=[1:4:350 3:4:350 4:4:350];
data_a=x(:,itr);

y=output;
y=y';
itr=[1:4:350 3:4:350 4:4:350];
data_b=y(:,itr);

itr=[2:4:350];
data_a3=x(:,itr);

itr=[2:4:350];
data_b3=y(:,itr);

x = data_a;
t = data_b;

%% rbf
tic
%net = newrb(x,t,0,0.4,40,5);
net = newrb([350 1;350 2],[350 1;350 2],0,10);
net.trainFcn = 'trainlm';
[net,tr] = train(net,x,t);
y_pred = net(data_a3);
time=toc;
figure, plotregression(data_b3,y_pred) % regression analysis
mse = perform(net,data_b3,y_pred); % maximum error
rmse = sqrt(mean((y_pred-data_b3).^2)); 
rmse = max(rmse);%RMS error
%gensim(net,-1);
%% Error
%error
Title = {'MSE';'RMSE';'TIME'};
RBF =[mse;rmse;time];
Error = table(RBF,'RowNames',Title)

%% Plot
figure
data_pred=data_b3';
target_pred=y_pred';
plot(data_pred)
hold on
plot(target_pred,'.-')
legend('Target', 'rbf')
xlabel('Data')
ylabel('The Output Voltage of PV (V)')