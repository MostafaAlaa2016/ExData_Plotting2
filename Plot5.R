library(ggplot2)

setwd("E:/Learning/Master/Data Science/Exploratory Data Analysis/Project 2")

source("Load_Data.R")

NEI_Baltimore_City <- NEI[NEI$fips == "24510", ] 

motor <- grep("motor", SCC$Short.Name, ignore.case = T)

motor <- SCC[motor, ]

motor <- NEI_Baltimore_City[NEI_Baltimore_City$SCC %in% motor$SCC, ]

png(filename = "plot5.png", width = 480, height = 480, units = "px")

g <- ggplot(motor, aes(year, Emissions))

g + geom_line(stat = "summary", fun.y = "sum") + ylab(expression('Total PM'[2.5]*" Emissions")) + ggtitle(" Total Emissions from motor vehicle sources \n in Baltimore City 1999–2008") + theme_bw(base_family = "Times")

dev.off()
