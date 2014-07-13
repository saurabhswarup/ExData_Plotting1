## Download zip file
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

#Construct plot1.png
png(filename="plot1.png", width=480, height=480, units="px")

hist(HPC$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", col="red")

dev.off()





