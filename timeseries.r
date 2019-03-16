setwd("D:/R")
library(readr)
AAPL_Dec_Feb <- read.csv("AAPL.csv")
View(AAPL_Dec_Feb)
df<-AAPL_Dec_Feb
head(df)
str(df)
new_date <- as.Date(df$Date,format="%d-%m-%Y")
new_date
str(df)


#new_date <- format(new_date,tryFormats = c("%d-%m-%Y", "%d-%m-%y", "%Y/%m/%d", "%m/%d/%y"))

data = ts(df$Close,frequency =12)
plot(data,main="Monthly Closing Prices")
log(data)
decompose(data)
decompose(data, type='multi')
par(mfrow=c(1,2)) 
plot(decompose(data, type='multi')) 
library(forecast)

seasonplot(data)

lag(data,10)

lag.plot(data)

data

ac<-acf(data) 
ac$acf
pac<-pacf(data)

pac$acf

model <- lm(data~c(1:length(data))) 
summary(model)

plot(resid(model),type='l')


tbl <- stl(data,'periodic') 
stab<-seasadj(tbl) 
seasonplot(stab,12)
library(tseries) 
adf.test(data)

model2<-auto.arima(data) 
accuracy(model2)
plot(forecast(model2,h=12))
adf.test(diff(data))


plot(diff(data))

diff(data,differences = 3)

model3<-auto.arima(diff(data))

accuracy(model3)

acf(diff(data))

pacf(diff(data))

model4 <- Arima(diff(data),order=c(4,0,5)) 
model4
accuracy(model4)
model5 <- Arima(diff(data),order=c(4,0,4)) 
model5
accuracy(model5)
model6<-Arima(data,order=c(3,0,5)) 
model6
accuracy(model6)
model7<-Arima(diff(data),order=c(4,0,4)) 
model7
accuracy(model7)

model8<-Arima(diff(data),order=c(0,0,1)) 
model8
accuracy(model8)

model9<-Arima(diff(data),order=c(1,0,0)) 
model9
accuracy(model9)
model10<-Arima(diff(data),order=c(1,0,1)) 
model10
accuracy(model10)
model11<-Arima(diff(data),order=c(1,0,2)) 
model11
accuracy(model11)
model12<-Arima(diff(data),order=c(1,1,3)) 
model12
accuracy(model12)

par(mfrow=c(1,2)) 
plot(forecast(model5,h=12))
model4<-HoltWinters(data,beta = F, gamma = F) 
summary(model4)
library(forecast) 
plot(forecast(model4,12))
model5<-HoltWinters(data,gamma = F) 
summary(model5)

model5

plot(forecast(model5,12))
plot(log(data))
model6<-HoltWinters(data)
summary(model6)
model6
plot(log(data))
plot(forecast(model6,12))
model7<-ets(data)
summary(model7)
accuracy(model7)
plot(log(data))
plot(forecast(model7,12))


#d. After 15 days again collect the data and compare with your forecast

library(readr)
AAPL_1Mar_14Mar <- read.csv("AAPL_1Mar_14Mar.csv")
View(AAPL_1Mar_14Mar)
df<-AAPL_1Mar_14Mar
head(df)
str(df)
new_date <- as.Date(df$Date,format="%d-%m-%Y")
new_date

str(df)
#format(new_date,format="%B %d %Y")

data = ts(df$Close,frequency =12)
plot(data,main="Monthly Closing Prices")
log(data)



