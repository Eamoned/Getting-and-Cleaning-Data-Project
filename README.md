# Getting-and-Cleaning-Data-Project
This repo contains the the README.md, CodeBook.md, run_analysis.R script and tidy data text file requirements for the Getting &amp; Cleaning Data Project 

This READMe file explains how the script “run_analysis.R” and code works and how the different parts of the analysis fit together. 

##The Script will carry out the following:

1.	Merges the training and the test sets to create one data set.
2.	Extracts only the measurements on the mean and standard deviation for each measurement. 
3.	Uses descriptive activity names to name the activities in the data set
4.	Appropriately labels the data set with descriptive variable names. 
5.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##This Repository will include:
* run_analysis.R: Script for transforming raw data to tidy data
* Code Book: Information on variables, data and transformation
* tidyData.txt: Text file of tidy data set.

##Run_analysis.R
This one script includes the full data processing cycle, including down load of datasets from the relevant web site, unzipping of data sets, merging, and so forth, and culminating with the creation of the tidy data set as a txt file.

No modifications are required for the script unless the following should apply:
•	The user already has the necessary datasets and files set up. In this case the “data download” section at the beginning of the script can be disregarded.
•	The code requires packages dplyr and tidyr to run. Library download is included in the script however these packages may need to be downloaded and installed before running the script.

