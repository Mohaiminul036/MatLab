function relustLabel=KNN3(test,train,trainlabels,k,type)
%% test 为一条输入测试数据，train为样本数据，trainlabels为样本标签,选取k个临近值
row = size(train,1);
for j=1:row
    switch type
        case 1  % 求test到每个样本的欧氏距离
             distanceMat(j)=sum((test-train(j,:)).^2);  %%% euclidean distance
        case 2  %求test到每个样本的夹角余弦  %%% cosine distance
             distanceMat(j)=(train(j,:)*test')/(norm(train(j,:),2)*norm(test,2));
            if distanceMat(j)<0
                distanceMat(j)=(distanceMat(j)+1)/2;
            end
    end       
end
distanceMat=distanceMat';
[B, IX] = sort(distanceMat,'ascend');  %距离从小到大排序
len = min(k,length(B));  %选k个邻近值，当然k不能超过训练样本个数
relustLabel = mode(trainlabels(IX(1:len))); % 取众数（即出现频率最高的label）作为返回结果
end
