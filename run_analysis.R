ra <- function(){
  #########################################################################
  #                                                                       #
  # More information can be found in the files README.md and CodeBook.md  #
  #                                                                       #
  #########################################################################
  
  # PHASE 1 - ADDRESS TRAIN DATA
  # Objective: Prepare train data for the merge process
  
  # STEP 1.1 - Obtaining data from train dataset.
  # Objective: Load the TXT files in R data structures. In this case "tables".
  
  y_train <- read.table("./train/y_train.txt")
  x_train <- read.table("./train/x_train.txt")
  s_train <- read.table("./train/subject_train.txt")
  
  # STEP 1.2 - Processing data x_train file
  # Objective: Compute the Mean and the Standard Deviation from the x_train table and store the
  # result in the matrix x_train_mat. This step will reduce the dimension of the x_train 
  # table, making it easy for the merge process.
  
  rows <- nrow(x_train)
  x_train_mat <- matrix(nrow = rows, ncol = 2)
  
  for(i in 1:rows){
    x_aux <- as.numeric(x_train[i,])
    x_train_mat[i,1] <- mean(x_aux, na.rm = FALSE)
    x_train_mat[i,2] <- sd(x_aux, na.rm = FALSE)
  }
  
  # STEP 1.3 - Binding the tables and naming their columns
  # Objective: Bind the tables in a new matrix mat_train and name their columns according to
  # the names defined in the dataset readme file and in the objective of the project.
  
  mat_train <- cbind(y_train, s_train, x_train_mat)
  colnames(mat_train) <- c("Activity", "Subject", "Mean", "Standard Deviation")
  
  
  # PHASE 2 - ADDRESS TEST DATA
  # Objective: Prepare test data for the merge process
  
  # STEP 2.1 - Obtaining data from test dataset.
  # Objective: Load the TXT files in R data structures. In this case "tables".
  
  y_test <- read.table("./test/y_test.txt")
  x_test <- read.table("./test/x_test.txt")
  s_test <- read.table("./test/subject_test.txt")
  
  # STEP 2.2 - Processing data x_test file
  # Objective: Compute the Mean and the Standard Deviation from the x_test table and store the
  # result in the matrix x_test_mat. This step will reduce the dimension of the x_test 
  # table, making it easy for the merge process.
  
  rows <- nrow(x_test)
  x_test_mat <- matrix(nrow = rows, ncol = 2)
  
  for(i in 1:rows){
    x_aux <- as.numeric(x_test[i,])
    x_test_mat[i,1] <- mean(x_aux, na.rm = FALSE)
    x_test_mat[i,2] <- sd(x_aux, na.rm = FALSE)
  }
  
  # STEP 2.3 - Binding the tables and naming their columns
  # Objective: Bind the tables in a new matrix mat_train and name their columns according to
  # the names defined in the dataset readme file and in the objective of the project.
  
  mat_test <- cbind(y_test, s_test, x_test_mat)
  colnames(mat_test) <- c("Activity", "Subject", "Mean", "Standard Deviation")
    
  # PHASE 3 - MERGE TRAIN & TEST DATA
  # Objective: Merge the preprocessed train & test data. The default merge process was chosen
  # because both datasets have the same columns and since we are focusing in the subject in this 
  # project, the observation are not repeated in the datasets: the subjects in the train and 
  # in the test datasets are differents.
  
  merged_train_test <- merge(mat_train, mat_test, all=TRUE)
  
  # PHASE 4 - PROVIDE DESCRIPTIVE ACTIVITY NAMES
  # Objective: Name the activities in the dataset with descriptive activity names 
  
  # STEP 4.1 - Creating the vector with the descriptive names
  # Objective: Create a vector with the descriptive names from the readme file.

  descriptive_names <- c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")
  rows <- nrow(merged_train_test)
  
  # STEP 4.2 - Changing the numbers for names
  # Objective: Change the numbers for their respectives activities names
  
  for(i in 1:rows){
    # We really do not need this next line, but it makes the code clear and safe
    activity <- descriptive_names[merged_train_test[i,1]]
    merged_train_test[i,1] <- activity
  }
  
  # PHASE 5 - CREATE THE NEW INDEPENDENT TIDY DATASET
  # Objective: Create a new independent tidy dataset from the previous one, containing 
  # the average of each variable for each activity and each subject.
  
  # STEP 5.1 - Preparing the dataset
  # Objective: Create a R data structure with the new requirements. We are using the default melt
  # function, since just three columns are required to the project.
    
  tidy_data <- melt(merged_train_test, id=c("Activity", "Subject", "Mean"))

  # STEP 5.2 - Writing to the file
  # Objective: Write the new independent tidy dataset to the TXT file
  
  write.table(tidy_data, file = "./tidy_data.txt", row.name=FALSE)
  
}