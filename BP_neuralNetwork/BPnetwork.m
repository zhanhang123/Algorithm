function [w,b]=BPnetwork(x,y,para,iter,error,alpha)
%% 参数
%%% 输出
% w:训练好的神经网络的权值矩阵
% b:训练好的神经网络的偏置矩阵
%%% 输入
% x:训练输入数据,列向量
% y:训练输出数据
% para:BP网络的相关参数,[输入层节点数,隐藏层节点数,输出层节点数]
% iter:迭代次数
% error:误差精度
% alpha:学习速率
%% 程序主体
disp('BP神经网络开始训练........................');
tic;
[~,col]=size(x);%输入矩阵的维度
hidePoint=length(para);%计算网络的层数
w=cell(1,hidePoint);%权值矩阵
b=cell(1,hidePoint);%偏置矩阵
inputNwtValue=cell(1,hidePoint);%神经元未激活前的输入值
outputNwtValue=cell(1,hidePoint);%神经元未激活后的输出值
w{1,1}=0;
b{1,1}=0;
inputNwtValue{1,1}=0;
outputNwtValue{1,1}=0;

%值初始化
for i=2:hidePoint
    w{1,i}=0.5*rand(para(i),para(i-1))-0.1;
    b{1,i}=0.5*rand(para(i),1)-0.1;
%     w{1,i}=ones(para(i),para(i-1));
%     b{1,i}=ones(para(i),1);
    inputNwtValue{1,i}=zeros(para(i),1);
    outputNwtValue{1,i}=zeros(para(i),1);
end
iterStart=1;%训练次数
E_theta=inf;%训练输出数据与原始数据的误差
% 当迭代次数或精度未达到设定目标训练
delt_w=cell(1,hidePoint);%修正权值矩阵
delt_b=cell(1,hidePoint);%修正偏置矩阵
delt=cell(1,hidePoint);%误差项
delt_w{1,1}=0;
delt_b{1,1}=0;
inputNwtValue{1,1}=x;
outputNwtValue{1,1}=x;

for iterStart=1:iter
    %% 前向传播
    for i=2:hidePoint
        if(i==hidePoint)
            inputNwtValue{1,i}=w{1,i}*outputNwtValue{1,i-1}+repmat(b{1,i},1,col);%未激活前向神经元值
           outputNwtValue{1,i}=inputNwtValue{1,i};%激活神经元 
        else
           inputNwtValue{1,i}=w{1,i}*outputNwtValue{1,i-1}+repmat(b{1,i},1,col);%未激活前向神经元值
           outputNwtValue{1,i}=BPfunction(inputNwtValue{1,i});%激活神经元 
        end
    end
    E_theta=sumsqr(outputNwtValue{1,hidePoint}-y);%误差
    if(E_theta<=error)
        break;
    end
    %% 反向误差传播
    for i=hidePoint:-1:2
        if(i==hidePoint)%偏置量改变值计算
            delt{1,i}=y-outputNwtValue{1,i};
        else
            delt{1,i}=w{1,i+1}'*delt{1,i+1}.*outputNwtValue{1,i}.*(1-outputNwtValue{1,i});
        end
        delt_b{1,i}=delt{1,i}*ones(col,1);
        delt_w{1,i}=delt{1,i}*outputNwtValue{1,i-1}';%权重改变值计算
    end
    %% 权重值,偏置量更改
    for i=2:hidePoint
        w{1,i}=w{1,i}+alpha*delt_w{1,i};
        b{1,i}=b{1,i}+alpha*delt_b{1,i};
    end 
end
BP_train_time=toc;
disp('BP神经网络训练完成!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
disp(['训练花费时间',num2str(BP_train_time),'s']);
disp(['训练迭代次数为：',num2str(iterStart),'次;精度为：',num2str(E_theta)]);

















