function result=BPfunction(x)
%% BP神经网络的激活函数
% x:待计算的数据
% result:激活函数计算后的值
%% 主函数
result=1./(1+exp(-x));
