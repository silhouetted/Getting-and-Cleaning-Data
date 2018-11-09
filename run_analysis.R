## Download the data and unzip if necessary


# set file name
fileName <- "UCIdata.zip"
fileUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"


# Check if file exists (to avoid downloading twice). Mode = wb seems to reduce errors
# on my machine (linux) and should not prevent it working on other systems

if(!file.exists(fileName)){
        download.file(fileUrl,fileName, mode = "wb") 
}

# Check if it has already been unzipped and if not then do so.
if(!file.exists("UCI HAR Dataset")){
        unzip("UCIdata.zip", files = NULL, exdir=".")
}


## 1. Merges the training and the test sets to create one data 
# set.

# read in the labels for both data sets

activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
featuresLabels <- read.table("UCI HAR Dataset/features.txt")

# read in training data
subjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt")
xTrain <- read.table("UCI HAR Dataset/train/X_train.txt")
yTrain <- read.table("UCI HAR Dataset/train/y_train.txt")

## read in test data
subjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt")
xTest <- read.table("UCI HAR Dataset/test/X_test.txt")
yTest <- read.table("UCI HAR Dataset/test/y_test.txt")

# merge both of the x Data fils into one data frame which will have 
# 10299 rows and 561 columns
mergedXData <- rbind(xTrain, xTest)

## 2. Extracts only the measurements on the mean and 
# standard deviation for each measurement.

# Create a vector of where the labels contain mean and std only 
# this is a vector of the columns we need with length 79
meanStd <- grep("mean()|std()", featuresLabels[, 2])

# Use this vector to subset the x data which should give use a data frame
# with 10299 rows and 79 columns
xDataMeanStdOnly <- mergedXData[,meanStd]

## 3. Uses descriptive activity names to name 
# the activities in the data set.

# First get the activity data into one data frame which will have 
# 10299 rows and one column 
activityData <- rbind(yTrain,yTest)

# Make the values (1:6) of activityData a factor variable 
activityData$V1 <- as.factor(activityData$V1)

# Get the level names from the activity labels data frame
rawLevels <- levels(activityLabels$V2)

# Put them in a slightly more readable format by

# Reducing underscores
newLevels <- sub("_", "", rawLevels)

# Making it lower case
newLevels <- tolower(newLevels)

# Then assign the levels of the factor to the labels (Walking, standing etc.)

levels(activityData$V1) <- newLevels

# This is also a good moment to add the subject data, before we start playing 
# around with the data and changing the order of the rows
subjectData <- rbind(subjectTrain, subjectTest)

# Then merge them all into one data set which should have 10299 rows and 81 cols
fullData <- cbind(subjectData, activityData, xDataMeanStdOnly)

## 4. Appropriately labels the data set with 
# descriptive variable names.

# Get the 79 column names from the feature labels file where there was mean/std 
meanStdColNames <- grep("mean()|std()", featuresLabels[, 2], value = TRUE)

# Remove the brackets() and dashes- to make column names human readable
readableMeanStdColNames <-  gsub("[()-]", "", meanStdColNames)

# Assign them to the full data names, remembering that the first twogsub("[()-]", "", meanStdColNames) columns
# are subject and activity, because of the column binding at the end of step 3
names(fullData) <- c("Subject", "Activity", readableMeanStdColNames)

## 5. From the data set in step 4, creates a
# second, independent tidy data set with the average of 
# each variable for each activity and each subject.

# install reshape2 package if necessary and then load it
if (!"reshape2" %in% installed.packages()) {
        install.packages("reshape2")
}
library("reshape2")

# Make the data tidy by making it tall and skinny
# Which means making every column which is a variable into a row
# This should output a data frame which is four columns wide with two existing
# columns (Subject, Activity) and two new columns (Variable, Value). Variable 
# will be the other column names (e.g. tbodyAcc-mean()) and value is the value
# that was in that column. It will therefore be 813621 rows (10299 rows * 79 new
# observations per row.

tidyData <- melt(fullData,(id.vars=c("Subject","Activity")))

# use dcast to find the subject and activity per variable

meanPerSubjectActivityData <- dcast(tidyData, Subject + Activity ~ variable, mean)

# Make it clear from the names that you are looking at means of mean and stdev
names(meanPerSubjectActivityData)[3:81] <- paste("Mean of ", names(meanPerSubjectActivityData)[3:81])

# Write the output to a text file with a tab separator and and remove the row names
write.table(meanPerSubjectActivityData, "UCI HAR output.txt", sep = "\t", row.names = FALSE)


