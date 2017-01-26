##Plot 5 - How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
setwd("C:/Users/jzimmerman/Documents/Rogue/Particle")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#prep data 
vehiclelist <- grepl("Mobile", SCC$EI.Sector, ignore.case=TRUE)
SCCcodesvehicle<-SCC[vehiclelist,]
SCCodesvehicle<-unique(SCCcodesvehicle$SCC)
vehicleshort<-subset(NEI, SCC %in% SCCodesvehicle)
#baltimore Cut
vehicleshort<-vehicleshort[vehicleshort$fips %in% c("24510"),]
emissyearvehicle<-aggregate(vehicleshort$Emissions~vehicleshort$year,FUN="sum")

#Make Plot 
dev.copy(png,'plot5.R.png',
         width = 480, height = 480)
barplot(height=emissyearvehicle$`vehicleshort$Emissions`, names.arg = emissyearvehicle$`vehicleshort$year`, xlab="Year", ylab="Emmissions PM2.5",main="PM2.5 Emissions - Baltomore, MD: Vehicle")
dev.off()

