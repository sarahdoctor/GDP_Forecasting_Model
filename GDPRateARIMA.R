library(tseries)
library(strucchange)
library(forecast)
library(astsa)

GDPdata<-read.csv("/Users/sarahdoctor/Desktop/GDP_TSE.csv")
attach(GDPdata)
head(GDPdata)

#TS Model
model<-ts(GDPRate,start=min(GDPdata$Date),end=max(GDPdata$Date),frequency=1)
plot(model)  

acf(model)
#cutsoff after first lag
pacf(model)
#appears to be stationary

#Check for stationarity
adf.test(model)
#p-value smaller than 0.05, therefore the series is stationary

#chow test to test for structural breaks
sctest(GDPdata$GDPRate ~ GDPdata$Date, type = "Chow", point= 5) #1965
sctest(GDPdata$GDPRate ~ GDPdata$Date, type = "Chow", point= 19) #1979
#p value higher than 0.05 so no stuctural break

#finding the best arima model
ndiffs(model)
nmodel<-diff(model)
acf(nmodel)
pacf(nmodel)

model1<-arima(model,order=c(1,1,0))
model1
model2<-arima(model,order=c(1,1,1))
model2
model3<-arima(model,order=c(0,1,1))
model3

auto.arima(model,ic="aic",trace=TRUE)

#lowest AIC
modelFinal<-arima(model,order=c(0,1,1))
modelFinal

#check for residuals
resi<-checkresiduals(modelFinal)
#appears mean reverting 
#between the blue lines, covariance = 0
#appears normally distributed

#forecast for 2 years
GDPforecast<-forecast(modelFinal,2)
GDPforecast
plot(GDPforecast)

plot(gdpforecast)

#validate using box test
Box.test(GDPforecast$resid,lag=25,type="Ljung-Box")
Box.test(GDPforecast$resid,lag=35,type="Ljung-Box")
