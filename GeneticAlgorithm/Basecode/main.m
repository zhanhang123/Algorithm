function main()
%遗传算法
format short
%% 主要思路：
% 1.编码
% 2.产生随机个体进行适应度计算(函数值计算)
% 3.交叉
% 4.变异
% 5.最优个体选择，赌轮盘法
%% 
clc;
clear;
%% 初始参数设置
groupSize=50;%种群规模大小
codeLength=20;%种群个体编码长度
crossPro=0.8;%个体交叉概率
variationPro=0.1;%个体变异概率
iterNum=100;%种群迭代次数
%% 初始化种群
%可采用round(rand(groupSize,codeLength))初始化种群，
%   其中round为四舍五入的函数，rand为产生0~1之间均匀的随机数
%unidrnd:产生离散均匀的随机数，如2，表示产生的随机数不是1，就是2
%ones:表示产生一个1矩阵
group=unidrnd(2,groupSize,codeLength)-ones(groupSize,codeLength);
%产生一个种群大小为groupSize，编码长度为codeLength的初始化种群
%% 种群迭代/循环
figure;
for i=1:iterNum
    %计算适应度
    %将二进制转化为十进制,输入参数为二进制种群与种群的编码长度
    xGroup=binary2num(group);
    fitValue=testObjFun(xGroup);%计算种群适应度/函数值
    %选择
    newGroup=select(group,fitValue);
    %交叉
    newGroup=crossCal(newGroup,crossPro);
    %变异
    newGroup=changeVar(newGroup,variationPro);
    %更新种群
    group=newGroup;
    %寻找最优解
    [bestIndividual,bestFit]=bestCal(group,fitValue);
    solveValue=binary2num(bestIndividual);
    groupValue=binary2num(group);
    plot(i,bestFit);
    hold on
end
fprintf('最优解为 --->>%5.2f\n',solveValue);
fprintf('最优解的值 --->>%5.2f\n',bestFit);











