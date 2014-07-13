url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
f <- file.path(getwd(), "Power_Con.zip")
download.file(url, f, mode = "wb")

## unzip the file
unzip(zipfile = "Power_Con.zip")

# Read the file
HPC <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?",
                  colClasses=c("character", "character", "numeric", 
                               "numeric", "numeric","numeric","numeric","numeric","numeric"))
HPC <- HPC[(HPC$Date == "1/2/2007") | (HPC$Date == "2/2/2007"),]
HPC$DateTime <- strptime(paste(HPC$Date, HPC$Time), "%d/%m/%Y %H:%M:%S")

#Construct plot4.png
png(filename="plot4.png", width=480, height=480, units="px")
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))

with(HPC, {
  plot(HPC$DateTime, HPC$Global_active_power, type="l", xlab="", ylab="Global Active Power")
  
  plot(HPC$DateTime, HPC$Voltage, xlab="datetime", ylab="Voltage", type="l")
  
  cols = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
  plot(HPC$DateTime, HPC$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(HPC$DateTime, HPC$Sub_metering_2, type="l", col="red")
  lines(HPC$DateTime, HPC$Sub_metering_3, type="l", col="blue")
  legend("topright", lty=1, lwd=1, col=c("black","blue","red"), legend=cols)
  
  plot(HPC$DateTime, HPC$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l")
    
})
dev.off()

