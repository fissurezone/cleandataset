#
# Generates `tidy_data.txt` from source data provided by :-
#
# Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz.
# A Public Domain Dataset for Human Activity Recognition Using Smartphones.
# 21th European Symposium on Artificial Neural Networks,
# Computational Intelligence and Machine Learning,
# ESANN 2013. Bruges, Belgium 24-26 April 2013
#
# It is fully described at:
#
# "UCI Mahine Learning Repository - Human Activity Recognition Using Smartphones Data Set"
# https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#

library(dplyr)

# download zip file containing data if it hasn't already been downloaded
# zipfile unpacks a directory named "UCI HAR Dataset"
datadir <- "UCI HAR Dataset"
if (!file.exists(datadir)) {
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
                "uci_har.zip", mode = "wb")
  unzip("uci_har.zip")
}


# takes an activity label (underscore separated string) and returns the title case form
clean_activity_label <- function(label) {
  paste(lapply(strsplit(label, "_"), all_caps_to_title_case), sep=" ")
}
all_caps_to_title_case <- function(s) {
  paste(toupper(substring(s, 1,1)), tolower(substring(s, 2)), sep="", collapse=" ")
}

# read activity labels and measurement features
activityLabels <- read.table(file.path(datadir, "activity_labels.txt"), as.is=TRUE)
colnames(activityLabels) <- c("activityId", "activity")

features <- read.table(file.path(datadir, "features.txt"), as.is = TRUE)
colnames(features) <- c("featureId", "feature")

# Clean up activity labels
activityLabels$activity <- sapply(activityLabels$activity, clean_activity_label)
activityLabels$activity <- as.factor(activityLabels$activity)

# Clean up feature names (to be used as column names of test and training data)
featureNames <- features[,2]
# fix double typo
featureNames <- gsub("BodyBody", "Body", featureNames)

# Read training and test data files
# Arguments:-
# type: "test" OR "train"
#
# 3 Files must exist for given type:
# subject_<type>.txt, y_<type>.txt, x_<type>.txt
#
# Returns single, well-annotated dataframe bound by rows of each data file
read_data <- function(type) {
  # read measurement subjects
  subjects <- read.table(file.path(datadir, type, sprintf("subject_%s.txt", type)))
  colnames(subjects) <- c("subjectId")
  
  # read measurement activities
  activity <- read.table(file.path(datadir, type, sprintf("y_%s.txt", type)))
  colnames(activity) <- c("activityId")
  
  # join with activity labels (implicitly over `activityId`)
  activity <- inner_join(activity, activityLabels)
  
  # read measurement values
  values <- read.table(file.path(datadir, type, sprintf("X_%s.txt", type)))
  # set colnames from cleaned up featureNames
  colnames(values) <- featureNames

  # merge subjects to the activities and values
  data <- bind_cols(subjects, activity, values)
  
  return(data)
}

# read and merge all subjects into one dataframe
data <- bind_rows(read_data("train"), read_data("test"))

# convert subjectId to factor
data$subjectId <- factor(data$subjectId)

# pick out just the mean and standard deviation values
measurements <- featureNames[grepl("(mean|std)\\(\\)", featureNames)]
data <- data[, names(data) %in% c("subjectId", "activity", measurements)]

# clean up measurement names
colnames(data) <- gsub("^f", "Frequency Domain ", colnames(data))
colnames(data) <- gsub("^t", "Time Domain ", colnames(data))
colnames(data) <- gsub("Acc", " Accelerometer", colnames(data))
colnames(data) <- gsub("Gyro", " Gyroscope", colnames(data))
colnames(data) <- gsub("Mag", " Magnitude", colnames(data))
colnames(data) <- gsub("([XYZ])$", " \\1 Axis", colnames(data))
colnames(data) <- gsub("mean(.+)", "\\1 Mean", colnames(data))
colnames(data) <- gsub("std(.+)", "\\1 Standard Deviation", colnames(data))
colnames(data) <- gsub("[\\(\\)-]", "", colnames(data))

# group by subject and activity and summarise using mean
tidyData <- data %>% group_by(subjectId, activity) %>% summarise_all(funs(mean))

# write to "tidy_data.txt"
write.table(tidyData, "tidy_data.txt", row.names = FALSE, quote = FALSE)
