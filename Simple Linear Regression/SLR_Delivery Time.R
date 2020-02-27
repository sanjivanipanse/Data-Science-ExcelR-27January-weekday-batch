
library(readr)
library(tidyverse)

del_time <- read_csv(file.choose())          # Load delivery_time.csv dataset
View(del_time)

# Exploratory data analysis
summary(del_time)

#Scatter plot
plot(del_time$`Sorting Time`, del_time$`Delivery Time`)  # plot(X,Y)

attach(del_time)


#Correlation Coefficient (r)
cor(`Sorting Time`, `Delivery Time`)             # cor(X,Y)

# since correleation coefficient is 0.8259973, the correlation is strong positive

# Simple Linear Regression model
reg <- lm(`Delivery Time` ~ `Sorting Time`)             # lm(Y ~ X)

summary(reg)

pred <- predict(reg)
View(pred)

sqrt(mean(reg$residuals^2))
#RMSE is 2.79165 which is good

confint(reg,level=0.95)
predict(reg,interval="predict")

# ggplot for adding regresion line for data
library(ggplot2)

ggplot(data = del_time, aes(x = `Sorting Time`, y = `Delivery Time`)) + 
     geom_point(color='blue') +
     geom_line(color='red',data = del_time, aes(x = `Sorting Time`, y = pred))


############# Transform sorting time to log(sorting time)#############

# x = log(sorting time); y = delivery time

del_time$logsort = log(`Sorting Time`)
attach(del_time)
plot(logsort, `Delivery Time`)
cor(logsort, `Delivery Time`)
# correlation coefficient = 0.8339325 shows marginal increase

#### We will make a different transformation by taking log(delivery time)

del_time$logdel = log(`Delivery Time`)
attach(del_time)
plot(`Sorting Time`, logdel)
cor(`Sorting Time`, logdel)
# correlation coefficient = 0.8431773 shows marginal increase


# Still for a better correlation, we take log(sort) and log(delivery time) both
cor(logsort, logdel)
# correlation coefficient = 0.8787271 shows very good increase
reglog <- lm(logdel ~ logsort)             # lm(Y ~ X)

summary(reglog)

pred <- predict(reglog)
View(pred)
pred_del <- exp(pred)               ##Back transform Y values
View(pred_del)
error = del_time$`Delivery Time` - pred_del
error

sqrt(sum(error^2)/nrow(del_time))  #RMSE
#RMSE is 2.745829 which has reduced , hence model has improved


confint(reglog,level=0.95)
predict(reglog,interval="confidence")

# Final model is 
#log(Delivery Time) = 1.74199 + 0.59752 * log(Sorting Time)



###############################
