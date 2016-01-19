# EDA Final Project
# January 18, 2016
# Rich Huebner
# file:  plot1.R


setwd("D:\\Data\\RProjects\\EDAFinalProject")

if (!exists("emdata")) {
  emdata <- readRDS("summarySCC_PM25.rds")   
}
if (!exists("scc")) {
  scc <- readRDS("Source_Classification_Code.rds")  
}


# Question 1:
# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission from all 
# sources for each of the years 1999, 2002, 2005, and 2008.

# aggregate the total

total <- aggregate(Emissions ~ year, emdata, sum)

# create the plot
png("plot1.png")
barplot(height=total$Emissions, 
        names.arg = total$year, 
        xlab = "Years",
        ylab = expression('Total PM'[2.5]*' Emission'),
        main = expression('Total PM'[2.5]*' Emissions During Various Years'),
        col = "blue")
dev.off()