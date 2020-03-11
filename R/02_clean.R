# Clear workspace
# ------------------------------------------------------------------------------
rm(list = ls())

# Load libraries
# ------------------------------------------------------------------------------
library("tidyverse")

# Define functions
# ------------------------------------------------------------------------------
source(file = "R/99_project_functions.R")

# Load data
# ------------------------------------------------------------------------------

my_url <- "https://www.ncbi.nlm.nih.gov/Class/FieldGuide/BLOSUM62.txt"
bl62 <- read_table(file = my_url, comment = '#') 

# Doesnt work for some reason?
# %>%  rename(aa = X1)

# Wrangle data
# ------------------------------------------------------------------------------
bl62 <- bl62 %>%
  select(X1:V) %>%
  slice(1:20) 

# Write data
# ------------------------------------------------------------------------------
write_tsv(x = bl62,
          path = "data/BLOSUM62_ncbi.tsv")

