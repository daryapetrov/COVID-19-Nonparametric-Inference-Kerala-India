
setwd("/Users/daryapetrov/research/COVID-19-Nonparametric-Inference-India/India/Kerala/data_preprocessing")
library(ggplot2)
library(VIM)

load("kerala_df.Rda")
data = kerala_df[,c("Date","State","Confirmed","Recovered","Deceased","Tested","Hospitalized")]

sum(data["Date"]==0) #0
sum(data["State"]==0) #0
sum(data["Confirmed"]==0) #0
sum(data["Recovered"]==0) #0
sum(data["Deceased"]==0) #0
sum(data["Tested"]==0) #0
sum(data["Hospitalized"]==0) #2
which(data["Hospitalized"]==0) #296,322

data["Hospitalized"][which(data["Hospitalized"]==0),]=NA

ggplot(data, aes(x=Date, y=Hospitalized/1000)) + geom_line() + ylab("Hospitalizations(thousands)") + ggtitle("Hospitalizations")

#2020-11-05, 218 wrong data input?
#2020-11-08,221 high peak, wrong data input?
data["Hospitalized"][c(218,221),] = NA
ggplot(data, aes(x=Date, y=Hospitalized/1000)) + geom_line() + ylab("Hospitalizations(thousands)") + ggtitle("Hospitalizations")


#impute from library VIM
data = cbind(data, kNN(data, variable = "Hospitalized",k=6)$Hospitalized)
names(data)[names(data) == names(data)[8]] = "impHospitalized"
ggplot(data, aes(x=Date, y=impHospitalized/1000)) + geom_line() + ylab("Hospitalizations(thousands)") + ggtitle("Hospitalizations")

#try sqrt(n) in lowess
n= dim(data)[1]
smoothed_impHospitalized = lowess(data$Date, data$impHospitalized,f=1/sqrt(n))$y
ggplot(data, aes(x=Date, y=smoothed_impHospitalized/1000)) + geom_line() + ylab("Hospitalizations(thousands)") + ggtitle("Hospitalizations")

#delta Hospital
delta_impHospitalized = c(0,diff(data$impHospitalized))
ggplot(data, aes(x=Date, y=delta_impHospitalized)) + geom_line() + ylab("Change in Daily Hospitalizations") + ggtitle("Change in Daily Hospitalizations")
smoothed_deltaHospital = lowess(data$Date, delta_impHospitalized,f=1/sqrt(n))$y
ggplot(data, aes(x=Date, y=smoothed_deltaHospital)) + geom_line() + ylab("Change in Daily Hospitalizations") + ggtitle("Change in Daily Hospitalizations")
data = cbind(data,delta_impHospitalized )


save(data, file = ke)


#CIR
diff1 = diff(data$Confirmed)
diff2 = diff(diff1)
diff1_sm = lowess(diff1, f = 1/10)$y
diff2_sm = lowess(diff2, f = 1/10)$y
CIR = diff2_sm/diff1_sm[-1]
plot(CIR, type = "l", main="bandwidth = 1/10")
ggplot(data[1:362,], aes(x=Date, y=CIR)) + geom_line() + ylab("CIR")


#CFR
CFR = 100*data$Deceased/data$Confirmed
data = cbind(data, CFR)

plot(CFR,type="l", main="bandwidth = 1/17")
CFR_lowess = lowess(CFR, f=1/20)$y
plot(CFR_lowess,type="l", main="bandwidth = 1/17")
ggplot(data[1:364,], aes(x=Date, y=CFR_lowess)) + geom_line() + ylab("CFR")





