GCD-Course-Project
==================

Course Project for Coursera Online Course Getting and Cleaning Data.

Objective: "[...] You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected"

1. Import X_test.txt file.
2. Import feature.txt file.
3. Take names from feature.txt file and assign them to columns in X_test.txt file. Used loop to do this step.
4. Import subject_test.txt and y_test files. Merge them using the cbind function. Assign variable names: "Subject" and "Activity". Create a data frame called "TEST"
5. Merge X_test.txt and "TEST using cbind.
6. Repeat steps with "train" data sets.
7. Merge TEST and TRAIN objects using rbind function.
8. Filter variable using grep function. Pattern searched was "mean" and "std".
9. Replace "Activity" numbers by "Activity" names using the ifelse function. This will iterate through out the "Activity" column searching for matches with activity_labels.txt file.
10. Change varaible names using gsub function.
11. Create a list where objects within the list are data frames for each individual.
12. To each individual in the list, create another list by each activity commited in the experiment (a list of length 6).
13. Calculate mean for each column in each activity list within each individual. Create a vector with results.
14. Get subject's number (1 to 30). 
15. Create a vector with subject's number, activity and average of each column.
16. Merge all subjects using rbind function. Result: Tidy Data Set
17. Change class of each variable. 
18. Save Tidy Data Set into an RData object.
