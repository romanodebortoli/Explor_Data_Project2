setwd("C:\\Users\\Romano\\Desktop\\Coursera\\Certificate Data Analisys\\Exploratory Data\\Course Project2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

index<-grep("Vehicle", SCC$Short.Name)
SCC_sel<-SCC[index,]

Baltimora<-NEI[NEI$fips == "24510",]
LosAngeles<-NEI[NEI$fips == "06037",]

NEI_Baltimora<-merge(SCC_sel, Baltimora, by="SCC")
NEI_LosAngeles<-merge(SCC_sel, LosAngeles, by="SCC")

res_Baltimora<-aggregate(NEI_Baltimora$Emissions, by=list(NEI_Baltimora$year), FUN=sum, na.rm=TRUE)
colnames(res_Baltimora)<-c("year","Emission")
res_LosAngeles<-aggregate(NEI_LosAngeles$Emissions, by=list(NEI_LosAngeles$year), FUN=sum, na.rm=TRUE)
colnames(res_LosAngeles)<-c("year","Emission")

with(res_Baltimora, plot(year, Emission, type="l", col="blue"))
par(new = TRUE)
with(res_LosAngeles, plot(year, Emission, axes = FALSE, type="l", col="red"))
axis(side=4, at = pretty(range(res_LosAngeles$Emission)))

title("Emission from motor vehicle sources")
legend("topright",legend=c("Baltimora","Los Angeles"),
  text.col=c("blue","red"),pch=c(16,15),col=c("blue","red"))

dev.copy(png,'plot6.png')
dev.off()