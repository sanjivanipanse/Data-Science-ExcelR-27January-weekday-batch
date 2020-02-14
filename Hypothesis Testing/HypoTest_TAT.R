install.packages("nortest")
install.packages("BSDA")
library("nortest")
library(BSDA)

alpha = 0.05
# Ho : Mean turn around time for all laboratories are the same
# Ha : Atleast one of the means is different from the others

v_tat <- read.csv(file.choose())
View(v_tat)
summary(v_tat)
stacked <- stack(v_tat)
View(stacked)
#############Normality test###############

ad.test(stacked$values)
#p-value = 0.05072,   > 0.05, hence we do not reject Ho.  Data is normal.

############# Variance test ###############
library(car)
leveneTest(stacked$values~stacked$ind, data = stacked)   #Test for equal Variance
#p-value = 0.05161 > 0.05, hence we do not reject Ho.   Variances are equal.

## ANOVA test

Anova_results <- aov(values~ind,data = stacked)
summary(Anova_results)

#p-value = 118.7 <2e-16, Since p-value is low we reject null hypothesis
#Conclusion : There is a significant difference in the average Turn Around Time (TAT) 
#among the different laboratories 



