# TITLE: Data processing and display for GitHub tutorial
# AUTHORS: B. Van Deynze
# DATE: Aug. 2020
# INPUTS: palmerpenguins.csv in /data/ directory
# OUTPUTS: processedpenguins.csv in /output/ directory; fig1.png in /figs/ directory

# Prepare environment ----
rm(list = ls())

library(tidyverse)
library(ggthemes)
library(here) # Helper functions for relative filespace referencing

# Read data ----
df <- read_csv(here("data/palmerpenguins.csv"))

# Prepare data ----
# Transform the data for potential future use in this section! Some ideas are provided below as TODOs.

# Drop NAs
# TODO: Drop NAs

# Compute bill measurement ratios (e.g. bill length to bill depth ratio)
# TODO: Compute bill measurements

# Generate plots ----
# Have some fun and make a ggplot figure! I provide an example (fig1). Modify this one, or Add your own and save it to the /figs/ directory!

# Figure 1 - Body mass over time, by species and sex
ggplot(df %>% drop_na(), aes(x = year, y = body_mass_g, color = species)) +
  geom_violin(aes(group = year)) + geom_jitter(width = 0.1) + facet_grid(species ~ sex) +
  scale_color_brewer("Species", type = "qual") + scale_fill_brewer("Species", type = "qual") +
  ggtitle("Body mass (g) by species over time") + labs(x = "Year", y = "Body mass (g)") + theme_clean()
ggsave(here("figs/fig1.png"), width = 6, height = 4)

# Figure 2 - Bill length over time, by site and species

# Figure 3 - 

# Save out modified data ----
write_csv(df, here("output/processedpenguins.csv"))

# When you're done, remember to add your name to the AUTHORS list!