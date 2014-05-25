
##Step 1 - read in and name each of the data sets that will be manipulated

x_test <- read.table("x_test.txt")
y_train <- read.table("y_train.txt")
x_train <- read.table("x_train.txt")
y_test <- read.table("y_test.txt")
features <- read.table("features.txt")
subject_train <- read.table("subject_train.txt")
subject_test <- read.table("subject_test.txt")
activity_labels <- read.table("activity_labels.txt")

##Combine the x_train and x_test data

x_combined <- rbind(x_train,x_test)

##Create a vector containing the "feature" column names

featureNames <- as.vector(features[,2])
colnames(x_combined) <- featureNames

##Combine and name the subject variable (train then test) 

subject_combined <- rbind(subject_train,subject_test)
colnames(subject_combined) <- "Subject"

##Add the subject variable to x_combined

x_combined <- cbind(x_combined,subject_combined)

##Combine and name the activity (train then test) variable 

activity_combined <- rbind(y_train, y_test)
colnames(activity_combined) <- "Activity"

##Add the activity variable to x_combined

x_combined <- cbind(x_combined,activity_combined)



##Step 2 - Extract Mean and Standard Deviation Variables

##Selected only the mean() and std() varaibles, since meanFreq() and the 
##means associated with the angle variables (e.g., gravityMean) are transformations 
##of other values, and the question asks for means of measuremens only.

##The first step is to create an indices for the columns containing mean() or std()
mean_index <- grep("mean()",colnames(x_combined),fixed=T)
std_index <- grep("std()",colnames(x_combined),fixed=T)
cindex <- c(mean_index, std_index)
cindex <- sort(cindex)

##Sdd Subject and Activity into to the cindex object so they are retained
cindex <- c(cindex,562,563)

##Create a new object that only contains the indexed data
stdmeanonly <- x_combined[,cindex]



##Step 3 - Clean and reformat the labels

##First, remove non-standard characters
colnames(stdmeanonly) <- gsub("()", "", colnames(stdmeanonly), fixed=T)
colnames(stdmeanonly) <- gsub("-", "", colnames(stdmeanonly), fixed=T)

##Then, expand abbreviations to be more human-readable
colnames(stdmeanonly) <- gsub("Mag", "Magnitude", colnames(stdmeanonly), fixed=T)
colnames(stdmeanonly) <- gsub("Acc", "Accel", colnames(stdmeanonly), fixed=T)

##Finally, capitalize "mean" and "std" to separate words in variable names
colnames(stdmeanonly) <- gsub("mean", "Mean", colnames(stdmeanonly), fixed=T)
colnames(stdmeanonly) <- gsub("std", "Std", colnames(stdmeanonly), fixed=T)



##Step 4 - Aggregate and create a tidy data set

##Group by activity and subject
datasummary <- aggregate(stdmeanonly, by=list(stdmeanonly$Subject,stdmeanonly$Activity), FUN=mean)

##Remove the "Group" columns

datasummary <- datasummary[,3:(ncol(datasummary))]



##Step 5 - Replace the activity codes with the activity names in "activity_labels.txt"

##Convert the Activity column to factors
datasummary[,68] <- factor(datasummary[,68])

##Apply the levels in activity_labels 
levels(datasummary[,68]) <- activity_labels[,2]

##Write the output file to "summary.txt"
write.table(datasummary, "summary.txt")









