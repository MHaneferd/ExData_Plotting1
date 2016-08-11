# load libraries needed
library(libcurl)

# Download the zipped files containing datasets
zipfile="./projectfiles.zip"
if(!file.exists("./projectfiles.zip")){
      fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
      download.file(fileUrl, destfile=zipfile, method="libcurl")
}

# Unpack files to data directory
unzip(zipfile)

# Clean up unneccesary values from environment:
rm(fileUrl)
rm(zipfile)
