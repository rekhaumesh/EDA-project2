library(ggplot2)
require(ggplot2)
library(reshape2)

NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")
SCC_coal<-SCC[grep("coal",SCC$Short.Name,ignore.case=TRUE),]

NEI_coal<-merge(x = NEI, y = SCC_coal,by="SCC")
NEI_coal$year<-as.factor(NEI_coal$year)
NEI_coal$type<-as.factor(NEI_coal$type)

data1<-tapply(NEI_coal$Emissions,NEI_coal$year,sum)
data2<-melt(data1)
colnames(data2)<-c("Year","Emissions")
png("plot4.png",width = 800, height = 500, bg="transparent")

ggplot(data2,aes(x=Year,y=Emissions)) +geom_line(colour="red") +geom_point(col="green") +geom_text(aes(label=round(Emissions/1000)),hjust=+0.1,vjust=1) + ylab("PM2.5 Emissions") + ggtitle("Coal Combustion Emission Across USA")

dev.off()

#rm(list=ls())

