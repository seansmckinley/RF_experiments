
library(randomForest)


print("Loading iris...")
data(iris)

invisible(if (file.exists("importance.csv")){
	     file.remove("importance.csv")
})

invisible(if (file.exists("importance.csv")){
	     file.remove("importance.csv")
})

for (i in 1:25){
    test  <- iris[ c(1:10, 51:60, 101:110), -5]  # removed the Species column here.
    permute <- c(sample(11:50), sample(61:100), sample(111:150))
    train <- iris[ permute,]
    iris.rf <- randomForest(Species ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width, 
    data=train, 
    importance=T, 
    do.trace=1000, 
    ntree = 1000) 
    imp <- importance(iris.rf)
    write.table(imp, file = "importance.csv", append = T, sep =" ", eol ="\n", row.names = T, col.names = T)
    write.table(c("\n"), file = "importance.csv", append = T, sep =" ", eol ="\n", row.names = F, col.names = F)

}



