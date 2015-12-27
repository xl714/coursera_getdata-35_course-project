Code Book
=========

Raw data
----------

The raw datas were found here : https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


Merging and cleaning steps in run_analysis.R
--------------------

Following transformations were performed by `run_analysis.R` script:

1. Load separated datas
2. Merges the training and the test sets to create one data set
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names
5. Extracts only the measurements on the mean and standard deviation for each measurement
6. From the data set in step before, creates a second, independent tidy data set with the average of each variable for each activity and each subject
7. Store tidy output to a text file

tidy_data.txt
-------------

The output clean datas is stored in the tidy_data.txt file. 
This is a text file with space-separated values which you can load with the following R code

    data <- read.table(file_path, header = TRUE)
    View(data)


Fields in output data set:

  Id variables :
  
    subject :  identifies the subject who performed the activity for each window sample. Its range is from 1 to 30
    activity : activity name 
    
  Measurments variables: average Mean value and Standard deviation of all the raw data collected
  
    tBodyAcc.mean...X 
    tBodyAcc.mean...Y
    tBodyAcc.mean...Z
    tBodyAcc.std...X
    tBodyAcc.std...Y
    tBodyAcc.std...Z
    tGravityAcc.mean...X
    tGravityAcc.mean...Y
    tGravityAcc.mean...Z
    tGravityAcc.std...X
    tGravityAcc.std...Y
    tGravityAcc.std...Z
    tBodyAccJerk.mean...X
    tBodyAccJerk.mean...Y
    tBodyAccJerk.mean...Z
    tBodyAccJerk.std...X
    tBodyAccJerk.std...Y
    tBodyAccJerk.std...Z
    tBodyGyro.mean...X
    tBodyGyro.mean...Y
    tBodyGyro.mean...Z
    tBodyGyro.std...X
    tBodyGyro.std...Y
    tBodyGyro.std...Z
    tBodyGyroJerk.mean...X
    tBodyGyroJerk.mean...Y
    tBodyGyroJerk.mean...Z
    tBodyGyroJerk.std...X
    tBodyGyroJerk.std...Y
    tBodyGyroJerk.std...Z
    tBodyAccMag.mean..
    tBodyAccMag.std..
    tGravityAccMag.mean..
    tGravityAccMag.std..
    tBodyAccJerkMag.mean..
    tBodyAccJerkMag.std..
    tBodyGyroMag.mean..
    tBodyGyroMag.std..
    tBodyGyroJerkMag.mean..
    tBodyGyroJerkMag.std..
    fBodyAcc.mean...X
    fBodyAcc.mean...Y
    fBodyAcc.mean...Z
    fBodyAcc.std...X
    fBodyAcc.std...Y
    fBodyAcc.std...Z
    fBodyAccJerk.mean...X
    fBodyAccJerk.mean...Y
    fBodyAccJerk.mean...Z
    fBodyAccJerk.std...X
    fBodyAccJerk.std...Y
    fBodyAccJerk.std...Z
    fBodyGyro.mean...X
    fBodyGyro.mean...Y
    fBodyGyro.mean...Z
    fBodyGyro.std...X
    fBodyGyro.std...Y
    fBodyGyro.std...Z
    fBodyAccMag.mean..
    fBodyAccMag.std..
    fBodyBodyAccJerkMag.mean..
    fBodyBodyAccJerkMag.std..
    fBodyBodyGyroMag.mean..
    fBodyBodyGyroMag.std..
    fBodyBodyGyroJerkMag.mean..
    fBodyBodyGyroJerkMag.std..
    
