install.packages("nortest")
install.packages("BSDA")
library("nortest")
library(BSDA)
library(tidyverse)
require(stats)
ab<-read.csv(file.choose()) # Customer+OrderForm.csv
ordfrm <- data.frame(ab)

View(ordfrm)
str(ordfrm)

# Build Chi square contingency table

rnam <- c(rep("Phillippines", 300), rep("Indonesia", 300), rep("Malta", 300), rep("India", 300))
View(rnam)


#bind all columns in 1 column
ab<-rbind(as.matrix(ordfrm$Phillippines), as.matrix(ordfrm$Indonesia),
            as.matrix(ordfrm$Malta), as.matrix(ordfrm$India))
#create 2 column matrix
finaldf<-cbind(rnam, ab)
View(finaldf)
#convert to dataframe
fdf <-data.frame(finaldf)
table(fdf$rnam, fdf$V2)
chisq.test(table(fdf$rnam, fdf$V2))

# p-value = 0.2771, which is > 0.05, hence, do not reject the null hypothesis
# Conclusion : Defective percentage does not vary by center

