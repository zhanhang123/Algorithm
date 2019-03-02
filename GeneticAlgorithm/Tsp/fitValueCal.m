function fitValue=fitValueCal(group,tspData)
[raw,col]=size(group);
%% 计算距离
dist=zeros(raw,1);
for i=1:raw
    for j=1:col-1
        x_dist=(tspData(group(i,j),1)-tspData(group(i,j+1),1))^2;
        y_dist=(tspData(group(i,j),2)-tspData(group(i,j+1),2))^2;
        dist(i)=dist(i)+(x_dist+y_dist)^(1/2);
    end
    x_dist=(tspData(group(i,1),1)-tspData(group(i,col),1))^2;
    y_dist=(tspData(group(i,1),2)-tspData(group(i,col),2))^2;
    dist(i)=dist(i)+(x_dist+y_dist)^(1/2);
end
fitValue=1./dist;
%% 计算适应度,fitValue
% max_dist=max(dist);
% min_dist=min(dist);
% dist=(dist-min_dist)/(max_dist-min_dist);%归一化
% sum_dist=sum(dist);
% fitValue_temp=dist./sum_dist;
% fitValue=cumsum(fitValue_temp);













