Code Book for Coursera Getting and Cleaning Data Project 
==============================================================


## The data 

The data has been taken from the [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones].

The raw data is the output of a number of observations by smartphone measures (accelerometer, gyroscope etc.) when separate activities of daily living are performed.

The experiments were carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The original data set had 561 features across the 30 participants.

- [Project data ZIP](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 
- [Full description](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

For a full description please refer to `README.txt` and `features_info.txt` using the full description link.

## Information on the elements in the data:

For each record in the tidy data it is provided:
- The subject number (1 to 30)
- The activity label (six different activities):
  - Laying
  - Sitting
  - Standing
  - Walking
  - Walking downstairs
  - Walking upstairs
- Each variables in the raw data which was a mean or a standard deviation.

## The transformations

The data was transformed as follows:

1. The training and test data was merged to create one file of all observations with 10,299 rows and 561 columns.
2. This was subsetted to include the data containing standard deviations and means only. 
3. The participant data and activity data was joined to this subset. The activity data was given human-readable names rather than numbers (walking rather than 1., etc.). 
4. The observation variables were given human readable names by extracting the variable names from the raw data and removing brackets() and dashes-.
5. The melt() function from the reshape2 package was used to create a tidy, narrow data set. All 79 columns other than Subject and Activity were in fact observations (e.g. mean of body acceleration). These were therefore melted into rows which created 813,621 rows (10299 rows * 79 new observations per row.)
6. A mean of each observation variable (e.g. body acceleration) per subject and activity was created using the dcast() function in the reshape2 package.
7. This was output to a tab-separated text file called "UCI HAR output.txt".

## Variable names

There are 81 variable names.

A full explanation of each of these is contained within features_info.txt contained within the [Project data ZIP](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 

"1"
"Subject"
"2"
"Activity"
"3"
"Mean of  tBodyAccmeanX"
"4"
"Mean of  tBodyAccmeanY"
"5"
"Mean of  tBodyAccmeanZ"
"6"
"Mean of  tBodyAccstdX"
"7"
"Mean of  tBodyAccstdY"
"8"
"Mean of  tBodyAccstdZ"
"9"
"Mean of  tGravityAccmeanX"
"10"
"Mean of  tGravityAccmeanY"
"11"
"Mean of  tGravityAccmeanZ"
"12"
"Mean of  tGravityAccstdX"
"13"
"Mean of  tGravityAccstdY"
"14"
"Mean of  tGravityAccstdZ"
"15"
"Mean of  tBodyAccJerkmeanX"
"16"
"Mean of  tBodyAccJerkmeanY"
"17"
"Mean of  tBodyAccJerkmeanZ"
"18"
"Mean of  tBodyAccJerkstdX"
"19"
"Mean of  tBodyAccJerkstdY"
"20"
"Mean of  tBodyAccJerkstdZ"
"21"
"Mean of  tBodyGyromeanX"
"22"
"Mean of  tBodyGyromeanY"
"23"
"Mean of  tBodyGyromeanZ"
"24"
"Mean of  tBodyGyrostdX"
"25"
"Mean of  tBodyGyrostdY"
"26"
"Mean of  tBodyGyrostdZ"
"27"
"Mean of  tBodyGyroJerkmeanX"
"28"
"Mean of  tBodyGyroJerkmeanY"
"29"
"Mean of  tBodyGyroJerkmeanZ"
"30"
"Mean of  tBodyGyroJerkstdX"
"31"
"Mean of  tBodyGyroJerkstdY"
"32"
"Mean of  tBodyGyroJerkstdZ"
"33"
"Mean of  tBodyAccMagmean"
"34"
"Mean of  tBodyAccMagstd"
"35"
"Mean of  tGravityAccMagmean"
"36"
"Mean of  tGravityAccMagstd"
"37"
"Mean of  tBodyAccJerkMagmean"
"38"
"Mean of  tBodyAccJerkMagstd"
"39"
"Mean of  tBodyGyroMagmean"
"40"
"Mean of  tBodyGyroMagstd"
"41"
"Mean of  tBodyGyroJerkMagmean"
"42"
"Mean of  tBodyGyroJerkMagstd"
"43"
"Mean of  fBodyAccmeanX"
"44"
"Mean of  fBodyAccmeanY"
"45"
"Mean of  fBodyAccmeanZ"
"46"
"Mean of  fBodyAccstdX"
"47"
"Mean of  fBodyAccstdY"
"48"
"Mean of  fBodyAccstdZ"
"49"
"Mean of  fBodyAccmeanFreqX"
"50"
"Mean of  fBodyAccmeanFreqY"
"51"
"Mean of  fBodyAccmeanFreqZ"
"52"
"Mean of  fBodyAccJerkmeanX"
"53"
"Mean of  fBodyAccJerkmeanY"
"54"
"Mean of  fBodyAccJerkmeanZ"
"55"
"Mean of  fBodyAccJerkstdX"
"56"
"Mean of  fBodyAccJerkstdY"
"57"
"Mean of  fBodyAccJerkstdZ"
"58"
"Mean of  fBodyAccJerkmeanFreqX"
"59"
"Mean of  fBodyAccJerkmeanFreqY"
"60"
"Mean of  fBodyAccJerkmeanFreqZ"
"61"
"Mean of  fBodyGyromeanX"
"62"
"Mean of  fBodyGyromeanY"
"63"
"Mean of  fBodyGyromeanZ"
"64"
"Mean of  fBodyGyrostdX"
"65"
"Mean of  fBodyGyrostdY"
"66"
"Mean of  fBodyGyrostdZ"
"67"
"Mean of  fBodyGyromeanFreqX"
"68"
"Mean of  fBodyGyromeanFreqY"
"69"
"Mean of  fBodyGyromeanFreqZ"
"70"
"Mean of  fBodyAccMagmean"
"71"
"Mean of  fBodyAccMagstd"
"72"
"Mean of  fBodyAccMagmeanFreq"
"73"
"Mean of  fBodyBodyAccJerkMagmean"
"74"
"Mean of  fBodyBodyAccJerkMagstd"
"75"
"Mean of  fBodyBodyAccJerkMagmeanFreq"
"76"
"Mean of  fBodyBodyGyroMagmean"
"77"
"Mean of  fBodyBodyGyroMagstd"
"78"
"Mean of  fBodyBodyGyroMagmeanFreq"
"79"
"Mean of  fBodyBodyGyroJerkMagmean"
"80"
"Mean of  fBodyBodyGyroJerkMagstd"
"81"
"Mean of  fBodyBodyGyroJerkMagmeanFreq"


