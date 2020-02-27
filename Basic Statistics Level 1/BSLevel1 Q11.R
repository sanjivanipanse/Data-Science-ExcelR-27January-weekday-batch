# Confidence interval

sampmean <- 200
sampsd <- 30

# sample size is nn
nn = 2000

# For 99% confidence interval alpha = 1 - 0.99 = 0.01
alpha = 0.01

# Calculate the critical z-score
z = qnorm(1-alpha/2)
z
err <- z*sampsd/sqrt(nn)
err
# Compute the CI
ci <- sampmean + c(-1,1)*err

cat("\n Sample Mean =  ", sampmean,"\n")

cat("\n Sample Standard Deviation = ",sampsd,"\n")

cat("\n Lower Limit of Confidence interval ", ci[1],"\n")
cat("\n Upper Limit of Confidence interval ", ci[2],"\n")