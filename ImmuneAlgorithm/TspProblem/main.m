%% �����㷨
% �㷨���̣�
% 1.��ԭʶ��;                                   �����Ż�����Ļ�ȡ
% 2.��������;                                   ��������ʼ��Ⱥ
% 3.�����׺Ͷ�;                                 ��������Ⱥ��Ӧ��
% 4.�Ƿ�������ֹ�������ǣ��������񣬼�����һ��;
% 5.���㿹��Ũ�Ⱥͼ�����;                       ��������Ⱥ�еĸ�������
% 6.����ѡ��                                  ����Ⱥ����ѡ��
% 7.��¡,����,��¡����                          ����Ⱥ����,�Ŵ��Ȳ���
% 8.��Ⱥˢ�£����ز���3
%% ������
clc
clear
%% ��ʼ��
popNum=200; % ��Ⱥ������
num=31;     % ���߸�����
iterNum=500;  % ��Ⱥ��������
cloneNum=20;% ��¡����
data=[1304 2312;3639 1315;4177 2244;3712 1399;3488 1535;
   3326 1556;3238 1229;4196 1004;4312 790;4386 570;
   3007 1970;2562 1756;2788 1491;2381 1676;1332 695;
   3715 1678;3918 2179;4061 2370;3780 2212;3676 2578;
   4029 2838;4263 2931;3429 1908;3507 2367;3394 2643;
   3439 3201;2935 3240;3140 3550;2545 2357;2778 2826;
   2370 2975];%����λ������
%% ������ʼ��Ⱥ
pop=zeros(popNum,num);%��Ⱥ����
for i=1:popNum
   pop(i,:)=randperm(num);
end
%% ��Ⱥ����Ӧ�ȼ���
fitValue=calFitValue(pop,data);%������Ӧ��ֵ
[sortFitValue,fitValueIndex]=sort(fitValue);%��Ӧ��ֵ����
popTemp=pop(fitValueIndex,:);%������Ӧ��ֵ�õ���������Ⱥ
%% ���߲���
iter=1;% ��Ⱥ�ĵ�������
bestValue=fitValue(1);%��Ⱥ��������ֵ
bestEvery=fitValue(1);%ÿ����Ⱥ����ֵ
bestPath=popTemp(1);%����·��
while(iter<=iterNum)
    %% ���߲���
    % ȡǰһ��ĸ���������߲���
    oldPopPart1=zeros(popNum/2,num);%�������ߺ���������
    oldPopPart2=zeros(popNum/2,num);%�������ɵ����߸���
    for i=1:popNum/2
        %% ��������
        immuPop=popTemp(i,:);%ѡ���������
        immuPopTemp=repmat(immuPop,cloneNum,1);%��¡
        for j=1:cloneNum
            %����
            index1=ceil(num*rand);%��������λ��
            index2=ceil(num*rand);%��������λ��
            while(index1==index2)
                index1=ceil(num*rand);
                index2=ceil(num*rand);
            end
            immuTemp=immuPopTemp(j,index1);
            immuPopTemp(j,index1)=immuPopTemp(j,index2);
            immuPopTemp(j,index2)=immuTemp;
        end
        immuPopTemp=[immuPopTemp;immuPop];%�����������
        valueTemp=calFitValue(immuPopTemp,data);%�������ߺ�ĸ�����Ӧ��
        [immuIndu,immuInduIndex]=sort(valueTemp);%���ߺ����Ӧ������
%         immuSortIn=immuPopTemp(immuInduIndex);%����
        oldPopPart1(i,:)=immuPopTemp(immuInduIndex(1),:);%ѡ�����Ÿ���
        %% ��Ⱥ��Ӧ�Ȳ�ĸ���ˢ��
        oldPopPart2(i,:)=randperm(num);%���������Ⱥ
    end
    pop=[oldPopPart1;oldPopPart2];%��������Ⱥ
    fitValue=calFitValue(pop,data);%������Ӧ��ֵ
    [sortFitValue,fitValueIndex]=sort(fitValue);%��Ӧ��ֵ����
    popTemp=pop(fitValueIndex,:);%������Ӧ��ֵ�õ���������Ⱥ
    bestEvery=[bestEvery;fitValue(1)];
    if(fitValue(1)<bestValue)
        bestValue=fitValue(1);%����ֵ
        bestPath=popTemp(1,:);%����·��
    end
    %% ��ͼ
    iter=iter+1;
    disp(iter);
    plot([iter-1,iter],[bestEvery(iter-1),bestEvery(iter)]);
    hold on
end
figure;
for i=1:num
    plot(data(i,1),data(i,2),'o')
    text(data(i,1),data(i,2),num2str(i));
    hold on
end
len=length(bestPath);
for i=1:len-1
   plot([data(bestPath(i),1),data(bestPath(i+1),1)],[data(bestPath(i),2),data(bestPath(i+1),2)]) ;
   hold on
end
hold on
plot([data(bestPath(1),1),data(bestPath(len),1)],[data(bestPath(1),2),data(bestPath(len),2)],'r')
title(['���·��Ϊ��',num2str(bestValue)]);




















