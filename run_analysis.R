runAnalysis <- function()
{
  ## Merge the training and the test sets to create one data set.
  trainingData<-read.table("./train/X_train.txt")
  testingData<-read.table("./test/X_test.txt")
  mergedSets<-rbind(trainingData, testingData)
  
  ## Use descriptive activity names to name the activities in the data set  
  ## Appropriately label the data set with descriptive activity names
  featureDataFrame<-read.table("features.txt")
  colnames(mergedSets)<-featureColumnNames
  
  ## Extract only the measurements on the mean and standard deviation for each measurement.  
  colNamesToKeep<-grepl(".*std().*|.*mean().*", colnames(mergedSets))
  mergedDataSubSet<-mergedSets[,colNamesToKeep]
  
  ## merging subject IDs with the data frame
  trainingSubjects<-read.table("./train/subject_train.txt")
  testingSubjects<-read.table("./test/subject_test.txt")
  subjectList<-rbind(trainingSubjects, testingSubjects)
  mergedDataSubset_withSubjects<-cbind(subjectList, mergedDataSubSet)
  colnames(mergedDataSubset_withSubjects)[1]<-"Subject_id"
  
  ## Creating a second, independent tidy data set 
  ## with the average of each variable for each activity and each subject.
  dataBySubset<-split(mergedDataSubset_withSubjects, mergedDataSubset_withSubjects$Subject_id)
  result<-sapply(dataBySubset, function(x) colMeans(x, na.rm=TRUE))
  write.table(result, "tidyData.txt", sep="\t")
  result
}
