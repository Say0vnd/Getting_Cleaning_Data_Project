# Getting_Cleaning_Data_Project
COde run_analysis.R reads Test & Train raw files.
It combines both Test & Train files to create Test & Train data frames. 
It combines both Test & Train data frames using Rbind. 
It then creates a subset of above data frame by selecting on Activity, Subject & Mean/Std columns
It then creates a tidy data frame by taking average of all the mean & std columns by Activity & Subject
It prints the final data frame to get_clean_data_assignment.txt
