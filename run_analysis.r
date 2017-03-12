
# Load the plyr & dplyr packages. Assumption is that the plyr & dplyr packages have been installed.
# Install the dplyr & plyr packages if you receive an error in this step.
library(dplyr)
library(plyr)

# Download the zip file that contains wearable data. Place the file in the working directory
# and unzip it.
fileurl = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl,destfile = "wearable.zip")
unzip ("wearable.zip")

# Extract the file that contains data about the activities and features. 
activitylabels <- read.table("./UCI HAR Dataset/activity_labels.txt")
features <- read.table("./UCI HAR Dataset/features.txt")

# Extract the files that contain test data.
testdata <- read.table("./UCI HAR Dataset/Test/X_test.txt")
testdatalables <- read.table("./UCI HAR Dataset/Test/y_test.txt")
testdatasubject <- read.table("./UCI HAR Dataset/Test/subject_test.txt")

# Extract the files that contain training data.
trainingdata <- read.table("./UCI HAR Dataset/train/X_train.txt")
trainingdatalables <- read.table("./UCI HAR Dataset/train/y_train.txt")
trainingdatasubject <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# Rename the column names for features and activitylabels in order to make them easier 
# to read. Any column that ends with key points to the primary key.
features <- plyr::rename(features, c("V1" = "featurekey"))
features <- plyr::rename(features, c("V2" = "feature"))
activitylabels <- plyr::rename(activitylabels, c("V1" = "activitykey"))
activitylabels <- plyr::rename(activitylabels, c("V2" = "activity"))

# The features file will be used to replace the column names in the test and training files.
# This step adds a V to the key name in order to have it match the column names in the 
# training and test files.
features$featurekey <- interaction( "V", features$featurekey, sep = "")

# Rename the lables of the test and training data sets. This will make it easier to match
# with the activity lables.
testdatalables <- plyr::rename(testdatalables, c("V1" = "activitykey"))
trainingdatalables <- plyr::rename(trainingdatalables, c("V1" = "activitykey"))
testdatasubject <- plyr::rename(testdatasubject, c("V1" = "subjectkey"))
trainingdatasubject <- plyr::rename(trainingdatasubject, c("V1" = "subjectkey"))

# Change the column names of the test and training data frame.
names(testdata) <- features$feature
names(trainingdata) <- features$feature

# Append the columns for activities and subjects to the test and training data sets. 
mergedtraining <- cbind(trainingdatasubject, trainingdata)
mergedtraining2 <- cbind(trainingdatalables, mergedtraining)
mergedtest <- cbind(testdatasubject, testdata)
mergedtest2 <- cbind(testdatalables, mergedtest)

# Merge the rows from the trainig and test data frames into a single data frame.
mergeddata <- rbind(mergedtraining2, mergedtest2)

# Added the activity description to the merged file.
mergeddata2 <- merge(activitylabels, mergeddata, by.x = "activitykey", by.y = "activitykey")

# Convert all the column names to lower case. 
names(mergeddata2) <- tolower(names(mergeddata2))

# Column names with activity, subjectkey, mean(), or std() are pulled.
mergedfinal <- mergeddata2 %>% dplyr:: select(grep("activity", names(mergeddata2)), grep("subjectkey", names(mergeddata2)), grep(("mean[:(:][:):]"), names(mergeddata2)), grep("std[:(:][:):]", names(mergeddata2)))

# Created a grouped table that contains a group by Activity and Subject. All columns other than Activity
# and subject are averaged.
groupedaggregate <- aggregate(mergedfinal[, 4:69], list(mergedfinal$activity, mergedfinal$activitykey, mergedfinal$subjectkey), mean)
groupedaggregate <- plyr::rename(groupedaggregate, c("Group.1" = "activity"))
groupedaggregate <- plyr::rename(groupedaggregate, c("Group.2" = "activitykey"))
groupedaggregate <- plyr::rename(groupedaggregate, c("Group.3" = "subject"))

#Write the dataset
write.table(groupedaggregate, "wearable.txt", row.names = FALSE)
                            
