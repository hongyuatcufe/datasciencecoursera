## Download and unzip the data

### Download dataset

download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip',destfile = 'dataset.zip',method = 'curl')


### Unzip dataset

unzip('dataset.zip')

## Merge dataset

library(data.table)
testx=fread('UCI HAR Dataset/test/X_test.txt')
trainx=fread('UCI HAR Dataset/train/X_train.txt')
testy=fread('UCI HAR Dataset/test/y_test.txt')
trainy=fread('UCI HAR Dataset/train/y_train.txt')
test_subj=fread('UCI HAR Dataset/test/subject_test.txt')
train_subj=fread('UCI HAR Dataset/train/subject_train.txt')
### combine test and train dataset seperately
test=cbind(testx,testy,test_subj)
train=cbind(trainx,trainy,train_subj)

### import variable names from features.txt and reaname the datasets
varnames=fread('UCI HAR Dataset/features.txt')[[2]]
names(test)=c(varnames,'activity','subject')
names(train)=c(varnames,'activity','subject')
test[['group']]='test'
train[['group']]='train'
### combine test and train datasets into one dataframe
merged_df=rbind(test,train)

## Extract the mean and std variables

library(dplyr)
keep=grep('(mean|std)\\(',varnames,value=T)
keep=c(keep,'group','activity','subject')
extracted_df=merged_df[,..keep]

## rename variable names and activity value label

### rename activity value
extracted_df$activity=factor(
  recode(extracted_df$activity,
         `1`='WALKING',
         `2`='WALKING_UPSTAIRS',
         `3`='WALKING_DOWNSTAIRS',
         `4`='SITTING',
         `5`='STANDING',
         `6`='LAYING'),
  levels = c('WALKING','WALKING_UPSTAIRS','WALKING_DOWNSTAIRS','SITTING','STANDING','LAYING'))

### rename variable name
#### eliminate all '()'
new_names=gsub('\\(|\\)','',names(extracted_df))
#### change 't' and 'f' to 'time' and 'freq'
new_names=sub('^t','time_',new_names)
new_names=sub('^f','freq_',new_names)
#### change all '-' to '_' 
new_names=gsub('-','_',new_names)
#### change 'BodyBody' to 'Body'
new_names=gsub('BodyBody','Body',new_names)
#### insert '_' before all uppercase characters
new_names=gsub('([A-Z])','_\\1',new_names)
#### change '__' to '_'
new_names=gsub('__','_',new_names)
### chanage all character to lowercase
new_names=tolower(new_names)
names(extracted_df)=new_names
names(extracted_df)
head(extracted_df,5)
write.csv(extracted_df,'data.csv')

## creates a second, independent tidy data set with the average of each variable for each activity and each subject.

extracted_mean_df=extracted_df %>% 
  group_by(activity,subject) %>% 
  summarise_all(function(x) mean(x,na.rm=T))

head(extracted_mean_df,5)
write.csv(extracted_mean_df,'data_mean.csv')
write.table(extracted_mean_df,'final_data.txt',row.name=FALSE)