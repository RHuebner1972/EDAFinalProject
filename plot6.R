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

library(ggplot2)

#Question 6
# Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle 
# sources in Los Angeles County, California (fips == "06037"). Which city has seen greater 
# changes over time in motor vehicle emissions?

# create a subset for Baltimore City AND LA County, CA and motor vehicle sources
subem <- emdata[(emdata$fips=="24510"|emdata$fips=="06037") & emdata$type=="ON-ROAD",]

# create the totals
total <- aggregate(Emissions ~ year + fips, subem, sum)
#update fips for Baltimore and LA County
total$fips[total$fips=="24510"] <- "Baltimore, MD"
total$fips[total$fips=="06037"] <- "Los Angeles County, CA"

# now complete the plot :)

# Create the graph now :)
png("plot6.png", width = 800, height = 640)
gp <- ggplot(total, aes( x = factor(year), Emissions))
gp <- gp +
  facet_grid(. ~ fips) +
  geom_bar(stat="Identity", fill="thistle3") +
  xlab("Year") +
  ylab(expression("On-Road PM"[2.5]*" Emissions")) +
  ggtitle("Total Emissions for Motor Vehicles (type= ON-ROAD) in Baltomore, MD vs. LA County, CA from 1999 to 2008")
print(gp)
dev.off()

