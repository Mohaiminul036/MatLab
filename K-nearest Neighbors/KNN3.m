function relustLabel=KNN3(test,train,trainlabels,k,type)
%% test Ϊһ������������ݣ�trainΪ�������ݣ�trainlabelsΪ������ǩ,ѡȡk���ٽ�ֵ
row = size(train,1);
for j=1:row
    switch type
        case 1  % ��test��ÿ��������ŷ�Ͼ���
             distanceMat(j)=sum((test-train(j,:)).^2);  %%% euclidean distance
        case 2  %��test��ÿ�������ļн�����  %%% cosine distance
             distanceMat(j)=(train(j,:)*test')/(norm(train(j,:),2)*norm(test,2));
            if distanceMat(j)<0
                distanceMat(j)=(distanceMat(j)+1)/2;
            end
    end       
end
distanceMat=distanceMat';
[B, IX] = sort(distanceMat,'ascend');  %�����С��������
len = min(k,length(B));  %ѡk���ڽ�ֵ����Ȼk���ܳ���ѵ����������
relustLabel = mode(trainlabels(IX(1:len))); % ȡ������������Ƶ����ߵ�label����Ϊ���ؽ��
end
