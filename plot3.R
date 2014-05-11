
#Read table

power <- read.table("household_power_consumption/household_power_consumption.txt", sep = ";", h=T)

#Change file

datetime <- paste(power$Date, power$Time)
datetime <-as.POSIXct(strptime(datetime, "%d/%m/%Y %H:%M:%S"))
power <- cbind(datetime, power[,-(1:2)])


#Subset and change
power <- subset(power, datetime >= as.POSIXct("2007-02-01 00:00:00 PST") & datetime <= as.POSIXct("2007-02-02 23:59:59 PST"))
power$Global_active_power = as.numeric(as.character(power$Global_active_power))


power$Sub_metering_1 <- as.numeric(as.character(power$Sub_metering_1))
power$Sub_metering_2 <- as.numeric(as.character(power$Sub_metering_2))
power$Sub_metering_3 <- as.numeric(as.character(power$Sub_metering_3))


#Open a png connection
png("plot3.png", width = 480, height = 480)
#Create the first plot for sub_1
plot(power$Sub_metering_1 ~ power$datetime, type = "l", main = "", ylab = "Energy sub metering", xlab = "")
#Add the lines for the sub_2, colored red
lines(power$Sub_metering_2 ~ power$datetime, col = "Red")
#Add the lines for the sub_3, colored blue
lines(power$Sub_metering_3 ~ power$datetime, col = "Blue")
#Add a legend
legend("topright", col = c("Black", "Red", "Blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1)
#Close the connection
dev.off()
