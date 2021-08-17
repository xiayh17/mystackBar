plot_bar <- function(data,colors) {
  ggplot(data, aes(x = orig.ident, fill = celltype,y=percent)) +
    geom_bar(stat = "identity") +
    scale_y_continuous(expand = c(0, 0)) +
    scale_x_discrete(position = "top") +
    scale_fill_manual(
      breaks = rev(names(colors)),
      values = colors) + theme(plot.subtitle = element_text(family = "serif", 
                                                            colour = "gray0"), 
                               axis.ticks = element_line(colour = "gray0",
                                                         size = 0.9, linetype = "blank"), 
                               panel.grid.minor = element_line(linetype = "blank"), 
                               panel.grid.major.y = element_line(colour = "coral"),
                               axis.title.x = element_text(family = "serif",face = "bold", 
                                                           colour = "chocolate4", hjust = 0, vjust = 0), 
                               axis.title.y = element_text(family = "serif",face = "bold", 
                                                           colour = "chocolate4", hjust = 1, vjust = 0.5),
                               axis.text = element_text(family = "serif", 
                                                        hjust = 1, vjust = 0), 
                               axis.text.x = element_text(family = "serif", 
                                                          vjust = 0.5, angle = -45), 
                               axis.text.y = element_text(family = "serif"), 
                               plot.title = element_text(family = "serif", hjust = 1, vjust = 0,
                                                         colour = "forestgreen"), 
                               legend.text = element_text(family = "serif"), 
                               legend.title = element_text(family = "serif"), 
                               panel.background = element_rect(fill = "aliceblue"), 
                               plot.background = element_rect(fill = "aliceblue"), 
                               legend.key = element_rect(fill = NA), 
                               legend.background = element_rect(fill = "aliceblue"),
                               axis.line = element_line(linetype = "blank")) +
    labs(title = "Cell proportion of each sample", 
         x = "Sample", y = "Proportion", fill = "Cell Type")
  }