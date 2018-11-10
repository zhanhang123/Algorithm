clc
clear
%求解旅行商最短路径问题
%% 主要思路：
% 1.编码
% 2.产生随机个体进行适应度计算(函数值计算)
% 3.交叉
% 4.变异
% 5.最优个体选择，赌轮盘法
%% 初始参数设置
load tspData %导入tsp数据,第1列x数据,第2列y数据
% tspData=[0.4 0.4439;0.2439 0.1463;0.1707 0.2293;0.2293 0.761;0.5171 0.9414;
%         0.8732 0.6536;0.6878 0.5219;0.8488 0.3609;0.6683 0.2536;0.6195 0.2634];
% tspData=[41 94;37 84;54 67;25 62;7 64;2 99;68 58;71 44;54 62;83 69;64 60;18 54;22 60;
%         83 46;91 38;25 38;24 42;58 69;71 71;74 78;87 76;18 40;13 40;82 7;62 32;58 35;45 21;41 26;44 35;4 50];
[raw,col]=size(tspData);
groupSize=250;%种群规模大小
crossPro=0.8;%个体交叉概率
variationPro=0.2;%个体变异概率
iterNum=2000;%种群迭代次数
%% 初始种群的产生
for i=1:groupSize
    group(i,:)=randperm(raw);
end
%% 计算
fitPerfact=zeros(1,iterNum);%历代最优值
groupPerfact=[];%最优个体
maxPerfact=[];
%适应度计算
fitValue=fitValueCal(group,tspData);
tem_group=100000000000;
for i=1:iterNum
%     %适应度计算
%     fitValue=fitValueCal(group,tspData);
    %选择
    newGroup=select(group,fitValue);
    %交叉
    newGroup=cross(newGroup,crossPro);
    %变异
    newGroup=variation(newGroup,variationPro);
    %适应度计算
    fitValue=fitValueCal(newGroup,tspData);
    group=newGroup;
    maxPerfact=max(fitValue);
    fitPerfact(i)=maxPerfact;
    if(tem_group>maxPerfact)
        groupPerfact=group(find(fitValue==maxPerfact),:);
        tem_group=maxPerfact;
    end
end
plotData=zeros(1,raw+1);
plotData(1:raw)=groupPerfact(1,:);
plotData(raw+1)=groupPerfact(1,1);
figure;
plot(tspData(:,1),tspData(:,2),'rp');
hold on
for i=1:raw
    x_point=tspData(plotData(i),:);
    y_point=tspData(plotData(i+1),:);
    plot([x_point(1,1),y_point(1,1)],[x_point(1,2),y_point(1,2)],'y');
    hold on
end
figure
plot([1:iterNum],1./fitPerfact);
fprintf('最优解为 --->>%5.2f\n',1/maxPerfact);
% fprintf('最优解的值 --->>%5.2f\n',groupPerfact);






















