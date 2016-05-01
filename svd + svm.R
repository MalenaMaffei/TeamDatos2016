library(MASS)
library(class)
library(e1071)
test <- read.csv("./test.csv")
train <- read.csv("./train.csv")
train.features = train
train.features$label <- NULL
testTrain = rbind(test, train.features)


inutil <- names(testTrain[, sapply(testTrain, function(v) var(v, na.rm=TRUE)==0)])
testTrain[inutil] <- list(NULL)

#svd comentado para hacer prueba sin nada, si lo quieren usar
#hay que cambiar en la parte del svm por uTrain y uTest
#testTrain.svd <- svd(testTrain)
#u <- testTrain.svd$u
#testTrainU <- u[,1:35]
#uTrain <- as.data.frame(testTrainU[28001:90000,])
#uTest <- as.data.frame(testTrainU[1:28000,])

class <- as.factor(train$label)

#SVM RBF g = 1/20 c=64 fue el mejor de todos, aunque despues
#va a haber que hacer gridsearch

svm_model <- svm(train.features, class,type="C-classification",kernel = "radial",gamma=1/20,cost=64)
svm_prediction <- predict(svm_model, test)

out <- as.character(svm_prediction)

write.table (out,file="svm rbf g 20 c64.csv",row.names=TRUE,col.names=TRUE,quote=FALSE,sep=",")