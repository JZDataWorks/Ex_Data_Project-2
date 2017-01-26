setwd("C:/Users/jzimmerman/Documents/Rogue/Particle")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#prep data 
emissyear<-aggregate(NEI$Emissions,list(NEI$year),FUN="sum")

#Make Plot 
dev.copy(png,'plot1.R.png',
         width = 480, height = 480)

barplot(height=emissyear$x, names.arg = emissyear$Group.1, xlab="Year", ylab="",main="PM2.5 Emissions - All Sources")

dev.off()
