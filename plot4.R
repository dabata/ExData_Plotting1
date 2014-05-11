#read data
pwcin<-read.table(file="household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
pwcin$datetime<-strptime(as.character(paste(pwcin$Date,pwcin$Time)),format="%d/%m/%Y %H:%M:%S")
pwc<-subset(pwcin, datetime >= as.POSIXct("2007-02-01 00:00:00") & datetime <= as.POSIXct("2007-02-02 23:59:59"))

#plot4
png(filename="plot4.png", width=480, height=480)
par(mfrow=c(2,2))
with(pwc,plot(datetime,Global_active_power,ylab="Global Active Power",xlab="",type="l"))
with(pwc,plot(datetime,Voltage,type="l"))
plot(pwc$datetime,pwc$Sub_metering_1,xlab="",ylab="Energy sub metering",type="n")
points(pwc$datetime,pwc$Sub_metering_1,type="l")
points(pwc$datetime,pwc$Sub_metering_2,type="l",col="red")
points(pwc$datetime,pwc$Sub_metering_3,type="l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,bty="n")
with(pwc,plot(datetime,Global_reactive_power,type="l"))
dev.off()