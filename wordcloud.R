##To load multiple documents into a single document
#To load the required packages

install.packages("tm")
library(tm)

install.packages("wordcloud")
library(wordcloud)

install.packages("stringr")
library(stringr)

install.packages("gsubfn")
library(gsubfn)

install.packages("stopwords")
library(stopwords)

files=setwd("C:/Users/Krishnan/Desktop/textmining")
filelist=list.files(path=files)

paste(files,"\\",filelist)

#To remove the unwanted files from the list
filelist=list.files(path = files,pattern = "*.txt")
filelist

#To get the data type of the file list
str(filelist)

#To apply the function
lapply(filelist,FUN=readLines)

a=lapply(filelist,FUN=readLines)

#To collapse all the elements in the list in to one element
lapply(a,FUN=paste,collapse=" ")

corpus=lapply(a,FUN = paste,collapse=" ")

#TO PERFORM TRANSFORMATIONS
#To clean the data like punctuation's using G-sub
corpus2=gsubfn(pattern="\\W",replace=" ",corpus)
corpus2

#To clean the data removing digits
corpus2=gsubfn(pattern = "\\d",replace=" ",corpus2)
corpus2

#To lowercase the letters to remove stop words
corpus3=tolower(corpus2)
corpus3

#To remove STOP words
corpus3=removeWords(corpus3,stopwords("english"))

#To remove the remaining apostrophe's
corpus3=gsubfn(pattern = "\\b[A-z]\\b{1}",replace=" ",corpus3)

#To remove the white spaces
corpus4=stripWhitespace(corpus3)
corpus4

#To build a WordCloud
wordcloud(corpus4)
corpus4

#To reorder the most frequent words in order
wordcloud(corpus2,random.order=FALSE)

#To colour the wordcloud
wordcloud(corpus2,random.order=FALSE,colors = rainbow(3))

#To segregrate the words in wordcloud as per the documents
comparison.cloud(corpus2)
