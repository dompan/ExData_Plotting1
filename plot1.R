#Create a new variable "posixDate" that contain "Date"+"Time" in POSIX format
full_hpc<-read.table("./4/cp1/household_power_consumption.txt", header=TRUE , sep=";" , na.string="?" , dec=".")
full_hpc$datetime <- paste(full_hpc$Date, full_hpc$Time)
full_hpc$posixDate <- strptime(full_hpc$datetime, "%d/%m/%Y %H:%M:%S", tz="GMT")

#Filter the two required days
twodays<-full_hpc[full_hpc$posixDate>=as.POSIXlt("2007-02-01 00:00:00", tz="GMT") & full_hpc$posixDate<=as.POSIXlt("2007-02-02 23:59:59", tz="GMT"),]

#Launch the graphic device
png(filename="./4/plot1.png", height=480, width=480, bg="white")

#Plot the histogram
hist(twodays$Global_active_power,col='red',main="Global Active Power",xlab="Global Active Power (kilowatts)", ylab="Frequency")

#Close the graphic device
dev.off()





