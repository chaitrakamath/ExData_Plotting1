#Steps followed to get the file, read data from file and add date time column

install.pacakges ("sqldf") ##install package to be able to use read.csv.sql() function
library(sqldf) ##load the package
getwd() ##check your current work directory
setwd("C:/Users/ckamath/Documents/Personal/Coursera/June2014/Exploratory Data Analysis/Assignment/Week1") #set work directory to the location where the zip file exists
list.files() ##check files listed in the work directory to make sure that the zip file exists
unzip("exdata-data-household_power_consumption.zip") #unzip the file
list.files() #again check to make sure that the zip file was unzipped and file has been extracted
rawData <- read.csv.sql (file = "household_power_consumption.txt", sql = "select * from file where Date in ('1/2/2007', '2/2/2007')", sep = ";") ##read data only for Feb 1st and Feb 2nd of 2007
rawData <- transform (rawData, DateTime =  strptime(paste (Date, Time), "%d/%m/%Y %H:%M:%S")) ##add datetime column to the dataframe
head(rawData) #check the data

##Plot 3: 
png (filename = "Plot3", width = 480, height = 480) #Open png to load third plot
plot(rawData$DateTime,rawData$Sub_metering_1, type = "l", ylab = "Energy Sub Metering", xlab = " ") #create third plot
lines(rawData$DateTime,rawData$Sub_metering_2, col = "red") ##add Submetering_2 information to plot
lines(rawData$DateTime,rawData$Sub_metering_3, col = "blue") ##add Submetering_3 information to plot
legend  ("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = c(2.5,2.5,2.5),col = c("black", "red", "blue")) ##add legend to topright corner
dev.off() ##close the png file connection
