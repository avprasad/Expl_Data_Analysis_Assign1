#Load the data 
setwd("C:\\CourseraAssignments\\Exploratory_Data_Analysis\\HouseholdPower")
#Tidy up the data 
hhld_power <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
hhld_power_Dt <- subset(hhld_power, Date %in% c("1/2/2007","2/2/2007"))
hhld_power_Dt$Date <- as.Date(hhld_power_Dt$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(hhld_power_Dt$Date), hhld_power_Dt$Time)
hhld_power_Dt$Datetime <- as.POSIXct(datetime)
#Create the plot
with(hhld_power_Dt, {
  plot(Global_active_power~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
})

# Method to copy to the Png File 
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
