The run_analysis.R script performs the data preparation and then followed by the 5 steps required.

Download the dataset
Dataset downloaded and extracted under the folder called UCI HAR Dataset

Assign each data to variables
features -->features.txt : 561 rows, 2 columns (n and functions) 

activity --> activity_labels.txt : 6 rows, 2 columns (code and Activity)

List of activities performed when the corresponding measurements were taken and its codes (labels)

subject_test -->-->subject_test.txt : 2947 rows, 1 column (subject)

x_test -->X_test.txt : 2947 rows, 561 columns 

contains recorded features test data
y_test -->y_test.txt : 2947 rows, 1 columns 

contains test data of activities’code labels
subject_train -->subject_train.txt : 7352 rows, 1 column 

contains train data of 21/30 volunteer subjects being observed
x_train -->X_train.txt : 7352 rows, 561 columns 

contains recorded features train data
y_train -->y_train.txt : 7352 rows, 1 columns 

contains train data of activities’ code labels

Merges the training and the test sets to create one data set
X (10299 rows, 561 columns) is created by merging x_train and x_test using rbind() function

Y (10299 rows, 1 column) is created by merging y_train and y_test using rbind() function

Subject (10299 rows, 1 column) is created by merging subject_train and subject_test using rbind() function

Merged_Data (10299 rows, 563 column) is created by merging Subject, Y and X using cbind() function

Extracts only the measurements on the mean and standard deviation for each measurement

Tidy_Data (10299 rows, 88 columns) is created by subsetting  Merged_Data.
Selecting only columns  subject, code and the measurements on the mean and standard deviation (std) for each measurement.

Uses descriptive activity names to name the activities in the data set
Entire numbers in code column of the Tidy_Data replaced with corresponding activity taken from second column of the  activity variable

Appropriately labels the data set with descriptive variable names
code column in Tidy_Data renamed into activities


From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
FinalData is created by summarizing  Tidy_Data taking the means of each variable for each activity and each subject and  grouped by subject and activity.
Export FinalData into FinalData.txt file.


README
Peer-graded Assignment--> Getting and Cleaning Data Course Project-Week 2 Assignment
This repository is for Getting and Cleaning Data course project, with the instructions on how to run analysis on Human Activity recognition dataset.

Dataset
Human Activity Recognition Using Smartphones


run_analysis.R performs the data preparation and then followed steps.
Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement.
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names.
From the data set in step 4, creates a second, independent tidy_data set with the average of each variable for each activity and each subject.
FinalData.txt is the exported final data after going through all the sequences described above.
