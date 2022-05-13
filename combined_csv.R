#Part 3.4 
# Combines featureCounts_output files into one csv file

# Import libraries:
library(tidyverse)
library(janitor)

#setting working directory:
setwd("/projectnb/bf528/students/poorvaj/project5/featureCounts/")
# Get list of applicable file names:
txt_files <- list.files(path = "/projectnb/bf528/students/poorvaj/project5/featureCounts/", pattern="*.txt$")

# For every file:
for (i in 1:9){
  file <- txt_files[i]
  # Read in table:
  file_table <- read.table(file, header=TRUE)
  # Grab 1st (should be Geneid) and last (counts in Sample)
  file_table<- file_table[,c(1, ncol(file_table))]
  # Convert to tibble
  file_tbl<- as_tibble(file_table)
  # Start combined tibble if first file, otherwise merge with existing combined tibble:
  if (i==1){
    comb_tbl <- file_tbl
  }else{
    comb_tbl <- full_join(comb_tbl, file_tbl, by="Geneid")
  }
}

# Check column names:
names(comb_tbl)

# Shorten column names:

names(comb_tbl) <- sub("X.projectnb.bf528.students.poorvaj.project5.bamOutput_files.", "", names(comb_tbl))
names(comb_tbl) <- sub("Aligned.sortedByCoord.out.bam", "", names(comb_tbl))

# Write csv:
# (Geneid column labeled "Geneid" as in input datasets)
write.csv(comb_tbl, file="featureCounts_combined.csv", row.names=FALSE)