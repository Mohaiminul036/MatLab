function relustLabel=KNN3(test,train,trainlabels,k,type)

row = size(train,1);
for j=1:row
    switch type
        case 1  
             distanceMat(j)=sum((test-train(j,:)).^2);  
        case 2  
             distanceMat(j)=(train(j,:)*test')/(norm(train(j,:),2)*norm(test,2));
            if distanceMat(j)<0
                distanceMat(j)=(distanceMat(j)+1)/2;
            end
    end       
end
distanceMat=distanceMat';
[B, IX] = sort(distanceMat,'ascend');  
len = min(k,length(B)); 
relustLabel = mode(trainlabels(IX(1:len))); 
end
