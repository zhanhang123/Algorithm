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
% load tspData %����tsp����,��1��x����,��2��y����
% tspData=[0.4 0.4439;0.2439 0.1463;0.1707 0.2293;0.2293 0.761;0.5171 0.9414;
%         0.8732 0.6536;0.6878 0.5219;0.8488 0.3609;0.6683 0.2536;0.6195 0.2634];
% tspData=[41 94;37 84;54 67;25 62;7 64;2 99;68 58;71 44;54 62;83 69;64 60;18 54;22 60;
%         83 46;91 38;25 38;24 42;58 69;71 71;74 78;87 76;18 40;13 40;82 7;62 32;58 35;45 21;41 26;44 35;4 50];
% tspData=[1304 2312; 3639 1315; 4177 2244; 3712 1399;
%     3488 1535; 3326 1556; 3238 1229; 4196 1004; 
%     4312 790; 4386 570; 3007 1970; 2562 1756; 
%     2788 1491; 2381 1676; 1332 695; 3715 1678; 
%     3918 2179; 4061 2370; 3780 2212; 3676 2578; 
%     4029 2838; 4263 2931; 3429 1908; 3507 2367; 
%     3394 2643; 3439 3201; 2935 3240; 3140 3550; 
%     2545 2357; 2778 2826; 2370 2975];
tspData=[16.47 96.10;16.67 94.44;20.09 92.54;22.39 93.37;
    25.23 97.24;22.00 96.05;20.47 97.02;17.20 96.29;
    16.30 97.38;14.05 98.12;16.53 97.38;21.52 95.59;
    19.41 97.13;20.09 92.55];
[raw,col]=size(tspData);
groupSize=200;%��Ⱥ��ģ��С
crossPro=0.7;%���彻�����
variationPro=0.1;%����������
iterNum=500;%��Ⱥ��������
%% ��ʼ��Ⱥ�Ĳ���
for i=1:groupSize
    group(i,:)=randperm(raw);
end
%% ����
fitPerfact=zeros(1,iterNum);%��������ֵ
groupPerfact=[];%���Ÿ���
maxPerfact=[];%�����Ӧ�ȵ�ֵ
%��Ӧ�ȼ���
fitValue=fitValueCal(group,tspData);%������Ӧ��
tem_group=100000000000;%���ڱȽ��б���Ӧ��
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
    fitPerfact(i)=1/maxPerfact;
    if(tem_group>maxPerfact)
        groupPerfact=group(find(fitValue==maxPerfact),:);
        tem_group=maxPerfact;
    end
    disp(i);
end
plotData=zeros(1,raw+1);
plotData(1:raw)=groupPerfact(1,:);
plotData(raw+1)=groupPerfact(1,1);
figure;
plot(tspData(:,1),tspData(:,2),'ro');
hold on
strtitle=strcat('��',num2str(i),'�ε�����');
for i=1:raw
    x_point=tspData(plotData(i),:);
    y_point=tspData(plotData(i+1),:);
    plot([x_point(1,1),y_point(1,1)],[x_point(1,2),y_point(1,2)],'bo-');
    title(strtitle);
    hold on
    pause(0.3)
end
% end
figure
plot([1:iterNum],fitPerfact);
fprintf('���Ž�Ϊ --->>%5.2f\n',1/maxPerfact);
disp('���Ž��ֵ');disp(groupPerfact(1,:));






















