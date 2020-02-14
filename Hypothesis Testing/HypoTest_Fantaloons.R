install.packages("nortest")
install.packages("BSDA")
library("nortest")
library(BSDA)
library(tidyverse)
require(stats)
ab<-read.csv(file.choose()) # Faltoons.csv
fant <- data.frame(ab)

View(fant)
str(fant)

# Build Chi square contingency table

rnam <- c(rep("Weekdays", 400), rep("Weekend", 400))
View(rnam)

#bind all columns in 1 column
ab<-rbind(as.matrix(fant$Weekdays), as.matrix(fant$Weekend))
View(ab)
#create 2 column matrix
finaldf<-cbind(rnam, ab)
View(finaldf)
#convert to dataframe
fdf <-data.frame(finaldf)
table(fdf$rnam, fdf$V2)
chisq.test(table(fdf$rnam, fdf$V2))

# p-value = 8.543e-05 = 0, which is < 0.05, hence, reject the null hypothesis
# Conclusion : Percentage of males versus females walking in to the store differ 
#                 based on day of the week

