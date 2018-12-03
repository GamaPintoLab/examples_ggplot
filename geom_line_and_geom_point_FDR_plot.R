

load(file="FDR_analyis_df.RData")

FDR_analyis_df$FDR=as.numeric(FDR_analyis_df$FDR)
FDR_analyis_df$Thresh=as.numeric(FDR_analyis_df$Thresh)
FDR_analyis_df$Experiment=as.factor(FDR_analyis_df$Experiment)


FDR_analyis_plot=ggplot(data=FDR_analyis_df,aes(x=Thresh, y=FDR, color=Experiment))+
  geom_line()+
  geom_point()+
  scale_color_manual(name="Exp", labels=c(levels(FDR_analyis_df$Experiment)), values=c("darkgreen","darkblue"))+
  scale_x_reverse(breaks=c(0.005, 0.01, 0.05))+
  theme_light()+
  ggtitle("geom_line and geom_point")

