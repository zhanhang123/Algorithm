function newGroup=crossCal(group,crossPro)
%group:����ѡ�����Ӵ���Ⱥ
%crossPro:������
[raw,col]=size(group);
newGroup=ones(raw,col);%???
for i=1:2:(raw-1)
    if(rand<crossPro)
        colNum=round(rand*col);%���ȡ�������Ӵ����н���
        newGroup(i,:)=[group(i,1:colNum),group(i+1,colNum+1:col)];
        newGroup(i+1,:)=[group(i+1,1:colNum),group(i,colNum+1:col)];
        %����i�е�1��colNum�����i+1�е�colNum+1��col�н��н���
    else
        newGroup(i,:)=group(i,:);
        newGroup(i+1,:)=group(i+1,:);
    end
end