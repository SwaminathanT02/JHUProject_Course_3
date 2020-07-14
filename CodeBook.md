# Code Book

This code book is created to explain how the final _TidyDataset_ is created by cleaning and linking the existing data.

**Step 1**
The existing raw data is imported into R and column names are denoted accordingly.

* ActivityLabels <- "activity_labels.txt" : ColumnNames <- "Label", "Activity" : Based on 6 activities and corresponding labels.
* Features <- "features.txt" : ColumnNames <- ID", "Function" : List of Features (Correspond to X train and test).
* SubjectTest <- "./test/subject_test.txt"" : ColumnNames <- "Subject" : Test data of 9 volunteers.
* XTest <- "./test/X_test.txt" : ColumnNames <- Features$Function : Features for test data.
* YTest <- "./test/y_test.txt" : ColumnNames <- "Label" : Feature Labels for test data.
* SubjectTrain <- ""./train/subject_train.txt"" : ColumnNames <- "Subject" : Train data of rest 21 volunteers.
* XTrain <- "./train/X_train.txt" : ColumnNames <- Features$Function : Features for train data.
* YTrain <- "./train/y_train.txt" : ColumnNames <- "Label" : Feature Labels for train data.

**Step 2**
Binding the training and the test datasets.
X <- Row Binding XTrain, XTest
Y <- Row Binding YTrain, YTest
Subject <- Row Binding SubjectTrain, SubjectTest
Data <- Column Binding Subject, Y and X.

**Step 3**
Extracting measurements on mean and standard deviation only.
Data <- Only Variables measuring mean and standard deviation

**Step 4**
Use descriptive activity names to name the activities in the data set.
Variable _Label_ of Data changed according to ActivityLabels.

**Step 5**
Descriptive variable names denoted.
To lower case and set non-abbreviated forms of variable names.

**Step 6**
A second, independent tidy data set with the average of each variable for each activity and each subject.
* TidyDataset is created by taking the means of each variable for corresponding _activity_ and _subject_.
* TidyDataset is exported as TidyDataset.txt