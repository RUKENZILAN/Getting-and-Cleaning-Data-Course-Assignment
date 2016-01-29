# Getting and Cleaning Data Course Assignment Code Book

This file describes the variables, the data and any transformations or work that is performed to clean up the data.
The used data is obtained from  http://archive.ics.uci.edu/ml/machine-learning-databases/00240/
The used data for the project is http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip
One must set the working directory before running the code.

#The run_analysis.

R script performs the following steps to clean the data:

Reads the subject test and train data from ./UCI HAR Dataset/test/subject_test.txt and ./UCI HAR Dataset/train/subject_train.txt, respectively.
Names the datasets ( s_test, s_train, s_merged ) and then merges the training and the test sets under the crt_subject_dataset to create one data set.

Reads X_test.txt and X_train.txt files from ./UCI HAR Dataset/test/X_test.txt and ./UCI HAR Dataset/train/X_train.txt', respectively.
Binds and names the data ( X_test,X_train,X_merged ), creates X data set (crt_X_dataset).
 
Reads y_test.txt and y_train.txt files from ./UCI HAR Dataset/test/y_test.txt and ./UCI HAR Dataset/train/y_train.txt', respectively.
Binds and names the data ( y_test,y_train,y_merged ), creates y data set (crt_y_dataset).
 
Assigns dataset function (crt_subject_dataset(),crt_X_dataset(),crt_y_dataset()) to subject_dataset, X_dataset, y_dataset respectively.

Reads the id and column features from ./UCI HAR Dataset/features.txt file. Extracts the standard deviation and mean values for these features and names as dataset_filtered. The function is named as selected_measurements.

Activity labels are read from ./UCI HAR Dataset/activity_labels.txt file and called activity_labels.

Creates an intermediate dataset for measurements by combining all previously created datasets under the "results" folder which is called whole_dataset.csv.

Dataset from the whole_dataset is reorganized first under "measurements" name and then under the "tidy_dataset" name according to subject and activities. 
Finally the clean tidy_dataset is written as .cvs and .txt files under the "results" folder.




         
         
