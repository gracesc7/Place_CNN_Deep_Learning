library(ggplot2)
sixgood <- read.csv("/Users/manoj/good_bad_placecnn/data/6way_good_rdata.txt",sep=" ",header=FALSE)
sixbad <- read.csv("/Users/manoj/good_bad_placecnn/data/6way_bad_rdata.txt",sep=" ",header=FALSE)
Layers <- c("conv1","conv2","conv3","conv4","conv5","fc6","fc7","fc8")
cond <- rep(c("Good","Bad"), each=8)

library(dplyr)
gb_CNN <- sixgood
gb_CNN$Layers <- Layers
sixbad$Layers <- Layers
gb_CNN <- rbind(gb_CNN, sixbad)
gb_CNN$cond <- cond

for (j in 1:10){
  colnames(gb_CNN)[j] <- paste('Fold',j)
  
}

library(reshape2)
gb <- melt(gb_CNN)

source("/Users/manoj/good_bad_placecnn/data_plot/SummarySE.R")
gbstats <- summarySE(gb, measurevar="value", groupvars=c("Layers", "cond"))
#(gbstats)[3] <- paste('mean')
library(ggplot2)
p<- ggplot(gbstats, aes(x=Layers, y=value, fill=cond)) +ggtitle('6 Way Classification')
 p+ geom_bar(position=position_dodge(.9), colour="black", stat="identity") +
  geom_errorbar(position=position_dodge(.9), width=.25, aes(ymin=value-ci, ymax=value+ci)) +
  theme_bw()  +scale_fill_manual(values=c(rgb(158/255, 31/255,99/255),rgb(28/255, 117/255,188/255)))+
 ylab('Classifier Accuracy') + 
  theme(axis.title.x = element_text(size=24)) + theme(axis.text.x = element_text(size=20, angle = 90))+
  theme(axis.title.y = element_text(size=24)) + theme(axis.text.y = element_text(size=20))+ 
  theme(legend.text=element_text(size=20)) + theme(legend.title=element_blank())+
  theme(  panel.grid.minor = element_blank()) +
  theme(axis.line = element_line(color = 'black'))+ geom_hline(aes(yintercept = 0.5),linetype="dotted")

 #p+ geom_point(position=position_dodge(.5), colour="black", stat="identity")
