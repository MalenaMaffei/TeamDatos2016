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
# testTrainU <- u[,1:50]
uTrain <- as.data.frame(testTrainU[28001:70000,])
uTest <- as.data.frame(testTrainU[1:28000,])
class <- as.factor(train$label)
#primero hago nuestro clasificador de siempre
svm_model <- svm(uTrain, class,type="C-classification",kernel = "radial",gamma=1/20,cost=64)
svm_prediction <- predict(svm_model, uTest)
svm_prediction <- as.data.frame(svm_prediction)
id <- rownames(svm_prediction)
svm_prediction <- cbind(id=id, svm_prediction)
names(svm_prediction) <- c("ImageId","Label")
#voy a reclasificar todos pero con menos dimensiones (15)
testTrainU2 <- u[,1:15]

  uTrain2 <- as.data.frame(testTrainU2[28001:70000,])
uTest2 <- as.data.frame(testTrainU2[1:28000,])
uTrainConF <- cbind(uTrain2,train[,1]) #vuelvo a unir train con su etiqueta

#creo 8 modelos pero con menos gamma y menos costo... (1/10 c=10) por ahira el mejor p/ may simple
g = 1/10
c = 10
sample_size = 10000
sample_rbf <- uTrainConF[sample(nrow(uTrainConF),sample_size, replace=TRUE), ]
class_rbf <- as.factor(sample_rbf[,16])
sample_rbf[,16] <- NULL
svm_rbf1 <- svm(sample_rbf, class_rbf,type="C-classification",kernel = "radial",gamma=g,cost=c)

sample_rbf <- uTrainConF[sample(nrow(uTrainConF),sample_size, replace=TRUE), ]
class_rbf <- as.factor(sample_rbf[,16])
sample_rbf[,16] <- NULL
svm_rbf2 <- svm(sample_rbf, class_rbf,type="C-classification",kernel = "radial",gamma=g,cost=c)

sample_rbf <- uTrainConF[sample(nrow(uTrainConF),sample_size, replace=TRUE), ]
class_rbf <- as.factor(sample_rbf[,16])
sample_rbf[,16] <- NULL
svm_rbf3 <- svm(sample_rbf, class_rbf,type="C-classification",kernel = "radial",gamma=g,cost=c)

sample_rbf <- uTrainConF[sample(nrow(uTrainConF),sample_size, replace=TRUE), ]
class_rbf <- as.factor(sample_rbf[,16])
sample_rbf[,16] <- NULL
svm_rbf4 <- svm(sample_rbf, class_rbf,type="C-classification",kernel = "radial",gamma=g,cost=c)

sample_rbf <- uTrainConF[sample(nrow(uTrainConF),sample_size, replace=TRUE), ]
class_rbf <- as.factor(sample_rbf[,16])
sample_rbf[,16] <- NULL
svm_rbf5 <- svm(sample_rbf, class_rbf,type="C-classification",kernel = "radial",gamma=g,cost=c)

sample_rbf <- uTrainConF[sample(nrow(uTrainConF),sample_size, replace=TRUE), ]
class_rbf <- as.factor(sample_rbf[,16])
sample_rbf[,16] <- NULL
svm_rbf6 <- svm(sample_rbf, class_rbf,type="C-classification",kernel = "radial",gamma=g,cost=c)

sample_rbf <- uTrainConF[sample(nrow(uTrainConF),sample_size, replace=TRUE), ]
class_rbf <- as.factor(sample_rbf[,16])
sample_rbf[,16] <- NULL
svm_rbf7 <- svm(sample_rbf, class_rbf,type="C-classification",kernel = "radial",gamma=g,cost=c)

sample_rbf <- uTrainConF[sample(nrow(uTrainConF),sample_size, replace=TRUE), ]
class_rbf <- as.factor(sample_rbf[,16])
sample_rbf[,16] <- NULL
svm_rbf8 <- svm(sample_rbf, class_rbf,type="C-classification",kernel = "radial",gamma=g,cost=c)

sample_rbf <- uTrainConF[sample(nrow(uTrainConF),sample_size, replace=TRUE), ]
class_rbf <- as.factor(sample_rbf[,16])
sample_rbf[,16] <- NULL
svm_rbf9 <- svm(sample_rbf, class_rbf,type="C-classification",kernel = "radial",gamma=g,cost=c)

sample_rbf <- uTrainConF[sample(nrow(uTrainConF),sample_size, replace=TRUE), ]
class_rbf <- as.factor(sample_rbf[,16])
sample_rbf[,16] <- NULL
svm_rbf10 <- svm(sample_rbf, class_rbf,type="C-classification",kernel = "radial",gamma=g,cost=c)

sample_rbf <- uTrainConF[sample(nrow(uTrainConF),sample_size, replace=TRUE), ]
class_rbf <- as.factor(sample_rbf[,16])
sample_rbf[,16] <- NULL
svm_rbf11 <- svm(sample_rbf, class_rbf,type="C-classification",kernel = "radial",gamma=g,cost=c)

sample_rbf <- uTrainConF[sample(nrow(uTrainConF),sample_size, replace=TRUE), ]
class_rbf <- as.factor(sample_rbf[,16])
sample_rbf[,16] <- NULL
svm_rbf12 <- svm(sample_rbf, class_rbf,type="C-classification",kernel = "radial",gamma=g,cost=c)

sample_rbf <- uTrainConF[sample(nrow(uTrainConF),sample_size, replace=TRUE), ]
class_rbf <- as.factor(sample_rbf[,16])
sample_rbf[,16] <- NULL
svm_rbf13 <- svm(sample_rbf, class_rbf,type="C-classification",kernel = "radial",gamma=g,cost=c)

sample_rbf <- uTrainConF[sample(nrow(uTrainConF),sample_size, replace=TRUE), ]
class_rbf <- as.factor(sample_rbf[,16])
sample_rbf[,16] <- NULL
svm_rbf14 <- svm(sample_rbf, class_rbf,type="C-classification",kernel = "radial",gamma=g,cost=c)

sample_rbf <- uTrainConF[sample(nrow(uTrainConF),sample_size, replace=TRUE), ]
class_rbf <- as.factor(sample_rbf[,16])
sample_rbf[,16] <- NULL
svm_rbf15 <- svm(sample_rbf, class_rbf,type="C-classification",kernel = "radial",gamma=g,cost=c)

#aca hago predecir a c/uno ojo ocn uTest cambiar a 4 o 5
pred_rbf1 <- predict(svm_rbf1, uTest2)
pred_rbf2 <- predict(svm_rbf2, uTest2)
pred_rbf3 <- predict(svm_rbf3, uTest2)
pred_rbf4 <- predict(svm_rbf4, uTest2)
pred_rbf5 <- predict(svm_rbf5, uTest2)
pred_rbf6 <- predict(svm_rbf6, uTest2)
pred_rbf7 <- predict(svm_rbf7, uTest2)
pred_rbf8 <- predict(svm_rbf8, uTest2)
pred_rbf9 <- predict(svm_rbf9, uTest2)
pred_rbf10 <- predict(svm_rbf10, uTest2)
pred_rbf11 <- predict(svm_rbf11, uTest2)
pred_rbf12 <- predict(svm_rbf12, uTest2)
pred_rbf13 <- predict(svm_rbf13, uTest2)
pred_rbf14 <- predict(svm_rbf14, uTest2)
pred_rbf15 <- predict(svm_rbf15, uTest2)

pred_rbfb1 <- as.data.frame(pred_rbf1)
id <- rownames(pred_rbfb1)
pred_rbfb1 <- cbind(id=id, pred_rbfb1)
names(pred_rbfb1) <- c("ImageId","Label")

pred_rbfb2 <- as.data.frame(pred_rbf2)
id <- rownames(pred_rbfb2)
pred_rbfb2 <- cbind(id=id, pred_rbfb2)
names(pred_rbfb2) <- c("ImageId","Label")

pred_rbfb3 <- as.data.frame(pred_rbf3)
id <- rownames(pred_rbfb3)
pred_rbfb3 <- cbind(id=id, pred_rbfb3)
names(pred_rbfb3) <- c("ImageId","Label")

pred_rbfb4 <- as.data.frame(pred_rbf4)
id <- rownames(pred_rbfb4)
pred_rbfb4 <- cbind(id=id, pred_rbfb4)
names(pred_rbfb4) <- c("ImageId","Label")

pred_rbfb5 <- as.data.frame(pred_rbf5)
id <- rownames(pred_rbfb5)
pred_rbfb5 <- cbind(id=id, pred_rbfb5)
names(pred_rbfb5) <- c("ImageId","Label")

pred_rbfb6 <- as.data.frame(pred_rbf6)
id <- rownames(pred_rbfb6)
pred_rbfb6 <- cbind(id=id, pred_rbfb6)
names(pred_rbfb6) <- c("ImageId","Label")

pred_rbfb7 <- as.data.frame(pred_rbf7)
id <- rownames(pred_rbfb7)
pred_rbfb7 <- cbind(id=id, pred_rbfb7)
names(pred_rbfb7) <- c("ImageId","Label")

pred_rbfb8 <- as.data.frame(pred_rbf8)
id <- rownames(pred_rbfb8)
pred_rbfb8 <- cbind(id=id, pred_rbfb8)
names(pred_rbfb8) <- c("ImageId","Label")

pred_rbfb9 <- as.data.frame(pred_rbf9)
id <- rownames(pred_rbfb9)
pred_rbfb9 <- cbind(id=id, pred_rbfb9)
names(pred_rbfb9) <- c("ImageId","Label")

pred_rbfb10 <- as.data.frame(pred_rbf10)
id <- rownames(pred_rbfb10)
pred_rbfb10 <- cbind(id=id, pred_rbfb10)
names(pred_rbfb10) <- c("ImageId","Label")

pred_rbfb11 <- as.data.frame(pred_rbf11)
id <- rownames(pred_rbfb11)
pred_rbfb11 <- cbind(id=id, pred_rbfb11)
names(pred_rbfb11) <- c("ImageId","Label")

pred_rbfb12 <- as.data.frame(pred_rbf12)
id <- rownames(pred_rbfb12)
pred_rbfb12 <- cbind(id=id, pred_rbfb12)
names(pred_rbfb12) <- c("ImageId","Label")

pred_rbfb13 <- as.data.frame(pred_rbf13)
id <- rownames(pred_rbfb13)
pred_rbfb13 <- cbind(id=id, pred_rbfb13)
names(pred_rbfb13) <- c("ImageId","Label")

pred_rbfb14 <- as.data.frame(pred_rbf14)
id <- rownames(pred_rbfb14)
pred_rbfb14 <- cbind(id=id, pred_rbfb14)
names(pred_rbfb14) <- c("ImageId","Label")

pred_rbfb15 <- as.data.frame(pred_rbf15)
id <- rownames(pred_rbfb15)
pred_rbfb15 <- cbind(id=id, pred_rbfb15)
names(pred_rbfb15) <- c("ImageId","Label")
#


pred <- svm_prediction
#pred <- pred_rbfb1 #para inicializar con un data frame valido


for (j in 1:28000){
  #preds <- c(as.numeric(as.character(pred_rbfb1[j,2])),as.numeric(as.character(pred_rbfb2[j,2])),as.numeric(as.character(pred_rbfb3[j,2])),as.numeric(as.character(pred_rbfb4[j,2])),as.numeric(as.character(pred_rbfb5[j,2])),as.numeric(as.character(pred_rbfb6[j,2])),as.numeric(as.character(pred_rbfb7[j,2])),as.numeric(as.character(pred_rbfb8[j,2])),as.numeric(as.character(pred_rbfb9[j,2])),as.numeric(as.character(pred_rbfb10[j,2])),as.numeric(as.character(pred_rbfb11[j,2])),as.numeric(as.character(pred_rbfb12[j,2])),as.numeric(as.character(pred_rbfb13[j,2])),as.numeric(as.character(pred_rbfb14[j,2])),as.numeric(as.character(pred_rbfb15[j,2])))
  #con solo 8
  preds <- c(as.numeric(as.character(pred_rbfb1[j,2])),as.numeric(as.character(pred_rbfb2[j,2])),as.numeric(as.character(pred_rbfb3[j,2])),as.numeric(as.character(pred_rbfb4[j,2])),as.numeric(as.character(pred_rbfb5[j,2])),as.numeric(as.character(pred_rbfb6[j,2])),as.numeric(as.character(pred_rbfb7[j,2])),as.numeric(as.character(pred_rbfb8[j,2])))
  #valor <- sort(table(preds),decreasing=TRUE)[1]
  if (valor >= 6){
    pred[j,2] <- as.numeric(names(valor))
  }
  #pred[j,2] <- as.numeric(names(valor))
}

all(pred==svm_prediction)
write.table (pred,file="8 rbf g0.1 c10 mayora5.csv",row.names=FALSE,col.names=TRUE,quote=FALSE,sep=",")
