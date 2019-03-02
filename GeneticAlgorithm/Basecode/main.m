function main()
%�Ŵ��㷨
format short
%% ��Ҫ˼·��
% 1.����
% 2.����������������Ӧ�ȼ���(����ֵ����)
% 3.����
% 4.����
% 5.���Ÿ���ѡ�񣬶����̷�
%% 
clc;
clear;
%% ��ʼ��������
groupSize=50;%��Ⱥ��ģ��С
codeLength=20;%��Ⱥ������볤��
crossPro=0.8;%���彻�����
variationPro=0.1;%����������
iterNum=100;%��Ⱥ��������
%% ��ʼ����Ⱥ
%�ɲ���round(rand(groupSize,codeLength))��ʼ����Ⱥ��
%   ����roundΪ��������ĺ�����randΪ����0~1֮����ȵ������
%unidrnd:������ɢ���ȵ����������2����ʾ���������������1������2
%ones:��ʾ����һ��1����
group=unidrnd(2,groupSize,codeLength)-ones(groupSize,codeLength);
%����һ����Ⱥ��СΪgroupSize�����볤��ΪcodeLength�ĳ�ʼ����Ⱥ
%% ��Ⱥ����/ѭ��
figure;
for i=1:iterNum
    %������Ӧ��
    %��������ת��Ϊʮ����,�������Ϊ��������Ⱥ����Ⱥ�ı��볤��
    xGroup=binary2num(group);
    fitValue=testObjFun(xGroup);%������Ⱥ��Ӧ��/����ֵ
    %ѡ��
    newGroup=select(group,fitValue);
    %����
    newGroup=crossCal(newGroup,crossPro);
    %����
    newGroup=changeVar(newGroup,variationPro);
    %������Ⱥ
    group=newGroup;
    %Ѱ�����Ž�
    [bestIndividual,bestFit]=bestCal(group,fitValue);
    solveValue=binary2num(bestIndividual);
    groupValue=binary2num(group);
    plot(i,bestFit);
    hold on
end
fprintf('���Ž�Ϊ --->>%5.2f\n',solveValue);
fprintf('���Ž��ֵ --->>%5.2f\n',bestFit);











