
      ##Reading Features and ActivityLabels vector
      Features <- read.table("features.txt", header = FALSE)[2]
      activity_labels <- read.table("activity_labels.txt", header = FALSE)
      
      ##Reading Sets
      X_test <- read.table("test/X_test.txt", header = FALSE)
      X_train <- read.table("train/X_train.txt", header = FALSE)
      X_merged <- rbind(X_test,X_train)        
      
      ##Reading Movement
      Y_test <- read.table("test/Y_test.txt", header = FALSE)
      Y_train <- read.table("train/Y_train.txt", header = FALSE)
      Y_merged <- rbind(Y_test, Y_train)
      
      ##Reading subject_id
      subject_test <- read.table("test/subject_test.txt", header = FALSE)
      subject_train <- read.table("train/subject_train.txt", header = FALSE)
      subject_merged <- rbind(subject_test, subject_train)
      
      ##Extracting columns which includes measurements
      names(X_merged) <- Features[ ,1]
      X_merged <- X_merged[ grepl("std|mean", names(X_merged), ignore.case = TRUE) ] 
      
      #Descriptive ActivityName analysis
      Y_merged <- merge(Y_merged, activity_labels, by.x = "V1", by.y = "V1")[2]
      X_merged <- cbind(subject_merged, Y_merged, X_merged)
      names(X_merged)[1:2] <- c("subject_id", "Activity_Labels")
      
      
      ##Tidying X_merged
      tidy_data <- group_by(X_merged, subject_id, Activity_Labels) %>%
            summarise_all(funs(mean))
      