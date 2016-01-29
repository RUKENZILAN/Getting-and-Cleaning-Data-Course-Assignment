Getting and Cleaning Data Course Assignment
========================================

# run_analysis.R

This R script does the followings as stated in the project assignment instructions:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive names to name the activities in the data set
4. Labels the data set with descriptive names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

## Downloading the original data

Before running the script you must downloaded and unzip the original Samsung data in a folder called UCI HAR Dataset. 
Set the working directory according to that.

## Analysis

load the script in R environment by typing

source('run_analysis.R')

The result will be found in the results folder under the name of final_tidy_dataset.txt and final_tidy_dataset.csv, as well.


## Tidy dataset

In the final clean dataset each row includes subject, activity and measured data for features(standard deviation and mean).
# Getting-and-Cleaning-Data-Course-Assignment
