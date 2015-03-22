## load dplyr package
library(dplyr)
## Read Train Attributes File
setwd("C:/coursera/getting_cleaning_data/data/UCI HAR Dataset/")
Xtrain <- read.table("train/X_train.txt", sep = "")
## Read Train Attributed Data Labels
temp <- read.table("features.txt", sep = "")
attributeNames <- temp$V2
## Rename column names for train attributes dataset
names(Xtrain) <- attributeNames
## Read train data activity file
Ytrain = read.table("train/y_train.txt", sep = "")
## Rename the train activity data column
names(Ytrain) <- "Activity"
## Convert Activity variable as factor variable
Ytrain$Activity = as.factor(Ytrain$Activity)
## Read Activity labels file
activityLabels <- read.table("activity_labels.txt")
## Convert activity codes to description
levels(Ytrain$Activity) <- activityLabels$V2
## Read Train dataset subject file
trainSubjects = read.table("train/subject_train.txt", sep = "")
## Rename Train subject dataset column
names(trainSubjects) = "Subject"
## Convert Subject column as factor variable
trainSubjects$Subject = as.factor(trainSubjects$Subject)
## Create train dataset
train = cbind(Xtrain, trainSubjects, Ytrain)


## Reading Test Files

## Read test data file 
Xtest <- read.table("test/X_test.txt", sep = "")
## Rename the columns of the test dataset
names(Xtest) <- attributeNames
## Read test activity file
Ytest = read.table("test/y_test.txt", sep = "")
## Rename the columns of the test activity dataset
names(Ytest) <- "Activity"
## Convert Activity variable as factor variable
Ytest$Activity <- as.factor(Ytest$Activity)
## Convert activity codes to description
levels(Ytest$Activity) <- activityLabels$V2
## Read test subject file
testSubjects <- read.table("test/subject_test.txt", sep = "")
## Rename Test subject dataset column
names(testSubjects) <- "Subject"
## Convert Subject column as factor variable
testSubjects$Subject <- as.factor(testSubjects$Subject)
## create test dataset
test <- cbind(Xtest, testSubjects, Ytest)

## Combine test & train datasets
merged_data<-rbind(test,train)

## Select only mean & std column

mean_sd_data<-merged_data[,c(grep("\\mean",names(merged_data)),grep("\\Std",names(merged_data)),562,563)]

## Calculate mean of all the mean & std columns by Activity & Subject
avg_mean_sd_data <- group_by(mean_sd_data, Activity,Subject) %>% summarise_each(funs(mean))
## Write final dataset to flat file
write.table(avg_mean_sd_data,"C:/coursera/getting_cleaning_data/project/get_clean_data_assignment.txt",row.names=FALSE)







