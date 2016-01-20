# EDA Final Project
# January 18, 2016
# Rich Huebner
# file:  plot5.R

setwd("D:\\Data\\RProjects\\EDAFinalProject")
if (!exists("emdata")) {
  emdata <- readRDS("summarySCC_PM25.rds")  
}
if (!exists("scc")) {
  scc <- readRDS("Source_Classification_Code.rds")
}

library(ggplot2)

# Question 5
# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

# create a subset for Baltimore City and motor vehicle sources
subem <- emdata[emdata$fips=="24510" & emdata$type=="ON-ROAD",]

total <- aggregate(Emissions ~ year, subem, sum)


# Create the graph now :)
png("plot5.png", width = 640, height = 640)
gp <- ggplot(total, aes( x = factor(year), Emissions))
gp <- gp +
  geom_bar(stat="Identity", fill="tan") +
  xlab("Year") +
  ylab(expression("On-Road PM"[2.5]*" Emissions")) +
  ggtitle("Total Emissions for Motor Vehicles (type= ON-ROAD) in Baltomore, MD from 1999 to 2008")
print(gp)
dev.off()