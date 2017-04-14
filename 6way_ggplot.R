library(ggplot2)
sixgood <- read.csv("/Users/manoj/good_bad_placecnn/data/6way_good_rdata.txt",sep=" ",header=FALSE)
sixbad <- read.csv("/Users/manoj/good_bad_placecnn/data/6way_bad_rdata.txt",sep=" ",header=FALSE)
Layers <- c("conv1","conv2","conv3","conv4","conv5","fc6","fc7","fc8")
cond <- rep(c("Good","Bad"), each=8)

library(dplyr)
gb_CNN <- sixgood
gb_CNN$Layers <- Layers
sixbad$Layers <- Layers
gb_CNN <- rbind(gb_CNN,sixbad)
gb_CNN$cond <- cond

for (j in 1:10){
  colnames(gb_CNN)[j] <- paste('Fold',j)
  
}

library(reshape2)
gb <- melt(gb_CNN)

source("/Users/manoj/good_bad_placecnn/data_plot/SummarySE.R")
gbstats <- summarySE(gb, measurevar="value", groupvars=c("cond","Layers"))
gbstats <-data.frame(gbstats, perm = c(
                                        0.2190476,0.2190476,0.2190476,0.2238095,0.2190476,0.2238095,0.2192857,0.2190476,
                                       0.242857,0.242857,0.238095,0.238095,0.242857,0.23333,0.233333,0.2238095
                                       ))
#good front, bad back 
#ggg<-subset.data.frame(gbstats,perm)
ggg=gbstats[,c("cond","Layers","perm")]
#(gbstats)[3] <- paste('mean')
#perm<-c(0.22,0.22,0.23,0.24,0.22,0.22,0.22,0.23,0.22,0.22,0.23,0.24,0.22,0.22,0.22,0.23)
library(ggplot2)
p<- ggplot(gbstats, aes(x=Layers, y=value, fill=cond)) +ggtitle('6 Way Classification')
  
 p+ geom_bar(position=position_dodge(.9), colour="black", stat="identity") +
  geom_errorbar(position=position_dodge(.9), width=.25, aes(ymin=value-ci, ymax=value+ci)) +
  theme_bw()  +scale_fill_manual(values=c(rgb(226/255, 34/255,34/255),rgb(34/255, 194/255,226/255)))+
 ylab('Classifier Accuracy') + 
  theme(axis.title.x = element_text(size=24)) + theme(axis.text.x = element_text(size=24, angle = 90))+
  theme(axis.title.y = element_text(size=24)) + theme(axis.text.y = element_text(size=20))+ 
  theme(plot.title = element_text(family = "Trebuchet MS", color="#000000", face="bold", size=30, hjust=0.4)) +
  theme(legend.text=element_text(size=20)) + theme(legend.title=element_blank())+
  theme(  panel.grid.minor = element_blank()) +
  theme(axis.line = element_line(color = 'black'))+ 
   #geom_hline(aes(yintercept = 0.5),linetype="dotted")+
 geom_point(data = ggg, aes(y = perm, x = Layers, color = cond,fill=cond),shape=23,size=2.8,position=position_dodge(0.9))+
   scale_color_manual(name="",values=c("Good"="purple","Bad"="green"))
  