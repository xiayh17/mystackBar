plot_rect <- function(data, fill, name, cols) {
  fill <- enquo(fill)
  data$y <- rep(name,nrow(data))
  ggplot(data, aes(Sample,y, fill=!!fill)) +
    geom_tile(colour = "white",size = 0.5)+
    theme(axis.ticks = element_line(linetype = "blank"), 
          panel.grid.major = element_line(linetype = "blank"), 
          panel.grid.minor = element_line(linetype = "blank"), 
          axis.text = element_text(size = 0), 
          axis.text.y = element_text(family = "serif", face = "bold",
                                     size = 11, colour = "chocolate4"),
          panel.background = element_rect(fill = "aliceblue"), 
          plot.background = element_rect(fill = "aliceblue"), 
          legend.title = element_text(hjust = 0.55,face = "bold", colour = "chocolate4",family = "serif"),
          legend.direction = "horizontal",
          legend.text = element_text(family = "serif"),
          legend.key = element_rect(fill = "aliceblue"), 
          legend.background = element_rect(fill = "aliceblue")) +
    labs(x = NULL, y = NULL, fill = name)+
    scale_fill_manual(values = cols,
                      breaks = names(cols))
}