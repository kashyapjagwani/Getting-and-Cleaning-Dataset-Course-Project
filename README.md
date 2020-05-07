# Getting-and-Cleaning-Dataset-Course-Project
Submission for the peer graded [Coursera](https://www.coursera.org/learn/data-cleaning) Assignment.

## The R script performs the following steps
0. In this step, we create a new directory called **data** and download the zip file into this directory. Once downloaded, the file is extracted.
1. This step basically deals with reading the txt files in appropriate variables. All the train and test data files along with the subject, features, and activity data are read. After reading the data files, they are given column names since the original data did not have column names.
2. In this step, we merge all the data files read in the above steps.
3. Now, as we only need to work with columns related to the mean and std values, we extract the required columns into a new data frame along with activity and subject IDs.
4. Here, we merge the newly created data frame with the activity data based on activity ID.
5. This step creates a tidy data set consisting of the average of each variable for each activity and each subject, and writes this tidy dataset as a txt file.
