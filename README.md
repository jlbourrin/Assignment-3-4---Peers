# Assignment-3-4---Peers
Peer-graded Assignment: Getting and Cleaning Data Course Project


This script uses the following libraries:
- reshape2
- dplyr


STEP 1: IMPORT DATA

The script starts by importing all necessary data:
- label of activities (from activity_labels.txt)
- label of measurements (from features.txt)
- actual subjects (from subject_test.txt), and their corresponding activity (from y_test.txt) and measurements (from X_test.txt) done in tests  
- actual subjects (from subject_train.txt), and their corresponding activity (from y_train.txt) and measurements (from X_train.txt) done in training


STEP 2: MERGE TEST AND TRAINING DATASETS INTO A SINGLE CLEAN DATASET

The cleaned data set will display:
- the subject ID in the first column
- the activity label in the 2nd column
- only means and standard deviations measurements recorded in either a test or a training

Step 2.1:
Subjects ID are directly provided by subject_test.txt and subject_train.txt. These files are used to construct the first column which is labelled "subject".

Step 2.2:
The script matches activity codes in y_test.txt and y_train.txt, and match them with their corresponding labels from activity_labels.txt.
Only lables will be kept, and added to the clean data set as a 2nd column which is labelled "activity".

Step 2.3:
Measurements are merged from X_test.txt and X_train.txt, then labelled thanks to features.txt.
The script then identifies all columns with a name containing "mean" or "std".
All other columns are disregarded.

Step 2.4:
Subject, activity and "mean"/"std" measurements columns are merged in a single clean data set.
The dataset is exported as a txt file named "tidy_table.txt"


STEP 3: CREATE A SECOND, INDEPENDENT TIDY DATASET WITHT HE AVERAGE OF EACHE VARIABLE FOR EACH 
ACTIVITY AND EACH SUBJECT


Step 3-1
The script set "subject" as factor in dataframe "data"

Step 3-2
The script melts and casts data (with "subject" and "activity" as aggregated levels) to create
a new tidy data set.
The new data set is then exported as a txt file named "tidy_table2.txt"
