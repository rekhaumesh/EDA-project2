NEI<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")
samNEI<-NEI[sample(nrow(NEI),1000000,replace=TRUE),]
data<-tapply(samNEI$Emissions, samNEI$year, sum)
png("plot1.png",bg="transparent")
barplot(data, xlab="Year",ylab="Total Emission PM2.5 in Kilotons", col="red")
rm(list=ls())
dev.off()
