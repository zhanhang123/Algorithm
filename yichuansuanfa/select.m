function newGroup=select(group,fitValue)
%% ����������̣�˭�ĸ��ʴ�ѡ���ĸ�����
%% ѡ���µ���Ⱥ
% group:��ʼ����Ⱥ
% fitValue:��Ⱥ��Ӧ��
[raw,col]=size(group);%�жϳ�ʼ����Ĵ�С
totalFit=sum(fitValue);%������Ⱥ��Ӧ�ȵ�ֵ�ܺ�
aveFit=fitValue/totalFit;%���ÿһ����Ӧ��������Ӧ���е�Ȩ��
aveFitTemp=cumsum(aveFit);%������еĸ����ܺ�
%cumsum(A) ����һ����Aͬ��ͬ�еľ��󣬾����е�m��
%��n��Ԫ����A�е�1�е���m�е����е�n��Ԫ�ص��ۼӺ�
sortAveFit=sort(rand(raw,1));%�������������ѡ��
calNum1=1;
calNum2=1;%�����ж���ѡ�����Ⱥ�еĸ����Ƿ�ﵽ��������
while calNum1<=raw
    if(sortAveFit(calNum1)<aveFitTemp(calNum2))
        %�ж���������ĸ�������Ӧ��Ȩ�صĴ�С
        %��С����ԭʼ��Ⱥ��Ӧ������
        newGroup(calNum1,:)=group(calNum2,:);
        %��ѡ��������Ⱥ������һ������ԭ����Ⱥ�еĸ�����
        %����Ⱥ�Ĺ�ģ��仯����С�仯
        calNum1=calNum1+1;
    else
        calNum2=calNum2+1;
    end
    if calNum2>=raw
        calNum2=raw;
    end
end









