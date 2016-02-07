##   Exploratory Data Analysis Project 1 - Plot 3  ##

## Reads file and stores on variable
HousePowerConsumption <- read.csv("./household_power_consumption.txt", sep=";") 

#Changes the data to a dataframe format
HousePowerConsumptionDF <- as.data.frame(HousePowerConsumption) 

##This Block converts the entire dataframe from Factor to Character
HousePowerConsumptionDF$Date <- as.character(HousePowerConsumptionDF$Date)
HousePowerConsumptionDF$Time <- as.character(HousePowerConsumptionDF$Time)
HousePowerConsumptionDF$Global_active_power<- as.character(HousePowerConsumptionDF$Global_active_power)
HousePowerConsumptionDF$Global_reactive_power <- as.character(HousePowerConsumptionDF$Global_reactive_power)
HousePowerConsumptionDF$Voltage <- as.character(HousePowerConsumptionDF$Voltage)
HousePowerConsumptionDF$Global_intensity <- as.character(HousePowerConsumptionDF$Global_intensity)
HousePowerConsumptionDF$Sub_metering_1 <- as.character(HousePowerConsumptionDF$Sub_metering_1)
HousePowerConsumptionDF$Sub_metering_2 <- as.character(HousePowerConsumptionDF$Sub_metering_2)
HousePowerConsumptionDF$Sub_metering_3 <- as.character(HousePowerConsumptionDF$Sub_metering_3)

##This Block converts all '?' to 'NA'
HousePowerConsumptionDF$Date[HousePowerConsumptionDF$Date =='?'] <- 'NA'
HousePowerConsumptionDF$Time[HousePowerConsumptionDF$Time =='?'] <- 'NA'
HousePowerConsumptionDF$Global_active_power[HousePowerConsumptionDF$Global_active_power == '?'] <- 'NA'
HousePowerConsumptionDF$Global_reactive_power[HousePowerConsumptionDF$Global_reactive_power=='?'] <- 'NA'
HousePowerConsumptionDF$Voltage[HousePowerConsumptionDF$Voltage=='?'] <- 'NA'
HousePowerConsumptionDF$Global_intensity[HousePowerConsumptionDF$Global_intensity=='?'] <- 'NA'
HousePowerConsumptionDF$Sub_metering_1[HousePowerConsumptionDF$Sub_metering_1=='?'] <- 'NA'
HousePowerConsumptionDF$Sub_metering_2[HousePowerConsumptionDF$Sub_metering_2=='?'] <- 'NA'
HousePowerConsumptionDF$Sub_metering_3[HousePowerConsumptionDF$Sub_metering_3=='?'] <- 'NA'

##Converts Date to POSIXlt format

#Concatenates date and time for correct time format
time_tmp <- paste(HousePowerConsumptionDF$Date,HousePowerConsumptionDF$Time, sep=":") 

# COnverts time and date to POSIXlt time data types
HousePowerConsumptionDF$Date <- strptime(HousePowerConsumptionDF$Date, "%d/%m/%Y")
HousePowerConsumptionDF$Time <- strptime(time_tmp, "%d/%m/%Y:%H:%M:%S")

##Setting up the subset for the correct time Interval
dataRange <- c(strptime("01/02/2007", "%d/%m/%Y"), strptime("02/02/2007", "%d/%m/%Y"))
targetData <- subset(HousePowerConsumptionDF, HousePowerConsumptionDF$Date%in%dataRange)

##Converting column to be plotted in targetData to numeric
targetData$Sub_metering_1 <- as.numeric(targetData$Sub_metering_1)
targetData$Sub_metering_2 <- as.numeric(targetData$Sub_metering_2)
targetData$Sub_metering_3 <- as.numeric(targetData$Sub_metering_3)

##Plots the graph to a png file
png(file = "plot3.png", width = 480, height = 480)
plot(targetData$Time, targetData$Sub_metering_1, type="l",xlab="", ylab = "Energy sub metering", col="green")
lines(targetData$Time, targetData$Sub_metering_2, type="l", col="red")
lines(targetData$Time, targetData$Sub_metering_3, type="l", col="blue")
legend( "topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("green", "red", "blue"), lty=1)
dev.off()