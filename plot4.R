df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses="character")

df1 <- df[df$Date %in% c("1/2/2007", "2/2/2007"),]

df1$Global_active_power = as.numeric(df1$Global_active_power)
df1$Global_reactive_power = as.numeric(df1$Global_reactive_power)
df1$Voltage = as.numeric(df1$Voltage)
df1$Sub_metering_1 = as.numeric(df1$Sub_metering_1)
df1$Sub_metering_2 = as.numeric(df1$Sub_metering_2)
df1$Sub_metering_3 = as.numeric(df1$Sub_metering_3)
df1$date_time <- as.POSIXct(paste(df1$Date, df1$Time), format="%d/%m/%Y %H:%M:%S")

png("plot4.png")
oldpar <- par(mfrow=c(2,2), mar=c(5,4,3,2)+0.1)

plot(df1$date_time, df1$Global_active_power, xlab="", ylab="Global Active Power", type="l")

plot(df1$date_time, df1$Voltage, xlab="datetime", ylab="Voltage", type="l")

plot(df1$date_time, df1$Sub_metering_1, xlab="", ylab="Energy sub metering", type="l")
lines(df1$date_time, df1$Sub_metering_2, col="red")
lines(df1$date_time, df1$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1,
       col=c("black", "red", "blue"), bty='n')

plot(df1$date_time, df1$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l")

par(oldpar)
dev.off()
