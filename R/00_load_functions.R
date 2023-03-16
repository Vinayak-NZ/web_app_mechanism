flattenCorrMatrix <- function(cormat, pmat, nmat) {
  ut <- upper.tri(cormat)
  data.frame(
    row = rownames(cormat)[row(cormat)[ut]],
    column = rownames(cormat)[col(cormat)[ut]],
    cor  =(cormat)[ut],
    p = pmat[ut], 
    n = nmat[ut]
  )
}

flattenDemTable <- function(variable, numbers, percentage, missing) {
  
  table_numbers <- as.data.frame(numbers)
  names(table_numbers)[names(table_numbers) == "Var1"] <- variable
  names(table_numbers)[names(table_numbers) == "Freq"] <- "numbers"
  
  table_prop <- as.data.frame(percentage)
  names(table_prop)[names(table_prop) == "Var1"] <- variable
  names(table_prop)[names(table_prop) == "Freq"] <- "percentage"
  
  table_summary <- merge(table_numbers, table_prop)
  table_summary$missing <- missing 
  
  return(table_summary)
    
}


