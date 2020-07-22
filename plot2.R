#Foundations in R coursera
#Exploratory data analysis course
#Week 1 Course Project
#plot2

##Read data
library(sqldf)
df1 <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where (Date = '1/2/2007') OR (Date='2/2/2007')",header=TRUE, sep=";" )

##Re-classify date/time variables
datetime<-paste(df1$Date, df1$Time)
df1$datetime=strptime(datetime, "%d/%m/%Y %H:%M:%S")

#Construct plot2
png("plot2.png") #save to png file
plot(df1$datetime,df1$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off() #close connection


