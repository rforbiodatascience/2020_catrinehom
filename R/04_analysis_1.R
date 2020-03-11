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
bl62 <- read_tsv(file = "data/02_bl62_clean.tsv")

# Wrangle data
# ------------------------------------------------------------------------------
bl62_pca <- bl62 %>%
  select(-X1) %>%
  prcomp(center = TRUE, scale = TRUE)

bl62_pca %>%
  broom::tidy("pcs") %>% 
  ggplot(aes(x = PC, y = percent)) +
  geom_col() +
  theme_bw()


bl62_pca_aug <- bl62_pca %>%
  broom::augment(bl62)


bl62_pca_aug <- bl62_pca_aug %>% 
  mutate(chem_class = get_chem_class(X1))

bl62_pca_aug %>% select(X1, chem_class)



# Model data
# ------------------------------------------------------------------------------


# Plot the PCA
# ------------------------------------------------------------------------------
bl62_pca_aug %>% 
  ggplot(aes(x = .fittedPC1, y = .fittedPC2, label = X1, colour = chem_class)) +
  geom_text() +
  theme(legend.position = "bottom")

# Write data
# ------------------------------------------------------------------------------
write_tsv(...)
ggsave(bl62_pca_aug)

