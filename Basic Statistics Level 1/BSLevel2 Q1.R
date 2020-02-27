
library(stringr)
company<-read.csv(file.choose())
View(company)

company$ValueX <- as.numeric(str_remove(company$Measure.X, "[%]"))

#Remove ValueX column
#company <- subset(company, select = -c(ValueX))

cat("\n Mean of Company = ",mean(company$ValueX), "\n")
cat("\n Standard Deviation of Company = ",sd(company$ValueX), "\n")
cat("\n Variance of Company = ",var(company$ValueX), "\n")


boxplot(company$ValueX)$out
cat("\n Outlier of the data is = ",boxplot(company$ValueX)$out, "\n")
boxplot(company$ValueX, main = "Boxplot MeasureX", horizontal = TRUE, col = "LightBlue", pch = 19)
