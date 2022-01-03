# COVID-19-Nonparametric-Inference in Kerala, India

We use the model described [here](https://www.medrxiv.org/content/10.1101/2021.02.01.21250936v1) on analyzing the dynamics of COVID-19 in Kerala, India.

# Description of the files

(A) The folder "data_preprocessing" contains the data processing steps:
1. The number of daily confirmed cases, recoveries, tests, and deaths from COVID-19 are obtained from https://data.covid19india.org. This is saved as ``` states.csv ```. 
2. The number of hospitalizations are obtained from https://dashboard.kerala.gov.in/covid/index.php. This is saved as ``` KerelaHosp.xlsx ```.
3. The social mobility data in terms of reduced (/increased) activity in different sectors are obtained from https://www.google.com/covid19/mobility. This is saved in ``` google_mobility_India.csv ```. Kerala data is extracted and saved as ``` keralaMobilityAvg.Rda ```. 
4. Confirmed cases, recoveries, tests, deaths, hopsitlaizations (imputation performed where necessary) are merged into a data-frame in R using ``` kerala.R``` and ``` kerala_preprocessing.R ```.  
5. The above data are merged into a data-frame in R using the code in ``` data_final.R ``` and the output is stored in the RData file "KeralaData.Rda".
