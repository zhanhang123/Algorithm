function newGroup=binary2num(group)
%����������ת��Ϊʮ������
%��ÿһ��Ϊ��λ���ֱ�����ÿһ�ж�Ӧ��ʮ���������ֵ
[row,col]=size(group);
groupTempValue=zeros(row,1);
for i=1:col
    groupTemp_1(:,i)=2.^(col-i).*group(:,i);
end
groupTemp_2=sum(groupTemp_1,2);
%sum(A,1),��ʾ��ÿһ����ͣ�sum(A,2),��ʾ��ÿһ�����
newGroup=groupTemp_2*col/(2^col-1);


