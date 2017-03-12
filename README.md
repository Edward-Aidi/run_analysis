# run_analysis
Homework assignment for Getting and Cleaning Data class <br>
<br>
See the code book for a listing of the data frames that are created. <br>
See the file called run_analysis for the actual script. <br>
<br>
There are two packages that must be installed in order to ensure the script works.
They are dplyr and plyr. <br>
<br>
The script extracts a wearable zipped file from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
and then manipulates it in order to create a data frame that contains summarized data for all subjects and 
for the activity they were performing. <br>
<br>
The following steps are performed in order to accomplish this task. <br>
1. The packages dplyr and plyr are both intalled. <br>
2. The file is downloaded to the working directory where it is unzipped. <br>
3. The data files that contain information about the activities and features are extracted. <br>
4. The data files that contain the test data are extracted. <br>
5. The data files that contin the training data are extracted. <br>
6. The column names for the features and activity files are renamed in order to make them easier to understand. <br>
7. A V was added to the feature primary key in order to ensure that it matches the column names for the test and training files. <br>
8. The column names for activities and subjects, in the test and training files, were renamed. <br>
9. The column names for the rest of the columns in the test and training files were renamed. They were renamed based upon the features file. <br>
10. The activities and subject files are appended to the trainig and test data sets. <br>
11. The rows for the training and test data sets are merged into one large file.  <br>
12. A new column that contains the activity description was added to the main data frame. <br>
13. All the column names are converted to lower case. This was done to make column searches more accurate. <br>
14. Column names that included, activity, subjectkey, mean(), and std() were pulled.  <br>
15. A new data frame is created that takes the mean for activities and subject is created. The column names for the groups were renamed to make them easier to understand. <br>

