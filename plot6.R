library(ggplot2)
require(ggplot2)
library(reshape2)

NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")
subNEI_BaltLA<-subset(NEI, NEI$fips =="24510" & NEI$type == "ON-ROAD" | NEI$fips == "06037" & NEI$type == "ON-ROAD")
subNEI_BaltLA$year<-as.factor(subNEI_BaltLA$year)
subNEI_BaltLA$type<-as.factor(subNEI_BaltLA$type)
data2<-aggregate(Emissions~fips+year,data=subNEI_BaltLA,sum)

BaLA_labeller <- function(var, value){
  value <- as.character(value)
  if (var=="fips") { 
    value[value=="24510"] <- "Baltimore"
    value[value=="06037"]   <- "LA"
  }
  return(value)
}
  
png("plot6.png",width = 800, height = 600, bg="transparent")
sp<-ggplot(data=data2,aes(x=year,y=Emissions)) + geom_bar(stat="identity",aes(fill=year)) + facet_grid(.~fips, labeller=BaLA_labeller)+xlab("Year") + ylab("PM2.5 Emissions") + ggtitle("Total Emissions of Motor Vehicle Sources \n LA and Baltimore, USA")
      
sp +
  geom_text(aes(label=round(Emissions, 0),size=1,hjust=0.5,vjust= -0.5)) +
  theme(legend.position = "None")
  

dev.off()

#sp<-ggplot(data=subNEI_BaltLA,aes(x=year,y=Emissions)) + geom_bar(stat="identity",aes(fill=year)) + facet_grid(.~fips, labeller=BaLA_labeller)+xlab("Year") + ylab("PM2.5 Emissions") + ggtitle("Total Emissions of Motor Vehicle Sources \n LA and Baltimore, USA")

