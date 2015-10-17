#Run_analysis.R
#Tidy Data Project

#data download
if(!file.exists("./data")) {dir.create("./data")}      #create a data dir if it doesn't exist
fileUrl <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
download.file(fileUrl, destfile='./data/Dataset.zip')  # Create zip file and download dataset
unzip(zipfile='./data/Dataset.zip', exdir='./data')    # unzip file

library(dplyr)
library(tidyr)

##loading datasets to R

subject_train <- read.table('./data/UCI HAR Dataset/train/subject_train.txt') # load datasets to R
subject_test <- read.table('./data/UCI HAR Dataset/test/subject_test.txt')
x_train <- read.table('./data/UCI HAR Dataset/train/x_train.txt')
y_train <- read.table('./data/UCI HAR Dataset/train/y_train.txt')
x_test <- read.table('./data/UCI HAR Dataset/test/x_test.txt')
y_test <- read.table('./data/UCI HAR Dataset/test/y_test.txt')
features <- read.table('./data/UCI HAR Dataset/features.txt')
activity_labels <- read.table('./data/UCI HAR Dataset/activity_labels.txt')

##Change to column names for feature variables

colnames(x_train) <- features[,2]           #Rename x_train and x_test dataset column labels with feature variable names 
x_train <- x_train[, !duplicated(colnames(x_train))]  #Remove duplicates from both datasets
colnames(x_test) <- features[,2]
x_test <- x_test[, !duplicated(colnames(x_test))]

## Merging datasets

trainMerge <- cbind(subject_train, y_train, x_train)   #merge all 'train' datasets in this order
testMerge <- cbind(subject_test, y_test, x_test)       #merge all 'test' datasets in this order
mergeAll <- rbind(trainMerge, testMerge)               #merge both 'train' and 'test' datsets using row bind

colnames(mergeAll)[2] <- 'Activity'                    #Because columns 1&2 have same column name ('V1') change column 2

## Extracting only the measurements on the mean & standard deviation
## See code book for details on specfic criteria for mean and standard formats 

meanStd <- select(mergeAll, V1, Activity, contains('-mean()-'), contains('-std()-'))  #select only variables with mean & std in the variable name

##Use descriptive activity names to name the activities in the data set

meanStd$Activity <- factor(meanStd$Activity, levels=c(1,2,3,4,5,6), labels=activity_labels[,2]) 

##Appropriately label the data set with descriptive variable names
colnames(meanStd)[1] <- 'Subject' 

## Creates a second, independent tidy data set with the average of each variable for each activity 
## and each subject

meanStd %>%
      gather(Features, Measurement, -(Subject:Activity)) %>%  #gather & collapse columns into key value pairs
      group_by(Subject, Activity, Features) %>%  #group dataset by Subject, Activity & Features in that order
      summarise(Average=mean(Measurement)) %>%   #calculate average for grouped data
      spread(Features, Average) %>%  #Spread key-value pair (features & Average) across multiple columns
      print %>%
      write.table('tidyData.txt', row.name=FALSE)  #Create tidy data txt file

##End of Script
