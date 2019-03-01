function [w,b]=BPnetwork(x,y,para,iter,error,alpha)
%% ����
%%% ���
% w:ѵ���õ��������Ȩֵ����
% b:ѵ���õ��������ƫ�þ���
%%% ����
% x:ѵ����������,������
% y:ѵ���������
% para:BP�������ز���,[�����ڵ���,���ز�ڵ���,�����ڵ���]
% iter:��������
% error:����
% alpha:ѧϰ����
%% ��������
disp('BP�����翪ʼѵ��........................');
tic;
[~,col]=size(x);%��������ά��
hidePoint=length(para);%��������Ĳ���
w=cell(1,hidePoint);%Ȩֵ����
b=cell(1,hidePoint);%ƫ�þ���
inputNwtValue=cell(1,hidePoint);%��Ԫδ����ǰ������ֵ
outputNwtValue=cell(1,hidePoint);%��Ԫδ���������ֵ
w{1,1}=0;
b{1,1}=0;
inputNwtValue{1,1}=0;
outputNwtValue{1,1}=0;

%ֵ��ʼ��
for i=2:hidePoint
    w{1,i}=0.5*rand(para(i),para(i-1))-0.1;
    b{1,i}=0.5*rand(para(i),1)-0.1;
%     w{1,i}=ones(para(i),para(i-1));
%     b{1,i}=ones(para(i),1);
    inputNwtValue{1,i}=zeros(para(i),1);
    outputNwtValue{1,i}=zeros(para(i),1);
end
iterStart=1;%ѵ������
E_theta=inf;%ѵ�����������ԭʼ���ݵ����
% �����������򾫶�δ�ﵽ�趨Ŀ��ѵ��
delt_w=cell(1,hidePoint);%����Ȩֵ����
delt_b=cell(1,hidePoint);%����ƫ�þ���
delt=cell(1,hidePoint);%�����
delt_w{1,1}=0;
delt_b{1,1}=0;
inputNwtValue{1,1}=x;
outputNwtValue{1,1}=x;

for iterStart=1:iter
    %% ǰ�򴫲�
    for i=2:hidePoint
        if(i==hidePoint)
            inputNwtValue{1,i}=w{1,i}*outputNwtValue{1,i-1}+repmat(b{1,i},1,col);%δ����ǰ����Ԫֵ
           outputNwtValue{1,i}=inputNwtValue{1,i};%������Ԫ 
        else
           inputNwtValue{1,i}=w{1,i}*outputNwtValue{1,i-1}+repmat(b{1,i},1,col);%δ����ǰ����Ԫֵ
           outputNwtValue{1,i}=BPfunction(inputNwtValue{1,i});%������Ԫ 
        end
    end
    E_theta=sumsqr(outputNwtValue{1,hidePoint}-y);%���
    if(E_theta<=error)
        break;
    end
    %% ��������
    for i=hidePoint:-1:2
        if(i==hidePoint)%ƫ�����ı�ֵ����
            delt{1,i}=y-outputNwtValue{1,i};
        else
            delt{1,i}=w{1,i+1}'*delt{1,i+1}.*outputNwtValue{1,i}.*(1-outputNwtValue{1,i});
        end
        delt_b{1,i}=delt{1,i}*ones(col,1);
        delt_w{1,i}=delt{1,i}*outputNwtValue{1,i-1}';%Ȩ�ظı�ֵ����
    end
    %% Ȩ��ֵ,ƫ��������
    for i=2:hidePoint
        w{1,i}=w{1,i}+alpha*delt_w{1,i};
        b{1,i}=b{1,i}+alpha*delt_b{1,i};
    end 
end
BP_train_time=toc;
disp('BP������ѵ�����!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
disp(['ѵ������ʱ��',num2str(BP_train_time),'s']);
disp(['ѵ����������Ϊ��',num2str(iterStart),'��;����Ϊ��',num2str(E_theta)]);

















