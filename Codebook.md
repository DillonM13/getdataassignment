Getting and Cleaning Data

Dillon Medina

The Data 

he experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

Attribute information

For each record it is provided

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

Section 1 Merges the training and the test sets to create one data sets

Set your work directory. 
Read the files into Read
		features.txt
		activity_labels.txt
		subject_train.txt
		x_train.txt
		y_train.txt
		subject_test.txt
		x_text.txt
		y_test.txt
		
After reading the training data into R, assign column names and merge to create one data sets
This was repeated after reading to test data

Section 2 Extracts only the measurements on the mean and standard deviation for each measurement. 

Create a logical vector that contains true values for ID, Mean, & Standard Deviation. 
Subset the table to extract needed columns

Section 3 Uses descriptive activity names to name the activities in the data set

Merge data subset to include descriptive activity names

Update column names to include new descriptive activity names

Section 4 Appropriately labels the data set with descriptive variable names. 

Reassign column names to clean up the data labels

Update column names to new clean data labels

Section 5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Create a new data set that only includes average variable 

Merge both tables then export


