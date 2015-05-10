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
png(filename="plot3.png", width=480, height=480)

# plot the needed data with required lines and legend

plot(set$DateTime,set$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(set$DateTime,set$Sub_metering_2,col="red")
lines(set$DateTime,set$Sub_metering_3,col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# turn off graphic device
dev.off()


