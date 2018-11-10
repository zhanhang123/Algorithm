clc
clear
%������������·������
%% ��Ҫ˼·��
% 1.����
% 2.����������������Ӧ�ȼ���(����ֵ����)
% 3.����
% 4.����
% 5.���Ÿ���ѡ�񣬶����̷�
%% ��ʼ��������
load tspData %����tsp����,��1��x����,��2��y����
% tspData=[0.4 0.4439;0.2439 0.1463;0.1707 0.2293;0.2293 0.761;0.5171 0.9414;
%         0.8732 0.6536;0.6878 0.5219;0.8488 0.3609;0.6683 0.2536;0.6195 0.2634];
% tspData=[41 94;37 84;54 67;25 62;7 64;2 99;68 58;71 44;54 62;83 69;64 60;18 54;22 60;
%         83 46;91 38;25 38;24 42;58 69;71 71;74 78;87 76;18 40;13 40;82 7;62 32;58 35;45 21;41 26;44 35;4 50];
[raw,col]=size(tspData);
groupSize=250;%��Ⱥ��ģ��С
crossPro=0.8;%���彻�����
variationPro=0.2;%����������
iterNum=2000;%��Ⱥ��������
%% ��ʼ��Ⱥ�Ĳ���
for i=1:groupSize
    group(i,:)=randperm(raw);
end
%% ����
fitPerfact=zeros(1,iterNum);%��������ֵ
groupPerfact=[];%���Ÿ���
maxPerfact=[];
%��Ӧ�ȼ���
fitValue=fitValueCal(group,tspData);
tem_group=100000000000;
for i=1:iterNum
%     %��Ӧ�ȼ���
%     fitValue=fitValueCal(group,tspData);
    %ѡ��
    newGroup=select(group,fitValue);
    %����
    newGroup=cross(newGroup,crossPro);
    %����
    newGroup=variation(newGroup,variationPro);
    %��Ӧ�ȼ���
    fitValue=fitValueCal(newGroup,tspData);
    group=newGroup;
    maxPerfact=max(fitValue);
    fitPerfact(i)=maxPerfact;
    if(tem_group>maxPerfact)
        groupPerfact=group(find(fitValue==maxPerfact),:);
        tem_group=maxPerfact;
    end
end
plotData=zeros(1,raw+1);
plotData(1:raw)=groupPerfact(1,:);
plotData(raw+1)=groupPerfact(1,1);
figure;
plot(tspData(:,1),tspData(:,2),'rp');
hold on
for i=1:raw
    x_point=tspData(plotData(i),:);
    y_point=tspData(plotData(i+1),:);
    plot([x_point(1,1),y_point(1,1)],[x_point(1,2),y_point(1,2)],'y');
    hold on
end
figure
plot([1:iterNum],1./fitPerfact);
fprintf('���Ž�Ϊ --->>%5.2f\n',1/maxPerfact);
% fprintf('���Ž��ֵ --->>%5.2f\n',groupPerfact);






















