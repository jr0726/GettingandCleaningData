#My working directory
setwd("C:/Users/vasur/Desktop/Learning/3_Getting_Cleaning_Data")
#library
library(dplyr)
#down load file
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
              "SamsungGalaxy.zip",method = "libcurl")
#unzip the data
unzip("C:/Users/vasur/Desktop/Learning/3_Getting_Cleaning_Data/SamsungGalaxy.zip")
#Reading Data
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
activity <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("Code","Activity"))
#Test Data
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "Subject")
x_test <- read.table("UCI HAR Dataset/test/x_test.txt", col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "Code")
#Training Data
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "Subject")
x_train <- read.table("UCI HAR Dataset/train/x_train.txt", col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "Code")

#Mergeing the training and the test sets to create one data set.
x <- rbind(x_train,x_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_test,subject_train)
Merged_data <- cbind(subject, y, x)

#Measurements on the mean and standard deviation for each measurement.
Tidy_data <- Merged_data %>% select(Subject,Code,contains("mean"),contains("std"))
 
#Descriptive activity names to name the activities in the data set
Tidy_data$Code <- activity[Tidy_data$Code,2]

#Appropriately labels the data set with descriptive variable names
names(Tidy_data)[2] ="Activity"
names(Tidy_data) <- gsub("Acc","Accelerometer", names(Tidy_data))
names(Tidy_data) <- gsub("Gyro", "Gyroscope", names(Tidy_data))
names(Tidy_data) <- gsub("BodyBody", "Body", names(Tidy_data))
names(Tidy_data) <- gsub("Mag", "Magnitude", names(Tidy_data))
names(Tidy_data) <- gsub("^t", "Time", names(Tidy_data))
names(Tidy_data) <- gsub("^f", "Frequency", names(Tidy_data))
names(Tidy_data) <- gsub("tBody", "TimeBody", names(Tidy_data))

names(Tidy_data) <- gsub("-mean()", "Mean", names(Tidy_data),ignore.case = TRUE)
names(Tidy_data) <- gsub("-std()", "STD", names(Tidy_data),ignore.case = TRUE)
names(Tidy_data) <- gsub("-frequ()", "Frequency", names(Tidy_data),ignore.case = TRUE)
names(Tidy_data) <- gsub("angle", "Angle", names(Tidy_data))

FinalData <- Tidy_data %>% group_by(Subject, Activity) %>% summarise_all(funs(mean))
write.table(FinalData,"FinalData.txt", row.names = FALSE)