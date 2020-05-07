#Step 0 - Download the data set 

if(!file.exists("./data")){
  dir.create("./data")
}
#Dataset URL for the project:
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

#Download the dataset
download.file(fileUrl,destfile="./data/Dataset.zip")

# Unzip the dataset to 'data' directory
unzip(zipfile="./data/Dataset.zip",exdir="./data")

#Step 1 - Read the training, testing, features, and activity datasets into variables

#Read the train data
x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

#Read the test data
x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

#Read the feature and activity data
features <- read.table('./data/UCI HAR Dataset/features.txt')
activity_labels = read.table('./data/UCI HAR Dataset/activity_labels.txt')

#Assign column names to the datasets
colnames(x_train) <- features[,2]
colnames(y_train) <-"activityid"
colnames(subject_train) <- "subjectid"

colnames(x_test) <- features[,2] 
colnames(y_test) <- "activityid"
colnames(subject_test) <- "subjectid"

colnames(activity_labels) <- c('activityid','activitytype')

#Step 2 - Merge the data create the final dataset
x_merged <- rbind(x_train, x_test)
y_merged <- rbind(y_train, y_test)
subject_merged <- rbind(subject_train, subject_test)
dataset_final <- cbind(x_merged, y_merged, subject_merged)

#Step 3 - Extracting the required column names
column_names <- colnames(dataset_final)
cols_with_mean_std <- (grepl("activityid", column_names) | grepl("subjectid", column_names) | grepl("mean..", column_names) | grepl("std..", column_names))

#Subset for only mean and std columns
dataset_mean_std <- dataset_final[, cols_with_mean_std == T]

#Step 4 - Descriptive activity names to name the activities in the above data set
dataset_mean_std_activity <- merge(dataset_mean_std, activity_labels, by = "activityid", all.x = T)

##NOTE - At this point we have a tidy dataset ready with all the columns appropriately named

#Step 5 - Create a second tidy dataset
tidy_dataset <- aggregate(. ~subjectid + activityid, dataset_mean_std_activity, mean)
tidy_dataset <- tidy_dataset[order(tidy_dataset$subjectid, tidy_dataset$activityid),]

#Write the tidy dataset in a txt file
write.table(tidy_dataset, "tidy_dataset.txt", row.names = F, quote = F)
