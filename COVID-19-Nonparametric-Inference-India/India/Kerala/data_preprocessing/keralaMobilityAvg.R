setwd("/Users/daryapetrov/research/COVID-19-Nonparametric-Inference-India/India/Kerala/data_preprocessing")
mobility <- read.csv(file = 'google_mobility_India.csv')
one = subset(mobility, sub_region_1 == "Kerala")
two = subset(one,sub_region_2=="")[-c(seq(1,46,1)),]
keralaMobility = subset(two, select = -c(country_region_code, metro_area,iso_3166_2_code,census_fips_code,place_id ) )
avg = subset(keralaMobility, select = -c(country_region,sub_region_1,sub_region_2,date))
average = rowMeans(avg)
keralaMobilityAvg = cbind(keralaMobility, average)
save(keralaMobilityAvg, file = "keralaMobilityAvg.Rda")
