install.packages("nortest")
install.packages("BSDA")
library("nortest")

library(BSDA)

alpha = 0.05
# Ho : Mu1 = Mu2
# Ha : Mu1 <> Mu2
# where Mu1 and Mu2 are the population diameters of the cutlets of the two units
diam <- read.csv(file.choose())
View(diam)
summary(diam)


#Check for normality
ad.test(diam$Unit.A)
#p-value = 0.2866, hence the Unit.A data is normal
ad.test(diam$Unit.B)
#p-value = 0.6869, hence the Unit.B data is normal


#############Variance test###############
attach(diam)
var.test(Unit.A,Unit.B)
# p-value = 0.3136 > 0.05 so p high null fly => Variances are equal


#############2 samples t-test
# Since alternate hypothesis is "not equal to", we test for a two-sided t test
# For 5% level of signficance confidence level is 0.95
t.test(Unit.A,Unit.B,alternative = "two.sided",conf.level = 0.95,correct = TRUE)
#p-value = 0.4723, Since p-value is high we do not reject null hypothesis
#Conclusion : There is no significant difference in the diameter of the cutlets between two units




