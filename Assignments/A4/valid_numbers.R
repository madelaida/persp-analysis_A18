library(tidyverse)
library(readxl)
library(httr)
library(jsonlite)

#I run the algorth of phones alidation written by my classmate smiklin validphones.R, 
# that was in the Issue "Filter out invalid phone numbers #22" of the class main repository
# only one of the numbers on my area code was invalid. 

    # import data
  numbers <- read_excel("C:/Users/USER/Uchicago/Perspectives on Computational Analysis Fall 2018/PS4/PhoneSurvey.xlsx", 
                          skip = 2)  
    # set code
    code <- '801'
    
    # add code to the phone numbers and create valid column
    numbers <- numbers %>%
      mutate(`Phone number` = paste(`code`,as.character(`Phone number`), sep ="")) %>%
      mutate(valid = FALSE, `line type` = "")
    
    
    # use API to verify each number
    
    base.url <- "http://apilayer.net/api/validate"
    key <- "515d5bd2799a8cfb4eb5f6e6c1691a7d"
    phone.no <- "8014310454"
    
    valid <- GET(url = paste(base.url,"?access_key=",key,"&number=",phone.no,"&country_code=US&format=1", sep=""))
    
    
    # create validtest function
    valid.test <- function(phone.no){
      base.url <- "http://apilayer.net/api/validate"
      key <- "515d5bd2799a8cfb4eb5f6e6c1691a7d"
      info <- GET(url = paste(base.url,"?access_key=",key,"&number=",phone.no,"&country_code=US&format=1", sep=""))
      info_content <- content(info)
      return(info_content)
    }
    
    # call valid test function for each number and add values into df
    # I decided to record the line type as well, out of curiosity
    
    for (i in seq_along(numbers$`Phone number`)) {
      API.info <- valid.test(numbers$`Phone number`[i])
      numbers$valid[i] <- API.info$valid
      if (length(API.info$line_type) > 0 ){
        numbers$`line type`[i] <- API.info$line_type
      }
    }
    
    # save the data as csv. You can opt to save as xlsx using the xlsx library
    write_excel_csv(numbers, "ValidatedPhones.csv")
    