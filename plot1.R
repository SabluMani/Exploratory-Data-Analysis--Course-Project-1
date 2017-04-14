# Reading the electric power consumption data

setwd("C:\\Users\\Dhananjay\\Desktop\\SEM\\coursera_EDA")
electric_power <- read.table("household_power_consumption.txt",skip=1,sep=";")

# Name the variables of electric power consumption data
names(electric_power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

# Subset the electric power consumption data from the dates 2007-02-01 and 2007-02-02
sub_electric_power <- subset(electric_power,electric_power$Date=="1/2/2007" | electric_power$Date =="2/2/2007")
missing <- is.na(sub_electric_power)
sum(missing)

# Plot 1- Global Active Power
png("plot1.png", width=480, height=480)
hist(as.numeric(as.character(sub_electric_power$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
dev.off()