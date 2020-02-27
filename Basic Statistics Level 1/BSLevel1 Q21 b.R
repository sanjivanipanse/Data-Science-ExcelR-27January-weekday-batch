
wcat<-read.csv(file.choose())
View(wcat)

wcf <- wcat$Waist
adt <- wcat$AT

library(ggplot2)
qqnorm(wcf, pch = 1, main = "Normal Q-Q Plot for WC", frame=FALSE)
qqline(wcf, col = "steelblue", lwd = 2)

qqnorm(adt, pch = 1, main = "Normal Q-Q Plot for AT", frame=FALSE)
qqline(adt, col = "steelblue", lwd = 2)


