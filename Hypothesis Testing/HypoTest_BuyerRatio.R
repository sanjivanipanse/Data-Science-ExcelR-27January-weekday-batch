install.packages("nortest")
install.packages("BSDA")
library("nortest")
library(BSDA)

## Ho= Proportions of Male and Female buyer ratios are same across regions.

## Ha= Proportions of Male and Female buyer ratios are not same across regions.
Salesd<-read.csv(file.choose()) # BuyerRatio_modified.csv
View(Salesd)

#############Normality test###############

ad.test(Salesd$Sales)
#p-value = 0.05753,   > 0.05, hence we do not reject Ho.  Data is normal.


## 2 way ANOVA test

attach(Salesd)
res.aov2 <- aov(Sales ~ Gender + Region , data = Salesd)
summary(res.aov2)

# p-value = 0.029 < 0.05  => Reject null hypothesis
# => Proportions of Male and Female buyer ratios are not same. (Not all proportions are equal)
# p-value for Region = 0.389 > 0.05 => Do not reject null hypothesis
# => Proportions of buyer ratios in different regions are not same . (Not all proportions are equal)





