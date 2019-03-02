function newGroup=variation(group,variationPro)
[raw,col]=size(group);
newGroup=zeros(raw,col);
varPoint=zeros(1,2);
for i=1:raw
    if(rand<variationPro)
        varPoint(1)=round(rand*col);
        varPoint(2)=round(rand*col);
        if(varPoint(1)==0||varPoint(2)==0)
            zeroPoint=find(varPoint==0);
            varPoint(zeroPoint)=varPoint(zeroPoint)+1;
        end
        temp=group(i,varPoint(1));
        group(i,varPoint(1))=group(i,varPoint(2));
        group(i,varPoint(2))=temp;
        newGroup(i,:)=group(i,:);
    else
        newGroup(i,:)=group(i,:);
    end
end

















