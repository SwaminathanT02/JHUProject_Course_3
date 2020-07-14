#Importing The Necessary Packages
library(dplyr)
library(data.table)


#Setting Working Directory
setwd("C:/Users/venka/OneDrive/Desktop/data/project_course_3/UCI HAR Dataset")

#Importing Data and Naming Variables
ActivityLabels <- read.table("activity_labels.txt")
names(ActivityLabels) <- c("Label", "Activity")

Features <- read.table("features.txt")
names(Features) <- c("ID", "Function")

SubjectTest <- read.table("./test/subject_test.txt")
names(SubjectTest) <- "Subject"

XTest <- read.table("./test/X_test.txt")
names(XTest) <- Features$Function

YTest <- read.table("./test/y_test.txt")
names(YTest) <- "Label"

SubjectTrain <- read.table("./train/subject_train.txt")
names(SubjectTrain) <- "Subject"

XTrain <- read.table("./train/X_train.txt")
names(XTrain) <- Features$Function

YTrain <- read.table("./train/y_train.txt")
names(YTrain) <- "Label"

#I)Binding TRAIN and TEST data
X <- rbind(XTrain, XTest)
Y <- rbind(YTrain, YTest)
Subject <- rbind(SubjectTrain, SubjectTest)
Data <- cbind(Subject, Y, X)

#II)Extracting only the measurements on the mean and standard deviation for each measurement.
Data <- Data[, grep("Subject|Label|mean\\(\\)|std\\(\\)", names(Data))]

#III)Uses descriptive activity names to name the activities in the data set.
Data$Label <- ActivityLabels[Data$Label, 2]
names(Data)[2] <- "Activity"

#IV)Appropriately label the data set with descriptive variable names.(Setting variable names to 
#   non-abbreviated form and lower case for convenience)

names(Data) <- gsub("tBody", "timebody", names(Data))
names(Data) <- gsub("tGravity", "timegravity", names(Data))
names(Data) <- gsub("fBody", "frequencybody", names(Data))
names(Data) <- gsub("[Bb]ody[Bb]ody", "body", names(Data))
names(Data) <- gsub("Mag", "magnitude", names(Data))
names(Data) <- gsub("Gyro", "gyroscope", names(Data))
names(Data) <- gsub("Acc", "accelerometer", names(Data))
names(Data) <- gsub("-", "", names(Data))
names(Data) <- gsub("\\(\\)", "", names(Data))
names(Data) <- tolower(names(Data))

#V)From the data set in step 4, create a second, independent tidy data set with 
#   the average of each variable for each activity and each subject.
TidyDataset <- data.table(Data)
TidyDataset <- TidyDataset[order(TidyDataset$subject), ]
TidyDataset <- TidyDataset[, lapply(.SD, mean), by='subject,activity']
write.table(TidyDataset, "TidyDataset.txt", row.names = FALSE)

