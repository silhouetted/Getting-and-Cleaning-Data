Readme for Coursera Getting and Cleaning Data Project
======================================================

## Getting and Cleaning Data Course Project

# The assignment

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example [this article](http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/). Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# The implementation

A script called run_analysis.R was created which transformed the data as follows:

1. The training and test data was merged to create one file of all observations with 10,299 rows and 561 columns.
2. This was subsetted to include the data containing standard deviations and means only. 
3. The participant data and activity data was joined to this subset. The activity data was given human-readable names rather than numbers (walking rather than 1., etc.). 
4. The observation variables were given human readable names by extracting the variable names from the raw data and removing brackets() and dashes-.
5. The melt() function from the reshape2 package was used to create a tidy, narrow data set. All 79 columns other than Subject and Activity were in fact observations (e.g. mean of body acceleration). These were therefore melted into rows which created 813,621 rows (10299 rows * 79 new observations per row.)
6. A mean of each observation variable (e.g. body acceleration) per subject and activity was created using the dcast() function in the reshape2 package.
7. This was output to a tab-separated text file called "UCI HAR output.txt".

## See run_analysis.R for code codebook.md for full details of variable names
## Tested using R Version 3.2.3 on x86_64-pc-linux-gnu on 9 November 2018

