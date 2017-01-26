#Plot 4 - Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?
setwd("C:/Users/jzimmerman/Documents/Rogue/Particle")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#prep data 
coallist <- grepl("coal", SCC$EI.Sector, ignore.case=TRUE)
SCCcodescoal<-SCC[coallist,]
SCCcodescoal<-unique(SCCcodescoal$SCC)
coalcombust<-subset(NEI, SCC %in% SCCcodescoal)
emissyearcoal<-aggregate(coalcombust$Emissions~coalcombust$year,FUN="sum")

#Make Plot 
dev.copy(png,'plot4.R.png',
         width = 480, height = 480)
barplot(height=emissyearcoal$`coalcombust$Emissions`, names.arg = emissyearcoal$`coalcombust$year`, xlab="Year", ylab="Emmissions PM2.5",main="PM2.5 Emissions - All US Coal Combustion")
dev.off()
