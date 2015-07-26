---
title: "README"
author: "William de Souza"
date: "Sunday, July 26, 2015"
output: html_document
---



**About that work: **

This work comprises of five phase, each phase with well-defined steps, as follow:

**PHASE 1 - ADDRESS TRAIN DATA**

Objective: Prepare train data for the merge process

STEP 1.1 - Obtaining data from train dataset.

Objective: Load the TXT files in R data structures. In this case "tables".
  
STEP 1.2 - Processing data x_train file

Objective: Compute the Mean and the Standard Deviation from the x_train table and store the result in the matrix x_train_mat. This step will reduce the dimension of the x_train table, making it easy for the merge process.
   
STEP 1.3 - Binding the tables and naming their columns
   
Objective: Bind the tables in a new matrix mat_train and name their columns according to the names defined in the dataset readme file and in the objective of the project.
  
**PHASE 2 - ADDRESS TEST DATA**

Objective: Prepare test data for the merge process

STEP 2.1 - Obtaining data from test dataset.

Objective: Load the TXT files in R data structures. In this case "tables".
  
STEP 2.2 - Processing data x_test file

Objective: Compute the Mean and the Standard Deviation from the x_test table and store the result in the matrix x_test_mat. This step will reduce the dimension of the x_test table, making it easy for the merge process.
  
STEP 2.3 - Binding the tables and naming their columns

Objective: Bind the tables in a new matrix mat_train and name their columns according to the names defined in the dataset readme file and in the objective of the project.


**PHASE 3 - MERGE TRAIN & TEST DATA**

Objective: Merge the preprocessed train & test data. The default merge process was chosen because both datasets have the same columns and since we are focusing in the subject in this project, the observation are not repeated in the datasets: the subjects in the train and in the test datasets are differents.

  
**PHASE 4 - PROVIDE DESCRIPTIVE ACTIVITY NAMES**

Objective: Name the activities in the dataset with descriptive activity names.
  
STEP 4.1 - Creating the vector with the descriptive names

Objective: Create a vector with the descriptive names from the readme file.

STEP 4.2 - Changing the numbers for names

Objective: Change the numbers for their respectives activities names
  

**PHASE 5 - CREATE THE NEW INDEPENDENT TIDY DATASET**

Objective: Create a new independent tidy dataset from the previous one, containing the average of each variable for each activity and each subject.
  
STEP 5.1 - Preparing the dataset

Objective: Create a R data structure with the new requirements. We are using the default melt function, since just three columns are required to the project.
    
STEP 5.2 - Writing to the file

Objective: Write the new independent tidy dataset to the TXT file


**Thank you! Enjoy the code! :)**
