function newGroup=select(group,dist)
[raw,col]=size(group);
%% ������Ӧ��,fitValue
max_dist=max(dist);
min_dist=min(dist);
dist=(dist-min_dist)/(max_dist-min_dist);%��һ��
sum_dist=sum(dist);
fitValue_temp=dist./sum_dist;
fitValue=cumsum(fitValue_temp);
sortFit=sort(rand(raw,1));%�������������ѡ��
newGroup=zeros(raw,col);
selectNum1=1;%����fitValue��ֵ
selectNum2=1;%����sortFit��ֵ
while selectNum2<=raw
    %�ܹ���֤��Ⱥ����Ŀ���ֲ���
    if(sortFit(selectNum2)<fitValue(selectNum1))
        %�ж������������ʵĴ�С��ϵ
        %��С������fitValue(selectNum1)��ֵ
        newGroup(selectNum2,:)=group(selectNum1,:);
        selectNum2=selectNum2+1;
    else
        selectNum1=selectNum1+1;
    end
    if(selectNum1>raw)
        selectNum1=raw;
    end
end

























