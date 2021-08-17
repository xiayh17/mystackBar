rectData <- function(data) {
  data_rect <- data %>%
    dplyr::select(orig.ident,company,group,pID,cancerType) %>%
    distinct()
  
  colnames(data_rect) <- c("Sample","Company","Group","Patient","CancerType")
  
  return(data_rect)
}

