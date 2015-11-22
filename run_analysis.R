# Checking whether required packages exist, and installing them if not.
if (!"dplyr" %in% installed.packages()) install.packages(dplyr)
if (!"R.utils" %in% installed.packages()) install.packages(R.utils)

# Loading the relevant packages into our workspace.
library(dplyr)
library(R.utils)

# Downloading the data set and changing the working directory.
if (!file.exists("UCI HAR Dataset")) {
        fileUrl = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        destfile = "dataset.zip"
        download.file(fileUrl, destfile)
        unzip(destfile)
}
setwd("UCI HAR Dataset")

# Reading all the requisite local data and loading them into the appropriate variables.
features <- read.table("features.txt")[,2]
X_train <- read.table("train/X_train.txt", col.names=features)
y_train <- read.table("train/y_train.txt", col.names="activity")
subject_train <- read.table("train/subject_train.txt", col.names="subject")
X_test <- read.table("test/X_test.txt", col.names=features)
y_test <- read.table("test/y_test.txt", col.names="activity")
subject_test <- read.table("test/subject_test.txt", col.names="subject")
activities <- as.character(read.table("activity_labels.txt")[,2])

# Combining the training and test data sets into a single data set.
X <- rbind(X_train, X_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)
dataComplete <- cbind(subject, y, X)

# Pruning out the irrelevant columns which do not deal with means or std. deviations.
relevantnames <- names(dataComplete)[-(1:2)]
nameprune1 <- relevantnames[grepl("mean|std", relevantnames)]

# Also pruning out the meanFreq observations on a second pass-through
# as it is entirely distinct from the mean. See the downloaded file 'features_info.txt' 
# in the UCI HAR dataset directory for more info.
nameprune2 <- c("subject", "activity", nameprune1[!grepl("meanFreq", nameprune1)])

# The pruned data 
prunedData <- dataComplete[nameprune2]

# Replacing the activity number with the corresponding activity in words.
activities <- tolower(activities)
activities <- sub("_", " ", activities)
activities <- capitalize(activities)
prunedData[,2] <- sapply(prunedData[,2], function(i) activities[i])

# Cleaning up a few of the variable names.
# First, delineating the  Time and Frequency observations. 
names(prunedData) <- sub("^t", "Time_", names(prunedData))
names(prunedData) <- sub("^f", "Freq_", names(prunedData))

# Identfying the x- ,y-, z- axes for the triaxial observations.
names(prunedData) <- sub("X$", "_xAxis", names(prunedData))
names(prunedData) <- sub("Y$", "_yAxis", names(prunedData))
names(prunedData) <- sub("Z$", "_zAxis", names(prunedData))

# Raising the profile of the mean and std. deviation observations.
names(prunedData) <- sub("mean", "_MEAN", names(prunedData))
names(prunedData) <- sub("std", "_STD", names(prunedData))

# Getting rid of a few unwanted dots and some repetition in the variable names.
names(prunedData) <- sub("\\.\\.\\.", "", names(prunedData))
names(prunedData) <- sub("\\.\\.", "", names(prunedData))
names(prunedData) <- sub("\\.", "", names(prunedData))
names(prunedData) <- sub("BodyBody", "Body", names(prunedData))

# Using the dplyr chaining operator to summarise the means of the relevant observations
# grouped by subject and activity into a (long form) tidy dataset.
tidyData <- prunedData %>%
                group_by(subject, activity) %>%
                        summarise_each(funs(mean))

#Returning to the original working diretory.
setwd("..")

# Writing the tidy dataset to a file.
write.table(tidyData, file="tidyData.txt", row.names=FALSE)