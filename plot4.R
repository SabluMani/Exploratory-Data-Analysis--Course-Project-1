# Reading the electric power consumption data

setwd("C:\\Users\\Dhananjay\\Desktop\\SEM\\coursera_EDA")
electric_power <- read.table("household_power_consumption.txt",skip=1,sep=";")

# Name the variables of electric power consumption data
names(electric_power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

# Subset the electric power consumption data from the dates 2007-02-01 and 2007-02-02
sub_electric_power <- subset(electric_power,electric_power$Date=="1/2/2007" | electric_power$Date =="2/2/2007")
missing <- is.na(sub_electric_power)
sum(missing)

# Transform the Date and Time vars of subset data from characters into objects of type Date and POSIXlt respectively
sub_electric_power$Date <- as.Date(sub_electric_power$Date, format="%d/%m/%Y")
sub_electric_power$Time <- strptime(sub_electric_power$Time, format="%H:%M:%S")
sub_electric_power[1:1440,"Time"] <- format(sub_electric_power[1:1440,"Time"],"2007-02-01 %H:%M:%S")
sub_electric_power[1441:2880,"Time"] <- format(sub_electric_power[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


# Inititae mixed plot
par(mfrow=c(2,2))

#Plot4
png("plot4.png", width=480, height=480)
with(sub_electric_power,{
  plot(sub_electric_power$Time,as.numeric(as.character(sub_electric_power$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
  plot(sub_electric_power$Time,as.numeric(as.character(sub_electric_power$Voltage)), type="l",xlab="datetime",ylab="Voltage")
  plot(sub_electric_power$Time,sub_electric_power$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
  with(sub_electric_power,lines(Time,as.numeric(as.character(Sub_metering_1))))
  with(sub_electric_power,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
  with(sub_electric_power,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
  legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
  plot(sub_electric_power$Time,as.numeric(as.character(sub_electric_power$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
})
dev.off()
