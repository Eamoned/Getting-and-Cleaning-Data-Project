###Code book
This Code book describes that describes the variables, the data, and any transformations or work that you performed to clean up the data.

To understand the significance of the study a full description can be found at:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones <br/>

A full description of the experiment including experiment conditions, volunteers, activities, measurement device, sensors, signal processing, measurements details and readings captured, can be found in the features_info.txt and README.txt files located in the UCI HAR Dataset at:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Note: The goal of this project is to demonstrate and detail the collection, merging, working with and cleaning of the dataset and so detail on where and how the experiment data came from will not detail in this text.

In the available datasets in the “UCI HAR Dataset” relevant data values, variables and column names were split up over several separate datasets.

The main datasets applicable to this project include the following. Note that other datasets (such as “Inertial Signals” datasets) were not required for the purpose of this project.

The x_train and y_train datasets contains the measurements for the different features:<br/>
train/X_train.txt: Training set consisting of values for the ‘feature’ measurements.<br/>
&nbsp;&nbsp;&nbsp;Data frame; 561 number Variables; 7352 obs. No NAs<p/>

test/X_test.txt: Test set consisting of values for the ‘feature’ measurements.<br/>
&nbsp;&nbsp;&nbsp;Data frame; 561 number Variables; 2949 obs. No NAs

features.txt: List of all features from the experiment.

This comes from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.<br/> 
(Examples include: tBodyAcc-mean()-X,  tBodyAcc-mean()-Y,  tBodyAcc-mean()-Z, tBodyAcc-std()-X, tBodyAcc-std()-Y, tBodyAcc-std()-Z …..)<br/>
&nbsp;&nbsp;&nbsp;Data frame; 561 obs; 2 Variables: integer V1, Factor V2. Corresponds to values of x_test/train datasets.

test/y_test.txt: Test labels<br/>
&nbsp;&nbsp;&nbsp;Data frame: 2947 obs; 1 integer variable; unique values 1 to 6 corresponding to activity labels.

train/y_train.txt: Training labels<br/>
Data frame: 7352 obs; 1 integer variable; unique values 1 to 6 corresponding to activity labels.

subject_train: <br/>
Data frame: 7352 obs; 1 integer variable: Corresponds to 21 subjects for the “train” datasets.<br/>
Subject_test:<br/>
Data frame: 2947 obs; 1 integer variable: Corresponds to 9 subjects for the “test” datasets.<br/>
(Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30)

activity_labels.txt: Links the class labels with their activity name<br/> 
Data frame: 6 obs; 2 Variables: integer V1; Factor V2 with 6 levels.<br/>
(Labels: Walking, Walking Upstairs, Walking Downstairs, Sitting Standing, Laying)

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






