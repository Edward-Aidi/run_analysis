# run_analysis
Homework assignment for Getting and Cleaning Data class

There are two packages that must be installed in order to ensure the script works.
They are dplyr and plyr. 

The script extracts a wearable zipped file from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
and then manipulates it in order to create a data frame that contains summarized data for all subjects and 
for the activity they were performing. 

The following steps are performed in order to accomplish this task.
1. The packages dplyr and plyr are both intalled.
2. The file is downloaded to the working directory where it is unzipped.
3. The data files that contain information about the activities and features are extracted.
4. The data files that contain the test data are extracted.
5. The data files that contin the training data are extracted.
6. The column names for the features and activity files are renamed in order to make them easier to understand.
7. A V was added to the feature primary key in order to ensure that it matches the column names for the test and training files.
8. The column names for activities and subjects, in the test and training files, were renamed.
9. The column names for the rest of the columns in the test and training files were renamed. They were renamed based upon the features file.
10. The activities and subject files are appended to the trainig and test data sets.
11. The rows for the training and test data sets are merged into one large file. 
12. A new column that contains the activity description was added to the main data frame.
13. All the column names are converted to lower case. This was done to make column searches more accurate.
14. Column names that included, activity, subjectkey, mean(), and std() were pulled. 
15. A new data frame is created that takes the mean for activities and subject is created. The column names for the groups were renamed to make them easier to understand.

