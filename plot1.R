
df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses="character")
df1 <- df[df$Date %in% c("1/2/2007", "2/2/2007"),]
df1$Global_active_power = as.numeric(df1$Global_active_power)

png("plot1.png")
hist(df1$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")
dev.off()
