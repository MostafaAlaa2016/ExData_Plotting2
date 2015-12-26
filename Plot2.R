setwd("E:/Learning/Master/Data Science/Exploratory Data Analysis/Project 2")
source("Load_Data.R")

NEI_Baltimore_City <- NEI[NEI$fips == "24510", ] 

totalEmissions <- aggregate(NEI_Baltimore_City$Emissions, list(NEI_Baltimore_City$year), FUN = "sum")

png(filename = "./plot2.png", width = 480, height = 480, units = "px")

plot(totalEmissions, type = "l", xlab = "Year", main = "Total Emissions in the Baltimore City, Maryland from 1999 to 2008", ylab = expression('Total PM'[2.5]*" Emission"))

dev.off()