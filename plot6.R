# EDA Final Project
# January 18, 2016
# Rich Huebner
# file:  plot6.R

setwd("D:\\Data\\RProjects\\EDAFinalProject")
if (!exists("emdata")) {
  emdata <- readRDS("summarySCC_PM25.rds")  
}
if (!exists("scc")) {
  scc <- readRDS("Source_Classification_Code.rds")
}

