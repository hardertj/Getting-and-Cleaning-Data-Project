# run_analysis.R
# Programmer: Thomas Harder
# Course: Getting and Cleaning Data
# School: 
# Date 08/19/2014

# Summary: Program working directory should be the directory above the test and 
# train directories. In this case the directory looked like so: 
# /UCI HAR Dataset
#       /train
#               subject_test
#               X_test
#               y_test	
#       /test
#               subject_test
#               X_test
#               y_test	
#       activity_labels.txt
#       features.txt

# The program will then open the files, read in the data and recombine the data 
# into a complete data set. Then the program will extract the subject, activity, 
# mean  and standard deviation features into a new data set, with activity 
# labels and column headers (taken from the features file). This data set then 
# will written out to a data file called ./foo.csv. Next the program will create 
# a new data table that is the  mean of each variable for each subject, activity
# pair. 

# 
library(reshape2)

# Open and read the data files
X_test_file = "./test/X_test.txt"
y_test_file = "./test/y_test.txt"
subject_test_file = "./test/subject_test.txt"

X_train_file = "./train/X_train.txt"
y_train_file = "./train/y_train.txt"
subject_train_file = "./train/subject_train.txt"

# Get the feature variable names from the features.txt file to use
# as column headers when the feature data are read in. 
features_file = "./features.txt"
rawFeatures <- read.table(features_file, stringsAsFactors=FALSE)

# Get the activity labels to use when the activity factor is converted. 
rawActivityLabels <- read.table("./activity_labels.txt")

# Get the test data
colNames = rawFeatures$V2
x_test_ds <- read.table(X_test_file, fill=TRUE, col.names=colNames)
colNames = c("Activity")
y_test_ds <- read.table(y_test_file, fill=TRUE, col.names=colNames)
colNames = c("SubjectNumber")
subject_test_ds <- read.table(subject_test_file, fill=TRUE, col.names=colNames)

# Merge the test data sets to create one test data set
MergedTestData = cbind(subject_test_ds, y_test_ds, x_test_ds)

# Get the training data
colNames = rawFeatures$V2
x_train_ds <- read.table(X_train_file, fill=TRUE, col.names=colNames)
colNames = c("Activity")
y_train_ds <- read.table(y_train_file, fill=TRUE, col.names=colNames)
colNames = c("SubjectNumber")
subject_train_ds <- read.table(subject_train_file, fill=TRUE, col.names=colNames)


# Merge the training data sets to create one training data set
MergedTrainingData = cbind(subject_train_ds,  y_train_ds, x_train_ds)

# Merge training and test data sets
MergedData = rbind(MergedTestData, MergedTrainingData)

# Extract only the measurements on the mean and std. dev. for each measurement
# uses grep to select the columes that have either "mean" or "std" in their column names. 
ExtractedData <- MergedData[, grep("SubjectNumber|Activity|mean|std", names(MergedData))]

# Order data by subject number and activity
SortedExtractedData <- ExtractedData[order(ExtractedData$SubjectNumber, ExtractedData$Activity), ] 

SortedExtractedData$Activity <- factor(SortedExtractedData$Activity, labels=rawActivityLabels$V2)

# Write ExtractedData data.frame to the file "workingdirectory"/foo.csv
write.table(SortedExtractedData, file="tidydata1.csv", sep=",", col.names=TRUE, row.names=FALSE)

dataMelt <- melt(SortedExtractedData, id=c("SubjectNumber", "Activity"))

# Recast data by SubjectNumber, Activity with means of each feature
castData <- dcast(dataMelt, SubjectNumber + Activity ~ variable, mean )

# Write out tidydata set 2
write.table(SortedExtractedData, file="tidydata2.csv", sep=",", col.names=TRUE, row.names=FALSE)
