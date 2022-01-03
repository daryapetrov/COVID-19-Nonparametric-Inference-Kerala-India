setwd("/Users/daryapetrov/research/COVID-19-Nonparametric-Inference-India/India/Kerala/data_preprocessing")
load("keralaMobilityAvg.Rda")
load("kerala_data.Rda")
data2020 = data[-c(seq(275,364,1)),]
mobility_rm = keralaMobilityAvg[keralaMobilityAvg$date != "2020-10-16", ]  
pop18 = 34630000
KeralaData = cbind(data2020,mobility_rm$average, rep(pop18,dim(mobility_rm)[1]) )
names(KeralaData)[names(KeralaData) == names(KeralaData)[10]] = "kappa"
names(KeralaData)[names(KeralaData) == names(KeralaData)[11]] = "pop18"
save(KeralaData, file = "KeralaData.Rda")
