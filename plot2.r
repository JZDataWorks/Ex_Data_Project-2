##Plot 2 - Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008?
setwd("C:/Users/jzimmerman/Documents/Rogue/Particle")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#prep data 
NEIbalt<-NEI[NEI$fips %in% c("24510"),]

emissyearbalt<-aggregate(NEIbalt$Emissions,list(NEIbalt$year),FUN="sum")

#Make Plot 
dev.copy(png,'plot2.R.png',
         width = 480, height = 480)

barplot(height=emissyearbalt$x, names.arg = emissyearbalt$Group.1, xlab="Year", ylab="",main="PM2.5 Emissions - Baltimore, MD")

dev.off()
