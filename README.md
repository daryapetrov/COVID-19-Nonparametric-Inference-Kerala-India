# COVID-19-Nonparametric-Inference in Kerala, India

We use the model described [here](https://www.medrxiv.org/content/10.1101/2021.02.01.21250936v1) on analyzing the dynamics of COVID-19 in Kerala, India.

# Description of the files

(A) The folder "data_preprocessing" contains the data processing steps:
1. The number of daily confirmed cases, recoveries, tests, and deaths from COVID-19 are obtained from https://data.covid19india.org. This is saved as ``` states.csv ```. 
2. The number of hospitalizations are obtained from https://dashboard.kerala.gov.in/covid/index.php. This is saved as ``` KerelaHosp.xlsx ```.
3. The social mobility data in terms of reduced (/increased) activity in different sectors are obtained from https://www.google.com/covid19/mobility. This is saved as ``` google_mobility_India.csv ```. Kerala data is extracted and saved as ``` keralaMobilityAvg.Rda ```. 
4. Confirmed cases, recoveries, tests, deaths, hopsitlaizations (imputation performed where necessary) are merged into a data-frame in R using ``` kerala.R``` and ``` kerala_preprocessing.R ```.  
5. The above data are merged into a data-frame in R using the code in ``` data_final.R ``` and the output is stored in the RData file ``` KeralaData.Rda ``` in the folder ``` data ```.

(B) The folder "code" contains the estimation procedure (described [here](https://github.com/Satarupa3671/COVID-19-Nonparametric-Inference)). 

# How to run the code:

* Step 1: Run the data preprocessing code (``` keralaMobilityAvg.R ```, ``` kerala.R ```, ``` kerala_preprocessing.R ```, ``` data_final.R ```) or use the cleaned data ``` KeralaData.Rda ``` in the ``` data ``` folder.
* Step 2: Find the optimal tuning parameters ("numBlock" and "wd.length") for Kerala, India using ``` opt_wd_Dec15.R ``` (in the folder "code"). For ``` numBlock ``` and ``` wd.length ```, from 10:14 for "numBlock" and 15:60 for "wd.length", the optimal parameters were 14 and 49 respectivey. 
*Step 3: For the estimation of different parameters and compartments of the model for Kerala, India, run the ``` individual_plots.R ``` script (in the folder "code"). This R script requires the tuning paramters to be provided for Kerala (the optimal paramters are found in step 2) and sources the file "est_module.R", which in turn uses the code from "fitting_functions.R" and "est_plot_func.R". The relevant plots are generated and the estimation outputs are stored in the RData file "Kerala_est_st.Rda".
*Step 4: For performing the residual bootstrap, use "resi_boot.R" (in the folder "code"). This requires the estimation outputs from Step 3. Bootstrap estimate outputs are stored in the RData files "Kerala_est_bs.Rda" and "Kerala_est_boot_data.Rda".
*Step 5: For generating the confidence interval and histogram plots, use "ggplot_ci.R" (in the folder "code"). This requires the output files from Step 3 and Step 4.



