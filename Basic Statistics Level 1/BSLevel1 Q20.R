
carsdata<-read.csv(file.choose())
View(MPG)

MPG <- carsdata$MPG


#P(MPG > 38)
pp <- (length(which(MPG > 38)))/length(MPG)
cat("\n P(MPG > 38)  = ",pp, "\n")

#P(MPG < 40)
pp <- (length(which(MPG < 40)))/length(MPG)
cat("\n P(MPG < 40)  = ",pp, "\n")

#P(20 < MPG < 50)
pp <- (length(which(MPG < 50)) - length(which(MPG < 20)))/length(MPG)
cat("\n P(20 < MPG < 50)  = ",pp, "\n")