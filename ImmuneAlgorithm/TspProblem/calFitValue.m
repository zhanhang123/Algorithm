function value=calFitValue(pop,data)
%% 计算种群适应度
[colPop,rawPop]=size(pop);%计算种群的大小
value=zeros(colPop,1);%种群适应度大小
for i=1:colPop
    distTemp=0;
    for j=1:rawPop-1
        distTemp=distTemp+sqrt((data(pop(i,j),1)-data(pop(i,j+1),1))^2+(data(pop(i,j),2)-data(pop(i,j+1),2))^2);
    end
    value(i)=distTemp+sqrt((data(pop(i,1),1)-data(pop(i,rawPop),1))^2+(data(pop(i,1),2)-data(pop(i,rawPop),2))^2);
end