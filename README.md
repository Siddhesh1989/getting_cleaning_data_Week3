getting_cleaning_data_Week3
===========================

Week 3 homework for getting and cleaning data course with coursera


The homework is contained in the files run_analysis.R
The algorithm used to achieve the objective of tidy data is described below.
============================================================================


Step 1. Merge the training and the test sets to create one data set.
Achieved by using read.table on each data set and subsequently performing rbind

Step 2. Use descriptive activity names to name the activities in the data set  
        Appropriately label the data set with descriptive activity names
Achieved by reading the list of features from the provided file, and setting the column names of the merged data set we have to these feature names

Step 3. Extract only the measurements on the mean and standard deviation for each measurement.
Achieved by using the grepl tool to help identify columns respresenting standard deviation and mean
We then subset the number of columns on the merged data set accordingly

Step 4. merging subject IDs with the data frame
Achieved by getting the list of subject ids from the training and testing data sets
Combining the two using rbind, then combining that result with the previous merged data frame
Then setting the column name for the newly added column to the data frame

Step 5. Creating a second, independent tidy data set 
         with the average of each variable for each activity and each subject.
Achieved by first splitting the data set by subject
Then running the sapply command on this split data set in conjunction with an anonymous function that computes column means for each recorded metric
We then output this result to a tab separated text file
