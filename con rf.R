#este re clasifica binariamente a los 5 y 4
library(MASS)
library(class)
library(e1071)
library(IM)
library(png)
library(ggplot2)
library(OIdata)
library(gridExtra)
library(randomForest)
library(party)
source("creador ensambles.R")
test <- read.csv("./test.csv")
train <- read.csv("./train.csv")
centroides <- read.csv("./centroides.csv",header=FALSE)
juntoS <- read.csv("./probs suave.csv")
juntoP <- read.csv("./probs polar.csv")
junto <- read.csv("./probs normal.csv")
polares <- read.csv("./polares.csv", header = FALSE)
u<- read.csv("./U.csv", header = FALSE)
svm9 <- read.csv("./svm 9 61dims junto.csv")
svm8 <- read.csv("./svm 8 61dims junto.csv")
svm5 <- read.csv("./svm 5 61dims junto.csv")
svm3 <- read.csv("./svm 3 61dims junto.csv")

# train.features = train
# train.features$label <- NULL
# testTrain = rbind(test, train.features)


testTrainPol.svd <- svd(polares)
uPol <- testTrainPol.svd$u
testTrainUP <- uPol[,1:3]
testTrainUP <- scale(testTrainUP)



#con la u ya calculada
testTrainU <- u[,1:35]
testTrainU <- scale(testTrainU)
#agrego extras
centroides <- scale(centroides[,4])
testTrainU <- cbind(testTrainU,centroides)
testTrainU <- cbind(testTrainU,testTrainUP)

uTrain <- as.data.frame(testTrainU[28001:70000,])
uTest <- as.data.frame(testTrainU[1:28000,])
class <- as.factor(train$label)



svm_model <- svm(uTrain, class,type="C-classification",kernel = "radial",gamma=1/20,cost=40)
svm_prediction <- predict(svm_model, uTest)
svm_prediction <- as.data.frame(svm_prediction)



uTrainConF <- cbind(uTrain,train$label)
names(uTrainConF)[names(uTrainConF)=="train$label"] <- "Class"
set.seed(415)
forest <- randomForest(as.factor(Class)~., data=uTrainConF,importance = TRUE, ntree = 150)
# varImpPlot(forest) 
prediction <- predict(forest, uTest)
prediction <- as.data.frame(prediction)

# forestParty <- cforest(as.factor(Class)~.,
#                data = uTrainConF, 
#                controls=cforest_unbiased(ntree=100, mtry=6))
# 
# Prediction <- predict(forestParty, uTest, OOB=TRUE, type = "response")

prediction <- read.csv("./rf default 50u.csv")

pred <- data.frame()
pred <- as.data.frame(junto[,1])
id <- rownames(pred)
pred <- cbind(id=id, pred)
names(pred) <- c("ImageId","Label")

cambiados = 0
menores = 0
polares = 0
suaves = 0
nueve = 0
ocho = 0 
cinco = 0
random = 0
tres = 0
for (j in 1:28000){
  #for (j in 1:4200){
  digito <- as.numeric(as.character(junto[j,1]))
  if(junto[j,digito+2] < 0.7){
    menores = menores + 1
    
    #  if(juntoP[j,digito+2]>0.8){
    #   pred[j,2] <- as.numeric(as.character(juntoP[j,1]))
    #   polares = polares +1
    # }else if(juntoS[j, digito+2]>0.7){
    #   pred[j,2] <- as.numeric(as.character(juntoS[j,1]))
    #   suaves = suaves +1
    # }
#     if(as.numeric(as.character(svm9[j,1]))==9 && 9!=digito){
#       pred[j,2] <- as.numeric(as.character(prediction[j,1]))
#       # pred[j,2] <- prediction[j,2]
#       
#       random = random +1
#     }
#     else if(as.numeric(as.character(svm8[j,1]))==8 && 8!=digito){
#       pred[j,2] <- as.numeric(as.character(prediction[j,1]))
#       # pred[j,2] <- prediction[j,2]
#       random = random +1
#     }
#     else if(as.numeric(as.character(svm5[j,1]))==5 && 5!=digito){
#       pred[j,2] <- as.numeric(as.character(prediction[j,1]))
#       # pred[j,2] <- prediction[j,2]
#       
#       random = random +1
#     }
#     else if(as.numeric(as.character(svm3[j,1]))==3 && 3!=digito){
#       pred[j,2] <- as.numeric(as.character(prediction[j,1]))
#       # pred[j,2] <- prediction[j,2]
#       
#       random = random +1
#     }
#     else if(junto[j,digito+2] < 0.35){
#       pred[j,2] <- as.numeric(as.character(prediction[j,1]))
#       # pred[j,2] <- prediction[j,2]
#       random = random +1
#     }
    if(as.numeric(as.character(rf9[j,1]))==9  || as.numeric(as.character(svm9[j,1]))==9 ){
      pred[j,2] <- 9
      # pred[j,2] <- prediction[j,2]
      
      random = random +1
      nueve = nueve+1
    }
    else if(as.numeric(as.character(rf8[j,1]))==8 || as.numeric(as.character(svm8[j,1]))==8){
      pred[j,2] <- 8
      # pred[j,2] <- prediction[j,2]
      random = random +1
      ocho = ocho +1
    }
    else if(as.numeric(as.character(rf5[j,1]))==5 || as.numeric(as.character(svm5[j,1]))==5){
      pred[j,2] <- 5
      # pred[j,2] <- prediction[j,2]
      random = random +1
      cinco = cinco +1
    }
    else if(as.numeric(as.character(rf3[j,1]))==3 || as.numeric(as.character(svm3[j,1]))==3){
      pred[j,2] <- 3
      # pred[j,2] <- prediction[j,2]
      random = random +1
      tres = tres +1
    }
    else{
      pred[j,2] <- digito
    }
    # else{
    # 
    #   pred[j,2] <- as.numeric(as.character(prediction[j,1]))
    #   random = random + 1
    # }
    
    if(digito != pred[j,2] ){
      cambiados = cambiados + 1
      # print(digito)
    }
  }
  else{
    pred[j,2] <- digito
  }
}


# Trbffinal <- table(pred[,2], class[37801:42000])
# Trbffinal
cambiados
# qplot(1:10, 1:10, geom = "blank") +theme_bw() +theme(line = element_blank(),text = element_blank()) + annotation_custom(grob = tableGrob(Trbffinal),xmin = -Inf, xmax = Inf, ymin = -Inf, ymax = Inf)
menores

# polares
# suaves
random
nueve
ocho
cinco
tres
7
write.table (pred,file="svm de siempre 9 8 5 3 rf 6f tuned or svms menor .82.csv",row.names=FALSE,col.names=TRUE,quote=FALSE,sep=",")


id <- rownames(svm_prediction)
svm_predictionOut <- cbind(id=id, svm_prediction)
names(svm_predictionOut) <- c("ImageId","Label")

write.table (svm_predictionOut,file="svm con 3 cols polares.csv",row.names=FALSE,col.names=TRUE,quote=FALSE,sep=",")
















