#Foundations in R coursera
#Exploratory data analysis course
#Week 1 Course Project
#plot3

##Read data
library(sqldf)
df1 <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where (Date = '1/2/2007') OR (Date='2/2/2007')",header=TRUE, sep=";" )

##Re-classify date/time variables
datetime<-paste(df1$Date, df1$Time)
df1$datetime=strptime(datetime, "%d/%m/%Y %H:%M:%S")

#Construct plot3
png("plot3.png") #save to png file
plot(df1$datetime,df1$Sub_metering_1, col="black", type="l", ylab="Energy sub metering", xlab="")
lines(df1$datetime,df1$Sub_metering_2, col="red", type="l")
lines(df1$datetime, df1$Sub_metering_3, col="blue", type="l")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off() #close connection


