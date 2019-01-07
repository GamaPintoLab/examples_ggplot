



library(ggplot2)
library("viridis")
library(ggdendro)
library(plotly)
library(reshape2)


read.csv(all_CUIs_matrix, file="all_CUIs_matrix.csv", stringsAsFactors = F, header=T)

# hide axis ticks and grid lines
eaxis <- list(
  showticklabels = FALSE,
  showgrid = FALSE,
  zeroline = FALSE
)

p_empty <- plot_ly(filename="r-docs/dendrogram") %>%
  # note that margin applies to entire plot, so we can
  # add it here to make tick labels more readable
  layout(margin = list(l = 400),
         xaxis = eaxis,
         yaxis = eaxis)
###
all_CUIs_matrix_df=melt(all_CUIs_matrix)
p=ggplot(all_CUIs_matrix_df, aes(x=Var1, y=Var2, fill=value))+
  geom_tile()+ 
  scale_fill_viridis()

subplot(p_empty, p,  margin = 0.01)





