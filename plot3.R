NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")
subNEI<-subset(NEI, NEI$fips =="24510")
subNEI$year<-as.factor(subNEI$year)
subNEI$type<-as.factor(subNEI$type)

png("plot3.png",width = 800, height = 500, bg="transparent")

ggplot(data=subNEI,aes(x=year,y=Emissions)) + geom_bar(stat="identity",fill="blue") + facet_grid(.~type)+xlab("Year") + ylab("PM2.5 Emissions") + ggtitle("Emission per Type in Baltimore City, Maryland")

dev.off()

#rm(list=ls())

