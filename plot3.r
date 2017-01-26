##Plot 3 - Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources 
##have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008?
library(ggplot2)

setwd("C:/Users/jzimmerman/Documents/Rogue/Particle")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#prep data 
NEIbalt<-NEI[NEI$fips %in% c("24510"),]

emissyearbalttype<-aggregate(NEIbalt$Emissions~NEIbalt$year+NEIbalt$type,FUN="sum")
colnames(emissyearbalttype)<-c("Year","Type","Emissions")

#Make Plot 
dev.copy(png,'plot3.R.png',
         width = 480, height = 480)
g<-ggplot(emissyearbalttype, 
       aes(Year,Emissions, color=Type))
g+geom_line()+ylab("Emissions")+xlab("Year")+ggtitle("Baltimore, MD Emissions by Type")

dev.off()
