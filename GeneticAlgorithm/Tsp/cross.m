function newGroup=cross(group,crossPro)
%���򽻲�
%��Ӧ��λ��λ�ã����Ҫ�жϻ���Ŀ�����
%���ж�ÿ�������е�ÿ�������Ƿ���ȫ��ͬ��
[raw,col]=size(group);
newGroup=zeros(raw,col);
crossPoint=zeros(1,2);
for i=1:raw-1
%     temp1=group(i,:);
%     temp2=group(i+1,:);
%     if(rand<crossPro)
%         %% ��ȡ��һ�ζ�һ�εĽ���
%         crossPoint(1)=round(rand*col);%��ȡ��Ӧ�����
%         crossPoint(2)=round(rand*col);
%         %����
%         minPoint=min(crossPoint)+1;
%         maxPoint=max(crossPoint);
%         temp_group=group(i,minPoint:maxPoint);
%         group(i,minPoint:maxPoint)=group(i+1,minPoint:maxPoint);
%         group(i+1,minPoint:maxPoint)=temp_group;
%         %�жϽ����Ƿ�ɹ�
%         if(length(unique(group(i,:)))==col)
%             %����ɹ�
%         else
%             group(i,:)=temp1;
%             group(i+1,:)=temp2;
%             %����ʧ��
%         end         
%     else
%         group(i,:)=temp1;
%         group(i+1,:)=temp2;
%     end
    %% ��ȡ��1��ʼ��croPointһ�εĽ���
%     if(rand<crossPro)
%         croPoint=round(rand*col);
%         newGroup(i,:)=[group(i,1:croPoint),group(i+1,croPoint+1:col)];
%         newGroup(i+1,:)=[group(i+1,1:croPoint),group(i,croPoint+1:col)];
%         while(length(unique(newGroup(i,:)))<col)
%             croPoint=round(rand*col);
%             newGroup(i,:)=[group(i,1:croPoint),group(i+1,croPoint+1:col)];
%             newGroup(i+1,:)=[group(i+1,1:croPoint),group(i,croPoint+1:col)];
%         end
    changeCro=round(rand*col)+1;
    for j=1:changeCro
        if(changeCro)
            croPoint=round(rand*col);
            %         disp(croPoint);
            if(croPoint==0)
                croPoint=1;
            end
            newGroup(i,:)=group(i,:);
            newGroup(i+1,:)=group(i+1,:);
            x=find(newGroup(i,:)==newGroup(i+1,croPoint));
            y=find(newGroup(i+1,:)==newGroup(i,croPoint));
            temp=newGroup(i,croPoint);
            newGroup(i,croPoint)=newGroup(i+1,croPoint);
            newGroup(i+1,croPoint)=temp;
            temp=newGroup(i,x);
            newGroup(i,x)=newGroup(i+1,y);
            newGroup(i+1,y)=temp;
        else
            newGroup(i,:)=group(i,:);
            newGroup(i+1,:)=group(i+1,:);
        end
    end
end



























