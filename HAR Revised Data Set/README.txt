Human Activity Recognition Revised Data Set

Getting and Cleaning Data
Data Science Course in Coursera
Prepared by MAT

Original Data Set prepared as:
==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.
Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 
The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers 
was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap 
(128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body 
acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. 
From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For the current record it is provided:
======================================

- A data set with combined train and test data from original data for 68 variables including the six(6) activities evaluated and the
  identification number of a total of 30 subjects.
- A second data set with 66-feature variables with the average of all time and frequency domain variables presented by activity and
  subject. 
- A features text file with all variables.
- A features codebook file describing all variables.
- Source code for the analysis.


The dataset includes the following files:
=========================================

- 'README.txt': Describes the complete data set.

- 'FinalFeatures3_codebook.txt': Shows information about the variables used on the feature data set and analysis.

- 'FinalFeatures3.txt': List of all features.

- 'Train_Test_Final.txt': Original data from six(6) files combined in a data set including train and test data, activities for train and test data,
   and subjects identifications for train and test data.

- 'TT_Act_Subj_Averages.txt': Second data set including the averages of each of the 66 mean and standard deviations variables for
   each of the 6 activities and for each of the 30 subjects. 

- 'run_analysis.R': The source code of the analysis with a detailed description of the activities.




Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.


For more information about this dataset contact: activityrecognition@smartlab.ws


License:
========
The reference for the use of the dataset is described as follows: 

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass 
Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). 
Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions 
for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
