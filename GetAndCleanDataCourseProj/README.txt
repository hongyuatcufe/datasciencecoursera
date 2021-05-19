README

In this Project, I perform steps as blow:
1.use download.file to download samsung smartphone collected dataset as dataset.zip.
2.use unzip to unzip dataset.zip into the dir 'UCI HAR Dataset'
3.use fread(in data.table) to read test and train data in dir 'UCI HAR Dataset'
4.use rbind to join all data together and use grep to extract the variables whose name include 'mean' and 'std'
5.use recode to change the value of activities
6.use gsub to change variable name
7.use group_by and summarise_all to caculate mean of variables
8.use write.csv to export dataframe to csv file("data.csv","data_mean.csv")

The "run_analysis.R" include all script I used to merge, extract, caculate and export datasets(export as "data.csv" "data_mean.csv" and "final_data.txt") 
The "run_analysis.html" shows the results of script.
The "data_mean.csv"("final_data.txt") is a tidy data set with the average of each variable for each activity and each subject of "data.csv".
The "codebook.txt"" illustate info of variables in "data.csv".