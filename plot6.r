#Plot 6 - Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037").
#Which city has seen greater changes over time in motor vehicle emissions?
library(ggplot2)
setwd("C:/Users/jzimmerman/Documents/Rogue/Particle")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#prep data 
vehiclelist <- grepl("Mobile", SCC$EI.Sector, ignore.case=TRUE)
SCCcodesvehicle<-SCC[vehiclelist,]
SCCodesvehicle<-unique(SCCcodesvehicle$SCC)
vehicleshort<-subset(NEI, SCC %in% SCCodesvehicle)
#baltimore and LA Cut
vehicleshortbla<-vehicleshort[vehicleshort$fips %in% c("24510","06037"),]
emissyearvehiclebla<-aggregate(vehicleshortbla$Emissions~vehicleshortbla$year+vehicleshortbla$fips,FUN="sum")
colnames(emissyearvehiclebla)<-c("Year","City","Emissions")
emissyearvehiclebla$City<-factor(emissyearvehiclebla$City,
                    levels = c("24510","06037"),
                    labels = c("Baltimore","Los Angeles"))

#Make Plot 
dev.copy(png,'plot6.R.png',
         width = 480, height = 480)
g<-ggplot(emissyearvehiclebla, 
          aes(Year,Emissions, color=City))
g+geom_line()+ylab("Emissions")+xlab("Year")+ggtitle("Baltimore, MD vs LA, CA: Vehicle Emissions")+scale_fill_discrete(labels=c("LA","Baltimore"))

dev.off()
