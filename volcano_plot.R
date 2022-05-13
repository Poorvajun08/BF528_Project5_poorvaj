library(tidyverse)

#volcano plot 

#DNA_Damage 
DNA_Damage_results <- read_csv("DNA_Damage_results.csv")

ggplot(data = DNA_Damage_results, aes(x=log2FoldChange,y = -log10(pvalue)))+
  geom_point(alpha =0.4) +
  xlab("log[fold changes (FC)] ") +
  ylab("-log10(P-value)") +
  labs(title ="Volcano plot for DNA Damage MOA") 
  
#ER
ER_results <- read_csv("ER_results.csv")

ggplot(data = ER_results, aes(x=log2FoldChange,y = -log10(pvalue)))+
  geom_point(alpha =0.4) +
  xlab("log[fold changes (FC)] ") +
  ylab("-log10(P-value)") +
  labs(title ="Volcano plot for ER MOA") 


#PPARA
PPARA_results <- read_csv("PPARA_results.csv")
ggplot(data = PPARA_results, aes(x=log2FoldChange,y = -log10(pvalue)))+
  geom_point(alpha =0.4) +
  xlab("log[fold changes (FC)] ") +
  ylab("-log10(P-value)") +
  labs(title ="Volcano plot for PPARA MOA") 


