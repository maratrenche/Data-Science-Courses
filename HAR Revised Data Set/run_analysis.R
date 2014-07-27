## Need to set wd to ./UCI HAR Dataset/ folder
## Reading training and test files
trainDS<-read.table("./train/X_train.txt", sep="")
testDS<-read.table("./test/X_test.txt", sep="")

## Reading and formatting training and test activity label files
trainLabels<-read.table("./train/y_train.txt", col.names=c("activity_id"), colClasses="numeric")
testLabels<-read.table("./test/y_test.txt", col.names=c("activity_id"), colClasses="numeric")

## Reading activity labels
## txt file pre-reformatted to facilitate reading
## by adding a space between character and number
activityLabels<-read.table("./activity_labels.txt", col.names=c("activity_id", "activity_desc"), stringsAsFactors=FALSE)

## Reading training and test subject files
trainSubject<-read.table("./train/subject_train.txt", sep="", col.names=c("subject_id"), colClasses="numeric")
testSubject<-read.table("./test/subject_test.txt", sep="", col.names=c("subject_id"), colClasses="numeric")

## Reading training and test data column names
features<-read.table("./features.txt", sep="\t")

## Add new activity and subject columns to train and test files
trainDS<-cbind(trainDS, trainLabels, trainSubject)
testDS<-cbind(testDS, testLabels, testSubject)

## Merge train and test files
trainTestbind<-rbind(trainDS, testDS)

## Prepare index for means and sd columns only (not including meanFreq)
## Included new added columns activity_id and subject_id at the end
TTmeansIndex<-grep("mean", features$V1)
TTSDIndex<-grep("std", features$V1)
TTmeanFreqIndex<-grep("meanFreq", features$V1)
TTmeansSDColIndex<-sort(c(TTmeansIndex, TTSDIndex))
TTFinalColIndex<-c(TTmeansSDColIndex[!TTmeansSDColIndex %in% TTmeanFreqIndex], 562, 563)

## Subset train and test binded document for applicable columns only
TTFinal<-trainTestbind[,TTFinalColIndex]

## Obtain clean document for final column names
## To separate unwanted number in label in other column
write.table(features, file="./features2.txt", quote=FALSE)
features2<-read.table("./features2.txt", skip=1, quote="", row.names=1, sep="")
features2Subs<-features2$V3[TTFinalColIndex]
features2Subs<-gsub("-", "_", features2Subs)
features2Subs<-gsub(",", "_", features2Subs)
features2Subs<-gsub("BodyBody", "Body", features2Subs)
cNames<-c(features2Subs)
cNames[67]<-"activity_id"
cNames[68]<-"subject_id"
colnames(TTFinal)<-cNames

## Write first data set
write.table(TTFinal, file="./Train_Test_Final.txt", quote=FALSE)

## Create second data set
TTFinalAver<-NULL
for (i in 1:6){
  for (j in 1:30) {
    TTFMSubset<-subset(TTFinal, TTFinal$activity_id==i & TTFinal$subject_id==j)
    TTAverCol<-apply(TTFMSubset, 2, mean)
    TTFinalAver<-rbind(TTFinalAver, TTAverCol)
  }
}

## Move activity_id and subject_id columns to first and second.
rownames(TTFinalAver)<-NULL
Final<-data.frame(TTFinalAver)
TTFinalAverages<-data.frame(Final$activity_id, Final$subject_id, TTFinalAver[, 1:66])

## Change id numbers to activities descriptions after completed analysis
for (k in 1:180) {
  ifelse (TTFinalAverages$Final.activity_id[k]==1, TTFinalAverages$Final.activity_id[k]<-activityLabels$activity_desc[1], 
    ifelse (TTFinalAverages$Final.activity_id[k]==2, TTFinalAverages$Final.activity_id[k]<-activityLabels$activity_desc[2],
      ifelse (TTFinalAverages$Final.activity_id[k]==3, TTFinalAverages$Final.activity_id[k]<-activityLabels$activity_desc[3],
        ifelse (TTFinalAverages$Final.activity_id[k]==4, TTFinalAverages$Final.activity_id[k]<-activityLabels$activity_desc[4],
          ifelse (TTFinalAverages$Final.activity_id[k]==5, TTFinalAverages$Final.activity_id[k]<-activityLabels$activity_desc[5],
                                                             TTFinalAverages$Final.activity_id[k]<-activityLabels$activity_desc[6])))))
}

## Obtain final variable names file
features3<-colnames(TTFinalAverages)
write.table(features3, file="./FinalFeatures3.txt", quote=FALSE)

## Write second data set with variables averages for activity and subject.
write.table(TTFinalAverages, file="./TT_Act_Subj_Averages.txt", quote=FALSE)

