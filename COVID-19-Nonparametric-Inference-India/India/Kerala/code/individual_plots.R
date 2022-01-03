### runs the estimation module for a few states and saves the respective plots. 

rm(list = ls())
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
library(ggplot2)
library(reshape2)
library(lubridate)
library(plyr)
library(gridExtra)
library(scales)
library(lemon)

source("./fitting_functions.R")
source("./est_plot_func.R")
source("./est_module.R")
load("../data_preprocessing/KeralaData.Rda")
bw_lowess = 1/16

st="Kerala"
numBlock=14 #10:14
wd.length=49 #15:60

plot_for_estimation(st, numBlock, wd.length)
