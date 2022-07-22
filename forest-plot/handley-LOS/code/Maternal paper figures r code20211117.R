library(table1)
library(ggplot2)
library(dplyr)
library(scales)
library(grid)
library(gridExtra)
library(lattice)
library(gtable)
library(cowplot)
setwd("C:/Users/hhers/OneDrive/Documents/R Code/Plots")
getwd()

LOSMAT.Fig <- read.csv("C:/Users/hhers/Dropbox/Sara Handley/COSMOS READMISSION/dataforLMatLOS1121.csv")
View(LOSMAT.Fig)
#readmission.Fig2 <- read.csv("C:/Users/hhers/Dropbox/Sara Handley/COSMOS READMISSION/readmission Fig2.csv")
#View(readmission.Fig2)


#Short LOS
#df1 <- data.frame(label=c("All-unadjusted", "All-adjusted", "Vaginal-unadjusted", "Vaginal-adjusted", "Cesarean-unadjusted", "Cesarean-adjusted"),
#RR=c(2.2, 2.3, 2.14, 2.12, 2.83, 3.01) ,
#lower=c(2.16, 2.25, 2.08, 2.06,2.71, 2.87),
#upper=c(2.25, 2.36, 2.19, 2.18, 2.96, 3.51))
df1<-data.frame(LOSMAT.Fig)
df1
df1$combined <- factor(df1$combined, levels=rev(df1$combined)) # flips the order of the factors
#df1 %>% 
#  mutate(stripe = factor(ifelse(DOY %% 2 == 0, 1, 0))) %>% 
p1 <- ggplot(df1, aes(x=combined, y=OR, ymin=lower, ymax=upper)) + 
  geom_linerange(size=1, col="black") +
  geom_hline(yintercept=1, lty=2) +
  geom_point(size=1.5, colour="black", stroke = 1.0, shape=16) +
  geom_rect(data=df1, colour="white", mapping=aes(xmin=as.numeric(combined)-0.5, xmax=as.numeric(combined)+0.5, ymin=0.3, ymax=3.6, fill=Model),alpha = 0.5)+
  # scale_fill_manual( = alpha(c("light blue", "red"), 0.2))+
  labs(y="Odds ratios of short postpartum hospitalization LOS",x="Mode of delivery")+
  scale_y_continuous(trans = "log10", limits=c(0.3, 7), n.breaks = 9) +
  theme_classic()+
  theme(
    #legend.title = element_blank(),
    #legend.text=element_text(size=11),
    legend.position = "none",
    axis.text.x = element_text(color = "black", size =  10),
    axis.text.y = element_blank(),
    axis.title.x = element_text(color = "black", size =  18),
    axis.title.y = element_text(color = "black", size =  18),
    axis.line.y = element_blank(),
    axis.ticks.y = element_blank())+
  #axis.text.y = element_text(color = "black", size =  10)) +
  coord_flip() 
#p1<-p1+scale_fill_brewer()
#p1<-p1+scale_fill_manual(values = alpha(c("light blue", "red"), .1))
p1
p1a<-p1+ geom_rect(data=df1, colour="white", mapping=aes(xmin= 0.5, xmax=2.5, ymin=0.3, ymax=0.4), fill="dark green", alpha =0.5)
#names(df1)
p1b<-p1a+geom_rect(data=df1, colour="white", mapping=aes(xmin= 2.5, xmax=4.5, ymin=0.3, ymax=0.4), fill="dark green", alpha =0.5)

p1b

p1c<-p1b+geom_rect(data=df1, colour="white", mapping=aes(xmin= 4.5, xmax=6.5, ymin=0.3, ymax=0.4), fill="dark green", alpha =0.5)

p1c
p1c<-p1c+scale_fill_brewer(palette = "Greens")
p1c
p1c <- p1c + annotate(geom="text", x=6.0,  y=3.0, label="A", size=5)
p1c<-p1c+ annotate(geom="text", x=6,  y=0.5, label="Unadjusted", size=4)
p1c<- p1c+ annotate(geom="text", x=5,  y=0.5, label="Adjusted", size=4)
p1c<-p1c+ annotate(geom="text", x=4,  y=0.5, label="Unadjusted", size=4)
p1c<- p1c+ annotate(geom="text", x=3,  y=0.5, label="Adjusted", size=4)
p1c<-p1c+ annotate(geom="text", x=2,  y=0.5, label="Unadjusted", size=4)
p1c<- p1c+ annotate(geom="text", x=1,  y=0.5, label="Adjusted", size=4)
p1c

p1d<-p1c+annotate(geom="text", x=5.5,  y=0.35, label="All", size=5, colour="white", angle=90)
p1d<-p1d+annotate(geom="text", x=3.5,  y=0.35, label="Vaginal",colour="white", size=5, angle=90)
p1d<-p1d+annotate(geom="text", x=1.5,  y=0.35, label="Cesarean",colour="white", size=5, angle=90)
p1d
p1d = p1d + theme(plot.margin=unit(c(1,1,1,1),"cm")) #adding space to the bottom of the first grob (c(bottom,left,top,right))
p1d
p1e<-p1d + annotate(geom="text", x=6,  y=5, label="1.99 (1.97-2.02)",colour="black", size=3)
p1e<-p1e+annotate(geom="text", x=5,  y=5, label="2.35 (2.32-2.39)",colour="black", size=3)
p1e<-p1e+annotate(geom="text", x=4,  y=5, label="1.91 (1.88-1.94)",colour="black", size=3)
p1e<-p1e+annotate(geom="text", x=3,  y=5, label="2.14 (2.11-2.18)",colour="black", size=3)
p1e<-p1e+annotate(geom="text", x=2,  y=5, label="2.25 (2.21-2.30)",colour="black", size=3)
p1e<-p1e+annotate(geom="text", x=1,  y=5, label="2.90 (2.83-2.98)",colour="black", size=3)
p1e
ggsave("C:/Users/hhers/OneDrive/Documents/R Code/bPlotsSara_cosmos_fig_MATERNALLOSONLY3withEE.tiff",
       width=7.2,
       height=4.8,
       units= "in",
       device = "tiff",
       dpi=400,
       plot = p1e)

###############READMISSION FIGURE

readmitMAT.Fig <- read.csv("C:/Users/hhers/Dropbox/Sara Handley/COSMOS READMISSION/Data for Figure of mat  readmit1121.csv")
View(readmitMAT.Fig)

df2<-data.frame(readmitMAT.Fig)
df2
df2$combined <- factor(df2$combined, levels=rev(df2$combined)) # flips the order of the factors
#df2 %>% 
#  mutate(stripe = factor(ifelse(DOY %% 2 == 0, 1, 0))) %>% 
p2 <- ggplot(df2, aes(x=combined, y=OR, ymin=lower, ymax=upper)) + 
  geom_linerange(size=1, col="black") +
  geom_hline(yintercept=1, lty=2) +
  geom_point(size=1.5, colour="black", stroke = 1.0, shape=16) +
  geom_rect(data=df2, colour="white", mapping=aes(xmin=as.numeric(combined)-0.5, xmax=as.numeric(combined)+0.5, ymin=0.3, ymax=3.6, fill=Model),alpha = 0.5)+
  # scale_fill_manual( = alpha(c("light blue", "red"), 0.2))+
  labs(y="Odds ratios of rehospitalization",x="Mode of delivery")+
  scale_y_continuous(trans = "log10", limits=c(0.3, 7), n.breaks = 9) +
  theme_classic()+
  theme(
    #legend.title = element_blank(),
    #legend.text=element_text(size=11),
    legend.position = "none",
    axis.text.x = element_text(color = "black", size =  10),
    axis.text.y = element_blank(),
    axis.title.x = element_text(color = "black", size =  18),
    axis.title.y = element_text(color = "black", size =  18),
    axis.line.y = element_blank(),
    axis.ticks.y = element_blank())+
  #axis.text.y = element_text(color = "black", size =  10)) +
  coord_flip() 
#p2<-p2+scale_fill_brewer()
#p2<-p2+scale_fill_manual(values = alpha(c("light blue", "red"), .1))
p2
p2a<-p2+ geom_rect(data=df2, colour="white", mapping=aes(xmin= 0.5, xmax=2.5, ymin=0.3, ymax=0.4), fill="dark green", alpha =0.5)
#names(df2)
p2b<-p2a+geom_rect(data=df2, colour="white", mapping=aes(xmin= 2.5, xmax=4.5, ymin=0.3, ymax=0.4), fill="dark green", alpha =0.5)

p2b

p2c<-p2b+geom_rect(data=df2, colour="white", mapping=aes(xmin= 4.5, xmax=6.5, ymin=0.3, ymax=0.4), fill="dark green", alpha =0.5)

p2c
p2c<-p2c+scale_fill_brewer(palette = "Greens")
p2c
p2c <- p2c + annotate(geom="text", x=6.0,  y=3.0, label="B", size=5)
p2c<-p2c+ annotate(geom="text", x=6,  y=0.5, label="Unadjusted", size=4)
p2c<- p2c+ annotate(geom="text", x=5,  y=0.5, label="Adjusted", size=4)
p2c<-p2c+ annotate(geom="text", x=4,  y=0.5, label="Unadjusted", size=4)
p2c<- p2c+ annotate(geom="text", x=3,  y=0.5, label="Adjusted", size=4)
p2c<-p2c+ annotate(geom="text", x=2,  y=0.5, label="Unadjusted", size=4)
p2c<- p2c+ annotate(geom="text", x=1,  y=0.5, label="Adjusted", size=4)
p2c

p2d<-p2c+annotate(geom="text", x=5.5,  y=0.35, label="All", size=5, colour="white", angle=90)
p2d<-p2d+annotate(geom="text", x=3.5,  y=0.35, label="Vaginal",colour="white", size=5, angle=90)
p2d<-p2d+annotate(geom="text", x=1.5,  y=0.35, label="Cesarean",colour="white", size=5, angle=90)
p2d
p2d = p2d + theme(plot.margin=unit(c(1,1,1,1),"cm")) #adding space to the bottom of the first grob (c(bottom,left,top,right))
p2d
p2e<-p2d + annotate(geom="text", x=6,  y=5, label="1.08 (1.03-1.13)",colour="black", size=3)
p2e<-p2e+annotate(geom="text", x=5,  y=5, label="1.02 (0.97-1.08)",colour="black", size=3)
p2e<-p2e+annotate(geom="text", x=4,  y=5, label="1.07 (1.00-1.15)",colour="black", size=3)
p2e<-p2e+annotate(geom="text", x=3,  y=5, label="1.03 (0.96-1.10)",colour="black", size=3)
p2e<-p2e+annotate(geom="text", x=2,  y=5, label="1.10 (1.02-1.18)",colour="black", size=3)
p2e<-p2e+annotate(geom="text", x=1,  y=5, label="1.01 (0.94-1.08)",colour="black", size=3)
p2e
ggsave("C:/Users/hhers/OneDrive/Documents/R Code/cPlotsSara_cosmos_fig_MATERNALreadmitONLY3withee.tiff",
       width=7.2,
       height=4.8,
       units= "in",
       device = "tiff",
       dpi=400,
       plot = p2e)

#arranging the grobs
both <-grid.arrange(
  p1e,
  p2e,
  ncol = 1,
  nrow = 2,
  heights = c(4, 4),
  clip = FALSE
)
both

#saving as tiff (can save as any file type here)
ggsave("C:/Users/hhers/OneDrive/Documents/R Code/cPlotsSara_cosmos_fig_MATERNALBOTH3withee.tiff",
       width=7.2,
       height=9.6,
       units= "in",
       device = "tiff",
       dpi=400,
       plot = both)
getwd()

#No annotation
p1c<-p1b+geom_rect(data=df1, colour="white", mapping=aes(xmin= 4.5, xmax=6.5, ymin=0.3, ymax=0.4), fill="dark green", alpha =0.5)

p1c
p1c<-p1c+scale_fill_brewer(palette = "Greens")
p1c
#p1c <- p1c + annotate(geom="text", x=6.0,  y=3.0, label="A", size=5)
p1c<-p1c+ annotate(geom="text", x=6,  y=0.5, label="Unadjusted", size=4)
p1c<- p1c+ annotate(geom="text", x=5,  y=0.5, label="Adjusted", size=4)
p1c<-p1c+ annotate(geom="text", x=4,  y=0.5, label="Unadjusted", size=4)
p1c<- p1c+ annotate(geom="text", x=3,  y=0.5, label="Adjusted", size=4)
p1c<-p1c+ annotate(geom="text", x=2,  y=0.5, label="Unadjusted", size=4)
p1c<- p1c+ annotate(geom="text", x=1,  y=0.5, label="Adjusted", size=4)
p1c

p1d<-p1c+annotate(geom="text", x=5.5,  y=0.35, label="All", size=5, colour="white", angle=90)
p1d<-p1d+annotate(geom="text", x=3.5,  y=0.35, label="Vaginal",colour="white", size=5, angle=90)
p1d<-p1d+annotate(geom="text", x=1.5,  y=0.35, label="Cesarean",colour="white", size=5, angle=90)
p1d
p1d = p1d + theme(plot.margin=unit(c(1,1,1,1),"cm")) #adding space to the bottom of the first grob (c(bottom,left,top,right))

ggsave("C:/Users/hhers/OneDrive/Documents/R Code/PlotsSara_cosmos_fig_LOSONLY2noannote1.tiff",
       width=7.2,
       height=4.8,
       units= "in",
       device = "tiff",
       dpi=400,
       plot = p1d)

########################
p2b

p2c<-p2b+geom_rect(data=df2, colour="white", mapping=aes(xmin= 4.5, xmax=6.5, ymin=0.3, ymax=0.4), fill="dark green", alpha =0.5)

p2c
p2c<-p2c+scale_fill_brewer(palette = "Greens")
p2c
#p2c <- p2c + annotate(geom="text", x=6.0,  y=3.0, label="B", size=5)
p2c<-p2c+ annotate(geom="text", x=6,  y=0.5, label="Unadjusted", size=4)
p2c<- p2c+ annotate(geom="text", x=5,  y=0.5, label="Adjusted", size=4)
p2c<-p2c+ annotate(geom="text", x=4,  y=0.5, label="Unadjusted", size=4)
p2c<- p2c+ annotate(geom="text", x=3,  y=0.5, label="Adjusted", size=4)
p2c<-p2c+ annotate(geom="text", x=2,  y=0.5, label="Unadjusted", size=4)
p2c<- p2c+ annotate(geom="text", x=1,  y=0.5, label="Adjusted", size=4)
p2c

p2d<-p2c+annotate(geom="text", x=5.5,  y=0.35, label="All", size=5, colour="white", angle=90)
p2d<-p2d+annotate(geom="text", x=3.5,  y=0.35, label="Vaginal",colour="white", size=5, angle=90)
p2d<-p2d+annotate(geom="text", x=1.5,  y=0.35, label="Cesarean",colour="white", size=5, angle=90)
p2d
p2d = p2d + theme(plot.margin=unit(c(1,1,1,1),"cm")) #adding space to the bottom of the first grob (c(bottom,left,top,right))

ggsave("C:/Users/hhers/OneDrive/Documents/R Code/PlotsSara_cosmos_fig_MATERNALreadmitONLY2noannote1.tiff",
       width=7.2,
       height=4.8,
       units= "in",
       device = "tiff",
       dpi=400,
       plot = p2d)
getwd()

