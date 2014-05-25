The attached R script (run_analysis.R) performs the following to clean up the data:

Merges the training and test sets to create one data set: 
train/X_train.txt with test/X_test.txt 
train/subject_train.txt with test/subject_test.txt 
train/y_train.txt with test/y_test.txt 

Reads file features.txt and extracts only the measurements on the mean and standard deviation for each measurement. The result is a 10299 x 66 data frame,

Reads activity_labels.txt and applies descriptive activity names to name the activities in the data set:
walking
walkingupstairs
walkingdownstairs
sitting
standing
laying
The script also appropriately labels the data set with descriptive names: all feature names (attributes) and activity names are converted to lower case, underscores and brackets () are removed.
The result is saved as merged_clean_data.txt, a 10299x68 data frame such that the first column contains subject IDs, the second column activity names, and the last 66 columns are measurements. Subject IDs are integers between 1 and 30 inclusive. Names of the attributes are similar to the following:
tbodyacc-mean-x
tbodyacc-mean-y
tbodyacc-mean-z
tbodyacc-std-x
tbodyacc-std-y
tbodyacc-std-z
tgravityacc-mean-x
tgravityacc-mean-y
Finally, the script creates a 2nd, independent tidy data set with the average of each measurement for each activity and each subject. 
The result is saved as data_set_with_the_averages.txt, the first column contains subject IDs, the second column contains activity names, and then the averages for each of the 66 attributes are in next columns.

