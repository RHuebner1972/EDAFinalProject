# EDA Final Project
# January 18, 2016
# Rich Huebner
# file:  plot3.R

setwd("D:\\Data\\RProjects\\EDAFinalProject")
if (!exists("emdata")) {
  emdata <- readRDS("summarySCC_PM25.rds")  
}
if (!exists("scc")) {
  scc <- readRDS("Source_Classification_Code.rds")
}

# Question 3
# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources 
# have seen decreases in emissions from 1999-2008 for Baltimore City? 
# Which have seen increases in emissions from 1999-2008? Use the ggplot2 plotting system to make a plot answer this question.

# ust use ggplot2
library(ggplot2)

# get subset for Baltimore City again, like plot2.R
subem <- emdata[emdata$fips=="24510",]

# aggregate the data by year and type
total <- aggregate(Emissions ~ year + type, subem, sum)

# make the plot with ggplot2 library
png("plot3.png", width = 640, height = 640)
gp <- ggplot(total, aes(year, Emissions, color = type))

# annotate the plot now
gp <- gp + geom_line() + xlab("Year") + 
  ylab(expression("Total PM"[2.5]*" Emissions")) +
  ggtitle(expression("Total PM"[2.5]*" Emissions in Baltimore City, MD from 1999 to 2008"))

print(gp)
dev.off()





