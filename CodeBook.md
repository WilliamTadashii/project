---
title: "CodeBook"
author: "William de Souza"
date: "Sunday, July 26, 2015"
output: html_document
---

This document comprises of three sections. First one describes the variables used in the script. The second describes the data used and the third describes the transformations performed.

**1. VARIABLES**

1.1. A set of variables to receive the files from the train and test dataset:

```{r}
y_train
x_train
s_train
y_test
x_test
s_test
```

1.2. A variable to receive the number of lines in some file:

```{r}
  rows
```

1.3. Two variables to receive matrices with the x_train and x_test data table content:

```{r}
  x_train_mat
  x_test_mat
```

1.4. Two auxiliar variables to receive temporary data from matrices:

```{r}
  x_aux
  activity
```

1.5. Two variables to receive matrices the result of the bind operation, combining the files content:

```{r}
  mat_train
  mat_test
```

1.6. A variable to receive the merged datasets:

```{r}
merged_train_test
```

1.7. A variable to receive the descriptive activity names:

```{r}
descriptive_names
```

1.8. A variable to receive the new independent tidy dataset :

```{r}
tidy_data
```

**2. DATA**

2.1. Files with the data from the train and test datasets:

```{r}
y_train.txt
x_train.txt
subject_train.txt
y_test.txt
x_test.txt
subject_test.txt
```

**3. Transformations**

3.1. This transformation aims to reduce the dimension of the x_train and x_test table, making it easy for the merge process. First, it transform the data of one entire row in numeric. After, it computes the mean and the standard deviation. Both results are store in the same row, in two different columns:

```{r}
for(i in 1:rows){
    x_aux <- as.numeric(x_train[i,])
    x_train_mat[i,1] <- mean(x_aux, na.rm = FALSE)
    x_train_mat[i,2] <- sd(x_aux, na.rm = FALSE)
  }
  
for(i in 1:rows){
    x_aux <- as.numeric(x_test[i,])
    x_test_mat[i,1] <- mean(x_aux, na.rm = FALSE)
    x_test_mat[i,2] <- sd(x_aux, na.rm = FALSE)
  }
```

3.2. This transformation aims to create a matrix with the train and test datasets, considering the transformed x_train and x_test from the previous transformation:

```{r}
mat_train <- cbind(y_train, s_train, x_train_mat)

mat_test <- cbind(y_test, s_test, x_test_mat)
```

3.3. This transformation aims to give meaningful names to the columns of matrices:

```{r}
colnames(mat_train) <- c("Activity", "Subject", "Mean", "Standard Deviation")
  
colnames(mat_test) <- c("Activity", "Subject", "Mean", "Standard Deviation")
```

3.4. This transformation aims to merge the preprocessed train & test data. The default merge process was chosen because both datasets have the same columns and since we are focusing in the subject in this project, the observation are not repeated in the datasets: the subjects in the train and in the test datasets are differents:

```{r}

merged_train_test <- merge(mat_train, mat_test, all=TRUE)
 
```

3.5. This transformation aims to create a vector with the descriptive names. It aims to change the numbers of the activities for their respectives activities names:

```{r}

descriptive_names <- c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")

for(i in 1:rows){
    activity <- descriptive_names(merged_train_test[i,1])
    merged_train_test[i,1] <- activity
  }
  
```

3.6. This transformation aims to create a new independent tidy dataset from the previous one, containing the average of each variable for each activity and each subject. We are using the default melt function, since just three columns are required to the project:

```{r}

tidy_data <- melt(merged_train_test, id=c("Activity", "Subject", "Mean"))
  
```






