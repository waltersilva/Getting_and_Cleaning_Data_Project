# Project for Getting and Cleaning Data

traindata1 <- read.table("train/X_train.txt")
testdata1 <- read.table("test/X_test.txt")
x1 <- rbind(traindata1, testdata1)
traindata2 <- read.table("train/subject_train.txt")
testdata2 <- read.table("test/subject_test.txt")
x2 <- rbind(traindata2, testdata2)
traindata3 <- read.table("train/y_train.txt")
testdata3 <- read.table("test/y_test.txt")
x3 <- rbind(traindata3, testdata3)

features <- read.table("features.txt")
indices_of_good_features <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
x1 <- x1[, indices_of_good_features]
names(x1) <- features[indices_of_good_features, 2]
names(x1) <- gsub("\\(|\\)", "", names(x1))
names(x1) <- tolower(names(x1)) 

activities <- read.table("activity_labels.txt")
activities[, 2] = gsub("_", "", tolower(as.character(activities[, 2])))
x3[,1] = activities[x3[,1], 2]
names(x3) <- "activity"

names(x2) <- "subject"
cleaned <- cbind(x2, x3, x1)
write.table(cleaned, "merged_clean_data.txt")

uniqsub = unique(x2)[,1]
numsub = length(unique(x2)[,1])
numact = length(activities[,1])
numCols = dim(cleaned)[2]
result = cleaned[1:(numsub*numact), ]

nrow = 1
for (i in 1:numsub) {
	for (a in 1:numact) {
		result[nrow, 1] = uniqsub[i]
		result[nrow, 2] = activities[a, 2]
		tmp <- cleaned[cleaned$subject==i & cleaned$activity==activities[a, 2], ]
		result[nrow, 3:numCols] <- colMeans(tmp[, 3:numCols])
		nrow = nrow+1
	}
}
write.table(result, "data_set_with_the_averages.txt")
