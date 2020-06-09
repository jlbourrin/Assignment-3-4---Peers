library(reshape2)
library(dplyr)

setwd("~/Documents/LEARNING/2- R/Assignment 3-4 - Peers")

# 1- Import data

# Labels of activities and features
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
features <- read.table("UCI HAR Dataset/features.txt")

# import test data
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")

# import training data
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")



# 2- Merge test and training datasets into a single clean dataset

# 2-1 - Subjects 
# Merge data on subjects, and name column
subject_all <- rbind(subject_test, subject_train)
colnames(subject_all) <- "subject"

# 2-2 - Activities
# Merge data on activities, and change the activity's code into its label
y_all <- rbind(y_test, y_train)
y_all <- merge(y_all, activity_labels, by.x = "V1", by.y = "V1", all = FALSE)
y_all <- select(y_all,"V2") 
colnames(y_all) <- "activity"

# 2-3 - Measurements
# 2-3-a Merge data on measurements and name all columns with features labels
x_all <- rbind(x_test, x_train)
colnames(x_all) <- features$V2
# 2-2-b Identify features including "mean" and "std" and only keep them in the dataset
keep_those <- grep(".*(mean[^Ff]|std)", features$V2, value = TRUE)
x_all <- x_all[keep_those]

# 2-4 Merge all columns from subjects, activites, and measurements to obtain complete datase
# with descriptive activity and features names
data <- cbind(subject_all, y_all, x_all)
write.table(data, file = "Output/tidy_table.txt")


#3 - Creates a second, independent tidy data set with the average of each variable for each 
# activity and each subject

#  3-1 Set "subject" as factor in dataframe "data"
data$subject <- factor(data$subject)

# 3-2 Melt and cast data to create the new tidy data set
data %>% melt(id = c("subject", "activity")) %>% dcast(activity+subject ~ variable, mean) %>% 
      write.table(file = "Output/tidy_table2.txt")
