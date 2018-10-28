function newGroup=crossCal(group,crossPro)
%group:经过选择后的子代种群
%crossPro:交叉率
[raw,col]=size(group);
newGroup=ones(raw,col);%???
for i=1:2:(raw-1)
    if(rand<crossPro)
        colNum=round(rand*col);%随机取两相邻子代进行交叉
        newGroup(i,:)=[group(i,1:colNum),group(i+1,colNum+1:col)];
        newGroup(i+1,:)=[group(i+1,1:colNum),group(i,colNum+1:col)];
        %将第i行第1到colNum列与第i+1行第colNum+1到col列进行交换
    else
        newGroup(i,:)=group(i,:);
        newGroup(i+1,:)=group(i+1,:);
    end
end