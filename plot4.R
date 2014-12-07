#I need this for weekdays in english
Sys.setlocale("LC_TIME", "en_US.UTF-8")

#Create a new variable "posixDate" that contain "Date"+"Time" in POSIX format
full_hpc<-read.table("./4/cp1/household_power_consumption.txt", header=TRUE , sep=";" , na.string="?" , dec=".")
full_hpc$datetime <- paste(full_hpc$Date, full_hpc$Time)
full_hpc$posixDate <- strptime(full_hpc$datetime, "%d/%m/%Y %H:%M:%S", tz="GMT")

#Filter the two required days
twodays<-full_hpc[full_hpc$posixDate>=as.POSIXlt("2007-02-01 00:00:00", tz="GMT") & full_hpc$posixDate<=as.POSIXlt("2007-02-02 23:59:59", tz="GMT"),]

#Launch the graphic device
png(filename="./4/plot4.png", height=480, width=480, bg="white")

#Set the page for multiple graphs
par(mfcol=c(2,2))

#Plot 1st Graph
plot(twodays$posixDate,twodays$Global_active_power,xlab="", ylab="Global Active Power",type="l")

#Plot 2nd Graph
plot(twodays$posixDate,twodays$Sub_metering_1,type="l",col="black",ylab="Energy sub metering",xlab="")
lines(twodays$posixDate,twodays$Sub_metering_2,col="red")
lines(twodays$posixDate,twodays$Sub_metering_3,col="blue")
legend("topright", col = c("black","red", "blue"), lty=c(1,1,1),bty="n",legend =c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Plot 3rd Graph
plot(twodays$posixDate,twodays$Voltage,xlab="datetime", ylab="Voltage",type="l")

#Plot 4th Graph
plot(twodays$posixDate,twodays$Global_reactive_power,xlab="datetime", ylab="Global Reactive Power",type="l")

#Close the graphic device
dev.off()