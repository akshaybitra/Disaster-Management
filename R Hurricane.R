# Milestone 1
#Data Acquisition
#Hurricane Disaster Management.
#-----------------------------
library(jsonlite)
library(curl)
download.file("https://www.dropbox.com/s/pytnxphfuhqv9pn/hurriane.csv?dl=0", "hurriane.csv")
write.csv(data, "hurriane.csv")


#Milestone 2
#Data Preprocessing
#-----------------------------
library(tidyr)
library(stringr)
library(foreign)
#-----------------------------
#Firstly the date and time are seperated using the Excel.
#Secondarily, The reqired fields are concatenated 
#Lastly, useless column is discarded. 

#Viewing the data for the ease to know what is happening. 

View(data)

#Removing unnecessary characters from Message Column
data$TWEET_TEXT <- gsub("@", " " , data$TWEET_TEXT)
data$TWEET_TEXT <- gsub("#", " " , data$TWEET_TEXT)
data$TWEET_TEXT <- gsub("(s?)(f|ht)tp(s?)://\\S+\\b", "", data$TWEET_TEXT)
data$TWEET_TEXT <- gsub("[[:punct:]]", " " , data$TWEET_TEXT)
data$TWEET_TEXT <- gsub("[0-9]", " " , data$TWEET_TEXT)
data$TWEET_TEXT <- gsub("\\ can ", " " , data$TWEET_TEXT)
data$TWEET_TEXT <- gsub("\\ to ", " " , data$TWEET_TEXT)
data$TWEET_TEXT <- gsub("\\ is ", " " , data$TWEET_TEXT)
data$TWEET_TEXT <- gsub("\\ the ", " " , data$TWEET_TEXT)
data$TWEET_TEXT <- gsub("\\ did ", " " , data$TWEET_TEXT)
data$TWEET_TEXT <- gsub("\\You ", " " , data$TWEET_TEXT)
data$TWEET_TEXT <- gsub("\\Your ", " " , data$TWEET_TEXT)
data$TWEET_TEXT <- gsub("\\The ", " " , data$TWEET_TEXT)
data$TWEET_TEXT <- tolower(data$TWEET_TEXT)

#Checking and Omitting the NA's
#checking for NA's
any(is.na(data))
#No. of NA's
sum(is.na(data))

