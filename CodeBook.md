# Code Book

This code book is created to explain how the final _TidyDataset_ is created by cleaning and linking the existing data.

**Step 1**
The existing raw data is imported into R and column names are denoted accordingly.

* ActivityLabels <- _"activity_labels.txt"_ | ColumnNames <- _"Label", "Activity"_ 
 | Based on 6 activities and corresponding labels.
* Features <- _"features.txt"_ | ColumnNames <- _"ID", "Function" _
 | List of Features (Correspond to X train and test).
* SubjectTest <- _"./test/subject_test.txt"_ | ColumnNames <- _"Subject"_
 | Test data of 9 volunteers.
* XTest <- _"./test/X_test.txt"_ | ColumnNames <- _Features$Function_
 | Features for test data.
* YTest <- _"./test/y_test.txt"_ | ColumnNames <- _"Label"_
 | Feature Labels for test data.
* SubjectTrain <- _"./train/subject_train.txt"_ | ColumnNames <- _"Subject"_
 | Train data of rest 21 volunteers.
* XTrain <- _"./train/X_train.txt"_ | ColumnNames <- _Features$Function_
 | Features for train data.
* YTrain <- _"./train/y_train.txt"_ | ColumnNames <- _"Label"_
 | Feature Labels for train data.

**Step 2**
Binding the training and the test datasets.
* X <- Row Binding XTrain, XTest
* Y <- Row Binding YTrain, YTest
* Subject <- Row Binding SubjectTrain, SubjectTest
* Data <- Column Binding Subject, Y and X.

**Step 3**
Extracting measurements on mean and standard deviation only.
* Data <- Only Variables measuring mean and standard deviation

**Step 4**
Use descriptive activity names to name the activities in the data set.
* Variable _Label_ of Data changed according to ActivityLabels.

**Step 5**
Descriptive variable names denoted.
* To lower case and set non-abbreviated forms of variable names.

**Step 6**
A second, independent tidy data set with the average of each variable for each activity and each subject.
* TidyDataset is created by taking the means of each variable for corresponding _activity_ and _subject_.
* TidyDataset is exported as TidyDataset.txt