setwd("C:\\Users\\Romano\\Desktop\\Coursera\\Certificate Data Analisys\\Exploratory Data\\Course Project2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

Baltimora<-NEI[NEI$fips == "24510",]

res<-aggregate(Baltimora$Emissions, by=list(Baltimora$year), FUN=sum, na.rm=TRUE)
colnames(res)<-c("year", "Emission")
with(res, plot(year, Emission, type="l", col="blue"))
title("Total Emission in Baltimora")

dev.copy(png,'plot2.png')
dev.off()