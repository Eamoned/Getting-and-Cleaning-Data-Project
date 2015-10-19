# Getting-and-Cleaning-Data-Project
This repo contains the the <code>README.md</code>, <code>CodeBook.md</code>, <code>run_analysis.R</code> script and tidy data text file requirements for the Getting &amp; Cleaning Data Project 

This READMe file explains how the script “run_analysis.R” and code works and how the different parts of the analysis fit together. 

###This Repository will include:
* <code>run_analysis.R</code>: Script for transforming raw data to tidy data
* <code>CodeBook</code>: Information on variables, data and transformation
* <code>tidyData.txt</code>: Text file of tidy data set.

###The Script will carry out the following:
1.	Merges the training and the test sets to create one data set.
2.	Extracts only the measurements on the mean and standard deviation for each measurement. 
3.	Uses descriptive activity names to name the activities in the data set
4.	Appropriately labels the data set with descriptive variable names. 
5.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

###Run_analysis.R
This one script includes the full data processing cycle, including down load of datasets from the relevant web site, unzipping of data sets, merging, and so forth, and culminating with the creation of the tidy data set as a txt file.

No modifications are required for the script unless the following should apply:

*	The user already has the necessary datasets and files set up. In this case the “data download” section at the beginning of the script can be disregarded.
*	The code requires packages dplyr and tidyr to run. Library download is included in the script however these packages may need to be downloaded and installed before running the script.

###Code Book
* The accompanying Code Book describes the variables, the data, any transformations or work that was performed to clean up the data and a description of the tidy data file contents.
* Details are given regarding what constitutes the mean and standard deviation and how this was interpreted and the deciding format it should take.
* Any slight variations from the project sequence are explained, reasons for labelling and the chosen descriptive names are examined.
 
###Tidy data Set
This script will generate a tidy data test file which meets the principles of tidy data, i.e.
* Each variable form a column
* Each observation forms a row
* Each type of observational unit forma a table  

###Discussion of Results
The tidy data output fulfils the criteria and clearly complies with the output as outlined in point 5 of the script requirements.

The data has headings so it’s easy to distinguish which columns are which, the variables are in different columns and there are no duplicate columns.

The output from this Tidy data set takes the ''''wide form''''. Refer to the output in <code>tidyData.txt</code><br/>It has been mentioned in the rubric that either long or wide is acceptable (as discussed in the forum and mentioned in in Hadley Wickham’s Tidy Data paper). Also tidy data is only worthwhile if it makes analysis easier and the form of ‘tidy’ depends on the problem being solved (again discussed in the forum and outlined in Hadley Wickham’s Tidy Data paper). This was forefront in my mind when structuring the tidy data set.<br/><br/> 

#####Additional Discussion
Considering the points above and remembering there are many forms of tidy, it’s also possible to construct the long form which was my initial result, shown below. 

      Subject  Activity       Features      Average
4       1  WALKING tGravityAcc-mean()-X  0.93522320

5       1  WALKING tGravityAcc-mean()-Y -0.28216502

6       1  WALKING tGravityAcc-mean()-Z -0.06810286

Note: The data has headings so it’s easy to distinguish which columns are which, there are no duplicate columns, however it does counter rule that variables are in different columns. Still, it does fulfil the requirements and is appropriate for the problem being solved.





