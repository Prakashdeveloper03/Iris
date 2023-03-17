# Load required packages & data
source("script/base.R")

# Print the first few rows of the data
head(df)

# Display the structure of the data
str(df)

# Count the number of missing values
sum(is.na(df))

# Calculate the mean for each column
apply(df[-1][-5], 2, mean)

# Calculate the median for each column
apply(df[-1][-5], 2, median)

# Calculate the quartiles for each column
apply(df[-1][-5], 2, quantile)

# Calculate the interquartile range for each column
apply(df[-1][-5], 2, IQR)

# Calculate the variance for each column
apply(df[-1][-5], 2, var)

# Calculate the standard deviation for each column
apply(df[-1][-5], 2, sd)

# Print a summary of the data
summary(df)

# Define function to create histogram plot
create_hist_plot <- function(data, variable, binwidth = 0.3, fill_color = "#69b3a2", bg_color = "#FFFFFF", title = NULL) {
  p <- ggplot(data) +
    geom_histogram(aes(x = !!sym(variable)), binwidth = binwidth, fill = fill_color, color = "#e9ecef", alpha = 0.9) +
    xlab(variable) +
    ggtitle(ifelse(is.null(title), paste("Histogram of", variable), title)) +
    themeglb
  return(p)
}

# Call function for each variable and combine plots
hist_list <- lapply(names(df)[-1][-5], create_hist_plot, data = df)

# Combine plots using grid.arrange
plot_grid(plotlist = hist_list, nrow = 2, ncol = 2)

# Save the plot
ggsave("output/histogram.png", width = 12, height = 12, units = "cm")

# Define function to create density plot
create_density_plot <- function(data, variable, fill_color = "#69b3a2", bg_color = "#FFFFFF", title = NULL) {
  p <- ggplot(data) +
    geom_density(aes(!!sym(variable)), fill = fill_color, color = "#e9ecef", alpha = 0.9) +
    xlab(variable) +
    ggtitle(ifelse(is.null(title), paste("Density of", variable), title)) +
    themeglb
  return(p)
}

# Call function for each variable and combine plots
density_list <- lapply(names(df)[-1][-5], create_density_plot, data = df)

# Combine plots using grid.arrange
plot_grid(plotlist = density_list, nrow = 2, ncol = 2)

# Save the plot
ggsave("output/density.png", width = 12, height = 12, units = "cm")


# Define function to create box plot
create_box_plot <- function(data, variable, fill_color = "cyan", bg_color = "#FFFFFF", title = NULL) {
  p <- ggplot(data) +
    geom_boxplot(aes(y = !!sym(variable), fill = fill_color)) +
    ylab(variable) +
    ggtitle(ifelse(is.null(title), paste("Boxplot of", variable), title)) +
    themeglb +
    theme(legend.position = "none")
  return(p)
}

# Call function for each variable and combine plots
boxplot_list <- lapply(names(df)[-1][-5], create_box_plot, data = df)

# Combine plots using grid.arrange
plot_grid(plotlist = boxplot_list, nrow = 2, ncol = 2)

# Save the plot
ggsave("output/boxplot.png", width = 12, height = 12, units = "cm")
