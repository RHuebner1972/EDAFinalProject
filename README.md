# EDA Final Project -- Rich Huebner
Final project for Exploratory Data Analysis - Coursera

This project was completed for the EDA Final Course project, through Coursera.org.  It requires the use of the various plotting systems in R, primarily the base and ggplot2 plotting systems. It also requires some data manipulation and creating subsets of a data set prior to making the plot.

The source code assumes that the datasets were already downloaded and placed into a working directory. I keep all my source files under D:\Data\RProjects, so you'll see in the source code that I use setwd(). If you wish to use this code, please tell me, and don't forget to change the setwd() to your own working directory.

-----

## plot1.R

Question 1:
Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

### Algorithm:

1. Read data into R from .RDS files.
2. Create the totals from using aggregate function for emissions
3. Create the plot using barpot from the base plotting system

-----

## plot2.R

Question 2:
Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.

### Algorithm:

1. Read data into R from .RDS files
2. Create a subset for Baltimore City
3. Aggregate the total for the subset
4. Create plot with the base plotting system (using barplot())

-----

## plot3.R

Question 3:
Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources 
have seen decreases in emissions from 1999-2008 for Baltimore City? Which have seen increases in emissions from 1999-2008? Use the ggplot2 plotting system to make a plot answer this question.

### Algorithm:

1. Read data into R from .RDS files
2. Load ggplot2 library
3. Get subset for Baltimore city
4. Aggregate the data from the subset by year and type.
5. Make the plot with ggplot function and annotate it.

-----

## plot4.R

Question 4:
Across the United States, how have emissions from coal combustion related sources changed from 1999-2008?

### Algorithm:

1. Read data into R from .RDS files
2. Load the ggplot2 library
3. Create a subset that only includes records with coal.
4. Get the totals using the aggregate function, based on the subset
5. Make the plot using the ggplot function and annotate it.

-----

## plot5.R

Question 5:
How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

### Algorithm:

1. Read data into R from .RDS files
2. Load the ggplot2 library
3. Create a subset that includes Baltimore City (fips==24510) and motor vehicle sources (using type=="ON-ROAD")
4. Get the totals using the aggregate function, based on the subset
5. Make the plot using the ggplot function and annotate it

-----

## plot6.R

Question 6:
Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?

1. Read data into R from .RDS files
2. Load the ggplot2 library
3. Create a subset for motor vehicle sources in Baltimore City and LA County, CA (fips==06037)
4. Create the totals based on the subset (using the aggregate function).
5. Update fips for Baltimore an LA County
6. Create the plot using ggplot

> Note: This graph can be done in multiple ways, but I chose to do a side-by-side.  














