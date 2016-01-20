# EDA Final Project
# January 18, 2016
# Rich Huebner
# file:  plot4.R

# Assumes we already downloaded the data sets

setwd("D:\\Data\\RProjects\\EDAFinalProject")
if (!exists("emdata")) {
  emdata <- readRDS("summarySCC_PM25.rds")  
}
if (!exists("scc")) {
  scc <- readRDS("Source_Classification_Code.rds")
}

library(ggplot2)

# Question 4
# Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?



# create the subset that only includes records with coal.
sccsub <- scc[grepl("coal", scc$Short.Name, ignore.case=TRUE), ]
emsub <- emdata[emdata$SCC %in% sccsub$SCC,]

# get totals for the coal records
total <- aggregate(Emissions ~ year, subem, sum)

# create the graph now. Preferring ggplot2.
png("plot4.png", width = 640, height = 640)
gp <- ggplot(total, aes( x = factor(year), Emissions))
gp <- gp +
      geom_bar(stat="Identity", fill="navyblue") +
      xlab("Year") +
      ylab(expression("Coal-Related PM"[2.5]*" Emissions")) +
      ggtitle("Total Emissions for Coal Sources from 1999 to 2008")
print(gp)
dev.off()


  


