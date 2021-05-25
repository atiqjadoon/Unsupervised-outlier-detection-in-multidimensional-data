function [temp,outlierPOS]=BADk(data,C,k)

[row,~]=size(data);

[~,dst]=knnsearch(data,data,'K',row);
dist=dst(:,k+1)';

%% outlier detection paper
%% Code for Equation 6
QQ = quantile(dist,[0.25 0.50 0.75]);
upperL= (QQ(3)-QQ(2))*C+QQ(3);              %(QQ(3)-QQ(1))*var+QQ(3); 
lowerL= -(QQ(2)-QQ(1))*C+QQ(1);             %-(QQ(3)-QQ(1))*var+QQ(1);  
j=1;
outlierPOS=[];
for i=1:size(dist,2)
    
    if dist(i)>upperL || dist(i)<lowerL
        
        outlierPOS(j)=i;
        j=j+1;
    end
end

%% Code for Equation 7b
% QQ = quantile(dist,[0.25 0.50 0.75]);
% zu=sqrt(var(dist(dist>=QQ(3))));
% upperL=   QQ(3)+C*zu;
% zu1=sqrt(var(dist(dist<QQ(1))));
% lowerL=   -(zu1)*C+QQ(1);
% j=1;
% outlierPOS=[];
% for i=1:size(dist,2)
%     
%     if dist(i)>upperL || dist(i)<lowerL
%         
%         outlierPOS(j)=i;
%         j=j+1;
%     end
% end
% outlierVAL=data(outlierPOS,:);


%%  Code for Equation 7a

% 
% QQ = quantile(dist,[0.25 0.50 0.75]);
% zu=sqrt(var(dist(dist>=QQ(2))));
% upperL=   QQ(3)+C*zu;
% zu1=sqrt(var(dist(dist<QQ(2))));
% lowerL=   -(zu1)*C+QQ(1);
% j=1;
% outlierPOS=[];
% for i=1:size(dist,2)
%     
%     if dist(i)>upperL || dist(i)<lowerL
%         
%         outlierPOS(j)=i;
%         j=j+1;
%     end
% end
% outlierVAL=data(outlierPOS,:);


data(outlierPOS,:)=[];
temp=data;

end