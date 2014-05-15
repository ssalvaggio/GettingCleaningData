Getting and Cleaning Data - Course Project

Salvino A. Salvaggio - Mai 2014

*****************************


CODE BOOK
================

# Table of Content
1. Origin of data
2. Experimental design
3. Description of the data in the tidy data set
4. Naming
5. Description of the variables
6. Description of transformation from original data sets. Comments to code
	1. STEP 1: Merges the training and the test sets to create one data set.
	3. STEP 2: Extracts only the measurements on the mean and standard deviation for each measurement.
	4. STEP 3: Uses descriptive activity names to name the activities in the data set .
	5. STEP 4: Appropriately labels the data set with descriptive activity names.
	6. STEP 5: Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

****************

# Origin of data
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. *Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine*. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
<http://http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

Zipped data file (including detailed description of raw data):
<http://https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip> 

****************

# Experimental design
The methodology behinnd the collection of the initial raw data, as well as definitions of data sets, lists of variables, etc. is provided by original authors in separate documents (README.txt, features_info.txt and features.txt) included in the zipped data file.

<u>Summary</u>: The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.
Each initial record provides:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

****************

# Description of the data in the tidy data set
<u>Caveat</u>: In order to limit the scope of this work while meeting the assignment requirement, I have excluded the data from the 2 'Inertial Signals' folders. Actually, this assignment focuses on mean and standard deviation values which are already available in other files (y_test.txt and y_train.txt). There is therefore no need to go back to the original data to recalculate them.

The original raw data come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using several methods which are describedin detail in the original features_info.txt file.

Also, a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

* mean(): Mean value
* std(): Standard deviation
* mad(): Median absolute deviation 
* max(): Largest value in array
* min(): Smallest value in array
* sma(): Signal magnitude area
* energy(): Energy measure. Sum of the squares divided by the number of values. 
* iqr(): Interquartile range 
* entropy(): Signal entropy
* arCoeff(): Autorregresion coefficients with Burg order equal to 4
* correlation(): correlation coefficient between two signals
* maxInds(): index of the frequency component with largest magnitude
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency
* skewness(): skewness of the frequency domain signal 
* kurtosis(): kurtosis of the frequency domain signal 
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
* angle(): Angle between to vectors.

Out of the initial 561 variables, as requesteed by the assignment I kept only the variables reporting mean or standard deviation values, ending in total number of variables of 90.

After having transformed the variable names in a more descriptive manner, list of variable names is:

* 	SubjectId
* 	Group
* 	ActivityCode
* 	Activity
* 	Time.BodyAcc.Mean.X
* 	Time.BodyAcc.Mean.Y
* 	Time.BodyAcc.Mean.Z
* 	Time.BodyAcc.Std.X
* 	Time.BodyAcc.Std.Y
* 	Time.BodyAcc.Std.Z
* 	Time.GravityAcc.Mean.X
* 	Time.GravityAcc.Mean.Y
* 	Time.GravityAcc.Mean.Z
* 	Time.GravityAcc.Std.X
* 	Time.GravityAcc.Std.Y
* 	Time.GravityAcc.Std.Z
* 	Time.BodyAccJerk.Mean.X
* 	Time.BodyAccJerk.Mean.Y
* 	Time.BodyAccJerk.Mean.Z
* 	Time.BodyAccJerk.Std.X
* 	Time.BodyAccJerk.Std.Y
* 	Time.BodyAccJerk.Std.Z
* 	Time.BodyGyro.Mean.X
* 	Time.BodyGyro.Mean.Y
* 	Time.BodyGyro.Mean.Z
* 	Time.BodyGyro.Std.X
* 	Time.BodyGyro.Std.Y
* 	Time.BodyGyro.Std.Z
* 	Time.BodyGyroJerk.Mean.X
* 	Time.BodyGyroJerk.Mean.Y
* 	Time.BodyGyroJerk.Mean.Z
* 	Time.BodyGyroJerk.Std.X
* 	Time.BodyGyroJerk.Std.Y
* 	Time.BodyGyroJerk.Std.Z
* 	Time.BodyAccMag.Mean
* 	Time.BodyAccMag.Std
* 	Time.GravityAccMag.Mean
* 	Time.GravityAccMag.Std
* 	Time.BodyAccJerkMag.Mean
* 	Time.BodyAccJerkMag.Std
* 	Time.BodyGyroMag.Mean
* 	Time.BodyGyroMag.Std
* 	Time.BodyGyroJerkMag.Mean
* 	Time.BodyGyroJerkMag.Std
* 	FreqDomainSignal.BodyAcc.Mean.X
* 	FreqDomainSignal.BodyAcc.Mean.Y
* 	FreqDomainSignal.BodyAcc.Mean.Z
* 	FreqDomainSignal.BodyAcc.Std.X
* 	FreqDomainSignal.BodyAcc.Std.Y
* 	FreqDomainSignal.BodyAcc.Std.Z
* 	FreqDomainSignal.BodyAcc.Mean.FreqX
* 	FreqDomainSignal.BodyAcc.Mean.FreqY
* 	FreqDomainSignal.BodyAcc.Mean.FreqZ
* 	FreqDomainSignal.BodyAccJerk.Mean.X
* 	FreqDomainSignal.BodyAccJerk.Mean.Y
* 	FreqDomainSignal.BodyAccJerk.Mean.Z
* 	FreqDomainSignal.BodyAccJerk.Std.X
* 	FreqDomainSignal.BodyAccJerk.Std.Y
* 	FreqDomainSignal.BodyAccJerk.Std.Z
* 	FreqDomainSignal.BodyAccJerk.Mean.FreqX
* 	FreqDomainSignal.BodyAccJerk.Mean.FreqY
* 	FreqDomainSignal.BodyAccJerk.Mean.FreqZ
* 	FreqDomainSignal.BodyGyro.Mean.X
* 	FreqDomainSignal.BodyGyro.Mean.Y
* 	FreqDomainSignal.BodyGyro.Mean.Z
* 	FreqDomainSignal.BodyGyro.Std.X
* 	FreqDomainSignal.BodyGyro.Std.Y
* 	FreqDomainSignal.BodyGyro.Std.Z
* 	FreqDomainSignal.BodyGyro.Mean.FreqX
* 	FreqDomainSignal.BodyGyro.Mean.FreqY
* 	FreqDomainSignal.BodyGyro.Mean.FreqZ
* 	FreqDomainSignal.BodyAccMag.Mean
* 	FreqDomainSignal.BodyAccMag.Std
* 	FreqDomainSignal.BodyAccMag.Mean.Freq
* 	FreqDomainSignal.BodyBodyAccJerkMag.Mean
* 	FreqDomainSignal.BodyBodyAccJerkMag.Std
* 	FreqDomainSignal.BodyBodyAccJerkMag.Mean.Freq
* 	FreqDomainSignal.BodyBodyGyroMag.Mean
* 	FreqDomainSignal.BodyBodyGyroMag.Std
* 	FreqDomainSignal.BodyBodyGyroMag.Mean.Freq
* 	FreqDomainSignal.BodyBodyGyroJerkMag.Mean
* 	FreqDomainSignal.BodyBodyGyroJerkMag.Std
* 	FreqDomainSignal.BodyBodyGyroJerkMag.Mean.Freq
* 	Angle.tBodyAcc.Mean.Gravity
* 	Angle.tBodyAccJerk.Mean.Gravity.Mean
* 	Angle.tBodyGyro.Mean.Gravity.Mean
* 	Angle.tBodyGyroJerk.Mean.Gravity.Mean
* 	Angle.XGravity.Mean
* 	Angle.YGravity.Mean
* 	Angle.ZGravity.Mean


****************

# Naming
In this work, naming all identifiers (names of R objects, variables within the R objects, and functions) follows these simple rules:

* no underscores, no hyphens, no parentheses
* initial capital letters when several expressions/words name an object, a variable or a function. Ex: VariableName, PartialData, SortedCompleteData
* in long variable names, dot is used to increase readability
* newly created functions always start with verb. Ex: Convert(), RecodeActivity()

****************

# Description of variables
This function only focuses on the tidy data set and the second, independent tidy data set


1. <u>Complete tidy data set</u>

	* 	SubjectId: 30 volunteers were enrolled for this experiement. Variable reports their ID number. This is a factor variable, 30 levels:, 1, 2, ..., 30
	* 	Group: 70% of the volunteers was selected to generate the training data, and 30% the test data. This variable mentions which group the recording belongs to. Factor variable, 2 levels: Test, Training
	* 	ActivityCode: Report the code of the physical activity undertaken. Factor variable, 5 levels: 1, 2,..., 5
	* 	Activity: Report the code of the physical activity undertaken. Factor variable, 5 levels: 1, 2,..., 5
	* 	Activity: Verbal description of physical activity carried out. factor variable, 5 levels: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

	* 	Time.BodyAcc.Mean.X
	* 	Time.BodyAcc.Mean.Y
	* 	Time.BodyAcc.Mean.Z -- Three variables provide means of the time domain signal for the body accelerometer for each of the 3 spacial direction x, y, z
	* 	Time.BodyAcc.Std.X
	* 	Time.BodyAcc.Std.Y
	* 	Time.BodyAcc.Std.Z -- Three variables provide standard deviations of the time domain signal for the body accelerometer for each of the 3 spacial direction x, y, z 
	* 	Time.GravityAcc.Mean.X
	* 	Time.GravityAcc.Mean.Y
	* 	Time.GravityAcc.Mean.Z -- Three variables provide means of the time domain signal for the gravity accelerometer for each of the 3 spacial direction x, y, z
	* 	Time.GravityAcc.Std.X
	* 	Time.GravityAcc.Std.Y
	* 	Time.GravityAcc.Std.Z -- Three variables provide standard deviations of the time domain signal for the gravity accelerometer for each of the 3 spacial direction x, y, z
	* 	Time.BodyAccJerk.Mean.X
	* 	Time.BodyAccJerk.Mean.Y
	* 	Time.BodyAccJerk.Mean.Z -- Three variables provide means of the time domain signal for the body accelerometer Jerk signal for each of the 3 spacial direction x, y, z
	* 	Time.BodyAccJerk.Std.X
	* 	Time.BodyAccJerk.Std.Y
	* 	Time.BodyAccJerk.Std.Z -- Three variables provide standard deviations of the time domain signal for the body accelerometer Jerk signal for each of the 3 spacial direction x, y, z
	* 	Time.BodyGyro.Mean.X
	* 	Time.BodyGyro.Mean.Y
	* 	Time.BodyGyro.Mean.Z -- Three variables provide means of the time domain signal for the body gyroscope for each of the 3 spacial direction x, y, z
	* 	Time.BodyGyro.Std.X
	* 	Time.BodyGyro.Std.Y
	* 	Time.BodyGyro.Std.Z -- Three variables provide standard deviations of the time domain signal for the body gyroscope for each of the 3 spacial direction x, y, z
	* 	Time.BodyGyroJerk.Mean.X
	* 	Time.BodyGyroJerk.Mean.Y
	* 	Time.BodyGyroJerk.Mean.Z -- Three variables provide means of the time domain signal for the body gyroscope Jerk signal for each of the 3 spacial direction x, y, z
	* 	Time.BodyGyroJerk.Std.X
	* 	Time.BodyGyroJerk.Std.Y
	* 	Time.BodyGyroJerk.Std.Z -- Three variables provide standard deviations of the time domain signal for the body gyroscope Jerk signal for each of the 3 spacial direction x, y, z
	* 	Time.BodyAccMag.Mean
	* 	Time.BodyAccMag.Std
	* 	Time.GravityAccMag.Mean
	* 	Time.GravityAccMag.Std
	* 	Time.BodyAccJerkMag.Mean
	* 	Time.BodyAccJerkMag.Std
	* 	Time.BodyGyroMag.Mean
	* 	Time.BodyGyroMag.Std
	* 	Time.BodyGyroJerkMag.Mean
	* 	Time.BodyGyroJerkMag.Std -- Ten variables provide mean and standard deviation of magnitude of the 3-dimensional time domain signals, for body accelerator, body gyroscope, Jerk or no Jerk signals
	* 	FreqDomainSignal.BodyAcc.Mean.X
	* 	FreqDomainSignal.BodyAcc.Mean.Y
	* 	FreqDomainSignal.BodyAcc.Mean.Z -- Three variables provide means of the frequency domain signal for the body accelerometer for each of the 3 spacial direction x, y, z
	* 	FreqDomainSignal.BodyAcc.Std.X
	* 	FreqDomainSignal.BodyAcc.Std.Y
	* 	FreqDomainSignal.BodyAcc.Std.Z -- Three variables provide standard deviations of the frequency domain signal for the body accelerometer for each of the 3 spacial direction x, y, z
	* 	FreqDomainSignal.BodyAcc.Mean.FreqX
	* 	FreqDomainSignal.BodyAcc.Mean.FreqY
	* 	FreqDomainSignal.BodyAcc.Mean.FreqZ -- Three variables provide means frequency of the frequency domain signal for the body accelerometer for each of the 3 spacial direction x, y, z
	* 	FreqDomainSignal.BodyAccJerk.Mean.X
	* 	FreqDomainSignal.BodyAccJerk.Mean.Y
	* 	FreqDomainSignal.BodyAccJerk.Mean.Z -- Three variables provide means  of the frequency domain signal Jerk signal for the body accelerometer for each of the 3 spacial direction x, y, z
	* 	FreqDomainSignal.BodyAccJerk.Std.X
	* 	FreqDomainSignal.BodyAccJerk.Std.Y
	* 	FreqDomainSignal.BodyAccJerk.Std.Z -- Three variables provide standard deviations  of the frequency domain signal Jerk signal for the body accelerometer for each of the 3 spacial direction x, y, z
	* 	FreqDomainSignal.BodyAccJerk.Mean.FreqX
	* 	FreqDomainSignal.BodyAccJerk.Mean.FreqY
	* 	FreqDomainSignal.BodyAccJerk.Mean.FreqZ -- Three variables provide means frequency of the frequency domain signal Jerk signal for the body accelerometer for each of the 3 spacial direction x, y, z
	* 	FreqDomainSignal.BodyGyro.Mean.X
	* 	FreqDomainSignal.BodyGyro.Mean.Y
	* 	FreqDomainSignal.BodyGyro.Mean.Z -- Three variables provide means of the frequency domain signal for the body gyrooscope for each of the 3 spacial direction x, y, z
	* 	FreqDomainSignal.BodyGyro.Std.X
	* 	FreqDomainSignal.BodyGyro.Std.Y
	* 	FreqDomainSignal.BodyGyro.Std.Z -- Three variables provide standard deviations of the frequency domain signal for the body gyrooscope for each of the 3 spacial direction x, y, z
	* 	FreqDomainSignal.BodyGyro.Mean.FreqX
	* 	FreqDomainSignal.BodyGyro.Mean.FreqY
	* 	FreqDomainSignal.BodyGyro.Mean.FreqZ -- Three variables provide means frequency of the frequency domain signal for the body gyrooscope for each of the 3 spacial direction x, y, z
	* 	FreqDomainSignal.BodyAccMag.Mean
	* 	FreqDomainSignal.BodyAccMag.Std
	* 	FreqDomainSignal.BodyAccMag.Mean.Freq
	* 	FreqDomainSignal.BodyBodyAccJerkMag.Mean
	* 	FreqDomainSignal.BodyBodyAccJerkMag.Std
	* 	FreqDomainSignal.BodyBodyAccJerkMag.Mean.Freq
	* 	FreqDomainSignal.BodyBodyGyroMag.Mean
	* 	FreqDomainSignal.BodyBodyGyroMag.Std
	* 	FreqDomainSignal.BodyBodyGyroMag.Mean.Freq
	* 	FreqDomainSignal.BodyBodyGyroJerkMag.Mean
	* 	FreqDomainSignal.BodyBodyGyroJerkMag.Std
	* 	FreqDomainSignal.BodyBodyGyroJerkMag.Mean.Freq  -- Twelve variables provide mean and standard deviation of magnitude of the 3-dimensional frequency domain signals, for body accelerator, body gyroscope, Jerk or no Jerk signals
	* 	Angle.TimeBodyAcc.Mean.Gravity
	* 	Angle.TimeBodyAccJerk.Mean.Gravity.Mean
	* 	Angle.TimeBodyGyro.Mean.Gravity.Mean
	* 	Angle.TimeBodyGyroJerk.Mean.Gravity.Mean
	* 	Angle.XGravity.Mean
	* 	Angle.YGravity.Mean
	* 	Angle.ZGravity.Mean -- Seven variable provide angles between vectors obtained by averaging the signals in a signal window sample


1. <u>New independent tidy data set comprising only the average of each variable for each activity and each subject</u>: Same as in the complete tidy data set BUT variable names are prefixed by 'MEAN.' to highlight that all the values are means (means of means, and means of standard deviations) calculated for that specific subject (1 to 30) on that specific activity (1 of 6)


****************

# Description of transformations from original data sets. Comments to code

Steps are as per assignment directions in :
https://class.coursera.org/getdata-003/human_grading/view/courses/972136/assessments/3/submissions

### !! The run_analysis() function require the `stringr` package to be installed

<u>STEP 1: Merges the training and the test sets to create one data set.</u>

1. load 'subject_test.txt' in R object (data frame) TestSubjectId
        
		TestSubjectId <- read.table('subject_test.txt', header= FALSE)      

	This vector comprises the ID of each volunteer who was included in the test group to perform some standard activities. IDs are repeated as per the activities carried out (original measurements available in another file).

2. column renamed in descriptive manner
		
		colnames(TestSubjectId) <- 'SubjectId'
		
3. add column to specify these subject were involved in the Test group

		TestSubjectId$Group <- rep('Test', length(TestSubjectId))
	
4. Do same (steps 1, 2, 3) with subjects involved in Training group

		TrainingSubjectId <- read.table('subject_train.txt', header= FALSE)
		colnames(TrainingSubjectId) <- 'SubjectId'
		TrainingSubjectId$Group <- rep('Training', length(TrainingSubjectId))
		
5. load 'y_test.txt' in R object TestActivity

		TestActivity <- read.table('y_test.txt', header=FALSE)
		
6. column renamed in descriptive manner and make it a factor

		colnames(TestActivity) <- 'ActivityCode'
		
7. load 'activity_labels.txt' in R object ActivityLabels

		ActivityLabels <- read.table('activity_labels.txt', header=FALSE, 
		sep=' ')
		
8. column renamed in descriptive manner

		colnames(ActivityLabels) <- c('ActivityCode', 'Activity')
		
9. create new field in TestActivity

		TestActivity$Activity <- NA
		
10. Recode TestActivity in descriptive manner as per ActivityLabels
		
		recodeActivity <- function() {
    			for(i in 1:6){
      				TestActivity$Activity[TestActivity$ActivityCode == i] <<- 
            			as.character(ActivityLabels$Activity[
            			ActivityLabels$ActivityCode == i])
    					}
			}
			recodeActivity()
			

11. load 'y_train.txt' in R object TestActivity
		
		TrainingActivity <- read.table('y_train.txt', header=FALSE)
		

12. column renamed in descriptive manner and make it a factor
		
		colnames(TrainingActivity) <- 'ActivityCode'


13. create new field in TrainingActivity
		
		TrainingActivity$Activity <- NA
		

14. Recode TestActivity in descriptive manner as per ActivityLabels
		
		RecodeActivity2 <- function() {
    				for(i in 1:6){
       			 		TrainingActivity$Activity[
       			 		TrainingActivity$ActivityCode ==  i]  
       			 		<<- as.character(ActivityLabels$Activity[
       			 		ActivityLabels$ActivityCode == i])
    						}
				}
			RecodeActivity2()	
		
15. load data from the test 'X_test.txt' in R object

			TestData <- read.table('X_test.txt', header=FALSE)
			
16. load data from the training 'X_training.txt' in R object
			
			TrainingData <- read.table('X_train.txt', header=FALSE)
			
17. load 'features.txt' into R object
			
			Features <- read.table('features.txt', header=FALSE)
			
18. rename columns or TestData and TrainingData as per list of values in Features
			
			colnames(TestData) <- Features[,2]
			colnames(TrainingData) <- Features[,2]
			
19. bind TestSubjectId, TestActivity and TestData in a single R object
			
			AllTestData <- cbind(TestSubjectId, TestActivity, TestData)
			
20. bind TrainingSubjectId, TrainingActivity and TrainingData in a single R object
			
			AllTrainingData <- 
			cbind(TrainingSubjectId, TrainingActivity, TrainingData)
			
21. bind AllTestData and AllTrainingData in a single R object
		
			AllData <- rbind(AllTestData, AllTrainingData)
		
22. convert columns 1 to 4 (SubjectId, Group, ActivityCode, Activity) to factor
		
			Convert <- function() {
    				for(i in 1:4){
        				AllData[,i] <<- as.factor(AllData[,i])
   			 		}
				}
			Convert()


<u>STEP 2: Extracts only the measurements on the mean and standard deviation for each measurement. </u>
		
1. From this new data frame comprising all data, extract only the measurements on the mean and standard deviation for each observation (and columns 1 to 4 to 
identify the observation), The following instruction identifies those measures that are measures of mean ('mean' or 'Mean' wherever they appear in the original naming of variables) and standard deviation (std)
		
		Data <- AllData[, c(1:4, grep('[Mm]ean|std', colnames(AllData)))]	
		

<u>STEP 3: Uses descriptive activity names to name the activities in the data set </u>

* Load the numerical activity labels from the files "y_train.txt" and "y_test.txt"
* Load the labels of the activities from the file "activity_labels.txt" and appropriately merge them with the datasets.

	This was done in points 5 to 10 and 11 to 14 in STEP 1


<u>STEP 4: Appropriately labels the data set with descriptive activity names. </u>

1. Package `stringr` has to be installed to make it easier working with strings (version 0.6.2 was used here).  If it is not installed on your computer:
		
		install.packages('stringr')

Then load it

		load('stringr')

2. Clean the exisiting variables names to capitalise, remove punctuation (commas, parentheses, hyphens)
		
		colnames(Data) <- str_replace_all(colnames(Data), '[[:punct:]]', '')
		colnames(Data) <- str_replace_all(colnames(Data), 'mean', '\\.Mean\\.')
		colnames(Data) <- str_replace_all(colnames(Data), 'std', '\\.Std\\.')
		colnames(Data) <- str_replace_all(colnames(Data), 'gravity', 'Gravity')
		colnames(Data) <- str_replace_all(colnames(Data), 'angle', 'Angle')
		
		
To make variable names more descriptive, prefix 't' or 'f' is replaced by english name:
		
		colnames(Data) <- str_replace_all(colnames(Data), '^t', 'Time\\.')
		colnames(Data) <- str_replace_all(colnames(Data), '^f', 'FreqDomainSignal\\.')
		colnames(Data) <- str_replace_all(colnames(Data), '^Angle', 'Angle\\.')
		
and useless dots at end of variable names are removed

		colnames(Data) <- str_replace_all(colnames(Data), '\\.$', '')


<u>STEP 5: Creates a second, independent tidy data set with the average of each variable for each activity and each subject.</u>

A newly created function (GenerateAverageSet() ) is used for this Step.

    GenerateAverageSet <- function() {
        NewAverageData <<- data.frame()
        	for(i in 1:30){
            		for(n in 1:6){
                		Output <- Data[(Data$SubjectId == i & 
                		Data$ActivityCode == n),]
               		 Means <- t(colMeans(Output[5:90]))
                
                		NewRow <- as.data.frame(c(Output[1,1:4], Means))
                		colnames(NewRow) <- c(colnames(Output[1:4]), 
                		colnames(Means))
                		NewAverageData <- rbind(NewAverageData, NewRow)
         		   }
       		 }
        		vectorName <- colnames(NewAverageData)
       		 vectorName[5:90] <- str_join('MEAN.', vectorName[5:90], sep='')
        		colnames(NewAverageData) <- vectorName
        		NewAverageData <<- NewAverageData
    		}
	}
	GenerateAverageSet()
	

Code extracts subjects (based on SubjectId), then extracts each of the 6 possible activities. For each couple of subject/activity, code computes the mean of the available measurements (rows) for each column. This is saved in an R object NewRow, which is pasted to the NewAverageData data frame. Each time an iteraction of the 30 subjects X 6 activities is completed a new row is pasted to the NewAverageData.

At the end, variables (colums of NewAverageData are renamed to highlight the fact that their values are means.



To conclude, the run_analysis() function <u>saves 2 files</u> into the R working directory:

* TidyData.txt that comprises all the tidy data
* NewAverageData.txt, that is a second, independent tidy data set comprising only the average of each variable for each activity and each subject

		write.table(Data, file='TidyData.txt', row.names=FALSE, sep='\t')
		write.table(NewAverageData, file='NewAverageData.txt', 
			row.names=FALSE, sep='\t')
