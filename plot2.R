# EDA Final Project
# January 18, 2016
# Rich Huebner
# file:  plot2.R

setwd("D:\\Data\\RProjects\\EDAFinalProject")
if (!exists("emdata")) {
  emdata <- readRDS("summarySCC_PM25.rds")  
}
if (!exists("scc")) {
  scc <- readRDS("Source_Classification_Code.rds")
}

# Question 2
# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") 
# from 1999 to 2008? Use the base plotting system to make a plot answering this question.

# create a subset for Baltimore City
subem <- emdata[emdata$fips=="24510",]

# aggregate the total for the subset
total <- aggregate(Emissions ~ year, subem, sum)

#
# create the plot
png("plot2.png")
barplot(height=total$Emissions, 
        names.arg = total$year, 
        xlab = "Years",
        ylab = expression('Total PM'[2.5]*' Emission'),
        main = expression('Total PM'[2.5]*' Emissions in Baltimore City, MD During Various Years'),
        col = "maroon")
dev.off()