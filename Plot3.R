library(ggplot2)

setwd("E:/Learning/Master/Data Science/Exploratory Data Analysis/Project 2")

source("Load_Data.R")

NEI_Baltimore_City <- NEI[NEI$fips == "24510", ] 

png(filename = "plot3.png", width = 480, height = 480, units = "px")

g <- ggplot(NEI_Baltimore_City, aes(year, Emissions, color = type))

g + geom_line(stat = "summary", fun.y = "sum") + ylab(expression('Total PM'[2.5]*" Emissions")) + ggtitle("Total Emissions in Baltimore City from 1999 to 2008") + theme_bw(base_family = "Times")

dev.off()


