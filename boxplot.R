
library(tidyverse)
setwd("/projectnb/bf528/students/poorvaj/project5/featureCounts/")

fc_comb <- read_csv("featureCounts_combined.csv")
#0 to NA
fc_comb <- fc_comb %>%
  mutate_if(is.numeric, ~replace(., . == 0, NA))

#Removing NA
fc_comb <- na.omit(fc_comb) 

#pivoting to sample and count for plotting
fc_comb <- fc_comb %>% pivot_longer(!Geneid, names_to = "Sample", values_to = "Count")
#max valuye for y
max_count<- max(fc_comb[,3])
colMax(fc_comb[,3])
# Boxplot of count distributions, with zeros removed
fc_comb %>%  ggplot(mapping = aes(x = Sample, y = Count,color = Sample)) +
   geom_boxplot()+
  theme(axis.text.x = element_text(angle = 90)) +
  labs(title = "Boxplot of Sample Count Distributions") 


fc_comb %>%  ggplot(mapping = aes(x = Sample, y = log(Count),color = Sample)) +
  geom_boxplot()+
  theme(axis.text.x = element_text(angle = 90)) +
  labs(title = "Boxplot of Sample Count Distributions") 

