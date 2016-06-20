set.seed(415)
model <- naiveBayes(as.factor(Class) ~ ., data = uTrainConF[1:35700,])
testDeTrain <- uTrainConF[35701:42000,-62]
naive <- predict(model, testDeTrain)
table(naive, uTrainConF[35701:42000,]$Class)


forestCross <- randomForest(as.factor(Class)~., data=uTrainConF[1:35700,],importance = TRUE, ntree = 500, mtry=4)
# varImpPlot(forest) 
testDeCross <- uTrainConF[35701:42000,-62]
predictionCross <- predict(forestCross, testDeCross)
normL4 <- table(predictionCross, uTrainConF[35701:42000,]$Class)
trees800








names(train3)[names(train3)=="train$label"] <- "Class"
forestCross <- randomForest(as.factor(Class)~., data=train3[1:35700,],importance = TRUE, ntree = 500)
# varImpPlot(forest) 
testDe3 <- train3[35701:42000,-62]
predictionCross <- predict(forestCross, testDe3)
para3 <- table(predictionCross, train3[35701:42000,]$Class)

para3 <- table(predictionCross, train3[35701:42000,]$Class)


names(train8)[names(train8)=="train$label"] <- "Class"
forestCross8 <- randomForest(as.factor(Class)~., data=train8[1:35700,],importance = TRUE, ntree = 500)
# varImpPlot(forest) 
testDe8 <- train8[35701:42000,-62]
predictionCross8 <- predict(forestCross8, testDe8)

para8 <- table(predictionCross8, train8[35701:42000,]$Class)

names(train9)[names(train9)=="train$label"] <- "Class"
forestCross9 <- randomForest(as.factor(Class)~., data=train9[1:35700,],importance = TRUE, ntree = 500)
# varImpPlot(forest) 
testDe9 <- train9[35701:42000,-62]
predictionCross9 <- predict(forestCross9, testDe9)

para9 <- table(predictionCross9, train9[35701:42000,]$Class)


names(train5)[names(train5)=="train$label"] <- "Class"
forestCross5 <- randomForest(as.factor(Class)~., data=train5[1:35700,],importance = TRUE, ntree = 500)
# varImpPlot(forest) 
testDe5 <- train5[35701:42000,-62]
predictionCross5 <- predict(forestCross5, testDe5)

para5 <- table(predictionCross5, train5[35701:42000,]$Class)



#con todo el set

names(train3)[names(train3)=="train$label"] <- "Class"
forest3 <- randomForest(as.factor(Class)~., data=train3,importance = FALSE, ntree = 500)


rf3 <- predict(forestCross, uTest)
rf3 <- as.data.frame(rf3)

names(train8)[names(train8)=="train$label"] <- "Class"
forest8 <- randomForest(as.factor(Class)~., data=train8,importance = FALSE, ntree = 500)
rf8 <- predict(forestCross8, uTest)
rf8 <- as.data.frame(rf8)

names(train9)[names(train9)=="train$label"] <- "Class"
forest9 <- randomForest(as.factor(Class)~., data=train9,importance = FALSE, ntree = 500)
rf9 <- predict(forest9, uTest)
rf9 <- as.data.frame(rf9)

names(train5)[names(train5)=="train$label"] <- "Class"
forest5 <- randomForest(as.factor(Class)~., data=train5,importance = FALSE, ntree = 500)
# varImpPlot(forest) 
rf5 <- predict(forest5, uTest)
rf5<-as.data.frame(rf5)



forest3Tune <- tuneRF(train3[,-62], train3[,62],  ntreeTry=50, stepFactor=2, improve=0.05,
                      trace=TRUE, plot=TRUE, doBest=TRUE)
rf3 <- predict(forest3Tune, uTest)
rf3 <- as.data.frame(rf3)

forest5Tune <- tuneRF(train5[,-62], train5[,62], ntreeTry=50, stepFactor=2, improve=0.05,
                      trace=TRUE, plot=TRUE, doBest=TRUE)
rf5 <- predict(forest5Tune, uTest)
rf5<-as.data.frame(rf5)

forest8Tune <- tuneRF(train8[,-62], train8[,62], ntreeTry=50, stepFactor=2, improve=0.05,
                      trace=TRUE, plot=TRUE, doBest=TRUE)
rf8 <- predict(forest8Tune, uTest)
rf8 <- as.data.frame(rf8)

forest9Tune <- tuneRF(train9[,-62], train9[,62],  ntreeTry=50, stepFactor=2, improve=0.05,
                      trace=TRUE, plot=TRUE, doBest=TRUE)
rf9 <- predict(forest9Tune, uTest)
rf9 <- as.data.frame(rf9)

write.table (rf9,file="rf9.csv",row.names=FALSE,col.names=TRUE,quote=FALSE,sep=",")
write.table (rf8,file="rf8.csv",row.names=FALSE,col.names=TRUE,quote=FALSE,sep=",")
write.table (rf5,file="rf5.csv",row.names=FALSE,col.names=TRUE,quote=FALSE,sep=",")
write.table (rf3,file="rf3.csv",row.names=FALSE,col.names=TRUE,quote=FALSE,sep=",")
