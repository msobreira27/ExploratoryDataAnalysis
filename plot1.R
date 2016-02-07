##   Exploratory Data Analysis Project 1 - Plot 1  ##

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
HousePowerConsumptionDF$Date <- strptime(HousePowerConsumptionDF$Date, "%d/%m/%Y")

##Setting up the subset for the correct time Interval
dataRange <- c(strptime("01/02/2007", "%d/%m/%Y"), strptime("02/02/2007", "%d/%m/%Y"))
targetData <- subset(HousePowerConsumptionDF, HousePowerConsumptionDF$Date%in%dataRange)

##Converting column to be plotted in targetData to numeric
targetData$Global_active_power <- as.numeric(targetData$Global_active_power)

##Plots the graph to a png file
png(file = "plot1.png", width = 480, height = 480)
hist(targetData$Global_active_power, breaks=12, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()

##End