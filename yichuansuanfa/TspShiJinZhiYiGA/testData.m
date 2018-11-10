clc
clear
tspData=[0.4 0.4439;0.2439 0.1463;0.1707 0.2293;0.2293 0.761;0.5171 0.9414;
        0.8732 0.6536;0.6878 0.5219;0.8488 0.3609;0.6683 0.2536;0.6195 0.2634];
[raw,col]=size(tspData);
m=10000;
n=10;
group=zeros(m,n);
for i=1:m
    group(i,:)=randperm(raw);
end
dist=zeros(m,1);
for i=1:m
    for j=1:n-1
        x_dist=(tspData(group(i,j),1)-tspData(group(i,j+1),1))^2;
        y_dist=(tspData(group(i,j),2)-tspData(group(i,j+1),2))^2;
        dist(i)=dist(i)+(x_dist+y_dist)^(1/2);
    end
    x_dist=(tspData(group(i,1),1)-tspData(group(i,col),1))^2;
    y_dist=(tspData(group(i,1),2)-tspData(group(i,col),2))^2;
    dist(i)=dist(i)+(x_dist+y_dist)^(1/2);
end
 fprintf('最小值为 --->>%5.2f\n',min(dist));





















