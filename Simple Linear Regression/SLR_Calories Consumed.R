
library(readr)
library(tidyverse)

cal_con <- read_csv(file.choose())          # Load calories_consumed.csv dataset
View(cal_con)

# Exploratory data analysis
summary(cal_con)

#Scatter plot
plot(cal_con$`Calories Consumed`, cal_con$`Weight gained (grams)`)  # plot(X,Y)

attach(cal_con)


#Correlation Coefficient (r)
cor(`Calories Consumed`, `Weight gained (grams)`)             # cor(X,Y)

# since correleation coefficient is 0.946991, the correlation is strong positive

# Simple Linear Regression model
reg <- lm(`Weight gained (grams)` ~ `Calories Consumed`)             # lm(Y ~ X)

summary(reg)
?predict
pred <- predict(reg)
View(pred)
reg$residuals

sqrt(sum(reg$residuals^2)/nrow(cal_con))  #RMSE

sqrt(mean(reg$residuals^2))

confint(reg,level=0.95)
predict(reg,interval="predict")

# ggplot for adding regresion line for data
library(ggplot2)

ggplot(data = cal_con, aes(x = `Calories Consumed`, y = `Weight gained (grams)`)) + 
     geom_point(color='blue') +
     geom_line(color='red',data = cal_con, aes(x = `Calories Consumed`, y = pred))


############# Transform calories consumed to x-square

# x = (calories consumed)-square; y = weight gained

cal_con$calsq = `Calories Consumed`*`Calories Consumed`
attach(cal_con)
plot(calsq, `Weight gained (grams)`)
cor(calsq, `Weight gained (grams)`)
# correlation coefficient = 0.9710636

reg_sq <- lm(`Weight gained (grams)` ~ calsq)   # lm(Y ~ X)
summary(reg_sq)
reg_sq$coefficients
predict(reg_sq)
sqrt(sum(reg_sq$residuals^2)/nrow(cal_con)) #RMSE

confint(reg_sq,level=0.95)
predict(reg_sq,interval="confidence")

###############################



