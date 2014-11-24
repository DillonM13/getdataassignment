# 1)Merge training and test sets to create one data set. 

#Step:

#     1.set working directory

setwd("C:/Users/Admin/Documents/R Programming/getdata assignment/UCI HAR Dataset")

#      2.read training files into R 

features<-read.table("./features.txt", header=FALSE)
activity<-read.table("./activity_labels.txt" , header=FALSE)
subjecttrain<-read.table("./train/subject_train.txt", header=FALSE)
xtrain<-read.table("./train/X_train.txt", header=FALSE)
ytrain<-read.table("./train/Y_train.txt", header=FALSE)

#      3 assisgn column names

colnames(activity)=c("activityid", "activity type")
colnames(subjecttrain)="subjectid"
colnames(xtrain)= features[, 2]
colnames(ytrain)= "activityid"

#      4 create final training table

trainingdata<-cbind(ytrain,subjecttrain,xtrain)

#      5 read test data into R

subjecttest<-read.table("./test/subject_test.txt", header=FALSE)
xtest<-read.table("./test/X_test.txt", header=FALSE)
ytest<-read.table("./test/Y_test.txt", header=FALSE)

#      6 assisgn column names

colnames(subjecttest)="subjectid"
colnames(xtest)= features[, 2]
colnames(ytest)= "activityid"

#      7 create final training table

testdata<-cbind(ytest,subjecttest,xtest)

#      8 Merge training and test tables together

finaldata<-rbind(trainingdata, testdata)

#     9 Creating vectors for the column names

columnnames<-colnames(finaldata)

# 2) Extract only the measurement on the mean and standard deviation. 

#     1 Creating a logical vector that contains true values for ID, mean & standard deviation

vector <- (grepl("activity..",columnnames) | grepl("subject..",columnnames) | grepl("-mean..",columnnames) & 
                   !grepl("-meanFreq..",columnnames) & !grepl("mean..-",columnnames) | grepl("-std..",columnnames) & 
                   !grepl("-std()..-",columnnames))

#     2 Subsetting finaldata table    

finaldata<-finaldata[vector==TRUE]

# 3  Use descriptive activity nams to name the activities in the data set

finaldata<- merge(finaldata,activity, by="activityid", all.x=TRUE)

#     2 Updating the column names to include new names

columnnames<- colnames(finaldata)

#4 Appropriately labels the data set with descriptive variable names

columnnames<-c("activityid", "subjectid", "timebodyaccmagnitudemean", "timebodyaccmagnitudestd",
               "timegravityaccmagnitudemean", "timegravityaccmagnitudestd", "timebodyaccjerkmagnitudemean", 
               "timebodyaccjerkmagnitudestd", "timebodygryomagnitudemean", "timebodygyromagnitudestd",
               "timebodygyrojerkmagnitudemean", "timebodygyrojerkmagnitudestd", "freqbodyaccmagnitudemean", 
               "freqbodyaccmagnitudestd", "freqbodyaccjerkmagnitudemean", "freqbodyaccjerkmagnitudestd",
               "freqbodygyromagnitudemean", "freqbodygyromagnitudestd", "freqbodygyrojerkmagnitudemean",
               "freqbodygyrojerkmagnitudestd", "activity type")

#     2 Assign new description to column names

colnames(finaldata)<- columnnames

#5 Creating second tidy data set with average of each variable 

#     1 creating a table without the activity type column

noactivity<- finaldata[,names(finaldata) != "activity type"]

#     2 Including the mean of each variable 

tidydata<- aggregate(noactivity[,names(noactivity) != c("activityid","subjectid")],
            by=list(activityid=noactivity$activityid,subjectid = noactivity$subjectid),mean)

#     3 Merging both tables to include descriptive activity name

tidydata<- merge(tidydata,activity,by="activityid",all.x=TRUE)

# Exporting data set

write.table(tidydata, "./tidydata.txt", row.names=FALSE, sep="/t")


                
