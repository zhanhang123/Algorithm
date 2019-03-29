%% 免疫算法
% 算法流程：
% 1.抗原识别;                                   即最优化问题的获取
% 2.产生抗体;                                   即产生初始种群
% 3.计算亲和度;                                 即计算种群适应度
% 4.是否满足终止条件？是，结束；否，继续下一步;
% 5.计算抗体浓度和激励度;                       即计算种群中的个体数量
% 6.免疫选择；                                  即种群个体选择
% 7.克隆,变异,克隆抑制                          即种群复制,遗传等操作
% 8.种群刷新，返回步骤3
%% 主程序
clc
clear
%% 初始化
popNum=200; % 种群个体数
num=31;     % 免疫个体数
iterNum=500;  % 种群迭代次数
cloneNum=20;% 克隆个数
data=[1304 2312;3639 1315;4177 2244;3712 1399;3488 1535;
   3326 1556;3238 1229;4196 1004;4312 790;4386 570;
   3007 1970;2562 1756;2788 1491;2381 1676;1332 695;
   3715 1678;3918 2179;4061 2370;3780 2212;3676 2578;
   4029 2838;4263 2931;3429 1908;3507 2367;3394 2643;
   3439 3201;2935 3240;3140 3550;2545 2357;2778 2826;
   2370 2975];%城市位置坐标
%% 产生初始种群
pop=zeros(popNum,num);%种群个体
for i=1:popNum
   pop(i,:)=randperm(num);
end
%% 种群的适应度计算
fitValue=calFitValue(pop,data);%计算适应度值
[sortFitValue,fitValueIndex]=sort(fitValue);%适应度值排序
popTemp=pop(fitValueIndex,:);%依据适应度值得到排序后的种群
%% 免疫操作
iter=1;% 种群的迭代次数
bestValue=fitValue(1);%种群总体最优值
bestEvery=fitValue(1);%每代种群最优值
bestPath=popTemp(1);%最优路径
while(iter<=iterNum)
    %% 免疫操作
    % 取前一半的个体进行免疫操作
    oldPopPart1=zeros(popNum/2,num);%经过免疫后的优秀个体
    oldPopPart2=zeros(popNum/2,num);%重新生成的免疫个体
    for i=1:popNum/2
        %% 个体免疫
        immuPop=popTemp(i,:);%选择优秀个体
        immuPopTemp=repmat(immuPop,cloneNum,1);%克隆
        for j=1:cloneNum
            %变异
            index1=ceil(num*rand);%产生变异位点
            index2=ceil(num*rand);%产生变异位点
            while(index1==index2)
                index1=ceil(num*rand);
                index2=ceil(num*rand);
            end
            immuTemp=immuPopTemp(j,index1);
            immuPopTemp(j,index1)=immuPopTemp(j,index2);
            immuPopTemp(j,index2)=immuTemp;
        end
        immuPopTemp=[immuPopTemp;immuPop];%保留优秀个体
        valueTemp=calFitValue(immuPopTemp,data);%计算免疫后的个体适应度
        [immuIndu,immuInduIndex]=sort(valueTemp);%免疫后的适应度排序
%         immuSortIn=immuPopTemp(immuInduIndex);%排序
        oldPopPart1(i,:)=immuPopTemp(immuInduIndex(1),:);%选择最优个体
        %% 种群适应度差的个体刷新
        oldPopPart2(i,:)=randperm(num);%随机产生种群
    end
    pop=[oldPopPart1;oldPopPart2];%更新新种群
    fitValue=calFitValue(pop,data);%计算适应度值
    [sortFitValue,fitValueIndex]=sort(fitValue);%适应度值排序
    popTemp=pop(fitValueIndex,:);%依据适应度值得到排序后的种群
    bestEvery=[bestEvery;fitValue(1)];
    if(fitValue(1)<bestValue)
        bestValue=fitValue(1);%最优值
        bestPath=popTemp(1,:);%最优路径
    end
    %% 画图
    iter=iter+1;
    disp(iter);
    plot([iter-1,iter],[bestEvery(iter-1),bestEvery(iter)]);
    hold on
end
figure;
for i=1:num
    plot(data(i,1),data(i,2),'o')
    text(data(i,1),data(i,2),num2str(i));
    hold on
end
len=length(bestPath);
for i=1:len-1
   plot([data(bestPath(i),1),data(bestPath(i+1),1)],[data(bestPath(i),2),data(bestPath(i+1),2)]) ;
   hold on
end
hold on
plot([data(bestPath(1),1),data(bestPath(len),1)],[data(bestPath(1),2),data(bestPath(len),2)],'r')
title(['最短路径为：',num2str(bestValue)]);




















