# Load required libraries
library(mice) # for imputing missing values
library(rlang) # for advanced evaluation tools
library(scales) # for visual scaling
library(cowplot) # for creating complex plots
library(viridis) # for color palettes
library(corrplot) # for correlation plots
library(ggthemes) # for custom ggplot2 themes
library(tidyverse) # for data wrangling and visualization
library(gridExtra) # for arranging multiple plots
library(GGally) # for creating scatterplot matrices

# Read data from CSV file
df <- read_csv("data/Iris.csv")

# Rename columns for clarity
names(df) <- c("Id", "SepalLength", "SepalWidth", "PetalLength", "PetalWidth", "Species")
