function  newGroup=changeVar(group,variationPro)
%�Ӵ���Ⱥ���б���
[raw,col]=size(group);
newGroup=ones(raw,col);
for i=1:raw
    if(rand<variationPro)
        changePoint=round(rand*col);%��ȡ���촦��λ��
        if changePoint<=0
            changePoint=1;
        end
        newGroup(i,:)=group(i,:);
        if(newGroup(i,changePoint)==0)
            newGroup(i,changePoint)=1;
        else
            newGroup(i,changePoint)=0;
        end
    else
        newGroup(i,:)=group(i,:);
    end
end





