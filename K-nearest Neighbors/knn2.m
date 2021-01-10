clc;clear all
load Compound.txt
data=Compound;


dataMat = data(:,1:2);
labels = data(:,3);
len = size(dataMat,1); 
k = 4;
error = 0;

label1=find(data(:,3)==1);
label2=find(data(:,3)==2);
label3=find(data(:,3)==3);
label4=find(data(:,3)==4);

figure
plot3(data(label1,1),data(label1,2),data(label1,3),'ro');  
hold on
plot3(data(label2,1),data(label2,2),data(label2,3),'g+');
hold on
plot3(data(label3,1),data(label3,2),data(label3,3),'bo');
hold on
plot3(data(label4,1),data(label4,2),data(label4,3),'r*');  
grid on


maxV = max(dataMat);
minV = min(dataMat);
range = maxV-minV;
newdataMat = (dataMat-repmat(minV,[len,1]))./(repmat(range,[len,1]));


Ratio = 0.1;
numTest = Ratio * len; 


TrainData=newdataMat(numTest+1:end,:);
TrainLabels=labels(numTest+1:end,:);

TestData=newdataMat(1:numTest,:);
TestLabels=labels(1:numTest,:);


type=1;
for i = 1:numTest
    classifyresult = KNN3(TestData(i,:),TrainData,TrainLabels,k,type);
 [classifyresult labels(i)]
    if(classifyresult~=labels(i))
        error = error+1;
    end
end
classifyresult=classifyresult';
fprintf('The incorrected labels are: ')
Index=find(classifyresult~=TestLabels)
fprintf('The accuracy is: %f\n',1-error/(numTest))