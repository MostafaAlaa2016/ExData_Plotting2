library(ggplot2)

setwd("E:/Learning/Master/Data Science/Exploratory Data Analysis/Project 2")

source("Load_Data.R")

coal <- grep("coal", SCC$Short.Name, ignore.case = T)

coal <- SCC[coal, ]

coal <- NEI[NEI$SCC %in% coal$SCC, ]

png(filename = "plot4.png", width = 480, height = 480, units = "px")

g <- ggplot(coal, aes(year, Emissions))

g + geom_line(stat = "summary", fun.y = "sum") + ylab(expression('Total PM'[2.5]*" Emissions")) + ggtitle("Total Emissions from coal combustion-related sources 1999–2008") + theme_bw(base_family = "Times")

dev.off()
