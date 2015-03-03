setwd("C:\\Users\\Romano\\Desktop\\Coursera\\Certificate Data Analisys\\Exploratory Data\\Course Project2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

index<-grep("Vehicle", SCC$Short.Name)
SCC_sel<-SCC[index,]

Baltimora<-NEI[NEI$fips == "24510",]

NEI_sel<-merge(SCC_sel, Baltimora, by="SCC")

library(ggplot2)

res<-aggregate(NEI_sel$Emissions, by=list(NEI_sel$year), FUN=sum, na.rm=TRUE)
colnames(res)<-c("year","Emission")
with(res, plot(year, Emission, type="l", col="blue"))
title("Emission from motor vehicle sources in Baltimora")

dev.copy(png,'plot5.png')
dev.off()
