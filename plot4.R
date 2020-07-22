#Foundations in R coursera
#Exploratory data analysis course
#Week 1 Course Project
#plot4

##Read data
library(sqldf)
df1 <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where (Date = '1/2/2007') OR (Date='2/2/2007')",header=TRUE, sep=";" )

##Re-classify date/time variables
datetime<-paste(df1$Date, df1$Time)
df1$datetime=strptime(datetime, "%d/%m/%Y %H:%M:%S")

#Construct plot4
png("plot4.png") #save to png file
par(mfrow=c(2,2)) #Set grid for multiple plots
#plot top left
plot(df1$datetime,df1$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
#plot top right
plot(df1$datetime,df1$Voltage, type="l", ylab="Voltage", xlab="datetime")
#plot bottom left
plot(df1$datetime,df1$Sub_metering_1, col="black", type="l", ylab="Energy sub metering", xlab="") 
lines(df1$datetime,df1$Sub_metering_2, col="red", type="l")
lines(df1$datetime, df1$Sub_metering_3, col="blue", type="l")
#plot bottom right
plot(df1$datetime,df1$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off() #close connection


