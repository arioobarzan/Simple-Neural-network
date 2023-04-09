clc
clear all
close all

dataset  = csvread('data.csv');
label    = csvread('label.csv');

train_data  = dataset(:,1:500);
train_label = label(1:500);
test_data   = dataset(:,501:557);
test_label  = label(501:557);


[x,t,net]=Made_nf(dataset,label);

iteration = 100;

for i=0:iteration
    [y,e,net]=nf_train(x,t,net);
    predict = net(test_data);
    real = test_label;

    error = abs(predict-real)./real;
    
    mean(error);
    disp(['iteration: ',num2str(i),' - ','mean(error):',num2str(mean(error))])
end
label = [1801:1812 1901:1905];
h = plot(1:57,real(1,:),'blue',1:57,predict(1,:),'red');
xlim([1 57])
ylim([0 100])
set(h, 'LineWidth',2)
legend('Real','Predict');
title('Plot for Predition');