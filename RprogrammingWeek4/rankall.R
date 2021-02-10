rankall <- function(outcome, num = "best") {
  source('rankhospital.R')
  temp_data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  states <- sort(unique(temp_data$State))
  result_df=data.frame(sapply(states,function(x) rankhospital(x,outcome,num)))
  result_df['state']=row.names(result_df)
  names(result_df)=c('hospital','state')
  result_df
}
