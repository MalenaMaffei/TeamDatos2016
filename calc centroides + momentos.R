library(e1071)
library(IM)


test <- read.csv("./test.csv")
train <- read.csv("./train.csv")
train.features = train
train.features$label <- NULL
testTrain = rbind(test, train.features)
centroides <- data.frame()
momentos <- data.frame()



i=1
for(i in 1:70000){
  I <- as.numeric(testTrain[i,])
  dim(I) <- c(28, 28)
  I <- t(I)
  center= calcCentroid(I)
  centroides[i,1:2] <- center
  centroides[i,3] <- calcMaxRadius(I, center)
  obj = momentObj(I=I,type="cheby",order=1);
  momentosv<- t(as.vector(obj@moments))
  momentos <- rbind(momentos,momentosv)
}


library(raster)
cv(momentos[,1])
cv(momentos[,2])
cv(momentos[,3])
cv(momentos[,4])



id<- rownames(momentos)
momentosOut <- cbind(id=id, momentos)
write.table(momentosOut,file = "momentos.csv",quote = FALSE,sep = ",",row.names = FALSE,col.names = FALSE)



id<- rownames(centroides)
centroidesOut <- cbind(id=id,centroides)
write.table(centroidesOut,file = "centroides.csv",quote = FALSE,sep = ",",row.names = FALSE,col.names = FALSE)
displayImg(I)
