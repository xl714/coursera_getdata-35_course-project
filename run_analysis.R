
# One of the most exciting areas in all of data science right now is wearable computing - see for example this article : 
#    http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/ 
# Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. 
# The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 
# A full description is available at the site where the data was obtained: 
#     http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
# Here are the data for the project: 
#     https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
# 
# You should create one R script called run_analysis.R that does the following. 
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# 
# help here : https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/

# clearn env
rm(list = ls())
setwd("~/r-work/coursera_getdata-35_course-project")

# load for later use of filter and select
library(dplyr)

# Load separated datas
x_train <- read.table('UCI_HAR_Dataset/train/X_train.txt')
y_train <- read.table('UCI_HAR_Dataset/train/y_train.txt')
subject_train <- read.table('UCI_HAR_Dataset/train/subject_train.txt')
x_test <- read.table('UCI_HAR_Dataset/test/X_test.txt')
y_test <- read.table('UCI_HAR_Dataset/test/y_test.txt')
subject_test <- read.table('UCI_HAR_Dataset/test/subject_test.txt')

# get features.txt to set the colums names later 
features <- read.table('UCI_HAR_Dataset/features.txt', sep = " ", stringsAsFactors = FALSE) # stringsAsFactors for merge later with col names

# get activity labels
activityLabels <- read.table('UCI_HAR_Dataset/activity_labels.txt', sep = " ")

# keep only features name and clean them
features <- features$V2
#features <- tolower(features)
#features <- gsub("\\(\\)","",features)
#features <- gsub("\\(|\\)|,","-",features)
features <- make.names(names=features, unique=TRUE, allow_ = TRUE)

# keep only activity labels and clean them
activityLabels <- activityLabels$V2

# create a dataset for test and train datas
train <- data.frame(subject_train, y_train, x_train)
test <- data.frame(subject_test, y_test, x_test)

# remove variables unused anymore
rm(x_train, y_train, subject_train, x_test, y_test, subject_test)

# before merge : add a column "datafrom" to keep track of where the data comes from
train <- tbl_df(train)
test <- tbl_df(test)
train <- mutate(train, datafrom = "train")
test <- mutate(test, datafrom = "test")


#################################################################################
######## 1. Merges the training and the test sets to create one data set.######## 

df <- merge(train, test, all=TRUE)
df <- tbl_df(df)
# > dim(df)
# [1] 10299   564
# > names(df)


####################################################################################################
######## 3. Uses descriptive activity names to name the activities in the data set ######## 

df <- mutate(df, V1.1 = activityLabels[V1.1])


#######################################################################################
######## 4. Appropriately labels the data set with descriptive variable names. ######## 

cols <- c("subject", "activity", features, "datafrom")

colnames(df) <- cols


############################################################################################################
######## 2. Extracts only the measurements on the mean and standard deviation for each measurement. ########  

df <- select(df, subject, activity, datafrom, contains(".mean."), contains(".std."))


##################################################################################################
######## 5. From the data set in step 4, creates a second, independent tidy data set with ######## 
######## the average of each variable for each activity and each subject. ########################

library("reshape2")

# prepare measure.vars for melting 
dfColNames <- names(df)

dfMelt <- melt(df, id.vars = c("subject", "activity", "datafrom"), measure.vars = dfColNames[4:length(dfColNames)])

tidy_dataset <- dcast(dfMelt, subject + activity ~ variable, mean)

write.table(tidy_dataset, "tidy_dataset.txt", row.names = FALSE, quote = FALSE)

# to read the data set use :
# data <- read.table(file_path, header = TRUE)
# View(data)



