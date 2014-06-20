Code Book:

Objective: [...] a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md.

Variables: 
  1. "Subject": Number of the individual tested.
  2. "Activity": Activity performed by each person (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
  3. Other variables: Represent the mean (mean) and standard deviation (std) of variables defined in the experiment. Variables starting with the letter "t" this one stands for "time", and those ones starting with the letter "f" this one stands for "frequency". To see more details, please refere to the link provided by the assignment and consult file: features_info.txt.

Data: 
  1.  The Tidy Data Set contains the average of each variable (mean and std for each of the variables considered) for each individual and in each of the activities commited by this one.

Transformations: 
  1. Import data set files (X_test, y_test, X_train, y_train).
  2. Assign column names using "features.txt" file.
  3. Merge data sets (Test and Train)
  4. Identify variables that represent measurements on the mean and standard deviation of each observation.
  5. Replace activity numbers by activity names using "activity_labels.txt" file.
  6. Change names to variables to make them self explanatory.
  7. Create tidy data set using loops and creating a new data frame.
