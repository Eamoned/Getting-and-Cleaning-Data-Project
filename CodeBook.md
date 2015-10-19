###Code book
This Code book describes that describes the variables, the data, and any transformations or work that you performed to clean up the data.

To understand the significance of the study a full description can be found at:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones <br/>

A full description of the experiment including experiment conditions, volunteers, activities, measurement device, sensors, signal processing, measurements details and readings captured, can be found in the features_info.txt and README.txt files located in the UCI HAR Dataset at:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Note: The goal of this project is to demonstrate and detail the collection, merging, working with and cleaning of the dataset and so detail on where and how the experiment data came from will not detail in this text.

###Data sets

In the available datasets in the “UCI HAR Dataset” relevant data values, variables and column names were split up over several separate datasets.

The main datasets applicable to this project include the following. Note that other datasets (such as “Inertial Signals” datasets) were not required for the purpose of this project.

* The x_train and y_train datasets contains the measurements for the different features:<br/>
&nbsp;&nbsp;&nbsp; train/X_train.txt: Training set consisting of values for the ‘feature’ measurements.<br/>
&nbsp;&nbsp;&nbsp;&nbsp; Data frame; 561 number Variables; 7352 obs. No NAs<p/>

* test/X_test.txt: Test set consisting of values for the ‘feature’ measurements.<br/>
&nbsp;&nbsp;&nbsp;Data frame; 561 number Variables; 2949 obs. No NAs

* features.txt: List of all features from the experiment.<br/>
&nbsp;&nbsp;&nbsp;This comes from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.<br/> 
&nbsp;&nbsp;&nbsp;&nbsp;Data frame; 561 obs; 2 Variables: integer V1, Factor V2. Corresponds to values of x_test/train datasets.
(Examples include: tBodyAcc-mean()-X,  tBodyAcc-mean()-Y,  tBodyAcc-mean()-Z, tBodyAcc-std()-X,<br/> 
tBodyAcc-std()-Y, tBodyAcc-std()-Z …..)<br/>

* test/y_test.txt: Test labels<br/>
&nbsp;&nbsp;&nbsp;Data frame: 2947 obs; 1 integer variable; unique values 1 to 6 corresponding to activity labels.

* train/y_train.txt: Training labels<br/>
&nbsp;&nbsp;&nbsp;Data frame: 7352 obs; 1 integer variable; unique values 1 to 6 corresponding to activity labels.

* subject_train: <br/>
&nbsp;&nbsp;&nbsp;Data frame: 7352 obs; 1 integer variable: Corresponds to 21 subjects for the “train” datasets.<br/>
* Subject_test:<br/>
&nbsp;&nbsp;&nbsp;Data frame: 2947 obs; 1 integer variable: Corresponds to 9 subjects for the “test” datasets.<br/>
&nbsp;&nbsp;&nbsp;(Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30)

* activity_labels.txt: Links the class labels with their activity name<br/> 
&nbsp;&nbsp;&nbsp;Data frame: 6 obs; 2 Variables: integer V1; Factor V2 with 6 levels.<br/>
&nbsp;&nbsp;&nbsp;(Labels: Walking, Walking Upstairs, Walking Downstairs, Sitting Standing, Laying)

###Tidy data Transformation
Merging training & test datasets:<br/>
Test (x_test, subject_test, y_test) and training(y_train, subject_train, y_train) datasets merged to obtain a single dataset.<br/>
Feature Variables are labelled using the using the ‘features’ dataset  

Before merging the datasets the column headings for the x_train and x_test datasets were changed corresponding to the ‘features’ dataset (e.g. tBodyAcc-mean()-X,  tBodyAcc-mean()-Y). This will allow easier identification of the mean and standard deviation for each measurement when extracting. 

In the ‘features’ variables (columns), duplicates were identified and removed before merging (e.g. there are more than one entry for “fBodyAcc-bandsEnergy()-1,16”). Originally there was a total of 561 features, 477 of these are unique.

After merging both train and test datasets columns 1 and 2 have the same column names i.e. “V1”. To prevent duplicate errors in the following steps column 2 was changed to an appropriate descriptive variable name, i.e. ‘Activity’.

###Extracting only measurements on the mean and standard deviation for each measurement:
When extracting only the measurements on the mean and standard deviation for each measurement it was not stated explicitly what format this should take, i.e. in some cases ‘mean’ and ‘sd’ formed part of a name whilst in others it was quite distinct. It’s assumed there’s some flexibility in the matter and so names with the following format will be extracted.

Any name with the format “-mean()-“ and “-sd()-”. This means also any name with ‘-y’, ‘-x’ and ‘-z’ will be extracted. 
Formats such as “-mean()” and “sdfreq()” will not be extracted.

(Note: other interpretations of this will of course output different results to my tidy dataset but this project is aimed at the means of achieving tidy data rather than actual the ‘average’ results).

###Descriptive Activity names:
Activities in the dataset were named using the labels in the ‘activity_labels ’ dataset (i.e. Walking, Walking Upstairs, Walking Downstairs, Sitting Standing, Laying).<br/> 
The idea is to make variable names human readable.

###Appropriate labelling the dataset with descriptive variable names:
To maintain the theme of keeping variable names human readable,<br/>
Subject:<br/>
	&nbsp;&nbsp;&nbsp;Participants of the experiment<br/>
	&nbsp;&nbsp;&nbsp;Unique identifier for each subject, numbered 1 to 30<br/>
	
Activities:<br/>
	    &nbsp;&nbsp;&nbsp;Names of each activity<br/>
	    &nbsp;&nbsp;&nbsp;Walking, Walking Upstairs, Walking Downstairs, Sitting Standing, Laying<br/>
	
Features:<br/>
Acceleration and velocity mean and standard deviation measurements filtered from sensor signals carried out on the subjects. Includes all measurements for individual x, y and z axis only.

The variable names are descriptive to indicate features such as mean, sd, axis, and other components of the measurement.<br/>
[1] tBodyAcc-mean()-X<br/>     
[2] tBodyAcc-mean()-Y<br/>     
[3] tBodyAcc-mean()-Z<br/>    
[4] tGravityAcc-mean()-X<br/> 
[5] tGravityAcc-mean()-Y<br/>  
[6] tGravityAcc-mean()-Z<br/>  
[7] tBodyAccJerk-mean()-X<br/>
[8] tBodyAccJerk-mean()-Y<br/>
[9] tBodyAccJerk-mean()-Z<br/>
[10] tBodyGyro-mean()-X<br/>  
[11] tBodyGyro-mean()-Y<br/>  
[12] tBodyGyro-mean()-Z<br/>  
[13] tBodyGyroJerk-mean()-X<br/>
[14] tBodyGyroJerk-mean()-Y<br/>
[15] tBodyGyroJerk-mean()-Z<br/>
[16] fBodyAcc-mean()-X<br/>
[17] fBodyAcc-mean()-Y<br/>    
[18] fBodyAcc-mean()-Z<br/>   
[19] fBodyAccJerk-mean()-X<br/>
[20] fBodyAccJerk-mean()-Y<br/>
[21] fBodyAccJerk-mean()-Z<br/>
[22] fBodyGyro-mean()-X<br/>  
[23] fBodyGyro-mean()-Y<br/>   
[24] fBodyGyro-mean()-Z<br/>   
[25] tBodyAcc-std()-X<br/>    
[26] tBodyAcc-std()-Y<br/>   
[27] tBodyAcc-std()-Z<br/>   
[28] tGravityAcc-std()-X<br/> 
[29] tGravityAcc-std()-Y<br/> 
[30] tGravityAcc-std()-Z<br/> 
[31] tBodyAccJerk-std()-X<br/>
[32] tBodyAccJerk-std()-Y<br/>
[33] tBodyAccJerk-std()-Z<br/>
[34] tBodyGyro-std()-X<br/> 
[35] tBodyGyro-std()-Y<br/>   
[36] tBodyGyro-std()-Z<br/>
[37] tBodyGyroJerk-std()-X<br/>
[38] tBodyGyroJerk-std()-Y<br/>
[39] tBodyGyroJerk-std()-Z<br/>
[40] fBodyAcc-std()-X<br/>     
[41] fBodyAcc-std()-Y<br/>    
[42] fBodyAcc-std()-Z<br/>    
[43] fBodyAccJerk-std()-X<br/>
[44] fBodyAccJerk-std()-Y<br/>
[45] fBodyAccJerk-std()-Z<br/>
[46] fBodyGyro-std()-X<br/>   
[47] fBodyGyro-std()-Y<br/>
[48] fBodyGyro-std()-Z<br/>  


	






