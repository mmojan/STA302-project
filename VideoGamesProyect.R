
install.packages("tidyverse")
library(tidyverse)

wdir<-"/Users/ro/Downloads/"
setwd(wdir)
sales<-read.csv("Video_Games.csv")
summary(sales)

dim(sales)
names(sales)
sales<-sales[is.na(sales$User_Count)==FALSE,]
sales<-sales[is.na(sales$Critic_Count)==FALSE,]
sales<-sales[is.na(sales$Developer)==FALSE,]
sales<-sales[is.na(sales$Year_of_Release)==FALSE,]
sales<-sales[sales$Year_of_Release!="N/A",]

#sales<-drop_na(sales)

sales$User_Score<-as.numeric(sales$User_Score)
sales<-sales[,-c(5,6,7,8,9,12,14,15,16)]
sales<-sales[sales$Year_of_Release>1995,]
sales<-as.data.frame(sales)
dim(sales)
names(sales)
summary(sales)

write.csv(sales,file="VideoGamesSales.csv")

#boxplot(sales$Global_Sales)
#boxplot(log(sales$Global_Sales))
#plot(sales$Critic_Score,log(sales$Global_Sales))
#boxplot(log(sales$Global_Sales)~sales$Year_of_Release)


prop.table(table(sales$Platform))*100
prop.table(table(sales$Year_of_Release))*100 #Checar
prop.table(table(sales$Genre))*100
summary(sales)




