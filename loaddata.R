# Check for existing filtered data set (keeps only required dates for the project)
# NOTE: this will likely only work on Mac / Linux / other UNIX-like OS
if (!file.exists("hpc_filtered.txt")) {
  
  # Checks for raw data file, downloads and unzips a fresh copy if it's missing
  if (!file.exists("household_power_consumption.txt")) {
    try(download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                      "household_power_consumption.zip", method="curl"))
    try(system("unzip household_power_consumption.zip"))
    
    if (!file.exists("household_power_consumption.txt")) {
      stop("Data file (household_power_consumption.txt) doesn't exist in working directory")
    }
  }

  # Create filtered file containing only dates of interest
  try(system("head -n 1 household_power_consumption.txt > hpc_filtered.txt"))
  try(system("grep '^[12]/2/2007;' household_power_consumption.txt >> hpc_filtered.txt"))
  
  if (!file.exists("hpc_filtered.txt")) {
    stop("Couldn't generate filtered data from raw data file (expecting UNIX-like operating system)")
  }
}

# Read data from filtered file
data <- read.table("hpc_filtered.txt", sep=";", header=TRUE, na.strings = "?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

# Create timestamp field
data$Timestamp <- with(data, strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"))

# Reorder columns for convenience
data <- data[c(10, 3, 4, 5, 6, 7, 8, 9, 1, 2)]
