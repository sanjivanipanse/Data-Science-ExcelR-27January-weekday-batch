
library(readr)
library(tidyverse)

emp_data <- read_csv(file.choose())          # Load emp_data.csv dataset
View(emp_data)

# Exploratory data analysis
summary(emp_data)

#Scatter plot
plot(emp_data$Salary_hike, emp_data$Churn_out_rate)  # plot(X,Y)

attach(emp_data)


#Correlation Coefficient (r)
cor(Salary_hike, Churn_out_rate)             # cor(X,Y)

# since correleation coefficient is -0.9117216, the correlation is strong negative

# Simple Linear Regression model
reg <- lm(Churn_out_rate ~ Salary_hike)             # lm(Y ~ X)

summary(reg)

pred <- predict(reg)
View(pred)

sqrt(mean(reg$residuals^2))
#RMSE is 3.997528 which is good

confint(reg,level=0.95)
predict(reg,interval="predict")

# ggplot for adding regresion line for data
library(ggplot2)

ggplot(data = emp_data, aes(x = Salary_hike, y = Churn_out_rate)) + 
     geom_point(color='blue') +
     geom_line(color='red',data = emp_data, aes(x = Salary_hike, y = pred))


############# Transform Salary Hike to 1/Salary Hike#############

# x = 1/salary_hike; y = churn out rate

emp_data$sal_rec = 1/Salary_hike
attach(emp_data)
plot(sal_rec, Churn_out_rate)

cor(sal_rec, Churn_out_rate)

# correlation coefficient = 0.9301463 shows very good increase in strength of correlation


regrec <- lm(Churn_out_rate ~ sal_rec)             # lm(Y ~ X)

summary(regrec)

predrec <- predict(regrec)
View(predrec)
sqrt(mean(regrec$residuals^2))         #RMSE

#RMSE is 3.57303 which has reduced, hence model has improved


confint(regrec,level=0.95)
predict(regrec,interval="confidence")

# Final model is 
#Churn_out_rate = -107.87 + 304462.43 * (1/salary_hike)


###############################
