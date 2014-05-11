#read data
pwcin<-read.table(file="household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
pwcin$datetime<-strptime(as.character(paste(pwcin$Date,pwcin$Time)),format="%d/%m/%Y %H:%M:%S")
pwc<-subset(pwcin, datetime >= as.POSIXct("2007-02-01 00:00:00") & datetime <= as.POSIXct("2007-02-02 23:59:59"))

#plot1
png(filename="plot1.png", width=480, height=480)
hist(pwc$Global_active_power,col="red",ylim=c(0,1200),xlab="Global Active Power (Kilowatts)",main="Global Active Power")
dev.off()