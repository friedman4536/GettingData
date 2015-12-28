# This R Script does the following:
#
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Use this library to quickly create avg of each variable per subject / activity.
library(reshape2)

# 1. Merge the training and test sets.
# Change this var depending on the location of the downloaded data.
DATA_DIR <- "tidy"
OUTPUT_TABLE_FILENAME <- "tidy_text.txt"

# Convenience function for reading in data files.
get_data_from_file = function(file_name, subdir="") {
  read.table(paste(DATA_DIR, subdir, file_name, sep="/"))
}

# Let's read in some data! Starting with Features...
features = get_data_from_file("features.txt")

# Next, let's read in subjects.
subject_test = get_data_from_file("subject_test.txt", "test")
subject_train = get_data_from_file("subject_train.txt", "train")

# ...and the activity labels.
activity_labels = get_data_from_file("activity_labels.txt")

# ...and, finally, the data.
measurements_test <- get_data_from_file("X_test.txt", "test")
measurements_train <- get_data_from_file("X_train.txt", "train")
measurement_labels_test <- get_data_from_file("y_test.txt", "test")
measurement_labels_train <- get_data_from_file("y_train.txt", "train")

# Set column names on train and test measurements.
names(measurements_test) <- features$V2
names(measurements_train) <- features$V2

# Set column names for measurement labels.
names(measurement_labels_test) <- "activity"
names(measurement_labels_train) <- "activity"

# Set column name for subjects.
names(subject_test) <- "subject"
names(subject_train) <- "subject"

# Combine all train and test columns.
all_train <- cbind(measurements_train, measurement_labels_train, subject_train)
all_test <- cbind(measurements_test, measurement_labels_test, subject_test)

# Combine train and test data sets into one data set.
all_data <- rbind(all_test, all_train)

# 2. Extract mean and std measurements (note: keeps "subject" and "activities" cols).
mean_std_data <- all_data[, grepl("mean\\(|std\\(", features$V2)]

# 3. Replace activity ids with their descriptive names. Convert to factor.
mean_std_data$activity <- factor(mean_std_data$activity, labels=activity_labels$V2)

# 4. Appropriately label the data set -- see above for variable names
# (e.g. "activity", "subject").

# 5. Create an independent tidy data set with the average of each variable for each
# subject and activity
tidy_data <- dcast(
  melt(mean_std_data, id=c("subject", "activity")),
  subject + activity ~ variable,
  mean)

# Write out the result!
write.table(tidy_data, file=OUTPUT_TABLE_FILENAME)
