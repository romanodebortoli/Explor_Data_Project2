setwd("C:\\Users\\Romano\\Desktop\\Coursera\\Certificate Data Analisys\\Exploratory Data\\Course Project2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

res<-aggregate(NEI$Emissions, by=list(NEI$year), FUN=sum, na.rm=TRUE)
colnames(res)<-c("year", "Emission")
with(res, plot(year, Emission, type="l", col="blue"))
title("Total Emission")

dev.copy(png,'plot1.png')
dev.off()