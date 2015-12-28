# CodeBook

This code book describes the data and methods used to produce a tidy data set for future analysis.

## Data source
The data used was collected by UCI Machine Learning Repository, measuring test subjects' activity while wearing a Samsung Galaxy S II smartphone. Both "training" and "test" datasets were collected and are provided via the link to the zip file below.
* Original data set: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Description of the dataset: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Variables
* All variables either mean or std measures of activity data. See the description of the dataset above for more information.
* Additionally, an "activity" variable and a "subject" variable are provided. "Activity" contains a descriptive name of an activity taken by the subject (e.g. "WALKING", "SITTING"), and "subject" contains an integer ID for each subject whose activity data was recorded.

## Methods for tidying data
The data set used provides files for measurements of activities, subject identifiers, and descriptive names of each activity undertaken.
* First, the names of each measurement feature, the subject IDs, the descriptive activity names, and all measurements are loaded from data txt files. These files are assumed to be in a subdir of the working directory called `UCI HAR Dataset` (the path can be changed in the code).
* The names of each feature are applied to the measurements data, and the activity IDs and subject IDs are bound to the data (via `cbind`).
* The training and test data sets are combined (essentially concatenated).
* The dataset is pruned of all columns that are not of the form "...mean(..." or "...std(..." to isolate just mean and std measures.
* Activity IDs are replaced with descriptive activity names.
* A mean of each activity's and subject's measurements is calculated from the data set.
* This data is written out to a file called `tidy_data.txt` (the filename can be changed in the code).

## Output data
* The resulting dataset contains means for 66 measures, from the approximately 561 measures in the original dataset.
* The result contains 180 rows -- each row represents measurements for one activity type per subject. There are 30 subjects, and six different activity types.
