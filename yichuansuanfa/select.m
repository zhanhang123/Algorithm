function newGroup=select(group,fitValue)
%% 构造概率轮盘，谁的概率大，选择哪个个体
%% 选择新的种群
% group:初始化种群
% fitValue:种群适应度
[raw,col]=size(group);%判断初始矩阵的大小
totalFit=sum(fitValue);%计算种群适应度的值总和
aveFit=fitValue/totalFit;%求出每一个适应度在总适应度中的权重
aveFitTemp=cumsum(aveFit);%求出所有的概率总和
%cumsum(A) 返回一个和A同行同列的矩阵，矩阵中第m行
%第n列元素是A中第1行到第m行的所有第n列元素的累加和
sortAveFit=sort(rand(raw,1));%产生随机数用于选择
calNum1=1;
calNum2=1;%用于判断新选择的种群中的个数是否达到设置上限
while calNum1<=raw
    if(sortAveFit(calNum1)<aveFitTemp(calNum2))
        %判断随机产生的概率与适应度权重的大小
        %若小，则将原始种群对应的数据
        newGroup(calNum1,:)=group(calNum2,:);
        %挑选出来的种群个数不一定还是原来种群中的个体数
        %即种群的规模会变化，向小变化
        calNum1=calNum1+1;
    else
        calNum2=calNum2+1;
    end
    if calNum2>=raw
        calNum2=raw;
    end
end









