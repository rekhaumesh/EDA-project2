NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")
subNEI<-subset(NEI, NEI$fips =="24510" & NEI$type == "ON-ROAD")
subNEI$year<-as.factor(subNEI$year)
subNEI$type<-as.factor(subNEI$type)

data1<-tapply(subNEI$Emissions, subNEI$year, sum)
data2<-melt(data1)
colnames(data2)<-c("year","Emissions")
png("plot5.png",width = 800, height = 600, bg="transparent")

ggplot(data=data2, aes(x=year, y= Emissions)) + geom_line(col="red") +geom_point(col="blue") +xlab("Year")+ylab("Emissions PM2.5") + ggtitle('Total Emissions of Motor Vehicle Sources in Baltimore City, Maryland') + geom_text(aes(label = round(Emissions), hjust = 0.5, vjust = -0.5))
dev.off()
