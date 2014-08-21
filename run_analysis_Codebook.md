#run_analyis.R Codebook				
* by Thomas Harder

# to view the variables read this document in raw mode. The formatting is better. 

## Work Performed
The data had to be reassmebled from 8 different files. The files contained the subjects, features,
activities for both test and training data. This required reading in the files and then piecing them back 
together in the appropriate order. In the R code separate data tables were used for each transformation in 
order to aid understanding. If this program was to be used often it would be recommended to modify this 
code to do the transformation back on the same table has this would result in smaller memory space requirements. 

The basic algorithm is below
* Open and read the data files
* Get the feature variable names from the features.txt file to use as column headers when the 
feature data are read in. 
* Get the activity labels to use when the activity factor is converted. 
* Get the test data
* Merge the test data sets to create one test data set
* Get the training data
* Merge the training data sets to create one training data set
* Merge training and test data sets
* Extract only the measurements on the mean and std. dev. for each measurement uses grep to select the columes 
that have either "mean" or "std" in their column names. 
* Order data by subject number and activity
* Write ExtractedData data.frame to the file "workingdirectory"/foo.csv
* Recast data by SubjectNumber, Activity with means of each feature
* Write out tidy data set 2

## Variables below are for the tidy data set 2. 
The variable names were not changed on purpose. The author could not think of better names and something
like tBodyAcc.mean.mean...X, just sounded way to long and redundant. This require the user to know that tidy 
data set 2 has means of means and means of standard deviations. 
				
Variable Name	Descriptor								Position Range	
SubjectNumber		Number of the subject that was used				1	1 -- 30	
Activity		Type of activity user was engaged in				2	WALKING	
												WALKING_UPSTAIRS	
												WALKING_DOWNSTAIRS	
												SITTING	
												STANDING	
												LAYING	
tBodyAcc.mean...X	Mean of the tBodyAcc mean in the X axis				3	-1	1
tBodyAcc.mean...Y	Mean of the tBodyAcc mean in the y axis				4	-1	1
tBodyAcc.mean...Z	Mean of the tBodyAcc mean in the Z axis				5	-1	1
tBodyAcc.std...X	Mean of the tBodyAcc Standard Deviation in the X axis		6	-1	1
tBodyAcc.std...Y	Mean of the tBodyAcc Standard Deviation the Y axis		7	-1	1
tBodyAcc.std...Z	Mean of the tBodyAcc  Standard Deviation in the Z axis		8	-1	1
tGravityAcc.mean...X	Mean of the tGravityAcceleration mean in the X axis		9	-1	1
tGravityAcc.mean...Y	Mean of the tGravityAcceleration mean in the Y axis		10	-1	1
tGravityAcc.mean...Z	Mean of the tGravityAcceleration mean in the Z axis		11	-1	1
tGravityAcc.std...X	Mean of the tGravityAcc Standard Deviation in the X axis	12	-1	1
tGravityAcc.std...Y	Mean of the tGravityAcc  Standard Deviation in the Y axis	13	-1	1
tGravityAcc.std...Z	Mean of the  tGravityAcc Standard Deviation in the Z axis	14	-1	1
tBodyAccJerk.mean...X	Mean of the tBodyAccJerk mean in the X axis			15	-1	1
tBodyAccJerk.mean...Y	Mean of the tBodyAccJerk mean in the Y axis			16	-1	1
tBodyAccJerk.mean...Z	Mean of the tBodyAccJerk mean in the Z axis			17	-1	1
tBodyAccJerk.std...X	Mean of the tBodyAccJerk Standard Deviation in the X axis	18	-1	1
tBodyAccJerk.std...Y	Mean of the tBodyAccJerk Standard Deviation in the Y axis	19	-1	1
tBodyAccJerk.std...Z	Mean of the  tBodyAccJerk Standard Deviation in the Z axis	20	-1	1
tBodyGyro.mean...X	Mean of the tBodyGryo mean in the X axis			21	-1	1
tBodyGyro.mean...Y	Mean of the tBodyGyro mean in the Y axis			22	-1	1
tBodyGyro.mean...Z	Mean of the tBodyGyro mean in the Z axis			23	-1	1
tBodyGyro.std...X	Mean of the tBodyGyro Standard Deviation in the X axis		24	-1	1
tBodyGyro.std...Y	Mean of the tBodyGyro Standard Deviation in the Y axis		25	-1	1
tBodyGyro.std...Z	Mean of the  tBodyGyro Standard Deviation in the Z axis		26	-1	1
tBodyGyroJerk.mean...X	Mean of the tBodyGryoJerk mean in the X axis			27	-1	1
tBodyGyroJerk.mean...Y	Mean of the tBodyGyroJerk mean in the Y axis			28	-1	1
tBodyGyroJerk.mean...Z	Mean of the tBodyGyroJerk mean in the Z axis			29	-1	1
tBodyGyroJerk.std...X	Mean of the tBodyGyroJerk Standard Deviation in the X axis	30	-1	1
tBodyGyroJerk.std...Y	Mean of the tBodyGyroJerk Standard Deviation in the Y axis	31	-1	1
tBodyGyroJerk.std...Z	Mean of the  tBodyGyroJerk Standard Deviation in the Z axis	32	-1	1
tBodyAccMag.mean..	Mean of the tBodyAccMag mean					33	-1	1
tBodyAccMag.std..	Mean of the tBodyAccMag Standard Deviation			34	-1	1
tGravityAccMag.mean..	Mean of the tGravityAccMag mean					35	-1	1
tGravityAccMag.std..	Mean of the tGravityAccMag Standard Deviation			36	-1	1
tBodyAccJerkMag.mean..	Mean of the tBodyACCJerkMag mean				37	-1	1
tBodyAccJerkMag.std..	Mean of the tBodyACCJerkMag Standard Deviation			38	-1	1
tBodyGyroMag.mean..	Mean of the tBodyGyroMag mean					39	-1	1
tBodyGyroMag.std..	Mean of the tBodyGyroMag Standard Deviation			40	-1	1
tBodyGyroJerkMag.mean..	Mean of the tBodyGyroJerkMag mean				41	-1	1
tBodyGyroJerkMag.std..	Mean of the tBodyGyroJerkMag Standard Deviation			42	-1	1
fBodyAcc.mean...X	Mean of the fBodyAcc mean in the X axis				43	-1	1
fBodyAcc.mean...Y	Mean of the fBodyAcc mean in the Y axis				44	-1	1
fBodyAcc.mean...Z	Mean of the fBodyAcc mean in the Z axis				45	-1	1
fBodyAcc.std...X	Mean of the fBodyAcc Standard Deviation in the X axis		46	-1	1
fBodyAcc.std...Y	Mean of the fBodyAcc Standard Deviation the Y axis		47	-1	1
fBodyAcc.std...Z	Mean of the fBodyAcc  Standard Deviation in the Z axis		48	-1	1
fBodyAcc.meanFreq...X	Mean Frequency of the fBodyAcc mean frequency in the X axis	49	-1	1
fBodyAcc.meanFreq...Y	Mean frequency of the fBodyAcc mean frequency in the Y axis	50	-1	1
fBodyAcc.meanFreq...Z	Mean frequency of the fBodyAcc mean frequency in the Z axis	51	-1	1
fBodyAccJerk.mean...X	Mean of the fBodyAccJerk mean in the X axis			52	-1	1
fBodyAccJerk.mean...Y	Mean of the fBodyAccJerkmean  in the Y axis			53	-1	1
fBodyAccJerk.mean...Z	Mean of the fBodyAccJerk mean in the Z axis			54	-1	1
fBodyAccJerk.std...X	Mean of the fBodyAccJerk Standard Deviation in the X axis	55	-1	1
fBodyAccJerk.std...Y	Mean of the fBodyAccJerk Standard Deviation in the Y axis	56	-1	1
fBodyAccJerk.std...Z	Mean of the  fBodyAccJerk Standard Deviation in the Z axis	57	-1	1
fBodyAccJerk.meanFreq...X	Mean frequency of the fBodyAccJerk fmean frequency in the X axis	58	-1	1
fBodyAccJerk.meanFreq...Y	Mean frequency of the fBodyAccJerk mean frquency in the Y axis	59	-1	1
fBodyAccJerk.meanFreq...Z	Mean frequency of the fBodyAccJerk mean frequency in the Z axis	60	-1	1
fBodyGyro.mean...X	Mean of the fBodyGyro mean in the X axis			61	-1	1
fBodyGyro.mean...Y	Mean of the fBodyGyro mean  in the Y axis			62	-1	1
fBodyGyro.mean...Z	Mean of the fBodyGyro mean in the Z axis			63	-1	1
fBodyGyro.std...X	Mean of the fBodyGyro Standard Deviation in the X axis		64	-1	1
fBodyGyro.std...Y	Mean of the fBodyGyro Standard Deviation in the Y axis		65	-1	1
fBodyGyro.std...Z	Mean of the  fBodyGyro Standard Deviation in the Z axis		66	-1	1
fBodyGyro.meanFreq...X	Mean frequency of the fBodyGyro  in the X axis			67	-1	1
fBodyGyro.meanFreq...Y	Mean frequency of the fBodyGyro in the Y axis			68	-1	1
fBodyGyro.meanFreq...Z	Mean frequency of the fBodyGyro in the Z axis			69	-1	1
fBodyAccMag.mean..	Mean of the fBodyAccMag mean					70	-1	1
fBodyAccMag.std..	Mean of the fBodyAccMag standard deviation			71	-1	1
fBodyAccMag.meanFreq..	Mean frequency of the fBodyAccMag mean frequency		72	-1	1
fBodyBodyAccJerkMag.mean..	Mean of the fBodyBodyAccJerkMag mean			73	-1	1
fBodyBodyAccJerkMag.std..	Mean of the fBodyBodyAccJerkMag  standard deviation	74	-1	1
fBodyBodyAccJerkMag.meanFreq..	Mean frequency of the fBodyBodyACCJerkMag mean frequency	75	-1	1
fBodyBodyGyroMag.mean..	Mean of the fBodyBodyGyroMag mean				76	-1	1
fBodyBodyGyroMag.std..	Mean of the fBodyBodyGyroMag standard deviation			77	-1	1
fBodyBodyGyroMag.meanFreq..	Mean frequency of the fBodyBodyGyroMag			78	-1	1
fBodyBodyGyroJerkMag.mean..	Mean of the fBodyBodyGyroJerkMag mean			79	-1	1
fBodyBodyGyroJerkMag.std..	Mean of the fBodyBodyGyroJerkMag standard deviation	80	-1	1
fBodyBodyGyroJerkMag.meanFreq..	Mean frequency of the fBodyBodyGyroJerkMag mean frequency	81	-1	1
