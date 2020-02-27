

scores <- c(34,36,36,38,38,39,39,40,40,41,41,41,41,42,42,45,49,56)
library(moments)

cat("\n Mean of Scores = ",mean(scores), "\n")
cat("\n Median of Scores = ",median(scores), "\n")
cat("\n Variance of Scores = ",var(scores), "\n")
cat("\n Standard Deviation of Scores = ",sd(scores), "\n")
cat("\n Skewness of Scores = ",skewness(scores), "\n")
cat("\n Kurtosis of Scores = ",kurtosis(scores), "\n")


