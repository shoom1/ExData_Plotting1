
df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses="character")

df1 <- df[df$Date %in% c("1/2/2007", "2/2/2007"),]
df1$Global_active_power = as.numeric(df1$Global_active_power)
df1$date_time <- as.POSIXct(paste(df1$Date, df1$Time), format="%d/%m/%Y %H:%M:%S")

png("plot2.png")
plot(df1$date_time, df1$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l")
dev.off()
