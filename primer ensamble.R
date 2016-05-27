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

testTrain.svd <- svd(testTrain)
u <- testTrain.svd$u
testTrainU <- u[,1:35]
uTrain <- as.data.frame(testTrainU[28001:70000,])
uTest <- as.data.frame(testTrainU[1:28000,])
class <- as.factor(train$label)

uTrainConF <- cbind(uTrain,train[,1])

sample_rbf <- uTrainConF[sample(nrow(uTrainConF),10000, replace=TRUE), ]
class_rbf <- as.factor(sample_rbf[,36])
sample_rbf[,36] <- NULL

sample_poly3 <- uTrainConF[sample(nrow(uTrainConF),10000, replace=TRUE), ]
class_poly3 <- as.factor(sample_poly3[,36])
sample_poly3[,36] <- NULL

sample_poly2 <- uTrainConF[sample(nrow(uTrainConF),10000, replace=TRUE), ]
class_poly2 <- as.factor(sample_poly2[,36])
sample_poly2[,36] <- NULL

sample_rbf2 <- uTrainConF[sample(nrow(uTrainConF),10000, replace=TRUE), ]
class_rbf2 <- as.factor(sample_rbf2[,36])
sample_rbf2[,36] <- NULL

sample_poly32 <- uTrainConF[sample(nrow(uTrainConF),10000, replace=TRUE), ]
class_poly32 <- as.factor(sample_poly32[,36])
sample_poly32[,36] <- NULL


svm_rbf <- svm(sample_rbf, class_rbf,type="C-classification",kernel = "radial",gamma=1/20,cost=40)
pred_rbf <- predict(svm_rbf, uTest)

svm_poly3 <- svm(sample_poly3, class_poly3,type="C-classification",kernel = "polynomial", degree=3)
pred_poly3 <- predict(svm_poly3, uTest)

svm_poly2 <- svm(sample_poly2, class_poly2,type="C-classification",kernel = "polynomial", degree=2)
pred_poly2 <- predict(svm_poly2, uTest)

svm_rbf2 <- svm(sample_rbf2, class_rbf2,type="C-classification",kernel = "radial",gamma=1/20,cost=40)
pred_rbf2 <- predict(svm_rbf2, uTest)

svm_poly32 <- svm(sample_poly32, class_poly32,type="C-classification",kernel = "polynomial", degree=3)
pred_poly32 <- predict(svm_poly32, uTest)


pred_rbfb <- as.data.frame(pred_rbf)
id <- rownames(pred_rbfb)
pred_rbfb <- cbind(id=id, pred_rbfb)
names(pred_rbfb) <- c("ImageId","Label")

pred <- pred_rbfb

pred_poly3b <- as.data.frame(pred_poly3)
id <- rownames(pred_poly3b)
pred_poly3b <- cbind(id=id, pred_poly3b)
names(pred_poly3b) <- c("ImageId","Label")

pred_poly2b <- as.data.frame(pred_poly2)
id <- rownames(pred_poly2b)
pred_poly2b <- cbind(id=id, pred_poly2b)
names(pred_poly2b) <- c("ImageId","Label")

pred_rbf2b <- as.data.frame(pred_rbf2)
id <- rownames(pred_rbf2b)
pred_rbf2b <- cbind(id=id, pred_rbf2b)
names(pred_rbf2b) <- c("ImageId","Label")

pred_poly32b <- as.data.frame(pred_poly32)
id <- rownames(pred_poly32b)
pred_poly32b <- cbind(id=id, pred_poly32b)
names(pred_poly32b) <- c("ImageId","Label")


for (j in 1:28000){
  preds <- c(as.numeric(as.character(pred_rbfb[j,2])),as.numeric(as.character(pred_poly3b[j,2])),as.numeric(as.character(pred_poly2b[j,2])),as.numeric(as.character(pred_rbf2b[j,2])),as.numeric(as.character(pred_poly32b[j,2])))
  valor <- sort(table(preds),decreasing=TRUE)[1]
  if (valor >= 2){
    pred[j,2] <- as.numeric(names(valor))
  }
}

i <- 3
preds <- c(9,as.numeric(as.character(pred_rbfb[i,2])),as.numeric(as.character(pred_poly3b[i,2])),as.numeric(as.character(pred_poly2b[i,2])))
preds
dupli <- anyDuplicated(preds)
dupli
if (dupli != 0){
  pred[i,2] <- preds[dupli]
  #print(preds[dupli])
  print(pred[i,2])
}
valor <- sort(table(preds),decreasing=TRUE)[1]
valor[2]
valor == 9
as.numeric(names(valor))
pred[i,2] <- valor
#print(preds[dupli])
print(pred[i,2])


all(pred==pred_rbfb)
write.table (pred,file="ensamble de 5 svm resto igual.csv",row.names=FALSE,col.names=TRUE,quote=FALSE,sep=",")

