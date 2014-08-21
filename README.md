# README.md for the run_analysis.R

This file describes how the run_analysis.R file is supposed to be used. Download the data set and save it. 
The directory structure should then look like

	C:\Getting and Cleaning Data\Project\getdata_projectfiles_UCI HAR Dataset\UCI HAR Dataset
		features.txt
		activitylabels.txt
		\train
			x_train.txt
			y_train.txt
			subject_train.tx
		\test
			x_test.txt
			y_test.txt
			subject_test.tx

Once you start up R studio you need to change the session working directory to 
C:\Getting and Cleaning Data\Project\getdata_projectfiles_UCI HAR Dataset\UCI HAR Dataset, or the script
will not be able to locate the data files. 

Once completed the script will create 2 output files. The recombined tidy data set 1 will be written out as tidydata1.csv, 
and the new dataset of means will be created as tidydata2.csv. Both will be saved to the R session working directory.
