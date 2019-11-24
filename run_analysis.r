## Setting working Directory

setwd("D:/R/UCI HAR Dataset")
getwd()
library(dplyr)

## Reading/Loading train data

X_train<-read.table("./train/X_train.txt")
y_train<-read.table("./train/y_train.txt")
subject_train<-read.table("./train/subject_train.txt")

## Reading/Loading test data

X_test<-read.table("./test/X_test.txt")
y_test<-read.table("./test/y_test.txt")
subject_test<-read.table("./test/subject_test.txt")

## Reading data description

features<-read.table("features.txt")

## Reading the activity labels

activity_labels<-read.table("activity_labels.txt")

# 1. Merges the training and the test sets to create one data set.

X<-rbind(X_train,X_test)
y<-rbind(y_train,y_test)
subject<-rbind(subject_train,subject_test)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

selected_features<-features[grep("mean\\(\\)|std\\(\\)",features[,2]),]
X<-X[,selected_features[,1]]

# 3. Uses descriptive activity names to name the activities in the data set

colnames(y)<-"activity"
y$activitylabel<-factor(y$activity,labels=as.character(activity_labels[,2]))
activitylabel<-y[,2]

# 4. Appropriately labels the data set with descriptive variable names.

colnames(X) <- features[selected_features[,1],2]

## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

colnames(subject)<-"subject"
total<-cbind(X,activitylabel,subject)
tidySet <- total %>% group_by(activitylabel, subject) %>% summarize_each(funs(mean))

## Save tidy dataset

write.table(tidySet,"tidydata.txt",row.names = FALSE)



