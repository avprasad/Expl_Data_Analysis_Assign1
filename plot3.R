#Load the data 
setwd("C:\\CourseraAssignments\\Exploratory_Data_Analysis\\HouseholdPower")
#Tidy up the data 
hhld_power <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

hhld_power_Dt <- subset(hhld_power, Date %in% c("1/2/2007","2/2/2007"))
hhld_power_Dt$Date <- as.Date(hhld_power_Dt$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(hhld_power_Dt$Date), hhld_power_Dt$Time)
hhld_power_Dt$Datetime <- as.POSIXct(datetime)
#Name the PNG

png("plot3.png", height=480, width=480)
#Plot the graph

with(hhld_power_Dt, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
#Close the PNG creation
