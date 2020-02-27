
datacars <- read.csv('D:/SSP/Data Science ExcelR/BasicStatsLevel1 Q7.csv')

# Create the function for mode
getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

cat("\n Mean of Points = ",mean(datacars$Points), "\n")
cat("\n Mean of Score = ",mean(datacars$Score), "\n")
cat("\n Mean of Weight = ",mean(datacars$Weigh), "\n")

cat("\n Median of Points = ",median(datacars$Points), "\n")
cat("\n Median of Score = ",median(datacars$Score), "\n")
cat("\n Median of Weight = ",median(datacars$Weigh), "\n")

cat("\n Mode of Points = ",getmode(datacars$Points), "\n")
cat("\n Mode of Score = ",getmode(datacars$Score), "\n")
cat("\n Mode of Weight = ",getmode(datacars$Weigh), "\n")


cat("\n Variance of Points = ",var(datacars$Points), "\n")
cat("\n Variance of Score = ",var(datacars$Score), "\n")
cat("\n Variance of Weight = ",var(datacars$Weigh), "\n")

cat("\n Standard Deviation of Points = ",sd(datacars$Points), "\n")
cat("\n Standard Deviation of Score = ",sd(datacars$Score), "\n")
cat("\n Standard Deviation of Weight = ",sd(datacars$Weigh), "\n")

cat("\n Range of Points = ",max(datacars$Points) - min(datacars$Points), "\n")
cat("\n Range of Score = ",max(datacars$Score) - min(datacars$Score), "\n")
cat("\n Range of Weight = ",max(datacars$Weigh) - min(datacars$Weigh), "\n")

summary(datacars)

