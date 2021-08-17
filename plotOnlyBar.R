library(ggplot2)
library(Cairo)

# download files  ---------------------------------------------------------

download.file("https://cdn.jsdelivr.net/gh/xiayh17/Figs@main/uPic/sortStackFun_20210817.R",
              "sortStackFun_20210817.R")
download.file("https://cdn.jsdelivr.net/gh/xiayh17/Figs@main/uPic/plot_bar_20210817.R",
              "plot_bar_20210817.R")
download.file("https://cdn.jsdelivr.net/gh/xiayh17/Figs@main/uPic/data_mini_20210817.Rdata",
              "data_mini_20210817.Rdata")

# load data and source function -------------------------------------------
load("data_mini_20210817.Rdata")
source("sortStackFun_20210817.R")
source("plot_bar_20210817.R")


# make data sorted --------------------------------------------------------
stack_data <- sortStack(data_mini, orig.ident, celltype)


# set color names ---------------------------------------------------------
colors = c('#8dd3c7','#ffffb3','#bebada','#fb8072','#80b1d3','#fdb462','#b3de69')
names(colors) = c('Tcells', 'epithelial', 'myeloid', 'Bcells', 'stromal', 'mast', 'unkown')
name = stack_data@sort.type
colors <- colors[order(match(names(colors),name))]

# plot  -------------------------------------------------------------------
p <- plot_bar(stack_data@data,colors)


# save in pdf -------------------------------------------------------------
Cairo(16000, 8000, file="plotOnlyBar.pdf", type="pdf", bg="white",dpi = 300,units = "px")
p
dev.off()
