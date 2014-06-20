# 0. Reading dataset
# ===========================================================================================
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",destfile="./Getting and Cleaning Data/accelerometers.zip",method="curl")

# 1. Merges the training and the test sets to create one data set.
# ===========================================================================================
Xtest <- read.table("./Getting and Cleaning Data/UCI HAR Dataset/test/X_test.txt",sep="")
features <- read.table("./Getting and Cleaning Data/UCI HAR Dataset/features.txt",sep="",stringsAsFactors=FALSE)
for(i in 1:ncol(Xtest)){
	colnames(Xtest)[i] <- features[i,2]
}
subject_test <- read.table("./Getting and Cleaning Data/UCI HAR Dataset/test/subject_test.txt",sep="")
ytest <- read.table("./Getting and Cleaning Data/UCI HAR Dataset/test/y_test.txt",sep="")
TEST <- cbind(subject_test,ytest)
TEST <- cbind(TEST,Xtest)
colnames(TEST)[1] <- "Subject"
colnames(TEST)[2] <- "Activity"
Xtrain <- read.table("./Getting and Cleaning Data/UCI HAR Dataset/train/X_train.txt",sep="")
for(i in 1:ncol(Xtrain)){
	colnames(Xtrain)[i] <- features[i,2]
}
subject_train <- read.table("./Getting and Cleaning Data/UCI HAR Dataset/train/subject_train.txt",sep="")
ytrain <- read.table("./Getting and Cleaning Data/UCI HAR Dataset/train/y_train.txt",sep="")
TRAIN <- cbind(subject_train,ytrain)
TRAIN <- cbind(TRAIN,Xtrain)
colnames(TRAIN)[1] <- "Subject"
colnames(TRAIN)[2] <- "Activity"
project <- rbind(TEST,TRAIN)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# ===========================================================================================
relevant <- sort(c(grep("mean()",colnames(project)),grep("std()",colnames(project))))
project <- project[,c(1,2,relevant)]
project <- project[,-grep("meanFreq()",colnames(project))]

# 3. Uses descriptive activity names to name the activities in the data set.
# ===========================================================================================
activity_labels <- read.table("./Getting and Cleaning Data/UCI HAR Dataset/activity_labels.txt",sep="")
project$Activity <- ifelse(project$Activity==activity_labels$V1[1],as.character(activity_labels$V2[1]),ifelse(project$Activity==activity_labels$V1[2],as.character(activity_labels$V2[2]),ifelse(project$Activity==activity_labels$V1[3],as.character(activity_labels$V2[3]),ifelse(project$Activity==activity_labels$V1[4],as.character(activity_labels$V2[4]),ifelse(project$Activity==activity_labels$V1[5],as.character(activity_labels$V2[5]),as.character(activity_labels$V2[6]))))))

# 4. Appropriately labels the data set with descriptive variable names.
# ===========================================================================================
colnames(project) <- gsub("Acc","Acceleration",colnames(project))
colnames(project) <- gsub("Gyro","Gyroscope",colnames(project))
colnames(project) <- gsub("[()]","",colnames(project))
colnames(project) <- gsub("Mag","Magnitude",colnames(project))

# Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
# ===========================================================================================
l.project <- split(project,project$Subject)
tidy.data <- vector()
for(i in 1:length(l.project)){
	l.subject.activity <- split(l.project[[i]],l.project[[i]][,"Activity"])
	for(j in 1:length(l.subject.activity)){
		Avgs <- colMeans(l.subject.activity[[j]][,3:ncol(l.subject.activity[[j]])])
		sub.subject <- as.vector(c(i,unique(l.subject.activity[[j]][,2]),Avgs))
		tidy.data <- rbind(tidy.data,sub.subject)
	}
}
tidy.data <- as.data.frame(tidy.data,stringsAsFactors=FALSE)
rownames(tidy.data) <- NULL
tidy.data[,3:ncol(tidy.data)] <- apply(tidy.data[3:ncol(tidy.data)],2,as.numeric)
tidy.data[,1] <- as.integer(tidy.data[,1])
str(tidy.data)
colnames(tidy.data) <- colnames(project)
save(tidy.data,file="./Getting and Cleaning Data/Tidy Data Set.RData")