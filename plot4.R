# EDA Final Project
# January 18, 2016
# Rich Huebner
# file:  plot4.R

setwd("D:\\Data\\RProjects\\EDAFinalProject")
if (!exists("emdata")) {
  emdata <- readRDS("summarySCC_PM25.rds")  
}
if (!exists("scc")) {
  scc <- readRDS("Source_Classification_Code.rds")
}

# merge the sets
emscc <- merge(emdata, scc, by="SCC")


library(ggplot2)

# Question 4
# Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?
coal <- grepl("coal", emscc, ignore.case=TRUE)
# create the subset that only includes records with coal.
subem <- emscc[coal, ]

# get totals for the coal records
total <- aggregate(Emissions ~ year, subem, sum)

# create the graph now.
png("plot4.png", width = 640, height = 640)
gp <- ggplot(total, aes(factor(year), Emissions))
gp <- gp +
      geom_bar(stat="Identity") +
      xlab("Year") +
      ylab(expression("Total PM"[2.5]*" Emissions")) +
      ggtitle("Total Emissions for Coal Sources from 1999 to 2008")
print(gp)
dev.off()


  


