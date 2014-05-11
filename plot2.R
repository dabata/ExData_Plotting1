#read data
pwcin<-read.table(file="household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
pwcin$datetime<-strptime(as.character(paste(pwcin$Date,pwcin$Time)),format="%d/%m/%Y %H:%M:%S")
pwc<-subset(pwcin, datetime >= as.POSIXct("2007-02-01 00:00:00") & datetime <= as.POSIXct("2007-02-02 23:59:59"))

#plot2
png(filename="plot2.png", width=480, height=480)
with(pwc,plot(datetime,Global_active_power,ylab="Global Active Power (Kilowatts)",xlab="",type="l"))
dev.off()