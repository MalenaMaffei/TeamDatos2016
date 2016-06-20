#extrae los numeros que tienen mucha certeza

junto <- read.csv("./probs normal.csv")
test <- read.csv("./test.csv")
nuevos <- data.frame()

# names(nuevos) <- names(test)
selectedids <- c()
digitos <- c() 
for (j in 1:28000){
  digito <- as.numeric(as.character(junto[j,1]))
  if(junto[j,digito+2] > 0.99){
    digitos <- append(digitos,digito)
    selectedids <- append(selectedids,j)
  }
}

selectedids
digitos

nuevos <- test[selectedids,]
nuevos <- cbind(digitos,nuevos)
colnames(nuevos)[1] <- "label"
write.table (nuevos,file="train extra.csv",row.names=FALSE,col.names=TRUE,quote=FALSE,sep=",")



library(IM)

i <- 14

I <- as.numeric(nuevos[i,-1])
dim(I) <- c(28, 28)
I <- t(I)
displayImg(I)
