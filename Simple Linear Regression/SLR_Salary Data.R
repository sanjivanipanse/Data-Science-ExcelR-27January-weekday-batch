
library(readr)
library(tidyverse)

sal_data <- read_csv(file.choose())          # Load salary_data.csv dataset
View(sal_data)

# Exploratory data analysis
summary(sal_data)

#Scatter plot
plot(sal_data$YearsExperience, sal_data$Salary)  # plot(X,Y)

attach(sal_data)


#Correlation Coefficient (r)
cor(YearsExperience, Salary)             # cor(X,Y)

# since correleation coefficient is 0.9782416, the correlation is strong positive

# Simple Linear Regression model
reg <- lm(Salary ~ YearsExperience)             # lm(Y ~ X)

summary(reg)

pred <- predict(reg)
View(pred)

sqrt(mean(reg$residuals^2))
#RMSE is 5592.044

confint(reg,level=0.95)
predict(reg,interval="predict")

# ggplot for adding regresion line for data
library(ggplot2)

ggplot(data = sal_data, aes(x = YearsExperience, y = Salary)) + 
     geom_point(color='blue') +
     geom_line(color='red',data = sal_data, aes(x = YearsExperience, y = pred))


cor(log(YearsExperience), Salary) 
cor(YearsExperience, log(Salary)) 
cor(YearsExperience*YearsExperience, Salary) 


## Even after trying various transformations the correlation coefficient does not go above 0.9782416
# Hence, 
# Final model is 
# Salary =  14928 + 40582 * YearsExperience


###############################




