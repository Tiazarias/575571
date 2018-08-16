M = xlsread('CPE61.csv');   %import csv
M2 = sortrows(M,21,'descend'); % sort geade point by descend
M2Clear = rmmissing(M2);    %remove Rows wth Missing Values
%M2Clear = M1(1:10,:)  % copy row 1 to 3 and all columm from M1 to M2Clear
NRowTest = size(M2Clear,1);
NColTest = size(M2Clear,2);
Target = zeros(22,4);
for i=1:1:1
    for j=2:1:NColTest-1
        for k=1:1:22 
            if Target(k,1)==0 
                Target(k,1)=M2Clear(i,j);
                break;
            elseif Target(k,1)==M2Clear(i,j);       
                break;
            end
        end
    end
end
Target = sortrows(Target,1,'ascend');  
Target = Target(any(Target,2),:);  
NRowTarget = size(Target,1);
for i=1:1:NRowTest
    newID=0;
    for j=2:1:NColTest-1
        for k=1:1:NRowTarget
            if Target(k,1)==M2Clear(i,j)
                if Target(k,3)==0
                    Target(k,3)=M2Clear(i,21)
                end
                if Target(k,2)<120 | Target(k,4)==M2Clear(i,21)
                Target(k,2)= Target(k,2)+1;
                Target(k,4)= M2Clear(i,21);
                newID=1;
                break;    
                end
            end
        end
        if newID==1
            break;
        end
    end
end
figure
ax1=subplot(2,1,1)
bar(ax1,Target(:,1),Target(:,2))
title(char('Number of Student'));
ax2=subplot(2,1,2)
bar(ax2,Target(:,1),Target(:,3:4))
title(char('Max and Min of GradePoint'));