

load("BirA_intensities_df.RData")

example_data_vec=data.frame("val"=c(15, 17,21,22, 24, 25, 26, 31), "type"=c("out", "out", "in","in" ,"in","in","in","out"))
example_data_vec$type=as.factor(example_data_vec$type)


library(ggplot2)

example_norm_density_plot=ggplot(BirA_intensities_df,aes(Vals))+
  geom_density(position="identity")+
  stat_function(fun=dnorm,color="red",args=list(mean=mean(BirA_intensities_df$Vals), sd=sd(BirA_intensities_df$Vals)))+
  geom_vline(xintercept = quantile(BirA_intensities_df$Vals, .1), color="black") +
  geom_vline(xintercept = quantile(BirA_intensities_df$Vals, .9), color="black") +
  geom_vline(xintercept = quantile(BirA_intensities_df$Vals, .05), lty=2, color="black") +
  geom_vline(xintercept = quantile(BirA_intensities_df$Vals, .95), lty=2, color="black") +
  theme_light()+
  ggtitle("density_plot")+
  theme_light()+
  geom_point(data=example_data_vec, aes(x=val, y=0.001, color=type), position="identity")+
  scale_color_manual(name="cutoff", labels=c(levels(example_data_vec$type)), values=c("red","darkgreen"))
  


