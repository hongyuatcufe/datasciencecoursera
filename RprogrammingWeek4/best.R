best <- function(state, outcome) {
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  data <- data[,c(2,7,11,17,23)]
  name <- c('hispitol',"state","heart attack","heart failure","pneumonia")
  if (!state %in% unique(data[,2])) {
    stop("invalid state")
  }
  if (!outcome %in% name[3:5]) {
    stop("invalid outcome")
  }
  selected_data <- data[,c(1,2,which(name==outcome))]
  selected_data[,3]<-suppressWarnings(as.numeric(selected_data[,3]))
  selected_data=selected_data[selected_data$State==state & !is.na(selected_data[,3]),]
  ordered_data=selected_data[order(selected_data[,3]),]
  ordered_data[1,1]
}