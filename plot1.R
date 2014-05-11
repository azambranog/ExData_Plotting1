# This code generates a histogram of the global active power between
# 2007-02-01 and 2007-02-02. The result is stored in plot1.png

#get all data
data<-read.table("household_power_consumption.txt",
                 header=T,
                 sep=";",
                 na.strings="?",
                 stringsAsFactors=F)

#get necessary subset
data<-data[data$Date %in% c("1/2/2007","2/2/2007"),]


#save and do plot
png("plot1.png") #open device png

hist(data$Global_active_power, 
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     col="red")

dev.off() #close device png