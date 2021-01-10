%load Aggregation.txt

X = [randn(50,2)+ones(50,2);randn(50,2)-ones(50,2);randn(50,2)+[ones(50,1),ones(50,1)]]; %%150*2

[u re]=Kmeans_lj(X,3); %% kmeans

[m n]=size(re);
%最后显示聚类后的数据
figure;
hold on;
for i=1:m 
    if re(i,3)==1   
         plot3(re(i,1),re(i,2),re(i,3),'ro'); 
    elseif re(i,3)==2
         plot3(re(i,1),re(i,2),re(i,3),'go'); 
    elseif re(i,3)==3
         plot3(re(i,1),re(i,2),re(i,3),'bo'); 
    else
        plot3(re(i,1),re(i,2),re(i,3),'ko'); 
    end
end
grid on;