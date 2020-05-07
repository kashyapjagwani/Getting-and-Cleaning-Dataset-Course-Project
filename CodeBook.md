# Transformations
## The original data was transformed in the following manner
1. Merged the training and the test sets to create one data set.
2. Extracted only the measurements on the mean and standard deviation for each measurement.
3. Used descriptive activity names to name the activities in the data set
4. Appropriately labeled the data set with descriptive variable names.
5. From the data set in step 4, created a second, independent tidy data set with the average of each variable for each activity and each subject.

## About the R script
The **run_analysis.R** file performs the above 5 steps onto the original data and the final output (the tidy dataset) is stored into the **tidy_dataset.txt**.


**All the other information about the data can be found in the 'README.txt' file once you download the data from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) or run the R script.**
