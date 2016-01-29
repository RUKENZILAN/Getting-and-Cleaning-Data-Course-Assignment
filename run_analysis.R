# the 'run_analysis.R' script does the following:
#This code does the below steps as required.

# 1- Merges the training and the test sets to create one data set.
crt_subject_dataset <- function() {


        s_test<- read.table('./UCI HAR Dataset/test/subject_test.txt')
        s_train <- read.table('./UCI HAR Dataset/train/subject_train.txt')
        s_merged <- rbind(s_train, s_test)
        names(s_merged) <- "subject"
        s_merged
}

# reads and binds X dataset

crt_X_dataset <- function() {
        X_test <- read.table('./UCI HAR Dataset/test/X_test.txt')
        X_train <- read.table('./UCI HAR Dataset/train/X_train.txt')
        X_merged  <- rbind(X_train, X_test)
}

# reads and binds Y dataset
crt_y_dataset <- function() {
        y_test <- read.table('./UCI HAR Dataset/test/y_test.txt')
        y_train <- read.table('./UCI HAR Dataset/train/y_train.txt')
        y_merged  <- rbind(y_train, y_test)
}

# creates X and Y datasets

subject_dataset <- crt_subject_dataset()
X_dataset <- crt_X_dataset()
y_dataset <- crt_y_dataset()


# 2- Extracts the mean and standard deviation measurements for each case. 

selected_measurements <- function() {
        features <- read.table('./UCI HAR Dataset/features.txt', header=FALSE, col.names=c('id', 'name'))
        f_selected_columns <- grep('mean\\(\\)|std\\(\\)', features$name)
        dataset_filtered <- X_dataset[, f_selected_columns]
        names( dataset_filtered) <- features[features$id %in% f_selected_columns, 2]
        dataset_filtered
}

X_dataset_filtered <- selected_measurements()

# 3- Names the activities in the data set with descriptive activity names  

activity_labels <- read.table('./UCI HAR Dataset/activity_labels.txt', header=FALSE, col.names=c('id', 'name'))


# 4- Labels the data set with descriptive activity names. 

y_dataset[, 1] = activity_labels[y_dataset[, 1], 2]
names(y_dataset) <- "activity"


# 5.A- Creates an intermediate dataset for measurements.

whole_dataset <- cbind(subject_dataset, y_dataset, X_dataset_filtered)
write.csv(whole_dataset, "./results/whole_dataset.csv")


# 5.B- Creates independent tidy data set with the average of each variable for each activity and each subject.

measurements <- whole_dataset[, 3:dim(whole_dataset)[2]]
tidy_dataset <- aggregate(measurements, list(whole_dataset$subject, whole_dataset$activity), mean)
names(tidy_dataset)[1:2] <- c('subject', 'activity')
write.csv(tidy_dataset, "./results/final_tidy_dataset.csv")
write.table(tidy_dataset, "./results/final_tidy_dataset.txt",row.name=FALSE)