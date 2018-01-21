#Load the data 
setwd("C:\\CourseraAssignments\\Exploratory_Data_Analysis\\HouseholdPower")
#Tidy up the data 
hhld_power <- read.csv("household_power_consumption.txt",header = T,
                       sep = ";",na.strings="?", 
                       nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
hhld_power_Dt <- subset(hhld_power, Date %in% c("1/2/2007","2/2/2007"))
hhld_power_Dt$Date <- as.Date(hhld_power_Dt$Date, format="%d/%m/%Y")
#Create the plot and write into PNG
png("plot1.png", width=480, height=480)# Open the Png File 
hist(hhld_power_Dt$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()