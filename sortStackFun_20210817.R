library(dplyr)

setClass(Class="sortData",
         representation(
           data = "data.frame",
           sort.type="character",
           sample.order="character"
         )
)

sortStack <- function(data, sample, type) {
  
  sample <- enquo(sample)
  type <- enquo(type)
  
  data_c <- data %>% 
    dplyr::group_by( !!sample ) %>% 
    dplyr::count(!!type) %>% 
    dplyr::mutate( percent = n / sum(n) )
  
  sort.type <- data_c %>%
    count(!!type, wt = n) %>%
    arrange(desc(n)) %>%
    pull(!!type) %>%
    unique()
  
  sample.order <- data_c %>%
    filter(!!type == sort.type[1]) %>%
    group_by(!!sample) %>%
    mutate(sum = sum(percent)) %>%
    arrange(desc(sum)) %>%
    pull(!!sample) %>%
    unique()
  
  res <- data_c %>%
    mutate(!!sample := factor(!!sample, levels = sample.order)) %>%
    mutate(!!type := factor(!!type, levels = rev(sort.type)))

  return(new("sortData",
             data = res,
             sort.type = sort.type,
             sample.order = sample.order))
}

# test <- sortStack(phe, orig.ident, celltype)
# 
# colors = c('#8dd3c7','#ffffb3','#bebada','#fb8072','#80b1d3','#fdb462','#b3de69')
# name = test@sort.type
# names(colors) <- name
# 


