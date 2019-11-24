# The run_analysis.R script performs the data preparation using the steps required as described in the course project’s definition.

Download the dataset

Dataset downloaded and extracted under the folder called UCI HAR Dataset

## Assign each data to variables

features <- features.txt : 561 rows, 2 columns

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.

activity_labels <- activity_labels.txt : 6 rows, 2 columns

List of activities performed when the corresponding measurements were taken and its codes (labels)

subject_test <- test/subject_test.txt : 2947 rows, 1 column

contains test data of 9/30 volunteer test subjects being observed

X_test <- test/X_test.txt : 2947 rows, 561 columns

contains recorded features test data

y_test <- test/y_test.txt : 2947 rows, 1 columns

contains test data of activities’code labels

subject_train <- test/subject_train.txt : 7352 rows, 1 column

contains train data of 21/30 volunteer subjects being observed

X_train <- test/X_train.txt : 7352 rows, 561 columns

contains recorded features train data

y_train <- test/y_train.txt : 7352 rows, 1 columns

contains train data of activities’code labels

## Merges the training and the test sets to create one data set

X (10299 rows, 561 columns) is created by merging x_train and x_test using rbind() function

y (10299 rows, 1 column) is created by merging y_train and y_test using rbind() function

subject (10299 rows, 1 column) is created by merging subject_train and subject_test using rbind() function

total (10299 rows, 563 column) is created by merging Subject, Y and X using cbind() function

## The variables in the tidy data

Tidy data contains 180 rows and 68 columns. Each row has averaged features for each subject and activity.


Uses descriptive activity names to name the activities in the data set

Entire numbers in code column of the X replaced with corresponding activity taken from second column of the activity_labels variable

## Export tidySet data into tidydata.txt file.
