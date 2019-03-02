function newGroup=binary2num(group)
%将二进制数转化为十进制数
%以每一列为单位，分别计算出每一列对应的十进制最大数值
[row,col]=size(group);
groupTempValue=zeros(row,1);
for i=1:col
    groupTemp_1(:,i)=2.^(col-i).*group(:,i);
end
groupTemp_2=sum(groupTemp_1,2);
%sum(A,1),表示对每一列求和，sum(A,2),表示对每一行求和
newGroup=groupTemp_2*col/(2^col-1);


