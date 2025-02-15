cols=c('Date','Time','Global_active_power','Global_reactive_power','Voltage','Global_intensity','Sub_metering_1','Sub_metering_2','Sub_metering_3')
df<- read.table('household_power_consumption.txt',sep=';',na.strings='?', header = TRUE,nrows=2880, skip=66636,col.names =cols,stringsAsFactors = FALSE)
df$datetime<- paste(df$Date,df$Time)  
df$datetime<-as.POSIXct(df$datetime,format = "%d/%m/%Y %H:%M:%S")
plot(df$datetime,df$Sub_metering_1,type='l',xlab="",ylab="Energy sub metering",col="black")
lines(df$datetime,df$Sub_metering_2,type='l',col="red")
lines(df$datetime,df$Sub_metering_3,type='l',col="blue")
legend("topright",legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),cex=0.5,col=c("black","red", "blue"),lty=1)
dev.copy(png,"plot3.png",height=480, width=480)
dev.off()