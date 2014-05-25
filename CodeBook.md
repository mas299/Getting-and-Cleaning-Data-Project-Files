## Data

The file "run_analysis.R" runs scripts that transform the data contained in the UCI Machine Learning repository.  The following data files are loaded into R and transformed and summarized in the ""summary.txt"" output file: 

* x_test.txt
* y_train.txt
* x_train.txt
* y_test.txt
* features.txt
* subject_train.txt
* subject_test.txt
* activity_labels.txt

## Data Transformations 

The following steps were taken to transform the basic data into a tidy, summarized data set ("summary.txt").

### Step 1 - read in and name each of the data sets that will be manipulated

* Combine the training and test data sets (the x values)
* Name the variables (activities) using the features data set for column names
* Combine and name the subject variable (train then test) 
* Add the subject variable to the dataset
* Combine and name the activity (train then test) variable 
* Add the activity variable to dataset

### Step 2 - Extract the Mean and Standard Deviation Variables

Only the mean() and std() varaibles, since meanFreq() and the means associated with the angle variables (e.g., gravityMean) are transformations of other values, and the question asks for means of measuremens only.

* First, create indices for the columns containing mean() or std()
* Adding back in the subject and activity variables
* Then, create a new object that only contains the indexed data

### Step 3 - Clean and reformat the labels

* First, remove non-standard characters "()" and "-"
* Then, expand abbreviations to be more human-readable
* Finally, capitalize "mean" and "std" to separate words in variable names

### Step 4 - Aggregate and create a tidy data set

* First, Group the data by activity and subject, taking the mean of the grouped values
* Then, remove the "Group" columns


### Step 5 - Replace the activity codes with the activity names 

* First, convert the Activity column to factors
* Then, apply the levels in activity_labels 
* Writes the output file to "summary.txt"

## Data

The results of the above data transformations contains a data set with three types of variables described below ("summary.txt"). 

### Type 1: Averages of Standard Deviation and Mean Measurements

The following variables contain average values of the standard deviations and means for each subject and activity performend in the study.   

* tBodyAccelMeanX
* tBodyAccelMeanY
* tBodyAccelMeanZ
* tBodyAccelStdX
* tBodyAccelStdY
* tBodyAccelStdZ
* tGravityAccelMeanX
* tGravityAccelMeanY
* tGravityAccelMeanZ
* tGravityAccelStdX
* tGravityAccelStdY
* tGravityAccelStdZ
* tBodyAccelJerkMeanX
* tBodyAccelJerkMeanY
* tBodyAccelJerkMeanZ
* tBodyAccelJerkStdX
* tBodyAccelJerkStdY
* tBodyAccelJerkStdZ
* tBodyGyroMeanX
* tBodyGyroMeanY
* tBodyGyroMeanZ
* tBodyGyroStdX
* tBodyGyroStdY
* tBodyGyroStdZ
* tBodyGyroJerkMeanX
* tBodyGyroJerkMeanY
* tBodyGyroJerkMeanZ
* tBodyGyroJerkStdX
* tBodyGyroJerkStdY
* tBodyGyroJerkStdZ
* tBodyAccelMagnitudeMean
* tBodyAccelMagnitudeStd
* tGravityAccelMagnitudeMean
* tGravityAccelMagnitudeStd
* tBodyAccelJerkMagnitudeMean
* tBodyAccelJerkMagnitudeStd
* tBodyGyroMagnitudeMean
* tBodyGyroMagnitudeStd
* tBodyGyroJerkMagnitudeMean
* tBodyGyroJerkMagnitudeStd
* fBodyAccelMeanX
* fBodyAccelMeanY
* fBodyAccelMeanZ
* fBodyAccelStdX
* fBodyAccelStdY
* fBodyAccelStdZ
* fBodyAccelJerkMeanX
* fBodyAccelJerkMeanY
* fBodyAccelJerkMeanZ
* fBodyAccelJerkStdX
* fBodyAccelJerkStdY
* fBodyAccelJerkStdZ
* fBodyGyroMeanX
* fBodyGyroMeanY
* fBodyGyroMeanZ
* fBodyGyroStdX
* fBodyGyroStdY
* fBodyGyroStdZ
* fBodyAccelMagnitudeMean
* fBodyAccelMagnitudeStd
* fBodyBodyAccelJerkMagnitudeMean
* fBodyBodyAccelJerkMagnitudeStd
* fBodyBodyGyroMagnitudeMean
* fBodyBodyGyroMagnitudeStd
* fBodyBodyGyroJerkMagnitudeMean
* fBodyBodyGyroJerkMagnitudeStd

### Type 2: Subject Information

The "Subject" variable contains the anonymous number indicating which test subject provided the measurmeents.

### Type 3: Activity Information

The "Activity" variable contains the activity being performed that provided the measurements.  

