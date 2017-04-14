library(ggplot2)
#sixgood==gb
gb<- read.csv("/Users/manoj/good_bad_placecnn/data/goodbad.txt",sep=" ",header=FALSE)

Layers <- c("conv1","conv2","conv3","conv4","conv5","fc6","fc7","fc8")
#cond <- rep(c("Good","Bad"), each=8)

library(dplyr)
gb_CNN<-gb
gb_CNN$Layers <- Layers
#sixbad$Layers <- Layers
#gb_CNN <- rbind(gb_CNN, sixbad)
#gb_CNN$cond <- cond

for (j in 1:10){
  colnames(gb_CNN)[j] <- paste('Fold',j)
  
}

library(reshape2)
goodbad<- melt(gb_CNN)

source("/Users/manoj/good_bad_placecnn/data_plot/SummarySE.R")
gbstats <- summarySE(goodbad, measurevar="value", groupvars=c("Layers"))
#colnames(gbstats)[3] <- paste('mean')

library(ggplot2)
p<- ggplot(gbstats, aes(x=Layers, y=value)) +ggtitle('Good vs Bad Classification')

p+ geom_bar(position=position_dodge(.9), colour="black",fill="#5FC1DB" ,stat="identity") +
  geom_errorbar(position=position_dodge(.9), width=.25, aes(ymin=value-ci, ymax=value+ci)) +theme_bw()+ylab('Classifier Accuracy')+
  theme(axis.title.x = element_text(size=24)) + theme(axis.text.x = element_text(size=24, angle = 90))+
  theme(axis.title.y = element_text(size=24)) + theme(axis.text.y = element_text(size=20))+
  theme(plot.title = element_text(family = "Trebuchet MS", color="#000000", face="bold", size=30, hjust=0.4)) 


#67A8C9
 
  #theme(legend.text=element_text(size=20)) + theme(legend.title=element_blank())+
  
  #theme(  panel.grid.minor = element_blank()) +
  #theme(axis.line = element_line(color = 'black'))+ geom_hline(aes(yintercept = 0.5),linetype="dotted")
 

