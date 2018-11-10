function newGroup=select(group,dist)
[raw,col]=size(group);
%% 计算适应度,fitValue
max_dist=max(dist);
min_dist=min(dist);
dist=(dist-min_dist)/(max_dist-min_dist);%归一化
sum_dist=sum(dist);
fitValue_temp=dist./sum_dist;
fitValue=cumsum(fitValue_temp);
sortFit=sort(rand(raw,1));%产生随机数用于选择
newGroup=zeros(raw,col);
selectNum1=1;%控制fitValue的值
selectNum2=1;%控制sortFit的值
while selectNum2<=raw
    %能够保证种群的数目保持不变
    if(sortFit(selectNum2)<fitValue(selectNum1))
        %判断随机数与其概率的大小关系
        %若小，则保留fitValue(selectNum1)的值
        newGroup(selectNum2,:)=group(selectNum1,:);
        selectNum2=selectNum2+1;
    else
        selectNum1=selectNum1+1;
    end
    if(selectNum1>raw)
        selectNum1=raw;
    end
end

























