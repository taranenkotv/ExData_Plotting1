# name of file containing data
file <- "household_power_consumption.txt"

# read all data
dat = as.data.frame(read.table(file, sep=";", header=TRUE, na.strings = "?", stringsAsFactors=F))

# extract data from the dates 2007-02-01 and 2007-02-02
set = dat[(dat$Date == '1/2/2007' | dat$Date == '2/2/2007'), ]

# add a new column which contains the Date in POSIX format instead of character format
# this is needed for plotting purposes
set$DateTime = paste(set$Date, set$Time, sep=" ")
set$DateTime = strptime(set$DateTime, "%d/%m/%Y %H:%M:%S")
rm(dat)

# open the PNG graphic device
png(filename="plot4.png", width=480, height=480)
# set plot parameters -  2 rows and 2 columns
par(mfrow=c(2,2))
# upperleft chart
plot(set$DateTime,set$Global_active_power,type="l",xlab="",ylab="Global Active Power")

# upper right chart
plot(set$DateTime,set$Voltage,type="l",xlab="datetime",ylab="Voltage")

# lower left chart
plot(set$DateTime,set$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(set$DateTime,set$Sub_metering_2,col="red")
lines(set$DateTime,set$Sub_metering_3,col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")

# lower right chart
plot(set$DateTime,set$Global_reactive_power,type="l",xlab="datetime",ylab="Global Active Power")

# turn off graphic device
dev.off()


