Sys.setlocale("LC_TIME", "en_US.UTF-8")

full_hpc<-read.table("./4/cp1/household_power_consumption.txt", header=TRUE , sep=";" , na.string="?" , dec=".")
full_hpc$datetime <- paste(full_hpc$Date, full_hpc$Time)
full_hpc$posixDate <- strptime(full_hpc$datetime, "%d/%m/%Y %H:%M:%S", tz="GMT")

twodays<-full_hpc[full_hpc$posixDate>=as.POSIXlt("2007-02-01 00:00:00", tz="GMT") & full_hpc$posixDate<=as.POSIXlt("2007-02-02 23:59:59", tz="GMT"),]

png(filename="./4/plot2.png", height=480, width=480, bg="white")

plot(twodays$posixDate,twodays$Global_active_power,xlab="", ylab="Global Active Power (kilowatts)",type="l")

dev.off()