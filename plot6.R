library(ggplot2)

setwd("E:/Learning/Master/Data Science/Exploratory Data Analysis/Project 2")

source("Load_Data.R")

NEI_Baltimore_City <- NEI[NEI$fips == "24510", ]
NEI_California  <- NEI[NEI$fips == "06037", ] 


motor <- grep("motor", SCC$Short.Name, ignore.case = T)
motor <- SCC[motor, ]

motor_in_Baltimore_City <- NEI_Baltimore_City[NEI_Baltimore_City$SCC %in% motor$SCC, ]
motor_in_Baltimore_City$city <- "Baltimore City"

motor_in_California <- NEI_California[NEI_California$SCC %in% motor$SCC, ]
motor_in_California$city  <- "California"

bothmotor_Data <- rbind(motor_in_Baltimore_City,motor_in_California)

png(filename = "plot6.png", width = 580, height = 580, units = "px")

g <- ggplot(bothmotor_Data, aes(year, Emissions,fill=city))

g +  geom_bar(aes(fill=year),stat="summary", fun.y = "sum") +
        facet_grid(.~city) +
        guides(fill=FALSE) + theme_bw() +
        labs(x="year", y=expression("Total PM"[2.5]*" Emission")) +
        ggtitle(" Total Emissions from motor vehicle sources \n in Baltimore City & California, 1999–2008")
 

dev.off()
