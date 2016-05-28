#pruebas svm
library(e1071)
library(IM)
#pca 

test <- read.csv("./test.csv")
train <- read.csv("./train.csv")
train.features = train
train.features$label <- NULL
testTrain = rbind(test, train.features)
centroides <- data.frame()

i=1
I <- as.numeric(testTrain[i,])
dim(I) <- c(28, 28)
I <- t(I)
center= calcCentroid(I);
maxRadius= calcMaxRadius(I, center);
displayImg(I)

centroides[i,] <- center
centroides[i,3] <- calcMaxRadius(I, center)

i=1
for(i in 1:70000){
  I <- as.numeric(testTrain[i,])
  dim(I) <- c(28, 28)
  I <- t(I)
  center= calcCentroid(I)
  centroides[i,1:2] <- center
  centroides[i,3] <- calcMaxRadius(I, center)
}

id<- rownames(centroides)
centroidesOut <- cbind(id=id,centroides)
write.table(centroidesOut,file = "centroides.csv",quote = FALSE,sep = ",",row.names = FALSE,col.names = FALSE)
displayImg(I)
