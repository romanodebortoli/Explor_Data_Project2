setwd("C:\\Users\\Romano\\Desktop\\Coursera\\Certificate Data Analisys\\Exploratory Data\\Course Project2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

index<-grep("Coal", SCC$EI.Sector)
SCC_sel<-SCC[index,]

NEI_sel<-merge(SCC_sel, NEI, by="SCC")

library(ggplot2)

res<-aggregate(NEI_sel$Emissions, by=list(NEI_sel$year), FUN=sum, na.rm=TRUE)
colnames(res)<-c("year","Emission")
with(res, plot(year, Emission, type="l", col="blue"))
title("Emission from coal combustion-related sources")

dev.copy(png,'plot4.png')
dev.off()