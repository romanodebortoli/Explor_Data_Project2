setwd("C:\\Users\\Romano\\Desktop\\Coursera\\Certificate Data Analisys\\Exploratory Data\\Course Project2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

Baltimora<-NEI[NEI$fips == "24510",]

library(ggplot2)
Baltimora$type<-as.factor(Baltimora$type)

res<-aggregate(Baltimora$Emissions, by=list(Baltimora$year, Baltimora$type), FUN=sum, na.rm=TRUE)
colnames(res)<-c("year","type", "Emission")
qplot(year, Emission, data=res, geom="line", color=type, xlab="Year", ylab="Emission") + ggtitle("Baltimora Emission by type")

dev.copy(png,'plot3.png')
dev.off()