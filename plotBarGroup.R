library(ggplot2)
library(dplyr)
library(aplot)


# download files ----------------------------------------------------------

download.file("https://cdn.jsdelivr.net/gh/xiayh17/Figs@main/uPic/data_mini2_20210817.Rdata",
              "data_mini2_20210817.Rdata")
download.file("https://cdn.jsdelivr.net/gh/xiayh17/Figs@main/uPic/sortStackFun_20210817.R",
              "sortStackFun_20210817.R")
download.file("https://cdn.jsdelivr.net/gh/xiayh17/Figs@main/uPic/plot_bar_20210817.R",
              "plot_bar_20210817.R")
download.file("https://cdn.jsdelivr.net/gh/xiayh17/Figs@main/uPic/rectData_20210817.R",
              "rectData_20210817.R")
download.file("https://cdn.jsdelivr.net/gh/xiayh17/Figs@main/uPic/plot_rect_20210817.R",
              "plot_rect_20210817.R")

# load data and function --------------------------------------------------

load("data_mini2_20210817.Rdata")
source("sortStackFun_20210817.R")
source("plot_bar_20210817.R")
source("rectData_20210817.R")
source("plot_rect_20210817.R")

# set colors --------------------------------------------------------------
cols = list(
  colors = c('#8dd3c7','#ffffb3','#bebada','#fb8072','#80b1d3','#fdb462','#b3de69'),
  cols= c("#1b9e77","#d95f02"),
  gcols <- c('#fbb4ae','#b3cde3','#ccebc5','#decbe4'),
  pcols <- c('#7fc97f','#beaed4','#fdc086','#ffff99','#386cb0','#f0027f','#bf5b17'),
  ccols <- c('#fb9a99','#b2df8a',"#fdbf6f")
)
names(cols[[1]]) = c('Tcells', 'epithelial', 'myeloid', 'Bcells', 'stromal', 'mast', 'unkown')
names(cols[[2]]) = c('beirui','boao')
names(cols[[3]]) = c('ap','ln','normal','tumor')
names(cols[[4]]) = c('0', '4', '6', '8', '2', '5', '7')
names(cols[[5]]) = c('LCA', 'LUAD', 'LUSC')

stack_data <- sortStack(data_mini2, orig.ident, celltype)

rect_data <- rectData(data_mini2)

colors = cols[[1]]
name = stack_data@sort.type
colors <- colors[order(match(names(colors),name))]
p1 <- plot_bar(stack_data@data,colors)
p2 <- plot_rect(rect_data[,c(1,2)],fill = Company, name = "Company",cols= cols[[2]])
p3 <- plot_rect(rect_data[,c(1,3)],fill = Group, name = "Group",cols= cols[[3]])
p4 <- plot_rect(rect_data[,c(1,4)],fill = Patient, name = "Patient",cols= cols[[4]])
p5 <- plot_rect(rect_data[,c(1,5)],fill = CancerType, name = "CancerType",cols= cols[[5]])

p1 %>% insert_bottom(p2, height=.05) %>% insert_bottom(p3, height=.05) %>% insert_bottom(p4, height=.05)%>% insert_bottom(p5, height=.05)

# save in pdf -------------------------------------------------------------
Cairo(16000, 8000, file="plotBarGroup.pdf", type="pdf", bg="white",dpi = 300,units = "px")
p1 %>% insert_bottom(p2, height=.05) %>% insert_bottom(p3, height=.05) %>% insert_bottom(p4, height=.05)%>% insert_bottom(p5, height=.05)
dev.off()
