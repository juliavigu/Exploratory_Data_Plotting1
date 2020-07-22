#Foundations in R coursera
#Exploratory data analysis course
#Week 1 Course Project
#plot1

#Read data
df1 <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
df1 <- subset(df1, Date == "1/2/2007" | Date == "2/2/2007")

#Re-classify variables into numeric
df1[3:9]<- lapply(df1[3:9], function(x) as.numeric(x))

#Construct plot1
png("plot1.png") #save into png file
hist(df1$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off() #close device connection

