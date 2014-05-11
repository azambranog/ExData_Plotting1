# This code generates a time series plot of the global active power between
# 2007-02-01 and 2007-02-02. The result is stored in plot2.png

#get all data
data<-read.table("household_power_consumption.txt",
                 header=T,
                 sep=";",
                 na.strings="?",
                 stringsAsFactors=F)

#get necessary subset
data<-data[data$Date %in% c("1/2/2007","2/2/2007"),]


#create new column that has date and time format together in adequate date format
data$DateTime<-paste(data$Date,data$Time) #new column
#transform to time
data$DateTime<-strptime(data$DateTime,format="%d/%m/%Y %H:%M:%S")

  
#save and do plot
png("plot2.png") #open device png default size is what we need

plot(data$DateTime,data$Global_active_power, 
     main="",
     xlab="",
     ylab="Global Active Power (kilowatts)",
     type="l")

dev.off() #close device png