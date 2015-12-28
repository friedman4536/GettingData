# Getting and Cleaning Data
Contains source produced for Getting and Cleaning Data Coursera course.

## Run Instructions

1. Download the data source linked from CodeBook.md and put into a folder on your local drive. This will likely create a folder called `UCI HAR Dataset` -- you can change the name.
2. Download and place `run_analysis.R` in the parent folder of the data source (likely `UCI HAR Dataset`), then set that parent folder as your working directory in R (either R or RStudio).
3. Run `source("run_analysis.R")` in the R(Studio) console. This will produce a result data file (called `tiny_data.txt`) in your working directory.
4. You can change either the name of the data source folder or the resulting data file in `run_analysis.R` via the static vars at the top of the file.
