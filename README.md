# getting-and-cleaning-data
Class Project for Getting and Cleaning Data on Coursea

There are only four commands needed to create the data frames and files to complete this assignment.

install.packages("dplyr")
library(dplyr)
source("run_Analysis.R")
write.csv(tidy_data,"tidy_data.csv")

"dplyr" is needed to use the "%>%" pipe.

source("run_Analysis.R") runs the script that creates the following data frames.

"Features" contains the features from "features.txt".
"activity_labels" contains the features from "activity_labels.txt".
"X_test" contains the test data
"Y_test" contains the test labels
"X_train" contains the training data
"Y_train" contains the training labels
"X_merged" contains the merged data for testing and training
"Y_merged" contains the merged labels for testing and training
"subject_test" contains the subject who performed the activity for each window sample for the testing data.
"subject_train" contains the subject who performed the activity for each window sample for the training data.
"subject_merged" contains the subject who performed the activity for each window sample for the merged data."
"tidy_data" the average of each variable for each activity and each subject.

write.csv(tidy_data,"tidy_data.csv") writes "tidy_data" to "tidy_data.csv", a csv file for storing the "tidy_data" data frame to the git repository.
	