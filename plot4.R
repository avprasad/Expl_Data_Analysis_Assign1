#Load the data 
setwd("C:\\CourseraAssignments\\Exploratory_Data_Analysis\\HouseholdPower")
#Tidy up the data 
hhld_power <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

hhld_power_Dt <- subset(hhld_power, Date %in% c("1/2/2007","2/2/2007"))
hhld_power_Dt$Date <- as.Date(hhld_power_Dt$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(hhld_power_Dt$Date), hhld_power_Dt$Time)
hhld_power_Dt$Datetime <- as.POSIXct(datetime)

#Create the Graph

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(hhld_power_Dt, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})
#Copy output to PNG
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
#Close the Graph

